// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CapstoneApp());
}

class CapstoneApp extends StatelessWidget {
  const CapstoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capstone Login',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LoginScreen(),
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  final _emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _attemptLogin() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pushNamed(
        context,
        WelcomeScreen.routeName,
        arguments: _emailController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login (Local Validation)')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth < 600 ? constraints.maxWidth : 600.0;
          return Center(
            child: SingleChildScrollView(
              child: Container(
                width: maxWidth,
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Sign in', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (value) {
                              final v = value?.trim() ?? '';
                              if (v.isEmpty) return 'Please enter your email';
                              if (!_emailRegex.hasMatch(v)) return 'Enter a valid email address';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                            ),
                            validator: (value) {
                              final v = value ?? '';
                              if (v.isEmpty) return 'Please enter your password';
                              if (v.length < 6) return 'Password must be at least 6 characters';
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _isLoading ? null : _attemptLogin,
                                  child: _isLoading
                                      ? const SizedBox(
                                          height: 18,
                                          width: 18,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        )
                                      : const Text('Login'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Forgot password?'),
                                  content: const Text('This demo has no backend. Reset flow is not implemented.'),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
                                  ],
                                ),
                              );
                            },
                            child: const Text('Forgot password?'),
                          ),
                          const SizedBox(height: 6),
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Test: use any valid email and password >=6 chars')),
                              );
                            },
                            child: const Text('Need test credentials?'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String? ?? 'user@example.com';
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 72, color: Colors.green),
            const SizedBox(height: 12),
            // Updated deprecated style
            Text('Welcome,', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(email, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
// This code is a simple Flutter app that demonstrates a login screen with local validation.
// It includes email and password fields, a login button, and a welcome screen that displays the