// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 36,
            bottom: 36,
            left: 51,
            right: 51,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Kelompok 16',
                    style: primaryTextStyle.copyWith(
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                    child: Image.asset(
                  'assets/logo.png',
                  width: 150,
                )),
                const SizedBox(
                  height: 18,
                ),
                Center(
                  child: Text(
                    'Silahkan Login',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: emailC,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Email',
                    labelStyle: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Email tidak boleh kosong';
                    }

                    final regex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                    if (!regex.hasMatch(value!)) {
                      return 'Email tidak valid';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: passC,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Password',
                    labelStyle: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Password tidak boleh kosong';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      emailC.clear();
                      passC.clear();
                    }
                  },
                  child: Container(
                    height: 37,
                    width: 128,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      'Log IN',
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
