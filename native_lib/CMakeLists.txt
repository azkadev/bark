cmake_minimum_required(VERSION 3.16)

project(bark_library VERSION 0.0.1 LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 20)
 
message(STATUS "START COMPILE bark")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")

set(bark_shared_dir "lib")
set(bark_exe_dir "bin")
set(prefix_shared_library "lib")
 

if (ANDROID)
 set(package_shared_extension "_${ANDROID_ARCH_NAME}.so")
 set(package_exe_extension "")
 set(package_name "bark_${ANDROID_ARCH_NAME}")
elseif (WIN32)
 set(package_shared_extension ".dll")
 set(package_exe_extension ".exe") 
 set(package_name "bark")
elseif (APPLE)
 set(package_shared_extension ".dylib")
 set(package_exe_extension "") 
 set(package_name "bark")
else()
 set(package_shared_extension ".so")
 set(package_exe_extension "") 
 set(package_name "bark")
endif()


add_library(bark_shared SHARED bark.cpp)
add_executable(bark_exe bark.cpp)

set_target_properties(bark_shared PROPERTIES 
  LIBRARY_OUTPUT_DIRECTORY "${bark_shared_dir}"
  PREFIX "${prefix_shared_library}"
  OUTPUT_NAME "${package_name}"
)

set_target_properties(bark_exe PROPERTIES 
  RUNTIME_OUTPUT_DIRECTORY "${bark_exe_dir}"
  OUTPUT_NAME "${package_name}"
)

if (WIN32)
 set_target_properties(bark_shared PROPERTIES
  WINDOWS_EXPORT_ALL_SYMBOLS ON
)
endif (WIN32)
 
add_custom_command(
  TARGET bark_shared POST_BUILD 
  COMMAND ${CMAKE_STRIP} --strip-debug --strip-unneeded "${bark_shared_dir}/${prefix_shared_library}bark${package_shared_extension}"
)

add_custom_command(
  TARGET bark_exe POST_BUILD 
  COMMAND ${CMAKE_STRIP} --strip-debug --strip-unneeded "${bark_exe_dir}/bark${package_exe_extension}" 
)

 