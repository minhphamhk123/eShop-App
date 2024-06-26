import 'package:e_store/utils/formatters/formatter.dart';

import '';

/// Model class representing user data
class UserModel {
  //Keep values final which you don't want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.lastName,
    required this.firstName,
    required this.profilePicture,
  });

  ///Helper function
  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      phoneNumber: '',
      lastName: '',
      firstName: '',
      profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Chuyển đổi Map sang UserModel
  factory UserModel.fromJsonJVS(Map<String, dynamic> json) {
      return UserModel(
        id: json['Id'] ?? '',
        username: json['Username'] ?? '',
        email: json['Email'] ?? '',
        firstName: json['FirstName'] ?? '',
        lastName: json['LastName'] ?? '',
        phoneNumber: json['PhoneNumber'] ?? '',
        profilePicture: json['ProfilePicture'] ?? '',
      );
  }

  factory UserModel.fromJsonJV(Map<String, dynamic> json) {
    return UserModel(
      id: json['mongoDbID'].toString() ?? '',
      username: json['userName'] ?? '',
      email: json['emailId'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['mobileNo'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
    );
  }
}
