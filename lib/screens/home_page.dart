import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: myAppBar(),
            body: ListView(
              children: [
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset('assets/stories/story.png'),
                      Image.asset('assets/stories/story-1.png'),
                      Image.asset('assets/stories/story-2.png'),
                      Image.asset('assets/stories/story-3.png'),
                      Image.asset('assets/stories/story-4.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Divider(
                  color: Colors.black12,
                  indent: 30,
                  endIndent: 30,
                ),
                const SizedBox(height: 5,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Experiences in spotlight',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 400,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            experienceWidget('assets/images/image 1.png', 'Unique Egg Coffee class with Local', 'Coffee', 'Cultural Tour', 4.5, 28),
                            const SizedBox(width: 15,),
                            experienceWidget('assets/images/image 2.png', 'Hanoi Street Food Tour in Old Quarter', 'Street Food', 'Tour', 4.5, 28),
                          ],
                        ),
                      )
                    ],
                  ),
                )

              ],
            )
        )
    );
  }

  experienceWidget(String imgPath, String title, String category, String type, double rating, int price){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(imgPath),
            const Positioned(
              right: 10,
              top: 10,
              child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white
              ),
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          children: [
            Text(
              category,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const Text(
              '  •  ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              type,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 170,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 40,),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff50cc71),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Text(
                    '$rating ⭐️',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        color: Color(0xfffebd2f),
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      ' / person',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  myAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Hanoi, Vietnam',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Image.asset('assets/icons/cloud.png', height: 20, width: 20,),
                  const SizedBox(width: 5,),
                  const Text(
                    '32°C',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Image.asset('assets/icons/search.png', height: 20, width: 20,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
