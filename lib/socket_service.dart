import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/foundation.dart';

class SocketService {
  late IO.Socket _socket;
  final ValueNotifier<String> verifyStatus = ValueNotifier<String>('pending');

  void connect(String userId) {
    print('isConnecting');
    _socket = IO.io('http://192.168.1.3:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {'userId': userId},
    });

    // Lắng nghe sự kiện kết nối
    _socket.on('connect', (_) {
      print('Connected to server');
    });

    // Lắng nghe sự kiện ngắt kết nối
    _socket.on('disconnect', (_) {
      print('Disconnected from server');
    });

    // Lắng nghe sự kiện verifiedStatus
    _socket.on('verifiedStatus', (data) {
      print('Verified Status: $data');
      // Xử lý cập nhật trạng thái verified
      verifyStatus.value = data; // Cập nhật trạng thái verifyStatus
    });

    // Kết nối tới server
    _socket.connect();
  }

  void disconnect() {
    _socket.disconnect();
  }
}
