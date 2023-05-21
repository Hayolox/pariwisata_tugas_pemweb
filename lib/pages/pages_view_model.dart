import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PagesViewModel extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> getDataHome() {
    CollectionReference dataPariwisata =
        firestore.collection('data_pariwisata');

    return dataPariwisata.snapshots();
  }
}
