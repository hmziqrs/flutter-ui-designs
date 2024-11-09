# Commands

## Android

### App bundle (windows)

```bash
flutter build appbundle -t .\lib\main.firebase.dart --release
cp build\app\outputs\bundle\release\app-release.aab ~\Desktop\fuid\
```

## Web

### WASM

```bash
flutter build web --wasm --no-tree-shake-icons
```
