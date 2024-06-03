import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AdvancedAvatar(
                    size: 80,
                    name: 'Parcidio André',
                    image: const NetworkImage(
                        'https://avatars.githubusercontent.com/u/44862147?v=4'),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Parcidio André',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  const Text(
                    'parcidioandre@gmail.com',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Informações de perfil'),
              onTap: () {
                // Handle profile info tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.devices),
              title: const Text('Dispositivos'),
              subtitle: const Text("Parcidio's S24 Ultra e mais 1 dispositivo"),
              onTap: () {
                // Handle devices tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Locais'),
              onTap: () {
                // Handle locations tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Segurança e privacidade'),
              trailing: const Icon(Icons.warning, color: Colors.orange),
              onTap: () {
                // Handle security and privacy tap
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.cloud, color: Colors.blue),
              title: const Text('Samsung Cloud'),
              subtitle: const Text(
                'Sincronizar • Fazer cópia de segurança • Restaurar',
              ),
              onTap: () {
                // Handle Samsung Cloud tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfileScreen(),
  ));
}
