import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:utsav/utils/navimg/List.dart';
import 'package:utsav/utils/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;



  int currentIndex = 0;
  int state = 1;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(


        body:  ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(0),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 146,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 110,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contents.length,
                          itemBuilder: (context, i) {
                            return  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: InkWell(
                                onTap: (){},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:  [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.red.shade50,
                                      child: Image.asset(contents[i].image, height: 60,
                                        width:  60,),
                                    ),
                                    SizedBox(width: 50,
                                        child: Center(
                                            child: Text(contents[i].title,
                                              style: const TextStyle(height: 1.5,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                              overflow: TextOverflow.ellipsis,)))
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top:height*0.410,),
                  child: Image.asset('assets/images/ban1.png',height: height*0.090,),
                ),
                SizedBox(
                  height: height*0.400,
                  child: PageView.builder(
                      controller: _controller,
                      itemCount: content.length,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      itemBuilder: (_, i) {
                        return Padding(

                          padding: const EdgeInsets.all(0),
                          child: Stack(
                            children: [

                              Container(
                                height: height * 0.400,
                                child: Image.asset(
                                  fit: BoxFit.cover,
                                  height: height / 3,

                                  content[i].image,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 0.0,
                                left: 0,
                                // top: 0,
                                child: Align(
                                  // alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),

                                          child:  const Center(
                                            child: Text(
                                                'NEW',
                                                style: textStyle.khomesubheadingStyle
                                            ),
                                          ),
                                          height: height * 0.040,
                                          width: width*0.3,
                                        ),
                                        onTap: () {
                                        /*  Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MixCategoryLandigPage(
                                                        heding:
                                                        "End of Season Sale",
                                                        mapdata: _hidengemMap,
                                                        imglist: [],
                                                      )));*/
                                        },
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          height: height * 0.040,
                                          width: width*0.3,
                                          child: const Center(
                                            child: Text(
                                                'BEST SELLERS',
                                                style: textStyle.khomesubheadingStyle
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                       /*   Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MixCategoryLandigPage(
                                                        heding:
                                                        "This Week's Best Sellers",
                                                        mapdata: _hidengemMap,
                                                        imglist: [],
                                                      )));*/
                                        },
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          height: height * 0.040,
                                          width: width*0.3,
                                          child: const Center(
                                            child: Text(
                                                'READY TO SHIP',
                                                style: textStyle.khomesubheadingStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                      /*    Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const ReadyToShip()));*/
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top:height*0.410,),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: content.length,
                    effect: const SlideEffect(
                      activeDotColor: Colors.pink,
                      dotWidth: 10,
                      dotHeight: 10,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),




              ],
            ),


          ],
        ),

      ),
    );
  }
}
