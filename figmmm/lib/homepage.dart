import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/my deals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a deal here',
                        border: OutlineInputBorder(),
                        suffixIcon: Image.asset(
                          'images/img.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Text(
                          'Your Latest Deals',
                          style: GoogleFonts.poppins(fontSize: 20),
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
                                SizedBox(width: 50),
                                Text(
                                  'Featured',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('2012', style: TextStyle(color: Colors.black)),
                                SizedBox(width: 210),
                                Container(
                                  height: 90,
                                  width: 140,
                                  color: Color(0xfffD9D9D9),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('images/img_1.png',
                                        height: 100, width: 80),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Image.asset('images/img_2.png', height: 100),
                                SizedBox(height: 25),
                                SizedBox(width: 50),
                                Text('\$72.00/ Metro Dealers'),
                                SizedBox(width: 80),
                                Text(
                                  'Lorem ipsum dolor sit amet consectetur. Ac vitae neque feugiat vitae ut adipiscing. Aliquet ac nulla sed aliquam eget lobortis. Turpis lacinia in faucibus egestas vel quis adipiscing magnis. Mattis neque sagittis commodo tellus sed.',
                                ),
                                SizedBox(width: 18, height: 20),
                                Container(
                                  height: 90,
                                  width: 80,
                                  color: Color(0xFFFFFFFD9D9D9),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  height: 90,
                                  width: 80,
                                  color:Color(0xFFFFFFFD9D9D9),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  height: 90,
                                  width: 80,
                                  color: Color(0xFFFFFFFD9D9D9),
                                ),
                              ],
                            ),
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
                                SizedBox(width: 50),
                                Text(
                                  'Featured',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('2012',
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(width: 210),
                                Container(
                                  height: 20,
                                  width: 150,
                                  color: Color(0xFFFFFFFD9D9D9),
                                ),
                                SizedBox(width: 5,),
                                Image.asset('images/img_4.png',
                                    height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        showSelectedLabels: true, // Hide labels
        showUnselectedLabels: true, // Hide labels
        items: [
          BottomNavigationBarItem(
            icon:Container(
              height: 60,
                width: 50,
                child: Image.asset('images/img_10.png',height: 15,)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/img_11.png',height: 15,color: Colors.blue[500]), // Handshake icon
            label: 'Handshake',
          ),
          BottomNavigationBarItem(
            icon: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyDeals(),));
              },
                child: Image.asset('images/img_12.png',height: 15,)),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/img_9.png',height: 15,),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/img_13.png',height: 15,),
            label: 'User',
          ),

        ],
      ),
    );
  }
}
