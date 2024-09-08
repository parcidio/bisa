// Import the necessary packages
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../presentation/authentication/login/login.dart';

final supabase = Supabase.instance.client;

// Define a class to manage the state of the signup screen
class SignupController extends GetxController {
  // Initialize reactive variables to store the user's input
  final RxString _name = "".obs; // Store the user's name
  final RxString _email = "".obs; // Store the user's email
  final RxString _password = "".obs; // Store the user's password
  final RxString _confirm_password =
      "".obs; // Store the user's confirmed password
  final RxString _message = "".obs;
  final RxString _phone = "".obs;

  // Getters to access the values of the reactive variables
  get name => _name.value; // Get the user's name
  get email => _email.value; // Get the user's email
  get password => _password.value; // Get the user's password
  get confirm_password =>
      _confirm_password.value; // Get the user's confirmed password
  get message => _message.value;
  get phone => _phone.value;
  // Regular expressions to validate the user's input
  // Email regex: This pattern matches most common email formats
  // It checks for the following:
  // - One or more word characters (letters, numbers, or underscores) or hyphens
  // - An optional dot followed by one or more word characters or hyphens
  // - An @ symbol
  // - One or more word characters or hyphens
  // - A dot
  // - One or more word characters (letters, numbers, or underscores) or hyphens
  // - A top-level domain (letters only, 2-7 characters long)
  final RegExp _emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // Password regex: This pattern checks for the following:
  // - At least one uppercase letter
  // - At least one lowercase letter
  // - At least one digit
  // - A minimum length of 8 characters
  final RegExp _passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  // Method to check if the email is valid
  bool isEmailValid(String email) {
    // Use the email regex to check if the email matches the pattern
    return _emailRegex.hasMatch(email);
  }

  // Method to check if the password is valid
  bool isPasswordValid(String password) {
    // Use the password regex to check if the password matches the pattern
    return _passwordRegex.hasMatch(password);
  }

  // Methods to update the reactive variables
  void updateName(String value) {
    _name.value = value; // Update the user's name
  }

  void updateEmail(String value) {
    _email.value = value; // Update the user's email
  }

  void updatePassword(String value) {
    _password.value = value; // Update the user's password
  }

  void updateConfirmPassword(String value) {
    _confirm_password.value = value; // Update the user's confirmed password
  }

  void updateMessage(String value) {
    _message.value = value; // Update the message
  }

  void updatePhoneNumber(String value) {
    _phone.value = value; // Update the user's phone number
  }

  // Method to check if the form is valid
  bool isValidForm() {
    // Check if the email and password are valid, and if the password matches the confirmed password
    return isEmailValid(email) &&
        isPasswordValid(password) &&
        password == confirm_password;
  }

  // Method to sign up the user using Supabase
  Future<void> signup() async {
    // Check if the form is valid
    if (isValidForm()) {
      // Use the Supabase auth API to sign up the user
      final response = await supabase.auth.signUp(
        email: email, // Use the user's email
        password: password, // Use the user's password
        phone: phone,
      );
      // Check if the signup was successful
      if (response.user != null) {
        updateMessage("Signup successful");
        Get.to(() => const LoginScreen());
      } else {
        // Handle signup error
        updateMessage("Signup failed");
      }
    } else {
      // Form is not valid, show error message
      updateMessage("Please fill all the fields accordingly");
    }
  }
}
