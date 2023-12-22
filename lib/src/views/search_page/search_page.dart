import 'package:bahasaku/src/api/fetchdata.dart';
import 'package:bahasaku/src/models/course_model.dart';
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
  List<Course> listCourse = [];
  List<Course> rawData = [];
  final _searchController = TextEditingController();
  var searchValue = "";
  @override
  void initState() {
    DataRequest.fetchCourses().then((data) => {
          setState(() {
            data.sort((a, b) => a.title!.compareTo(b.title!));
            listCourse = data;
            rawData = data;
          })
        });
  }

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
          Positioned(
              top: 136,
              right: 20,
              left: 20,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                elevation: 10,
                shadowColor: Colors.black,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchValue = value;
                      listCourse = rawData
                          .where((e) =>
                              e.title!.toLowerCase().contains(searchValue))
                          .toList();
                    });
                  },
                  controller: _searchController,
                  decoration: const InputDecoration(
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
                                  SearchHashTag(hashtag: 'TOEIC'),
                                  SizedBox(width: 10),
                                  SearchHashTag(hashtag: 'IELTS'),
                                  SizedBox(width: 10),
                                  SearchHashTag(hashtag: 'Vocabulary'),
                                  SizedBox(width: 10),
                                  SearchHashTag(hashtag: 'Grammar'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                          height: 160,
                          child: (listCourse.isNotEmpty)
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: listCourse.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: SearchCard(
                                            title: listCourse[index].title!,
                                            image: listCourse[index].image!,
                                            courseId: listCourse[index].id!));
                                  })
                              : const Center(
                                  child: Text('Loading...'),
                                )),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'List Of Language Courses',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                    children: (listCourse.isNotEmpty)
                                        ? listCourse
                                            .map((course) => Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 15),
                                                  child: SearchCell(
                                                    title: course.title!,
                                                    subtitle: course.subtitle!,
                                                    image: course.image!,
                                                    courseId: course.id!,
                                                  ),
                                                ))
                                            .toList()
                                        : [
                                            const Center(
                                              child: Text('Loading...'),
                                            )
                                          ]),
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
