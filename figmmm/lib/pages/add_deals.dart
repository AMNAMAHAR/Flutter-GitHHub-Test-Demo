import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDeals extends StatefulWidget {
  const AddDeals({Key? key}) : super(key: key);

  @override
  State<AddDeals> createState() => _AddDealsState();
}
class _AddDealsState extends State<AddDeals> {
  File? _imageFile;
  final _picker = ImagePicker();
  TextEditingController _aboveDescriptionController = TextEditingController();
  TextEditingController _belowDescriptionController = TextEditingController();

  Future<void> _getImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print('Error picking image: $e');
      // You can add additional error handling logic here, such as showing an error message to the user.
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dealer Name',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 85,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'David Dealer',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                _buildTextFieldWithButton(
                  'Car Make',
                  'Select Make',
                  'images/img_26.png',
                      () {
                    // Show available car models
                    _showCarModelsDialog();
                  },
                ),
                _buildTextFieldWithButton(
                  'Car Model',
                  'Select Model',
                  'images/img_26.png',
                      () {
                    // Show available years
                    _showYearsDialog();
                  },
                ),
                _buildTextFieldWithButton(
                  'Year',
                  'Select Year',
                  'images/img_26.png',
                      () {
                    // Show available years
                    _showYearsDialog();
                  },
                ),
                _buildTextFieldWithButton(
                  'Trim',
                  'Select Trim',
                  'images/img_26.png',
                      () {
                    // Show trim options dialog
                    _showTrimDialog();
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Describe Your deal',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                SizedBox(
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your deal',
                        )

                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF113D6D), // Filled color blue
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Use the Camera',
                        style: TextStyle(color: Colors.white),
                      ),
                       // Use the camera white color
                      SizedBox(width: 10),
                      Icon(Icons.camera_alt, color: Colors.white),

                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Filled color blue
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gallery',
                        style: TextStyle(color: Color(0xFF113D6D)),
                      ),
                       // Gallery icon with white color
                      SizedBox(width: 10),
                      Icon(Icons.photo, color: Color(0xFF113D6D)),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add your cancel functionality here
                      },
                      child: Text('Cancel',style: TextStyle(),),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      color:  Color(0xFF113D6D),
                      child: TextButton(
                        onPressed: () {
                          // Add your add deal functionality here
                        },
                        child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                    ),
                  ],
                ),
                if (_imageFile != null) ...[
                  SizedBox(height: 24),
                  Text(
                    'Selected Image:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Image.file(_imageFile!),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithButton(
      String labelText,
      String hintText,
      String iconPath,
      void Function() onPressed,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        SizedBox(
          height: 85,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: TextButton(
                  onPressed: onPressed,
                  child: Image.asset(iconPath, height: 10),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showCarModelsDialog() {
    // Show dialog with available car models
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Car Model'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // List of available car models
                ListTile(
                  title: Text('Car Model 1'),
                  onTap: () {
                    // Handle selection
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text('Car Model 2'),
                  onTap: () {
                    // Handle selection
                    Navigator.of(context).pop();
                  },
                ),
                // Add more list items for other car models
              ],
            ),
          ),
        );
      },
    );
  }

  void _showYearsDialog() {
    // Show dialog with available years
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Year'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // List of available years
                ListTile(
                  title: Text('1980'),
                  onTap: () {
                    // Handle selection
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text('2024'),
                  onTap: () {
                    // Handle selection
                    Navigator.of(context).pop();
                  },
                ),
                // Add more list items for other years
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTrimDialog() {
    // Show dialog with available trim options
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Trim'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // List of available trim options
                ListTile(
                  title: Text('Trim Option 1'),
                  onTap: () {
                    // Handle selection
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text('Trim Option 2'),
                  onTap: () {
                    // Handle selection
                    Navigator.of(context).pop();
                  },
                ),
                // Add more list items for other trim options
              ],
            ),
          ),
        );
      },
    );
  }
}
