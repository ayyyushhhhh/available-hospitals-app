import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddHospitals extends StatefulWidget {
  @override
  _AddHospitalsState createState() => _AddHospitalsState();
}

class _AddHospitalsState extends State<AddHospitals> {
  bool isLoading = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController titleController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController bedsController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Correct Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: bedsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number Of Beds',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Additional Information'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (isLoading == false) {
                      try {
                        addtoCloud(context);
                      } catch (e) {
                        print(e.toString());
                      } finally {
                        isLoading = false;
                        setState(() {});
                      }
                    } else {
                      return null;
                    }
                  },
                  child: isLoading == false
                      ? Text('Submit')
                      : CircularProgressIndicator()),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                ),
                child: Text(
                  'Please, fill complete and neccessary information. Please make sure you have verified the details before filling it. Thank you.',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addtoCloud(BuildContext context) {
    print(titleController.text);

    if (titleController.text != "" &&
        addressController.text != "" &&
        phoneNumberController.text != "" &&
        bedsController.text != "" &&
        locationController.text != "" &&
        descriptionController.text != "") {
      isLoading = true;
      setState(() {});
      Map<String, String> data = {
        'Title': titleController.text,
        'Address': addressController.text,
        'Phone Number': phoneNumberController.text,
        'Number Of Beds': bedsController.text,
        'location': locationController.text,
        'Description': descriptionController.text,
      };
      firestore.collection('Hospitals').add(data);
      Navigator.pop(context);
    } else {}
  }
}