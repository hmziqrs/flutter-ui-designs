import 'dart:isolate';

const String scope = 'ASCRoot';

const Map strings = {
  '$scope/defaultDescription':
      "This entry-level model features a full-length Gum Rubber Outsole for excellent traction on the court. Rearfoot GEL Cushioning System provides enhanced cushioning - while the combination synthetic leather and mesh upper provides breathability and comfort. A great value for the multi-court player.",
  '$scope/defaultSubHeading': "RUNNING COLLECTION",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
