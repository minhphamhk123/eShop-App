import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/foundation.dart';

class SocketService {
  late IO.Socket _socket;
  final ValueNotifier<String> verifyStatus = ValueNotifier<String>('pending');
  final ip = dotenv.env['IP'] ?? 'IP not found';

  void connect(String email) {
    print('isConnecting');
    _socket = IO.io('http://$ip:8080', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {'email': email},
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
      Map<String, dynamic> jsonData;

      // Kiểm tra kiểu dữ liệu và chuyển đổi nếu cần thiết
      if (data is String) {
        try {
          // Chuyển đổi chuỗi JSON thành Map
          jsonData = json.decode(data) as Map<String, dynamic>;
        } catch (e) {
          print('Error decoding JSON: $e');
          return; // Thoát khỏi hàm nếu không thể chuyển đổi dữ liệu
        }
      } else if (data is Map<String, dynamic>) {
        // Nếu data đã là Map, gán nó trực tiếp
        jsonData = data;
      } else {
        print('Unsupported data type');
        return; // Thoát khỏi hàm nếu dữ liệu không được hỗ trợ
      }

      // Lấy giá trị của trường 'verified'
      var verifiedStatus = jsonData['value'].toString();

      print('Verified Status: $verifiedStatus test');
      print('Verified Status: $jsonData data');

      // Xử lý cập nhật trạng thái verified
      verifyStatus.value = verifiedStatus;
    });

    // Kết nối tới server
    _socket.connect();
  }

  void disconnect() {
    _socket.disconnect();
  }
}
