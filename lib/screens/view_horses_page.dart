import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewHorsesScreen extends StatelessWidget {
  const ViewHorsesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogue')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('horses').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No horses available right now.'));
          }

          final horses = snapshot.data!.docs;

          return ListView.builder(
            itemCount: horses.length,
            itemBuilder: (context, index) {
              // Extract the data map from the Firestore document
              final data = horses[index].data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(data['name'] ?? 'Unknown Horse'),
                  subtitle: Text('${data['breed']} • ${data['height']}'),
                  trailing: Text(data['sellerName'] ?? ''),
                  onTap: () {

                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}