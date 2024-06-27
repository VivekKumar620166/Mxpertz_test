import 'package:flutter/material.dart';

import 'MyDrawer.dart';

class MyMainScreenOne extends StatefulWidget {
  const MyMainScreenOne({Key? key}) : super(key: key);

  @override
  State<MyMainScreenOne> createState() => _MyMainScreenOneState();
}

class _MyMainScreenOneState extends State<MyMainScreenOne> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> images = [
    'assets/images/fashionone.png',
    'assets/images/fashionone1.png',
    'assets/images/fashionone2.png',
    'assets/images/fashionone.png',
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0; // Set the initial selected index to 0 (Recommend)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7, // Use 70% of screen width for drawer
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(Icons.person_add_rounded, size: 40, color: Colors.white),
                        ),
                    SizedBox(width: 20,),
                        Container(
                          child: Text(
                            "Mr.Vivek ",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 45),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.black),
                      SizedBox(width: 15,),
                      Text(
                        "Profile Setting",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),

                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.home, color: Colors.black),

                    SizedBox(width: 15,),
                    Text(
                      "Address",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),



                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.delivery_dining, color: Colors.black),
                        SizedBox(width:15),
                        Text(
                          "Orders",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.account_balance_sharp, color: Colors.black),
                    SizedBox(width: 15,),
                    Text(
                      "Account Setting",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )


                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.logout, color: Colors.black),
                    SizedBox(width:15),
                    Text(
                      "Log Out",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
      surfaceTintColor: Colors.white,
        title: Text(
          'uxeLoft',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 28),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.qr_code, color: Colors.black, size: 28),
            onPressed: () {
             
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Andrea",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "What are you looking for",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "today?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 180, // Set a fixed height for the container
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      height: 180,
                      width: 320,
                      child: Image.asset(images[index]),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildClickableText("Recommend", 0),
                    SizedBox(width: 15),
                    buildClickableText("Cell Phone", 1),
                    SizedBox(width: 15),
                    buildClickableText("Car Products", 2),
                    SizedBox(width: 15),
                    buildClickableText("Departments Store", 3),
                    SizedBox(width: 15),
                    buildClickableText("Shop", 4),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "See More",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 1),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/makeup.png', height: 55),
                            ],
                          ),
                        ),
                        Text(
                          "Beauty",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 1),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              Image.asset('assets/images/specialoffer.png', height: 48),
                            ],
                          ),
                        ),
                        Text(
                          "Offers",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 1),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/makeup.png', height: 55),
                            ],
                          ),
                        ),
                        Text(
                          "Beauty",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 1),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/soffa.png', height: 55),
                            ],
                          ),
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 1),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/shirt.png', height: 55),
                            ],
                          ),
                        ),
                        Text(
                          "Shirt",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 1),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              Image.asset('assets/images/handbag.png', height: 48),
                            ],
                          ),
                        ),
                        Text(
                          "Women",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 1),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/girlsdrees.png', height: 55),
                            ],
                          ),
                        ),
                        Text(
                          "Dress",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 1),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/appleiphone.png', height: 55),
                            ],
                          ),
                        ),
                        Text(
                          "Mobiles",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child:
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 15, // Adjust width as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/makeup.png',height: 80,),
                        Row(
                          children: [
                            Text(
                              "Multi Kit",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 14),
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_cart_rounded, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    "Add",
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$500',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Text("4.6"),
                            SizedBox(width: 7),
                            Text("86 Reviews"),
                            Icon(Icons.more_vert, color: Colors.grey)
                          ],
                        )
                      ],
                    ),
                  ),

                  // Second instance
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 15, // Adjust width as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/makeup.png',height: 80,),
                          Row(
                            children: [
                              Text(
                                "Multi Kit",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 14),
                              Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.shopping_cart_rounded, color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      "Add",
                                      style: TextStyle(fontSize: 15, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$500',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Text("4.6"),
                              SizedBox(width: 7),
                              Text("86 Reviews"),
                              Icon(Icons.more_vert, color: Colors.grey)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.select_all_rounded),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),  BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Private',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures labels are always shown
      ),
    );
  }

  Widget buildClickableText(String text, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isSelected ? Colors.orange : Colors.grey,
        ),
      ),
    );
  }
}
