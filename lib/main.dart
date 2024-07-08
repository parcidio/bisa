import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dona/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://adsbxntehzvwtmzharuq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkc2J4bnRlaHp2d3RtemhhcnVxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2ODU3MjYsImV4cCI6MjAzNTI2MTcyNn0.Xb11DbIye10JP3Rv0Cxt9iKIxVMe6B4rnsOfDYJePX8',
  );
  // Todo: Add Widgets Biding
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize database
  // Todo: Initialize Authentication
  runApp(const App());
}
