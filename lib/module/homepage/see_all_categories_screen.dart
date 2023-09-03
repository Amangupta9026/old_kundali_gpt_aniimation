import 'package:flutter/material.dart';
import 'package:kundali_gpt/constants/constant.dart';

class SeeAllCategoriesScreen extends StatefulWidget {
  const SeeAllCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SeeAllCategoriesScreen> createState() => _SeeAllCategoriesScreenState();
}

class _SeeAllCategoriesScreenState extends State<SeeAllCategoriesScreen> {
  List planetNames = [
    {
      'title': 'Sun (Surya)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
    {
      'title': 'Moon (Chandra)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
    {
      'title': 'Mars (Mangala)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
    {
      'title': 'Mercury (Budha)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
    {
      'title': 'Jupiter (Brihaspati)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
    {
      'title': 'Venus (Shukra)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
    {
      'title': 'Saturn (Shani)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
    {
      'title': 'Rahu (north node of the moon)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
    {
      'title': 'Ketu (south node of the moon)',
      'description':
          'This is the description of the item. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding * 1.5),
          child: Column(
            children: [
              ExpansionPanelList(
                elevation: 3,
                expansionCallback: (index, isExpanded) {
                  setState(() {
                    planetNames[index]['isExpanded'] = !isExpanded;
                  });
                },
                animationDuration: const Duration(milliseconds: 600),
                children: planetNames
                    .map(
                      (item) => ExpansionPanel(
                        canTapOnHeader: true,
                        backgroundColor: item['isExpanded'] == true
                            ? Colors.red[100]
                            : Colors.white,
                        headerBuilder: (_, isExpanded) => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 2,
                                horizontal: defaultPadding),
                            child: Row(
                              children: [
                                const Icon(Icons.ac_unit),
                                const SizedBox(
                                  width: defaultPadding,
                                ),
                                Expanded(
                                  child: Text(
                                    item['title'],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            )),
                        body: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Text(item['description']),
                        ),
                        isExpanded: item['isExpanded'],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
