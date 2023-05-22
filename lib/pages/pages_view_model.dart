import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pariwisata_kita/model/detail_model.dart';

import '../common/dialog.dart';

class PagesViewModel extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> getDataHome() {
    CollectionReference dataPariwisata = db.collection('data_pariwisata');

    return dataPariwisata.snapshots();
  }

  void addData(String nama, String imageUrl, String alamat, String deskripsi,
      BuildContext context) {
    CollectionReference dataWisata = db.collection('data_pariwisata');
    dataWisata.add(
      {
        'alamat': alamat,
        'deskripsi': deskripsi,
        'image_url': imageUrl,
        'nama': nama
      },
    );
    alertDialog('Info', 'Berhasil Tambah Data', DialogType.success, context);
  }

  void editData(DetailModel data, BuildContext context) {
    // Mendapatkan referensi dokumen yang ingin diedit
    DocumentReference docRef =
        db.collection('data_pariwisata').doc(data.documentId);

// Data yang ingin diupdate
    Map<String, dynamic> updatedData = {
      'alamat': data.address,
      'deskripsi': data.description,
      'image_url': data.imageUrl,
      'nama': data.name
      // field dan nilai terbaru lainnya sesuai kebutuhan
    };

// Melakukan update data
    docRef.update(updatedData).then((value) {
      Navigator.pop(context);
    }).catchError((error) {
      alertDialog('Info', 'Sistem Eror : $error', DialogType.error, context);
    });
  }

  void deleteData(String documentId, BuildContext context) {
    db
        .collection('data_pariwisata')
        .doc(documentId)
        .delete()
        .then((value) {})
        .catchError((error) {
      alertDialog('Info', 'Berhasil Hapus Data', DialogType.success, context);
    });
  }
}
