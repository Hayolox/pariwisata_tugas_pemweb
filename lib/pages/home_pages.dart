import 'package:flutter/material.dart';
import 'package:pariwisata_kita/pages/add_pages.dart';
import 'package:pariwisata_kita/pages/detail_pages.dart';
import 'package:pariwisata_kita/pages/edit_pages.dart';
import 'package:pariwisata_kita/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () {},
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
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
                      leading: Image.asset(
                        'assets/logo.png',
                        height: 75,
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
                            child: Text('Alice Springs NT 0870, Australia',
                                maxLines: 2, overflow: TextOverflow.clip),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
