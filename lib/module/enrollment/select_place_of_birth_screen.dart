import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kundali_gpt/widgets/reusable_widgets.dart';

import '../../constants/constant.dart';

class SelectPlaceOfBirthScreen extends StatefulWidget {
  final String? searchText;

  const SelectPlaceOfBirthScreen({Key? key, this.searchText}) : super(key: key);

  @override
  State<SelectPlaceOfBirthScreen> createState() =>
      _SelectPlaceOfBirthScreenState();
}

class _SelectPlaceOfBirthScreenState extends State<SelectPlaceOfBirthScreen> {
  TextEditingController? _searchController;

  List suggestions = [
    'Delhi, India',
    'Mumbai, India',
    'Bangalore, India',
    'Kolkata, India',
    'Punjab, India',
    'Hyderabad, India',
    'Ahmedabad, India',
    'Chennai, India',
  ];
  List searchResults = [];

  void autoCompleteSearch(value) async {
    log(value);
    searchResults = [];
    // var result = await googlePlace?.autocomplete.get(value);
    for (var a in suggestions) {
      log(a);
      if (a.toString().toLowerCase().contains(value.toString().toLowerCase()) &&
          mounted) {
        setState(() {
          searchResults.add(a);
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController(text: widget.searchText??'');
    autoCompleteSearch(_searchController!.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context, _searchController?.text ?? '');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 2, vertical: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search your birth place',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: defaultPadding * 2),
            CustomTextFormField(
              controller: _searchController!,
              onChanged: (value) {
                if (value!.isNotEmpty && value.length > 3) {
                  setState(() {
                    autoCompleteSearch(value);
                  });
                  // log('Selected: $searchedPlace');
                  // _placeOfBirthController.text = _selectedValue.toString();
                } else {
                  if (searchResults.length > 3 && mounted) {
                    setState(() {
                      searchResults = [];
                    });
                  }
                }
              },
              prefixIcon: const Icon(Icons.search),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ...List.generate(
                      searchResults.length,
                      (index) => ListTile(
                        onTap: () {
                          Navigator.pop(
                              context, searchResults[index].toString());
                        },
                        title: Text(searchResults[index].toString()),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
