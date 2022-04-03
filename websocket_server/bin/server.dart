import 'package:socket_io/socket_io.dart';

main() {
  // Dart server
  var io = Server();
  // var nsp = io.of('/some');
  // nsp.on('connection', (client) {
  //   print('connection /some');
  //   client.on('msg', (data) {
  //     print('data from /some => $data');
  //     client.emit('fromServer', "ok 2");
  //   });
  // });
  io.on('connection', (client) {
    io.emit("event", "data");
    io.send("dataw");
    client.emit('fromServer', "ok");
    print('connection default namespace');
    client.on('msg', (data) {
      print('data from default => $data');
      client.emit('fromServer', "ok");
    });
  });
  io.emit("event", "data");
  io.listen(3000);
}
