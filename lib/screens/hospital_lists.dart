import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospitals_app/screens/add_hospitals.dart';
import 'package:hospitals_app/screens/blood_plasma_list.dart';
import 'package:hospitals_app/screens/oxygen_list.dart';
import 'package:hospitals_app/screens/remedesvir_list.dart';
import 'package:hospitals_app/widgets/reusbale_widgets.dart';

class HospitalListScreen extends StatefulWidget {
  @override
  _HospitalListScreenState createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [
    AddHospitalWidget(),
    OxygenListScreen(),
    BloodPlasmaListScreen(),
    RemedesvirListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_hospital,
              size: 40,
            ),
            label: 'Beds',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.asterisk_circle,
                size: 40,
              ),
              label: 'Oxygen'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.description_sharp,
                size: 40,
              ),
              label: 'Blood And Plasma'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.pills,
                size: 40,
              ),
              label: 'Medicines'),
        ],
      ),
    );
  }
}

class AddHospitalWidget extends StatelessWidget {
  const AddHospitalWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beds'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.post_add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return AddHospitals();
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
                    .collection('Hospitals')
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
                          numOfBeds: data.data()['Number Of Beds'],
                          location: data.data()['location'],
                          description: data.data()['Description'],
                          typeWidget: widgetType.bed,
                        );
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
      ),
    );
  }
}
