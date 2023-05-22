// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pariwisata_kita/pages/pages_view_model.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../auth/auth_view_model.dart';
import '../model/detail_model.dart';

class EditPages extends StatelessWidget {
  EditPages({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailModel?;
    final pagesViewModel = Provider.of<PagesViewModel>(context, listen: false);
    TextEditingController nameTouristC =
        TextEditingController(text: args!.name);
    TextEditingController imageUrlC =
        TextEditingController(text: args.imageUrl);
    TextEditingController addressC = TextEditingController(text: args.address);
    TextEditingController descriptionC =
        TextEditingController(text: args.description);
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
                      controller: addressC,
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
                          pagesViewModel.editData(
                              DetailModel(
                                  name: nameTouristC.text,
                                  imageUrl: imageUrlC.text,
                                  address: addressC.text,
                                  description: descriptionC.text,
                                  documentId: args.documentId),
                              context);
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
