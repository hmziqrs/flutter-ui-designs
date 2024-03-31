import 'dart:isolate';

const String scope = 'DownloadScreen';

const Map strings = {
  // Title
  '$scope/title': 'Download',
  '$scope/description': 'Experience the app in different platform.',
  '$scope/mobile': 'Mobile',
  '$scope/desktop': 'Desktop',
  '$scope/web': 'Web',
  //
  '$scope/copy': 'Copy',
  '$scope/share': 'Share',
  '$scope/download': 'Download',
  '$scope/open': 'Open',
  '$scope/linkCopied': 'link copied',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
