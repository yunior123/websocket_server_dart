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
  // io.onconnection();

  io.on("UPDATE_USER_POSITION", (data) {
    print("UPDATE_USER_POSITION");
    print(data);
  });
  io.on('connection', (Socket client) {
    print('connection');
    print(client.data);
    io.emit("UPDATE_USER_POSITION", "data");
    io.send("locationData");
    client.emit('UPDATE_USER_POSITION', "ok");
    print('connection default namespace');
    client.on('UPDATE_USER_POSITION', (data) {
      print('data from default => $data');
      client.emit('UPDATE_USER_POSITION', "ok");
    });
  });

  io.listen(3000);
  io.emit("locationData", "data");
}
