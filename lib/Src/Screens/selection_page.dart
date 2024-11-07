import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Src/Screens/bottomNavigation.dart';
import 'package:news_app/Src/Screens/main_page.dart';
import 'package:news_app/Src/Widgets/Category_card.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen> {
  List<dynamic> allCategories = [
    {'name': 'Food', 'label': 'Food', 'icon': Icons.fastfood_outlined},
    {'name': 'World', 'label': 'World', 'icon': Icons.public_outlined},
    {'name': 'Sports', 'label': 'Sports', 'icon': Icons.sports_soccer_outlined},
    {
      'name': 'Health',
      'label': 'Health',
      'icon': Icons.health_and_safety_outlined
    },
    {'name': 'Travel', 'label': 'Travel', 'icon': Icons.flight_outlined},
    {'name': 'Science', 'label': 'Science', 'icon': Icons.science_outlined},
    {
      'name': 'Finance',
      'label': 'Finance',
      'icon': Icons.attach_money_outlined
    },
    {'name': 'Weather', 'label': 'Weather', 'icon': Icons.cloud_outlined},
    {
      'name': 'Business',
      'label': 'Business',
      'icon': Icons.business_center_outlined
    },
    {'name': 'Politics', 'label': 'Politics', 'icon': Icons.gavel_outlined},
    {'name': 'Lifestyle', 'label': 'Lifestyle', 'icon': Icons.style_outlined},
    {
      'name': 'Technology',
      'label': 'Technology',
      'icon': Icons.computer_outlined
    },
    {
      'name': 'Entertainment',
      'label': 'Entertainment',
      'icon': Icons.movie_outlined
    }
  ];
  List<dynamic> allSelectedCategories = [];
  List<dynamic> selectedCategory = [];
  List<dynamic> newsCategories = [
    {'title': 'Tech Trends', 'subtitle': 'Latest gadgets and innovations'},
    {'title': 'AI Revolution', 'subtitle': 'How AI is transforming industries'},
    {
      'title': 'Global Headlines',
      'subtitle': 'Breaking news from around the world'
    },
    {
      'title': 'Political Insights',
      'subtitle': 'Key moments shaping global politics'
    },
    {
      'title': 'Climate Watch',
      'subtitle': 'Global efforts to tackle climate change'
    },
    {'title': 'Sports Highlights', 'subtitle': 'Top moments from recent games'},
    {
      'title': 'Champions League',
      'subtitle': 'Highlights of this season’s games'
    },
    {'title': 'Olympic Glory', 'subtitle': 'Top performances at the Olympics'},
    {'title': 'Hollywood Buzz', 'subtitle': 'Latest celebrity news and gossip'},
    {
      'title': 'Film Reviews',
      'subtitle': 'Critic reviews of the latest movies'
    },
    {'title': 'Market Watch', 'subtitle': 'Stock market insights and trends'},
    {'title': 'Crypto News', 'subtitle': 'Updates on Bitcoin and altcoins'},
    {'title': 'Health Trends', 'subtitle': 'Latest in wellness and fitness'},
    {'title': 'Space Exploration', 'subtitle': 'Discoveries beyond the Earth'},
    {'title': 'Business Today', 'subtitle': 'Top news in the corporate world'},
    {
      'title': 'Sustainable Living',
      'subtitle': 'How to live an eco-friendly life'
    },
  ];
  List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image8.jpg',
    'assets/images/image9.jpg',
    'assets/images/image10.jpg',
    'assets/images/image11.jpg'
  ];

  Widget _checkBoxList(List items, List values) {
    return Container(
      color: Colors.transparent,
      child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 2, right: 2),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10,
            children: [
              for (var entry in items)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // items[index]["value"] = !items[index]["value"];
                      if (!values.contains(entry["name"])) {
                        values.add(entry["name"]);
                      } else {
                        values.remove(entry["name"]);
                      }
                    });
                    print(values);
                    // updateData();
                  },
                  child: IntrinsicWidth(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: (values.contains(entry['name']))
                                ? Colors.blue
                                : Colors.white),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            entry['icon'],
                            color: Colors.black,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            entry["label"],
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Material(
      child: SafeArea(
        child: Scaffold(
            bottomNavigationBar: GestureDetector(
              onTap: () {
                // Add your onPressed action here
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => StartPage()));
              },
              child: Container(
                color: Color(0xFFF0F5FF),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x333071FF), // 20% opacity #3071FF color
                          offset: Offset(0, 4), // X: 0, Y: 4
                          blurRadius: 8, // Blur radius
                          spreadRadius: 0, // Spread radius
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6E9BFF),
                          Color(0xFF3071FF)
                        ], // Gradient colors
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    height: h * 0.1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Category',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: Icon(
                                  Icons.question_mark_sharp,
                                  size: 15,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    'Featured Categories',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    width: w,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ListView.separated(
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      if (selectedCategory.contains(index)) {
                                        setState(() {
                                          selectedCategory.remove(index);
                                        });
                                      } else {
                                        setState(() {
                                          selectedCategory.add(index);
                                        });
                                      }
                                    },
                                    child: categoryCard(context, index,
                                        index < 11 ? images[index] : images[0],
                                        isSelected:
                                            selectedCategory.contains(index),
                                        title: newsCategories[index]['title'],
                                        subTitle: newsCategories[index]
                                            ['subtitle']),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                itemCount: newsCategories.length),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'All Categories',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  _checkBoxList(allCategories, allSelectedCategories)
                ],
              ),
              // Set the height for the line thickness
              width: double.infinity, // Set the width for the line length
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF0F5FF),
                    Color(0xFFF0F5FF).withOpacity(0.8)
                  ], // White to light blue
                  begin: Alignment.topCenter, // Start at the bottom
                  end: Alignment.bottomCenter,
                ),
              ),
            )),
      ),
    );
  }
}
