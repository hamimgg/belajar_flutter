import 'package:flutter/material.dart';

import '../../core/di/injection.dart';
import '../../data/models/training_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _batchIdController = TextEditingController(text: '1');

  String _jenisKelamin = 'L';
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  List<TrainingModel> _trainings = [];
  int? _selectedTrainingId;
  bool _isLoadingTrainings = true;

  @override
  void initState() {
    super.initState();
    _fetchTrainings();
  }

  Future<void> _fetchTrainings() async {
    try {
      final trainings = await Injection.authRepository.getTrainings();
      if (mounted) {
        setState(() {
          _trainings = trainings;
          if (_trainings.isNotEmpty) {
            _selectedTrainingId = _trainings.first.id;
          }
          _isLoadingTrainings = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingTrainings = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load trainings: $e')));
      }
    }
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await Injection.authRepository.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        jenisKelamin: _jenisKelamin,
        batchId: int.parse(_batchIdController.text),
        trainingId: _selectedTrainingId ?? 1,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
        Navigator.pop(context); // Go back to login
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      appBar: AppBar(
        title: const Text('Register', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2C2C2C),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                obscureText: true,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _jenisKelamin,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'L',
                    child: Text(
                      'Laki-laki',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'P',
                    child: Text(
                      'Perempuan',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
                onChanged: (v) => setState(() => _jenisKelamin = v!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _batchIdController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Batch ID',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              _isLoadingTrainings
                  ? const Center(child: CircularProgressIndicator())
                  : DropdownButtonFormField<int>(
                      initialValue: _selectedTrainingId,
                      decoration: const InputDecoration(
                        labelText: 'Training',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      isExpanded: true,
                      items: _trainings.map((t) {
                        return DropdownMenuItem<int>(
                          value: t.id,
                          child: Text(
                            t.title,
                            style: TextStyle(color: Colors.orange),
                            overflow: TextOverflow.ellipsis,
                          ),
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
                  onPressed: _register,
                  child: const Text('Register'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
