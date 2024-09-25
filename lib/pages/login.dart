import 'package:flutter/material.dart';
import 'package:streaming/pages/cadastro.dart';
import 'package:streaming/shared/style.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 100,
        padding: const EdgeInsets.all(48),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            myColors.azulTopGradiente,
            myColors.azulBottomGradiente
          ]),
            color: Colors.white),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/2469183_de912.png",
                width: 300,
                height: 300,),
                const SizedBox(height: 30),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.mail), hintText: "Digite o Email"),
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
                  decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        child: Icon(_showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      hintText: "Digite a senha"),
                  obscureText: _showPassword == false ? true : false,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    buttonEnterClick();
                  },
                  child: const Text("Entrar",
                      style: const TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                ),
                const Divider(
                  color: Colors.black87,
                ),
                GestureDetector(
                  child: const Text(
                    "Cadastro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900
                      ),
                    ),
                  onTap: () => {
                    Navigator.pushNamed(context, "/Cadastro")
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buttonEnterClick() {
    if (_formkey.currentState!.validate()) {
      print("form ok");
      Navigator.pushReplacementNamed(context, "/Home");
    } else {
      print("form erro");
    }
  }
}
