import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBloodPlasma extends StatefulWidget {
  @override
  _AddBloodPlasmaState createState() => _AddBloodPlasmaState();
}

class _AddBloodPlasmaState extends State<AddBloodPlasma> {
  bool isLoading = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController titleController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController bloodgroupController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final String errorText = "Please fill the details";

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
                decoration: InputDecoration(
                    labelText: 'Title',
                    errorText: titleController.text == null ? errorText : null),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                    labelText: 'Address',
                    errorText:
                        addressController.text == null ? errorText : null),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    errorText:
                        phoneNumberController.text == null ? errorText : null),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: bloodgroupController,
                decoration: InputDecoration(
                    labelText: 'Blood Group',
                    errorText:
                        bloodgroupController.text == null ? errorText : null),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                    labelText: 'Location',
                    errorText:
                        locationController.text == null ? errorText : null),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Additional Information',
                    errorText:
                        descriptionController.text == null ? errorText : null),
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
                  color: Colors.black12,
                ),
                child: Text(
                  'Please, fill complete and neccessary information. Please make sure you have verified the details before filling it. Thank you.',
                  style: TextStyle(fontSize: 20, color: Colors.black),
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
        phoneNumberController.text != "" &&
        bloodgroupController.text != "" &&
        locationController.text != "" &&
        descriptionController.text != "") {
      isLoading = true;
      setState(() {});
      Map<String, String> data = {
        'Title': titleController.text,
        'Address': addressController.text,
        'Phone Number': phoneNumberController.text,
        'Blood Group': bloodgroupController.text,
        'location': locationController.text,
        'Description': descriptionController.text,
      };
      firestore.collection('Blood Plasma').add(data);
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Please Fill All the Information'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
              ));
    }
  }
}
