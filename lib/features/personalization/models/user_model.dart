import 'package:e_store/utils/formatters/formatter.dart';

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

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      phoneNumber: '',
      lastName: '',
      firstName: '',
      profilePicture: '');

  /// Convert model to JSON structure for storing data in db
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }
}
