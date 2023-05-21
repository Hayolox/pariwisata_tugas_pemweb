// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../theme.dart';

class EditPages extends StatelessWidget {
  EditPages({super.key});
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameTouristC = TextEditingController();
  TextEditingController imageUrlC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Edit Data",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
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
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: nameTouristC,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                        labelText: 'Nama Wisata',
                        labelStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Nama Wisata tidak boleh kosong';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: imageUrlC,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                        labelText: 'Url Image',
                        labelStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Url Image tidak boleh kosong';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: nameTouristC,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                        labelText: 'Alamat',
                        labelStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Alamat tidak boleh kosong';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: descriptionC,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                        labelText: 'Deskripsi',
                        labelStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Deskripsi tidak boleh kosong';
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
                          nameTouristC.clear();
                          addressC.clear();
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
                          'Edit',
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
