import 'package:flutter/material.dart';
import 'package:streaming/pages/login.dart';
import 'package:streaming/shared/style.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formkey = GlobalKey<FormState>();
  bool _showPasswordcads2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
          height: MediaQuery.of(context).size.height * 100,
          padding: const EdgeInsets.all(48.0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            myColors.azulTopGradiente,
            myColors.azulBottomGradiente])),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Cadastro",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.man),
                      hintText: "Nome",
                    ),
                    validator: (String? nome) {
                      if (nome == "" || nome == null) {
                        return "Deve haver um Nome na caixa";
                      }
                      if (nome.length < 6) {
                        return "O Nome é curto demais";
                      }
                      if (nome.contains("@") &&
                          nome.contains(".") &&
                          nome.contains(",")) {
                        return "Nome inválido";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.numbers),
                      hintText: "CPF",
                    ),
                    validator: (String? cpf) {
                      if (cpf == "" || cpf == null) {
                        return "Deve haver um cpf na caixa";
                      }
                      if (cpf.length < 6) {
                        return "O cpf é curto demais";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "Email",
                    ),
                    validator: (String? email) {
                      if (email == "" || email == null) {
                        return "Deve haver um email na caixa";
                      }
                      if (email.length < 6) {
                        return "O email é curto demais";
                      }
                      if (!email.contains("@")) {
                        return "Email inválido";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.add_ic_call),
                      hintText: "Número",
                    ),
                    validator: (String? num) {
                      if (num == "" || num == null) {
                        return "Deve haver um telefone na caixa";
                      }
                      if (num.length < 6) {
                        return "O telefone é curto demais";
                      }
                      if (num.contains("@")) {
                        return "telefone inválido";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: _showPasswordcads2 == false ? true : false,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPasswordcads2 == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onTap: () {
                            setState(() {
                              _showPasswordcads2 = !_showPasswordcads2;
                            });
                          },
                        ),
                        hintText: "Senha"),
                    validator: (String? password) {
                      if (password == "" || password == null) {
                        return "Deve haver uma senha na caixa";
                      }
                      if (password.length < 6) {
                        return "A senha é curta demais";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Confirme a senha",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      buttonEnterClick();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    child: const Text("Cadastrar",
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const Divider(
                    color: Colors.black87,
                  ),
                  GestureDetector(
                    child: Text("Login",
                    style: TextStyle(
                      color: Colors.red.shade300,
                      fontSize: 16,
                      fontWeight: FontWeight.w900
                    ),),
                    onTap: () => {
                      Navigator.pop(context, "/")
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  buttonEnterClick() {
    if (_formkey.currentState!.validate()) {
      print("form ok");
    } else {
      print("form erro");
    }
  }
}
