import 'package:bahasaku/src/api/fetchdata.dart';
import 'package:bahasaku/src/common_widgets/circle_indicator.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/models/course_model.dart';
import 'package:bahasaku/src/provider/user_provider.dart';
import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:bahasaku/src/views/learning_page/learning_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CourseDetailPage extends StatefulWidget {
  final String courseId;
  const CourseDetailPage({super.key, required this.courseId});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  int activeIndex = 0;
  Course? course;
  @override
  void initState() {
    DataRequest.fetchCourseById(widget.courseId).then((data) => {
          setState(() {
            course = data;
          })
        });
  }

  void handleLearnCourse() {
    List courseList = Provider.of<UserProvider>(context, listen: false).courses;
    List data = courseList.where((e) {
      return e["id"] == course!.id;
    }).toList();
    if (data.isEmpty) {
      List newCourse = [
        ...courseList,
        {
          'id': course!.id,
          'progress': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ];
      Provider.of<UserProvider>(context, listen: false)
          .updateCourses(newCourse);
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => LearningPage(
                courseId: widget.courseId, title: course!.title!)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leadingWidth: 66,
          toolbarHeight: 66,
          leading: const PrevButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: (course != null)
            ? SizedBox(
                width: getWidth(context),
                height: getHeight(context),
                child: Stack(
                  children: [
                    SizedBox(
                      width: getWidth(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CarouselSlider.builder(
                                itemCount: course?.coverImage?.length ?? 1,
                                options: CarouselOptions(
                                    height: 327,
                                    viewportFraction: 1,
                                    onPageChanged: (index, reason) => {
                                          setState(() => activeIndex = index),
                                        }),
                                itemBuilder: (context, index, realIndex) {
                                  final urlImage = course?.coverImage?[index];

                                  return SizedBox(
                                    width: getWidth(context),
                                    child: Image.network(
                                      urlImage ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                  left: 21,
                                  bottom: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(course!.title!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -1,
                                          )),
                                      Text(course!.subtitle!,
                                          style: const TextStyle(
                                              color: Colors.white))
                                    ],
                                  )),
                              Positioned(
                                  right: 0,
                                  left: 0,
                                  bottom: 20,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AnimatedSmoothIndicator(
                                      activeIndex: activeIndex,
                                      count: course?.coverImage?.length ?? 0,
                                      effect: const SlideEffect(
                                        activeDotColor: Colors.white,
                                        dotColor: Colors.grey,
                                        dotWidth: 8,
                                        dotHeight: 8,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.people,
                                            size: 35,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            course!.participants!,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      const VerticalDivider(
                                          color: Colors.grey, width: 10),
                                      const Column(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: SingleChildScrollView(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                child: CircleIndicator(
                                                  radius: 20,
                                                  lineWidth: 4,
                                                  percent: 0.8,
                                                  fontSize: 9,
                                                )),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Progress',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      const VerticalDivider(
                                          color: Colors.grey, width: 10),
                                      const Column(
                                        children: [
                                          Icon(
                                            Icons.favorite_border,
                                            size: 35,
                                            color: Colors.red,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Fav',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      const VerticalDivider(
                                          color: Colors.grey, width: 10),
                                      const Column(
                                        children: [
                                          Icon(
                                            Icons.menu,
                                            size: 35,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'More',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Text(
                                    course!.description!,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                SizedBox(
                                  width: getWidth(context),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  TColors.primaryColor),
                                          shape: const MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              50))))),
                                      onPressed: handleLearnCourse,
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Learn Language',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Icon(
                                              Icons.arrow_right,
                                              size: 40,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
