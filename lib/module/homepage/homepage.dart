import 'dart:io';
import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kundali_gpt/constants/colors.dart';
import 'package:kundali_gpt/constants/constant.dart';
import 'package:kundali_gpt/module/homepage/see_all_categories_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int selectedIndex = 0;

  List planets = [
    'Sun (Surya)',
    'Moon (Chandra)',
    'Mars (Mangala)',
    'Mercury (Budha)',
    'Jupiter (Brihaspati)',
    'Venus (Shukra)',
    'Saturn (Shani)',
    'Rahu (north node of the moon)',
    'Ketu (south node of the moon)',
  ];

  File? _image;

  // Future<void> _pickImage(ImageSource source) async {
  //   final pickedFile = await ImagePicker().pickImage(source: source);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * 1.5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: Theme.of(context).textTheme.titleLarge),
                    Text('Gender',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('Date of birth',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('Place of birth',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('Time of birth',
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)
                      // image: DecorationImage(
                      // image: FileImage(_image),
                      // ),
                      ),
                  child: _image == null
                      ? const Center(
                          child: Icon(
                          Icons.person,
                          size: 35,
                        ))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Divider(
              thickness: 3,
              color: Colors.grey.shade200,
            ),
            const SizedBox(height: defaultPadding),
            CarouselSlider(
                items: imgList
                    .map((item) => Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                    .toInt())
                                .withOpacity(1.0),
                            // image: DecorationImage(
                            //     image: NetworkImage(item),
                            //     colorFilter: ColorFilter.mode(
                            //         primary[200]!, BlendMode.darken),
                            //     fit: BoxFit.cover),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Heading',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(color: Colors.white)),
                              const SizedBox(height: 5),
                              Text('Description ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white)),
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 180,
                )),
            const SizedBox(height: defaultPadding),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Planets',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SeeAllCategoriesScreen(),
                              ));
                        },
                        child: Row(
                          children: [
                            Text(
                              'See all',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                            ),
                            const SizedBox(width: 5),
                            Icon(Icons.arrow_forward_ios,
                                size: 15,
                                color: Theme.of(context).primaryColor),
                          ],
                        ))
                  ],
                ),
                const SizedBox(height: defaultPadding / 2),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          planets.length,
                          (index) => Row(
                            children: [
                              Container(
                                // margin: const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.all(10),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(child: const Icon(Icons.person)),
                                    Expanded(
                                      child: Text(planets[index],
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: defaultPadding,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Browse categories',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SeeAllCategoriesScreen(),
                          ));
                    },
                    child: Row(
                      children: [
                        Text(
                          'See all',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios,
                            size: 15, color: Theme.of(context).primaryColor),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 70,
      //   child: BottomNavigationBar(
      //       useLegacyColorScheme: false,
      //       selectedItemColor: Theme.of(context).primaryColor,
      //       currentIndex: selectedIndex,
      //       onTap: (index) {
      //         setState(() {
      //           selectedIndex = index;
      //         });
      //       },
      //       items: const [
      //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.bookmark_add_rounded), label: 'Saved'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.search), label: 'Search'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.person), label: 'Profile'),
      //       ]),
      // ),
    ));
  }
}
