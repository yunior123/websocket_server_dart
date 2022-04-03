import 'package:socket_io_client/socket_io_client.dart' as IO;

main() {
  // Dart client
  IO.Socket socket = IO.io('http://localhost:3000');
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.on('event', (data) {
    print('event: $data');
  });

  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (_) => print("ggtg"));
}
