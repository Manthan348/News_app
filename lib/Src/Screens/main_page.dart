import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:news_app/Src/Screens/news_detailPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool startAnimation = false;
  bool startListAnimation = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Widget _checkBoxList(List items, List values) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 2, right: 2),
        child: SizedBox(
          height: 32, // Adjust the height based on the required button size
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Horizontal scrolling
            itemCount: items.length,
            itemBuilder: (context, index) {
              var entry = items[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Clear the list if the user taps a different item
                    if (!values.contains(entry["name"])) {
                      values.clear();
                      values.add(entry["name"]);
                    } else {
                      values.remove(entry["name"]);
                    }
                  });
                  // setState(() {
                  //   if (!values.contains(entry["name"])) {
                  //     values.add(entry["name"]);
                  //   } else {
                  //     values.remove(entry["name"]);
                  //   }
                  // });
                  print(values);
                },
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 300 + (index * 100)),
                  transform:
                      Matrix4.translationValues(startAnimation ? 0 : w, 0, 0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5), // Spacing between items
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 2,
                        color: (values.contains(entry['name']))
                            ? Colors.blue
                            : Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        entry['icon'],
                        color: Colors.black,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
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
              );
            },
          ),
        ),
      ),
    );
  }

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
  String getRandomImage() {
    final random = Random();
    int randomIndex = random.nextInt(images.length); // Generate a random index
    return images[randomIndex];
  }

  List<dynamic> cardData = [
    {
      'title': 'Devastating Earthquake Hits Turkey',
      'details':
          'A massive earthquake shook Turkey, causing widespread devastation. Thousands of buildings have collapsed, and rescue teams are working around the clock to save survivors trapped under the rubble. The death toll is expected to rise as rescue efforts continue. Many families have been displaced, and international aid has started to arrive to assist in the recovery operations.'
    },
    {
      'title': 'Massive Wildfire Engulfs California Forests',
      'details':
          'A massive wildfire has erupted in the forests of California, leading to widespread destruction and mandatory evacuations. The fire, which started late last night, has already consumed thousands of acres of land and continues to spread rapidly due to strong winds and dry conditions. Firefighters are working tirelessly to contain the blaze, but the challenging terrain and extreme weather conditions are making their efforts difficult. Residents in the affected areas have been urged to evacuate immediately and seek shelter in designated safe zones. The cause of the fire is still under investigation, but authorities suspect it may have been sparked by a lightning strike.'
    },
    {
      'title': 'Hurricane Slams into Florida Coast',
      'details':
          'A Category 4 hurricane has made landfall on the Florida coast, bringing torrential rain, high winds, and severe flooding. Thousands of residents are without power, and many homes have been damaged or destroyed. Emergency services are on high alert, and evacuations are in place for the most vulnerable areas. The storm is expected to move inland over the next few days, weakening as it goes, but continuing to bring dangerous conditions to the southeastern U.S.'
    },
    {
      'title': 'Flooding in South Asia Displaces Millions',
      'details':
          'Severe monsoon rains have caused widespread flooding across parts of India, Bangladesh, and Nepal, displacing millions of people. Rivers have overflowed, submerging entire villages, and causing significant damage to crops and infrastructure. Relief efforts are underway, but the scale of the disaster has overwhelmed local authorities. Many areas remain inaccessible due to washed-out roads and bridges, and there are fears of disease outbreaks due to contaminated water supplies.'
    },
    {
      'title': 'Tornado Tears Through Midwest Towns',
      'details':
          'A powerful tornado has torn through several towns in the U.S. Midwest, leaving a trail of destruction in its wake. Homes have been flattened, power lines are down, and debris is scattered across the affected areas. Emergency services are responding to calls for help, and search and rescue operations are ongoing. Residents are being advised to stay indoors and avoid travel as cleanup efforts begin. The tornado is part of a larger storm system that has caused severe weather across multiple states.'
    },
    {
      'title': 'Volcanic Eruption Forces Thousands to Evacuate',
      'details':
          'A volcano in Indonesia has erupted, spewing ash and lava into the sky and forcing thousands of nearby residents to evacuate their homes. Authorities have raised the alert level to the highest possible, and flights in and out of the area have been canceled due to the ash cloud. Rescue teams are working to assist those affected, and shelters have been set up for displaced families. The volcano had been showing signs of increased activity in recent weeks, but the eruption took many by surprise.'
    },
    {
      'title': 'Blizzard Paralyzes Northeastern U.S.',
      'details':
          'A massive blizzard has struck the northeastern United States, dumping several feet of snow and bringing transportation to a standstill. Roads are impassable, flights have been canceled, and power outages have affected thousands of homes. Emergency services are working to clear roads and assist those in need, but the scale of the storm has made it difficult to reach some areas. Residents are being advised to stay indoors until conditions improve. The storm is expected to weaken by the end of the week.'
    },
    {
      'title': 'Heatwave Breaks Temperature Records Across Europe',
      'details':
          'A record-breaking heatwave has swept across Europe, causing widespread disruption and raising concerns about the impact of climate change. Temperatures in some areas have soared above 40°C (104°F), leading to heat-related illnesses, wildfires, and power outages. Governments are urging people to stay hydrated and avoid outdoor activities during the hottest parts of the day. The heatwave is expected to last for several more days, with little relief in sight.'
    }
  ];

  Widget _cards(context, index, title, details, image,
      {bool isDetails = true}) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return StatefulBuilder(
      builder: (context, setState) {
        // bool isDetails = false; // Moved inside StatefulBuilder

        return SizedBox(
          width: w * 0.9,
          child: Card(
            margin: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  child: Image.asset(
                    image, // Replace with your image URL or use AssetImage
                    height: h * 0.65,
                    width: w * 0.9,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: w * 0.84,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 15, top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w * 0.6759,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  print('object');
                                  isDetails = !isDetails; // Toggle the state
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  // if (!isDetails)
                                  Text(
                                    isDetails
                                        ? 'Tap to read more'
                                        : (details.toString().length > 200
                                            ? '${details.toString().substring(0, 200)}...'
                                            : details.toString()),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // if (isDetails) ...[
                                  //   SizedBox(
                                  //     height: 10,
                                  //   ),
                                  //   Divider(
                                  //     thickness: 1,
                                  //     color: Colors.grey,
                                  //   ),
                                  //   Text(
                                  //     details,
                                  //     style: TextStyle(
                                  //         color: Colors.black,
                                  //         fontFamily: 'Poppins',
                                  //         fontSize: 14,
                                  //         fontWeight: FontWeight.w500),
                                  //   ),
                                  // ],

                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Image.asset(
                              'assets/images/share.png',
                              height: 20,
                              width: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffDEE9FF),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      'World News',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<int> likeCounts =
      List<int>.generate(10, (index) => 0); // Start with 0 likes for each card

  // List to keep track of whether each card is liked or not
  List<bool> likedStatus = List<bool>.generate(10, (index) => false);
  Widget listCard(context, title, images, index) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.asset(
                images, // Replace with the actual image URL
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: w * 0.85,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Share functionality
                        },
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.share,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        likedStatus[index] = !likedStatus[index];
                        if (likedStatus[index]) {
                          likeCounts[index]++; // If liked, increase count
                        } else {
                          likeCounts[index]--; // If unliked, decrease count
                        }
                      });
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.black),
                        SizedBox(width: 4),
                        Text(likeCounts[index].toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: const Text('1'),
      color: Colors.blue,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('2'),
      color: Colors.red,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('3'),
      color: Colors.purple,
    )
  ];

  List<dynamic> allCategories = [
    {
      'name': 'Technology',
      'label': 'Technology',
      'icon': Icons.computer_outlined
    },
    {
      'name': 'Business',
      'label': 'Business',
      'icon': Icons.business_center_outlined
    },
    {'name': 'Sports', 'label': 'Sports', 'icon': Icons.sports_soccer_outlined},
    {
      'name': 'Health',
      'label': 'Health',
      'icon': Icons.health_and_safety_outlined
    },
    {
      'name': 'Entertainment',
      'label': 'Entertainment',
      'icon': Icons.movie_outlined
    },
    {'name': 'Science', 'label': 'Science', 'icon': Icons.science_outlined},
    {'name': 'Politics', 'label': 'Politics', 'icon': Icons.gavel_outlined},
    {'name': 'World', 'label': 'World', 'icon': Icons.public_outlined},
    {'name': 'Travel', 'label': 'Travel', 'icon': Icons.flight_outlined},
    {'name': 'Lifestyle', 'label': 'Lifestyle', 'icon': Icons.style_outlined},
    {
      'name': 'Finance',
      'label': 'Finance',
      'icon': Icons.attach_money_outlined
    },
    {'name': 'Food', 'label': 'Food', 'icon': Icons.fastfood_outlined},
    {'name': 'Weather', 'label': 'Weather', 'icon': Icons.cloud_outlined}
  ];

  List<dynamic> allSelectedCategories = [];
  bool isListView = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Material(
      child: SafeArea(
        child: Scaffold(
            body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      isListView = !isListView;

                      setState(() {});
                    },
                    child: Image.asset(
                      isListView
                          ? 'assets/images/cardView.png'
                          : 'assets/images/Frame.png',
                      height: 50,
                      width: 40,
                    ),
                  ),
                  Text(
                    'DailyCon',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Center(
                      child: Icon(
                        Icons.search_outlined,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            _checkBoxList(allCategories, allSelectedCategories),
            SizedBox(
              height: 20,
            ),
            isListView
                ? Expanded(
                    child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: cardData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(
                            builder: (context) => NewsArticlePage(
                              index: index,
                            ),
                          ));
                        },
                        child: AnimatedContainer(
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 300 + (index * 100)),
                          transform: Matrix4.translationValues(
                              startListAnimation ? 0 : w, 0, 0),
                          child: listCard(context, cardData[index]['title'],
                              images[index], index),
                        ),
                      );
                    },
                  ))
                : Flexible(
                    child: Container(
                    width: double.infinity,
                    child: CardSwiper(
                        backCardOffset: Offset(0, -40),
                        numberOfCardsDisplayed: 3,
                        allowedSwipeDirection: AllowedSwipeDirection.symmetric(
                            horizontal: true, vertical: false),
                        cardBuilder: (context,
                            index,
                            horizontalOffsetPercentage,
                            verticalOffsetPercentage) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(
                                builder: (context) => NewsArticlePage(
                                  index: index,
                                ),
                              ));
                            },
                            child: _cards(
                              context,
                              index,
                              cardData[index]['title'],
                              cardData[index]['details'],
                              index < 11 ? images[index] : images[0],
                            ),
                          );
                        },
                        cardsCount: cardData.length),
                  ))
          ]),
        )),
      ),
    );
  }
}
