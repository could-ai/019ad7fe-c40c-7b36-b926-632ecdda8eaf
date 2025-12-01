import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Settings'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          _buildSectionHeader('General'),
          _buildSwitchTile('Save location', true),
          _buildSwitchTile('Camera sounds', false),
          _buildSwitchTile('Google Lens suggestions', true),
          _buildDivider(),
          _buildSectionHeader('Photos'),
          _buildListTile('Camera photo resolution', 'Full resolution'),
          _buildSwitchTile('Save selfie as previewed', true),
          _buildDivider(),
          _buildSectionHeader('Videos'),
          _buildListTile('Back camera video resolution', '4K (60 FPS)'),
          _buildListTile('Front camera video resolution', '1080p'),
          _buildSwitchTile('Video stabilization', true),
          _buildDivider(),
          _buildSectionHeader('Advanced'),
          _buildSwitchTile('HDR+ control', true),
          _buildSwitchTile('RAW + JPEG control', false),
          _buildListTile('Grid type', '3 x 3'),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.yellowAccent,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      value: value,
      onChanged: (val) {},
      activeColor: Colors.yellowAccent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildListTile(String title, String subtitle) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildDivider() {
    return const Divider(color: Colors.white24, height: 1);
  }
}
