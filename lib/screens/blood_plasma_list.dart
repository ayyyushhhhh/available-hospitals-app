import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospitals_app/screens/add_blood_plasma.dart';
import 'package:hospitals_app/screens/add_oxygen.dart';
import 'package:hospitals_app/widgets/reusbale_widgets.dart';

class BloodPlasmaListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Blood And Plasma'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.post_add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return AddBloodPlasma();
            }));
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Blood Plasma')
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot data = snapshot.data.docs[index];
                          return InfoContainer(
                              title: data.data()['Title'],
                              address: data.data()['Address'],
                              contactNumber: data.data()['Phone Number'],
                              numOfBeds: data.data()['Blood Group'],
                              location: data.data()['location'],
                              description: data.data()['Description']);
                        },
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error));
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
