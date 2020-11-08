import 'dart:isolate';

const String scope = 'DownloadScreen';

const Map strings = {
  // Title
  '$scope/title': 'Download',
  '$scope/desc':
      'Explore app on a different platform or share the link directly with anyone who might be interested in exploring the app',
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
