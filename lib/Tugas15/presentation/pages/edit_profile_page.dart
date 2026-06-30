import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/di/injection.dart';
import '../../data/models/user_model.dart';
import '../../data/models/training_model.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel user;
  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _batchIdController;
  
  String _jenisKelamin = 'L';
  bool _isLoading = false;
  File? _imageFile;

  List<TrainingModel> _trainings = [];
  int? _selectedTrainingId;
  bool _isLoadingTrainings = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _batchIdController = TextEditingController(text: widget.user.batchId?.toString() ?? '1');
    _jenisKelamin = widget.user.jenisKelamin ?? 'L';
    
    // Parse existing training ID
    int? currentTrainingId;
    if (widget.user.trainingId != null) {
      currentTrainingId = int.tryParse(widget.user.trainingId.toString());
    }

    _fetchTrainings(currentTrainingId);
  }

  Future<void> _fetchTrainings(int? currentTrainingId) async {
    try {
      final trainings = await Injection.authRepository.getTrainings();
      if (mounted) {
        setState(() {
          _trainings = trainings;
          if (_trainings.isNotEmpty) {
            // Select current or first
            _selectedTrainingId = currentTrainingId ?? _trainings.first.id;
          }
          _isLoadingTrainings = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingTrainings = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load trainings: $e')),
        );
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  Future<void> _save() async {
    if (_nameController.text.trim().isEmpty || _emailController.text.trim().isEmpty) return;

    setState(() => _isLoading = true);
    try {
      await Injection.authRepository.updateProfile(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        jenisKelamin: _jenisKelamin,
        batchId: int.parse(_batchIdController.text),
        trainingId: _selectedTrainingId ?? 1,
      );
      
      if (_imageFile != null) {
        await Injection.authRepository.updateProfilePhoto(_imageFile!);
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!)
                    : (widget.user.profilePhotoUrl != null
                        ? NetworkImage(widget.user.profilePhotoUrl!)
                        : null) as ImageProvider?,
                child: _imageFile == null && widget.user.profilePhotoUrl == null
                    ? const Icon(Icons.camera_alt, size: 50)
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Tap to change photo'),
            const SizedBox(height: 24),
            
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            
            DropdownButtonFormField<String>(
              initialValue: _jenisKelamin == 'L' || _jenisKelamin == 'P' ? _jenisKelamin : 'L',
              decoration: const InputDecoration(labelText: 'Gender', border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: 'L', child: Text('Laki-laki')),
                DropdownMenuItem(value: 'P', child: Text('Perempuan')),
              ],
              onChanged: (v) => setState(() => _jenisKelamin = v!),
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _batchIdController,
              decoration: const InputDecoration(labelText: 'Batch ID', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            
            _isLoadingTrainings
                ? const Center(child: CircularProgressIndicator())
                : DropdownButtonFormField<int>(
                    initialValue: _selectedTrainingId,
                    decoration: const InputDecoration(labelText: 'Training', border: OutlineInputBorder()),
                    isExpanded: true,
                    items: _trainings.map((t) {
                      return DropdownMenuItem<int>(
                        value: t.id,
                        child: Text(t.title, overflow: TextOverflow.ellipsis),
                      );
                    }).toList(),
                    onChanged: (v) => setState(() => _selectedTrainingId = v),
                    validator: (v) => v == null ? 'Required' : null,
                  ),
            
            const SizedBox(height: 24),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save Changes'),
              ),
          ],
        ),
      ),
    );
  }
}
