import 'package:flutter/material.dart';

import '../../core/di/injection.dart';
import '../../data/models/user_model.dart';
import 'edit_profile_page.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<UserModel> _profileFuture;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  void _fetchProfile() {
    setState(() {
      _profileFuture = Injection.authRepository.getProfile();
    });
  }

  Future<void> _logout() async {
    await Injection.authRepository.logout();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff976d2c),
      appBar: AppBar(
        backgroundColor: const Color(0xFff5a623),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: _logout,
          ),
        ],
      ),
      body: FutureBuilder<UserModel>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: _fetchProfile,
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }
          if (!snapshot.hasData) return const SizedBox.shrink();

          final user = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async => _fetchProfile(),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: user.profilePhotoUrl != null
                        ? NetworkImage(user.profilePhotoUrl!)
                        : null,
                    child: user.profilePhotoUrl == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
                const SizedBox(height: 24),
                _buildInfoTile('Name', user.name ?? '-'),
                _buildInfoTile('Email', user.email ?? '-'),
                _buildInfoTile(
                  'Gender', 
                  user.jenisKelamin == 'L' ? 'Laki-laki' : (user.jenisKelamin == 'P' ? 'Perempuan' : '-'),
                ),
                _buildInfoTile('Batch ID', user.batchId?.toString() ?? user.batchKe ?? '-'),
                _buildInfoTile(
                  'Training',
                  user.trainingTitle ?? user.trainingId?.toString() ?? '-',
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFff5a623),
                  ),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditProfilePage(user: user),
                      ),
                    );
                    if (result == true) {
                      _fetchProfile();
                    }
                  },
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
    );
  }
}
