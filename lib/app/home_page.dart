import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.auth,
  }) : super(key: key);
  final AuthBase auth;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          TextButton(
            onPressed: _signOut,
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      // body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      //   stream: FirebaseFirestore.instance.collection('missions').snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       final data = snapshot.data;
      //       final docs = data!.docs;

      //       return ListView.builder(
      //           itemCount: docs.length,
      //           itemBuilder: ((context, index) => ListTile(
      //                 title: Text(docs[index].data()['name']),
      //               )));
      //     } else
      //       return Center(child: CircularProgressIndicator());
    );
  }
}
