// Import the necessary packages
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../navigation_menu.dart';
import '../presentation/authentication/login/login.dart';

final supabase = Supabase.instance.client;

// Define a class to manage the state of the signup screen
class SignupController extends GetxController {
  // Initialize reactive variables to store the user's inputfinal RxString _name = "".obs; // Store the user's name
  final RxString _email = "".obs; // Store the user's email
  final RxString _password = "".obs; // Store the user's password
  final RxString _message = "".obs;

  // Getters to access the values of the reactive variables
  get email => _email.value; // Get the user's email
  get password => _password.value; // Get the user's password
  get message => _message.value;
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

  // Method to check if the email is valid
  bool isEmailValid(String email) {
    // Use the email regex to check if the email matches the pattern
    return _emailRegex.hasMatch(email);
  }

  void updateEmail(String value) {
    _email.value = value; // Update the user's email
  }

  void updatePassword(String value) {
    _password.value = value; // Update the user's password
  }

  void updateMessage(String value) {
    _message.value = value; // Update the message
  }

  // Method to check if the form is valid
  bool isValidForm() {
    // Check if the email and password are valid, and if the password matches the confirmed password
    return isEmailValid(email);
  }

  // Method to login the user using Supabase
  Future<void> login() async {
    // Check if the form is valid
    if (isValidForm()) {
      // Use the Supabase auth API to login the user
      final response = await supabase.auth.signInWithPassword(
        email: email, // Use the user's email
        password: password, // Use the user's password
      );
      // Check if the login was successful
      if (response.user != null) {
        updateMessage("Login successful");

        Get.to(() => const NavigationMenu());
      } else {
        // Handle signup error
        updateMessage("Login failed");
      }
    } else {
      // Form is not valid, show error message
      updateMessage("Please enter a valid email");
    }
  }
}
