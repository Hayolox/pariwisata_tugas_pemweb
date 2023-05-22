import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pariwisata_kita/auth/signIn_page.dart';
import 'package:pariwisata_kita/pages/add_pages.dart';
import 'package:pariwisata_kita/pages/detail_pages.dart';
import 'package:pariwisata_kita/pages/edit_pages.dart';
import 'package:pariwisata_kita/pages/pages_view_model.dart';
import 'package:pariwisata_kita/theme.dart';
import 'package:provider/provider.dart';

import '../auth/auth_view_model.dart';
import '../model/detail_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 18),
          children: [
            const SizedBox(
              height: 12,
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Tambah Data'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AddPages();
                  },
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                authViewModel.logout();
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SignInPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 19),
            Text(
              'Wisata Palangka Raya',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Consumer<PagesViewModel>(
              builder: (context, value, child) {
                return StreamBuilder<QuerySnapshot<Object?>>(
                  stream: value.getDataHome(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      var listAllDataDocs = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listAllDataDocs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onLongPress: () {
                                AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.info,
                                        animType: AnimType.rightSlide,
                                        title: 'KONFIRMASI',
                                        desc: 'Yakin Untuk Menghapus Data Ini?',
                                        btnOkOnPress: () {
                                          value.deleteData(
                                              listAllDataDocs[index].id,
                                              context);
                                        },
                                        btnCancelOnPress: () {})
                                    .show();
                              },
                              onDoubleTap: () {
                               Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return EditPages();
                                      },
                                      settings: RouteSettings(
                                          arguments: DetailModel(
                                              name:
                                                  (listAllDataDocs[index].data()
                                                      as Map<String,
                                                          dynamic>)['nama'],
                                              imageUrl: (listAllDataDocs[index]
                                                          .data()
                                                      as Map<String, dynamic>)[
                                                  'image_url'],
                                              address: (listAllDataDocs[index]
                                                      .data()
                                                  as Map<String, dynamic>)['alamat'],
                                              description: (listAllDataDocs[index].data() as Map<String, dynamic>)['deskripsi'], documentId:   listAllDataDocs[index].id),),
                                    ));
                              },
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const DetailPages();
                                      },
                                      settings: RouteSettings(
                                          arguments: DetailModel(
                                              name:
                                                  (listAllDataDocs[index].data()
                                                      as Map<String,
                                                          dynamic>)['nama'],
                                              imageUrl: (listAllDataDocs[index]
                                                          .data()
                                                      as Map<String, dynamic>)[
                                                  'image_url'],
                                              address: (listAllDataDocs[index]
                                                      .data()
                                                  as Map<String, dynamic>)['alamat'],
                                              description: (listAllDataDocs[index].data() as Map<String, dynamic>)['deskripsi'], documentId:   listAllDataDocs[index].id),),
                                    ));
                              },
                              child: ListTile(
                                leading: Image.network(
                                  (listAllDataDocs[index].data()
                                      as Map<String, dynamic>)['image_url'],
                                  height: 100,
                                  width: 66,
                                ),
                                title: Text(
                                  (listAllDataDocs[index].data()
                                      as Map<String, dynamic>)['nama'],
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xff4C4DDC),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                      child: Text(
                                          (listAllDataDocs[index].data() as Map<
                                              String, dynamic>)['alamat'],
                                          maxLines: 2,
                                          overflow: TextOverflow.clip),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
