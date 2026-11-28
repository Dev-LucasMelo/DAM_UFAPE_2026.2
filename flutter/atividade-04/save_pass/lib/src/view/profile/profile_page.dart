import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_pass/src/controller/sqlite_password_controller.dart';
import 'package:save_pass/src/model/profile_model.dart';
import 'package:save_pass/ui/colors.dart';
import 'package:save_pass/ui/text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _profileLoaded = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SQlitePasswordController>(
      builder: (context, controller, child) {
        // Recupera os dados salvos no SQLite.
        if (controller.isInitialized && !_profileLoaded) {
          final profile = controller.profile;

          if (profile != null) {
            _usernameController.text = profile.username;
            _emailController.text = profile.email;
            _passwordController.text = profile.password;
          }

          _profileLoaded = true;
        }

        return Scaffold(
          backgroundColor: AppColors.black900,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            title: Text(
              'Meu perfil',
              style: AppTextStyle.headline5,
            ),
          ),
          body: !controller.isInitialized
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),

                        Center(
                          child: Text(
                            'Informações do perfil',
                            style: AppTextStyle.headline4,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Nome de usuário
                        Text(
                          'Nome de usuário',
                          style: AppTextStyle.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Digite seu nome',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Informe seu nome de usuário.';
                            }

                            if (value.trim().length < 3) {
                              return 'O nome deve ter pelo menos 3 caracteres.';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 24),

                        // E-mail
                        Text(
                          'E-mail de recuperação',
                          style: AppTextStyle.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Digite seu e-mail',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Informe seu e-mail.';
                            }

                            final emailRegex =
                                RegExp(r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$');

                            if (!emailRegex.hasMatch(value.trim())) {
                              return 'Digite um e-mail válido.';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 24),

                        // Senha
                        Text(
                          'Senha secreta',
                          style: AppTextStyle.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Digite sua senha',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe sua senha.';
                            }

                            if (value.length < 6) {
                              return 'A senha deve ter pelo menos 6 caracteres.';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 32),

                        // Salvar perfil
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final profile = ProfileModel(
                                  username: _usernameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                );

                                final messenger = ScaffoldMessenger.of(context);

                                await controller.saveProfile(profile);

                                if (!mounted) return;

                                Navigator.pop(context);

                                messenger.showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Perfil salvo com sucesso!',
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text('Salvar perfil'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
