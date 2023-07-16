cmake_minimum_required(VERSION 3.10)
project(bark_flutter_library VERSION 0.0.0 LANGUAGES C CXX)

add_library(bark_flutter SHARED
  "bark.cpp"
)

set_target_properties(bark_flutter PROPERTIES
  # PUBLIC_HEADER bark_flutter.h
  OUTPUT_NAME "bark"
)

target_compile_definitions(bark_flutter PUBLIC DART_SHARED_LIB)
