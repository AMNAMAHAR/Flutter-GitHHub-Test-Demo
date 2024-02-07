import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ChatsScreen.dart';
import '../pages/chatscreen.dart';
import 'Profile.dart';

class MyDeals extends StatefulWidget {
  const MyDeals({Key? key}) : super(key: key);

  @override
  _MyDealsState createState() => _MyDealsState();
}

class _MyDealsState extends State<MyDeals> {
  TextEditingController _replyController = TextEditingController();
  String _replyMessage = '';
  int _selectedIndex = 0; // Track the selected index for bottom navigation

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Logo Here',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.blue[700]),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              radius: 15,
              child: Image.asset(
                'images/cad4c767-5669-42f0-b2cf-92a3ed3f31fc.jpg',
                height: 20,
                width: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Add a deal here',
                    border: OutlineInputBorder(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/img.png',height: 20,),
                    ),

                    ),
                  ),
                ),

              SizedBox(height: 20),
              Container(
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Latest Deals in the community',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            Text(
                              "Suzuki Mehran",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('2012', style: TextStyle(color: Colors.black)),
                            SizedBox(height: 10),
                            Container(
                              height: 90,
                              width: 140,
                              color: Color(0xfffD9D9D9),
                              child: Image.asset('images/img_1.png', height: 100, width: 80),
                            ),
                            SizedBox(height: 10),
                            Image.asset('images/img_2.png', height: 100),
                            SizedBox(height: 10),
                            Text('\$72.00/ Metro Dealers'),
                            SizedBox(height: 10),
                            Text(
                              'Lorem ipsum dolor sit amet consectetur. Ac vitae neque feugiat vitae ut adipiscing. Aliquet ac nulla sed aliquam eget lobortis. Turpis lacinia in faucibus egestas vel quis adipiscing magnis. Mattis neque sagittis commodo tellus sed.',
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 90,
                                    width: 80,
                                    color: Color(0xFFFFFFFD9D9D9),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Container(
                                    height: 90,
                                    width: 80,
                                    color: Color(0xFFFFFFFD9D9D9),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Container(
                                    height: 90,
                                    width: 80,
                                    color: Color(0xFFFFFFFD9D9D9),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Image.asset('images/img_15.png', height: 25),
                                SizedBox(width: 3),
                                Text('39', style: TextStyle(color: Colors.black38, fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'All Comments',
                      style: GoogleFonts.poppins(fontSize: 16, color: Colors.black38),
                    ),
                    SizedBox(height: 10),
                    CommentWidget(
                      commenterName: 'Hector Mariano',
                      commentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit sem arcu vitae.',
                      commentTime: '1 hour ago',
                      profileImageAsset: 'images/img_16.png',
                      onPressed: () {
                        _showReplyDialog(context, 'Hector Mariano');
                      },
                    ),
                    SizedBox(height: 10),
                    CommentWidget(
                      commenterName: 'Aleim King',
                      commentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit sem arcu vitae.',
                      commentTime: '1 hour ago',
                      profileImageAsset: 'images/img_20.png',
                      onPressed: () {
                        _showReplyDialog(context, 'Aleim King');
                      },
                    ),
                    SizedBox(height: 10),
                    CommentWidget(
                      commenterName: 'James Bond',
                      commentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit sem arcu vitae.',
                      commentTime: '1 hour ago',
                      profileImageAsset: 'images/img_21.png',
                      onPressed: () {
                        _showReplyDialog(context, 'James Bond');
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _replyController,
                  onChanged: (value) {
                    setState(() {
                      _replyMessage = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Write your reply here...',
                    border: InputBorder.none,
                  ),
                ),
              ),


                ],
              ),

          ),
        ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // Fixed type to take full width
        showSelectedLabels: true, // Show labels
        showUnselectedLabels: true, // Show labels
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  // Add the desired navigation functionality
                },
                child: Image.asset('images/img_10.png', height: 15),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: TextButton(
              onPressed: () {
                // Add the desired navigation functionality
              },
              child: Image.asset('images/img_11.png', height: 15),
            ),
            label: 'Handshake',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/img_12.png', height: 15),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(),));
                },
                child: Image.asset('images/img_9.png', height: 15)),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile() ,));
                },
                child: Image.asset('images/img_13.png', height: 15)),
            label: 'User',
          ),
        ],
      ),
    );
  }

  void _showReplyDialog(BuildContext context, String commenterName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Reply to $commenterName'),
              content: TextField(
                controller: _replyController,
                onChanged: (value) {
                  setState(() {
                    _replyMessage = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Type your reply here',
                ),
                onSubmitted: (value) {
                  if (_replyMessage.isNotEmpty) {
                    _sendReply(context, commenterName);
                  }
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _replyMessage.isEmpty
                      ? null
                      : () {
                    _sendReply(context, commenterName);
                  },
                  child: Text('Reply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _sendReply(BuildContext context, String commenterName) {
    // Simulate sending reply
    Future.delayed(Duration(seconds: 2), () {
      print('Reply sent to $commenterName: $_replyMessage');
      _replyController.clear();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thanks for your developer and good working  $commenterName'),
          duration: Duration(seconds: 5),
        ),
      );
    });
  }
}

class CommentWidget extends StatelessWidget {
  final String commenterName;
  final String commentText;
  final String commentTime;
  final String profileImageAsset;
  final VoidCallback onPressed;

  const CommentWidget({
    Key? key,
    required this.commenterName,
    required this.commentText,
    required this.commentTime,
    required this.profileImageAsset,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(profileImageAsset),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      commenterName,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(width: 5),
                    Text(
                      commentTime,
                      style: TextStyle(color: Colors.blue[100]),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  commentText,
                  style: TextStyle(color: Colors.blue[100]),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: onPressed,
                  child: TextField(
                    decoration: InputDecoration(

                      hintText: 'Reply',

                      border: InputBorder.none,

                    ),


                          ),

                      ),
                    ]
                    ),
                  ),
                ),
              ],




    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyDeals(),
  ));
}
