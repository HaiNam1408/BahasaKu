import 'package:bahasaku/src/common_widgets/circle_indicator.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  int activeIndex = 0;
  final urlImages = [
    'https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/2560px-Flag_of_the_United_Kingdom.svg.png',
    'https://t4.ftcdn.net/jpg/01/08/47/29/360_F_108472954_A3Y42CvYf3GLzKKb5CJjVxuoal8TLE9M.jpg',
    'https://beyondincorp.com/uploads/blog/2021_08/thanh-lap-cong-ty-tai-uk-trong-nam-2021-va-day-la-5-loi-ich.png'
  ];
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
      body: SizedBox(
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
                        itemCount: urlImages.length,
                        options: CarouselOptions(
                            height: 327,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) => {
                                  setState(() => activeIndex = index),
                                }),
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = urlImages[index];

                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              urlImage,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                      Positioned(
                          right: 0,
                          left: 0,
                          bottom: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: urlImages.length,
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
                        const IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '120',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              VerticalDivider(color: Colors.grey, width: 10),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: SingleChildScrollView(
                                        physics: NeverScrollableScrollPhysics(),
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
                              VerticalDivider(color: Colors.grey, width: 10),
                              Column(
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
                              VerticalDivider(color: Colors.grey, width: 10),
                              Column(
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
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: Text(
                            lorem(paragraphs: 1, words: 30),
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
                              style: const ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))))),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Learn Language',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
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
      ),
    );
  }
}
