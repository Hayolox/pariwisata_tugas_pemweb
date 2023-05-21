import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:readmore/readmore.dart';

import '../theme.dart';

class DetailPages extends StatelessWidget {
  const DetailPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Detail",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 246,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
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
              const SizedBox(
                height: 24,
              ),
              Text(
                'Deskripsi',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const ReadMoreText(
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                trimLines: 4,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
