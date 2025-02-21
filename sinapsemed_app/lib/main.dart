import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SinapseMed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Chave para o formulário
  final _formKey = GlobalKey<FormState>();

  // Variáveis para armazenar os valores dos campos
  String _email = '';
  String _password = '';

  // Função para tratar o envio do formulário
  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Salva os valores dos campos
      _formKey.currentState!.save();

      // Aqui você integraria a lógica de autenticação com seu backend.
      // Por enquanto, vamos exibir um diálogo simulando o login bem-sucedido.
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Login Realizado'),
          content: Text('Email: $_email\nSenha: $_password'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login SinapseMed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Campo para o e-mail
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  // Validação simples de email
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Insira um email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              // Campo para a senha
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 20),
              // Botão de login
              ElevatedButton(
                onPressed: _submit,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
