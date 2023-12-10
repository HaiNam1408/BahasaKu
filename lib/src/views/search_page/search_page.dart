import 'package:bahasaku/src/views/search_page/widgets/search_card.dart';
import 'package:bahasaku/src/views/search_page/widgets/search_cell.dart';
import 'package:bahasaku/src/views/search_page/widgets/search_hashtag.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> image = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Image(
                      image: AssetImage('assets/images/Group260.png'),
                      fit: BoxFit.fitWidth,
                    )),
                const Positioned(
                  top: 64,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Which Language',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'would you like to learn?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
              top: 136,
              right: 20,
              left: 20,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                elevation: 10,
                shadowColor: Colors.black,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.search,
                          size: 32,
                        ),
                      ),
                      hintText: 'Search Language...',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 24, bottom: 10, top: 10)),
                ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 20,
              top: 200,
              child: ListView(
                padding: const EdgeInsets.only(top: 10),
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Category:',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 36,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: const [
                                  SizedBox(width: 10),
                                  SearchHashTag(hashtag: 'English'),
                                  SizedBox(width: 10),
                                  SearchHashTag(hashtag: 'Japanese'),
                                  SizedBox(width: 10),
                                  SearchHashTag(hashtag: 'Korean'),
                                  SizedBox(width: 10),
                                  SearchHashTag(hashtag: 'Chinese'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 140,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            SearchCard(
                                title: 'English',
                                image:
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png'),
                            SizedBox(
                              width: 20,
                            ),
                            SearchCard(
                                title: 'Japanese',
                                image:
                                    'https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/2560px-Flag_of_Japan.svg.png'),
                            SizedBox(
                              width: 20,
                            ),
                            SearchCard(
                                title: 'Korean',
                                image:
                                    'https://upload.wikimedia.org/wikipedia/commons/0/0f/Flag_of_South_Korea.png'),
                            SizedBox(
                              width: 20,
                            ),
                            SearchCard(
                                title: 'Chinese',
                                image:
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/2560px-Flag_of_the_People%27s_Republic_of_China.svg.png'),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Previous Language Courses',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SearchCell(
                                  title: 'English',
                                  subtitle: 'Introduction',
                                  image:
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png'),
                              SizedBox(
                                height: 15,
                              ),
                              SearchCell(
                                  title: 'Japanese',
                                  subtitle: 'Grammar',
                                  image:
                                      'https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/2560px-Flag_of_Japan.svg.png'),
                              SizedBox(
                                height: 15,
                              ),
                              SearchCell(
                                  title: 'Chinese',
                                  subtitle: 'Pronunciation',
                                  image:
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/2560px-Flag_of_the_People%27s_Republic_of_China.svg.png'),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
