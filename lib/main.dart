import 'package:flutter/material.dart';
import 'package:users_management/pages/display.users.pannel.page.dart';

void main() {
  runApp(const UserManagement());
}

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: DisplayUsersPannelPage(),
      ),
    );
  }
}
