import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsArticlePage extends StatefulWidget {
  final int index;
  NewsArticlePage({required this.index});
  @override
  _NewsArticlePageState createState() => _NewsArticlePageState();
}

class _NewsArticlePageState extends State<NewsArticlePage> {
  bool isLiked = false; // To manage like button state
  int likeCount = 0; // Initial like count
  String? title;
  String? image;
  String? details;
  void initState() {
    super.initState();
    title = cardData[widget.index]['title'];
    details = cardData[widget.index]['details'];
    image = images[widget.index];
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

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.black),
                onPressed: () {
                  // Additional actions
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image section
                Stack(
                  children: [
                    Image.asset(
                      image!, // Replace with your image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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

                // Title and article content
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 8),
                        Divider(
                          thickness: 1,
                          color: Color(0xff000000).withOpacity(0.15),
                        ),
                        SizedBox(height: 8),
                        Text(
                          details!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff192838)),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isLiked = !isLiked;
                                        likeCount = isLiked
                                            ? likeCount + 1
                                            : likeCount - 1;
                                      });
                                    },
                                    child: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text('$likeCount'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.comment,
                                    size: 20,
                                    color: Color(0xff7E858C),
                                  ),
                                  SizedBox(width: 5),
                                  Text('45'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.share,
                                    size: 20,
                                    color: Color(0xff7E858C),
                                  ),
                                  SizedBox(width: 5),
                                  Text('30'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          details!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff192838)),
                        ),
                        SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                // Read more functionality
                              },
                              child: Text(
                                'Read more',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff7E858C),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Profile Picture
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                  images[5]), // Replace with your image URL
                            ),
                            SizedBox(
                                width: 12), // Spacer between image and text

                            // Text Information
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 0),
                                Text(
                                  '2023-10-05 14:30',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),

                            Container(
                              height: 32,
                              width: 0.25 * w,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff6E9BFF),
                                    Color(0xff3071FF)
                                  ], // Gradient colors
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation:
                                      0, // Remove shadow to fit gradient style
                                  backgroundColor: Colors
                                      .transparent, // Set button background transparent
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Text(
                            'Same News Available On',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Horizontal list of logos
                        Container(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    // Circular logo
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(images[
                                          index]), // Add your logo images in the assets folder
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
