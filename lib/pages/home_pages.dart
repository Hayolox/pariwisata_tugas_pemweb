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
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onDoubleTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return EditPages();
                                  },
                                ));
                              },
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const DetailPages();
                                  },
                                ));
                              },
                              child: ListTile(
                                leading: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/pemweb-d32fa.appspot.com/o/kahayan.jpeg?alt=media&token=ea2b88ff-19ad-4963-9e83-05b3d3bc575b',
                                  height: 100,
                                  width: 66,
                                ),
                                title: Text(
                                  'Jembatan Kahayan',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xff4C4DDC),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                      child: Text(
                                          'Alice Springs NT 0870, Australia',
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
