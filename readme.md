# Bark

Bark is a transformer-based text-to-audio model created by Suno. Bark can generate highly realistic, multilingual speech as well as other audio - including music, background noise and simple sound effects. The model can also produce nonverbal communications like laughing, sighing and crying. To support the research community, we are providing access to pretrained model checkpoints, which are ready for inference and available for commercial use.



---

### Demo

---

### Tested On

| No | Device        | Os           | Ram  | CPU             |
|----|---------------|--------------|------|-----------------|
<!-- | 1. | Msi Modern 14 | Ubuntu 22.04 | 8 gb | Amd Ryzen 5500u |
| 2. | Realme 5      | Android 11   | 3gb  | Snapdragon 665  | -->


### Development

1. Compile Library

```bash
cd native_lib
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
```

2. Compile Library Android

```bash
cd native_lib
rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=${ANDROID_SDK}/ndk/24.0.8215888/build/cmake/android.toolchain.cmake -DCMAKE_BUILD_TYPE=Release -DANDROID_ABI=arm64-v8a
cmake --build .
```

### Install Library

```bash
dart pub add bark_dart
```

or flutter

```bash
dart pub add bark_flutter
```

### Import Library

```dart
import 'package:bark_dart/bark_dart.dart';
```


## Credit

1. [Bark Cpp](https://github.com/PABannier/bark.cpp)
2. [GGML](https://github.com/ggerganov/ggml)


