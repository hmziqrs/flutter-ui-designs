import 'dart:io';

void main(List<String> args) {
  final source = File('privacy-policy/index.html');
  final targetPath = 'build/web/privacy-policy.html';
  // copy the source to target
  source.copySync(targetPath);
  print('Copied $source to $targetPath');
}
