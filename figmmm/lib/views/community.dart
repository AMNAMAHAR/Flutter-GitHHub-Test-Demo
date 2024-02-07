import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../homepage.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
          IconButton(
          onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    },
      icon:
      CircleAvatar(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 10),
                         child: Image.asset('images/img_7.png',height: 150,width: 300,),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Our Best Deals',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,color: Colors.black38,
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
                                SizedBox(width:120),


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


              ]
            ),

        ),
        ]
      ),

    ),
    ]
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
              height: 40,
              width: 40,
              decoration: BoxDecoration( color: Colors.blue,borderRadius: BorderRadius.circular(20)),

              child: TextButton(
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Community(),) );
                },
                  child: Image.asset('images/img_10.png',height: 15,)),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              },
                child: Image.asset('images/img_11.png',height: 15,)), // Handshake icon
            label: 'Handshake',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/img_12.png',height: 15,),
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

