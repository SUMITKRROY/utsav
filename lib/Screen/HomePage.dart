import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:utsav/Screen/navbarbottom.dart';
import 'package:utsav/utils/navimg/List.dart';
import 'package:utsav/utils/widgets.dart';

import '../utils/Utils.dart';
import '../utils/app_color.dart';
import '../utils/styles.dart';
import '../znot uses/newformate.dart';
import '../znot uses/test.dart';
import 'create_new_account/Create an Account.dart';
import 'help_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  PageController _pageController =
  PageController(initialPage: 1, viewportFraction: 0.4);


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
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Container(
              //  color: Colors.red,
               // padding: const EdgeInsets.all(8),
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 100,
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
                                      radius: 35,
                                      backgroundColor: Colors.red.shade50,
                                      child: Image.asset(contents[i].image, height: 60,
                                        width:  35,),
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
                                           Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SareesPage()                                                        ));
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

              SizedBox(
                height: height * 0.020,
              ),

              ///SHOP BY ROLE
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(
                  child: Widgets.kheadinghome(context, "SHOP BY ROLE"),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              SizedBox(
                // color: Colors.lightGreen,F
                // height: height * 0.650,
                // height: height*0.510,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: ScrollController(keepScrollOffset: true),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: _brideInfoMap['bride'].length,
                  itemBuilder: (context, index) {
                    _brideInfoMap['bride'][index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          var img = mapdata['data'][index]['img'];
                          var name = mapdata['data'][index]['name'];
                          var imglist = _brideInfoMap['bride'][index]['img'];
                          var bnrimg = mapdata['data'][index]['bnrimg'];

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ConceptPage(
                          //           img: imglist,
                          //           bnrimg: bnrimg,
                          //           name: '$name',
                          //           imglist: [],
                          //         )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    _brideInfoMap['bride'][index]['img']),
                                fit: BoxFit.fill,
                              )
                            // image: DecorationImage(image: AssetImage(_brideInfoMap['bride'][index]['img']),fit: BoxFit.fill,)
                          ),
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.white,
                              minimumSize: const Size(100, 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: () {
                              var img = mapdata['data'][index]['img'];
                              var name = mapdata['data'][index]['name'];
                              var imglist =
                              _brideInfoMap['bride'][index]['img'];
                              var bnrimg = mapdata['data'][index]['bnrimg'];
                              //
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ConceptPage(
                              //           img: imglist,
                              //           bnrimg: bnrimg,
                              //           name: '$name',
                              //           imglist: [],
                              //         )));
                            },
                            child: Container(
                              color: Colors.white,
                              child: Text(
                                  _brideInfoMap['bride'][index]['name'],
                                  style: Styles.khomesubheadingStyle
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),

              ///
              ///READY-TO-SHIP COLLECTION
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(
                  child: Widgets.kheadinghome(
                      context, "READY-TO-SHIP COLLECTION"),
                ),
              ),
              // images/bannerImg/rom.png
              SizedBox(
                height: height * 0.010,
              ),
              Stack(children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const dashboardScreen(selectedIndex: 0),
                        ));
                  },
                  child: Container(
                      width: width,
                      height: height / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/rom.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                ),
                /* Positioned(
                  bottom: 66.0,
                  right: 0.0,
                  left: 0.0,
                  child: IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      // carouselController.previousPage();
                    },
                    icon: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        minimumSize: const Size(150, 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarBottom(selectedIndex: 0),
                            ));
                      },
                      child: Container(
                        color: Colors.white,
                        child: Text(
                          "Shop Now",
                          style: Styles.BrideStyle,
                        ),
                      ),
                    ),
                  ),
                ),*/
              ]),

              SizedBox(
                height: height * 0.010,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  color: Colors.grey,
                  // height: height / 2.3,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: ScrollController(keepScrollOffset: true),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List.generate(4, (index) {
                      switch (index) {
                        case 0:
                          return InkWell(
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/giftg.png',
                                    height: height * 0.050,
                                    width: height * 0.050,
                                  ),
                                  SizedBox(height: height * 0.010),
                                  const Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text.rich(
                                    TextSpan(
                                      text: '',
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Get ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "SourceSansPro",
                                            fontWeight: FontWeight.w400,
                                            // decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'INR500',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "SourceSansPro",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' off*',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "SourceSansPro",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    // builder: (context) => ConceptPage( )));
                                      builder: (context) => const CreateNewAccount()));
                            },
                          );
                          break;
                        case 1:
                          return InkWell(
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/flowg.png',
                                    height: height * 0.050,
                                    width: height * 0.050,
                                  ),
                                  SizedBox(height: height * 0.010),
                                  const Text('JUST ARRIVED',
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('Stylish Trends',
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ListingLandingPage(
                              //           imglist: [],
                              //           name: 'Arrived This Week',
                              //           more: '',
                              //         )));
                            },
                          );
                          break;
                        case 2:
                          return InkWell(
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                   "assets/birdg.png",
                                    height: height * 0.050,
                                    width: height * 0.050,
                                  ),
                                  SizedBox(height: height * 0.010),
                                  const Text('READY TO SHIP',
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('Save your Time',
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         const ReadyToShip()));
                            },
                          );
                          break;
                        case 3:
                          return InkWell(
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/star.png',
                                    height: height * 0.050,
                                    width: height * 0.050,
                                  ),
                                  SizedBox(height: height * 0.010),
                                  const Text('BESTSELLERS',
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('The Global Favs',
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             MixCategoryLandigPage(
                              //               heding: "This Week's Best Sellers",
                              //               mapdata: _hidengemMap,
                              //               imglist: [],
                              //             )));
                            },
                          );
                          break;
                        default:
                          return Container();
                          break;
                      }
                    }),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.010,
              ),

              SizedBox(
                height: height * 0.020,
              ),

              ///TRENDING THIS WEEK
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(
                  child: Widgets.kheadinghome(context, "TRENDING THIS WEEK"),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              SizedBox(
                // color: Colors.cyan,
                height: 350,
                child: ListView.builder(
                  controller: _pageController,
                  itemCount: _trendingMap['trending'].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = _trendingMap['trending'][index];
                    final img = category['img'];
                    return GestureDetector(
                      /*onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ?SimpleProdWithLogin(img: img, price: '', name: '',)
                                      : SimpleProdWithOutLogin(img: img)));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? BundleProdWithLogin(img: img)
                                      : BundleProdWithOutLogin(img: img)));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SoldPrdWithLogin(img: img)
                                      : SoldPrdWtLogin(img: img)));
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? ConfigProdwithLogin(img: img)
                                      : ConfigProdwithoutLogin(img: img)));
                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SimpleProdWithLogin(img: img, price: '', name: '',)
                                      : SimpleProdWithOutLogin(img: img)));
                        } else if (index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? BundleProdWithLogin(img: img)
                                      : BundleProdWithOutLogin(img: img)));
                        } else if (index == 6) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SoldPrdWithLogin(img: img)
                                      : SoldPrdWtLogin(img: img)));
                        } else if (index == 7) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? ConfigProdwithLogin(img: img)
                                      : ConfigProdwithoutLogin(img: img)));
                        }

                      },*/
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              // color: Colors.grey,
                              width: width / 2,
                              // height: height / width / 2,
                              child: Column(
                                // crossAxisAlignment: Axis.horizont,
                                children: [
                                  Card(
                                    color: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      // borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 0,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.network(
                                          category['img'],
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            category['name'],
                                            textAlign: TextAlign.left,
                                            style: Styles.decStyle,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: '',
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '₹5000.00',
                                                  style: Styles.prizeStyle5,
                                                ),
                                                TextSpan(
                                                  text: '  ₹3000.00',
                                                  style: Styles.prizeStyle3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // margin: EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// FASHION STORIES
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Container(
                  child: Widgets.kheadinghome(context, "FASHION STORIES"),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              SizedBox(
                // color: Colors.cyan,
                height: height / 2.9,
                child: ListView.builder(
                  controller: _pageController,
                  itemCount: coatimg.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var img = coatimg[index];
                    // final category = items[index];
                    final img1 =
                        'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/p/r/printed-velvet-suit-set-in-black-v1-mtx705_3.jpg';
                    return GestureDetector(
                      /*onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SimpleProdWithLogin(img: img, price: '', name: '',)
                                      : SimpleProdWithOutLogin(img: img)));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? BundleProdWithLogin(img: img)
                                      : BundleProdWithOutLogin(img: img)));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SoldPrdWithLogin(img: img)
                                      : SoldPrdWtLogin(img: img)));
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? ConfigProdwithLogin(img: img)
                                      : ConfigProdwithoutLogin(img: img)));
                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SimpleProdWithLogin(img: img, price: '', name: '',)
                                      : SimpleProdWithOutLogin(img: img)));
                        } else if (index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? BundleProdWithLogin(img: img)
                                      : BundleProdWithOutLogin(img: img)));
                        } else if (index == 6) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SoldPrdWithLogin(img: img)
                                      : SoldPrdWtLogin(img: img)));
                        } else if (index == 7) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? ConfigProdwithLogin(img: img)
                                      : ConfigProdwithoutLogin(img: img)));
                        }

                      },*/
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Container(
                          width: width / 2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(coatimg[index]),
                                fit: BoxFit.fill,
                              )),
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.white,
                              minimumSize: const Size(70, 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            /*onPressed: () {
                              if (index == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        Utils.checkLogin == true
                                            ? SimpleProdWithLogin(img: img, price: '', name: '',)
                                            : SimpleProdWithOutLogin(
                                            img: img)));
                              } else if (index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        Utils.checkLogin == true
                                            ? BundleProdWithLogin(img: img)
                                            : BundleProdWithOutLogin(
                                            img: img)));
                              } else if (index == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        Utils.checkLogin == true
                                            ? SoldPrdWithLogin(img: img)
                                            : SoldPrdWtLogin(img: img)));
                              } else if (index == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        Utils.checkLogin == true
                                            ? ConfigProdwithLogin(img: img)
                                            : ConfigProdwithoutLogin(
                                            img: img)));
                              } else if (index == 4) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        Utils.checkLogin == true
                                            ?SimpleProdWithLogin(img: img, price: '', name: '',)
                                            : SimpleProdWithOutLogin(
                                            img: img)));
                              } else if (index == 5) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        Utils.checkLogin == true
                                            ? BundleProdWithLogin(img: img)
                                            : BundleProdWithOutLogin(
                                            img: img)));
                              } else if (index == 6) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        Utils.checkLogin == true
                                            ? SoldPrdWithLogin(img: img)
                                            : SoldPrdWtLogin(img: img)));
                              } else if (index == 7) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        Utils.checkLogin == true
                                            ? ConfigProdwithLogin(img: img)
                                            : ConfigProdwithoutLogin(
                                            img: img)));
                              }


                            },*/
                            onPressed: (){},
                            child: const Text(
                              "BLAZERS",
                              style: Styles.khomesubheadingStyle,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              ///RECENTLY VIEWED
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Container(
                  child: Widgets.kheadinghome(context, "RECENTLY VIEWED"),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),

              SizedBox(
                // color: Colors.cyan,
                height: 350,
                child: ListView.builder(
                  controller: _pageController,
                  itemCount: _trendingMap['trending'].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = _trendingMap['trending'][index];
                    final img = category['img'];
                    return GestureDetector(
                  /*    onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SimpleProdWithLogin(img: img, price: '', name: '',)
                                      : SimpleProdWithOutLogin(img: img)));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? BundleProdWithLogin(img: img)
                                      : BundleProdWithOutLogin(img: img)));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SoldPrdWithLogin(img: img)
                                      : SoldPrdWtLogin(img: img)));
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? ConfigProdwithLogin(img: img)
                                      : ConfigProdwithoutLogin(img: img)));
                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SimpleProdWithLogin(img: img, price: '', name: '',)
                                      : SimpleProdWithOutLogin(img: img)));
                        } else if (index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? BundleProdWithLogin(img: img)
                                      : BundleProdWithOutLogin(img: img)));
                        } else if (index == 6) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? SoldPrdWithLogin(img: img)
                                      : SoldPrdWtLogin(img: img)));
                        } else if (index == 7) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Utils.checkLogin == true
                                      ? ConfigProdwithLogin(img: img)
                                      : ConfigProdwithoutLogin(img: img)));
                        }
                        /*  if (Utils.checkLogin==true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SoldPrdWithLogin(img:category[index])));
                        }else{
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SoldPrdWtLogin(img:category[index])));
                        }*/
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProductDetailsScreen(
                        //             img: category['img'])));
                      },*/
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              // color: Colors.grey,
                              width: width / 2,

                              child: Column(
                                // crossAxisAlignment: Axis.horizont,
                                children: [
                                  Card(
                                    color: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      // borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 0,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          category['img'],
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                category['name'],
                                                textAlign: TextAlign.left,
                                                style: Styles.decStyle,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text.rich(
                                                TextSpan(
                                                    text: '₹5000.00',
                                                    style: Styles.decStyle
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // margin: EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // const SizedBox(
              //   height: 10,
              // ),
              ///HIDDEN GEMS
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Container(
                  child: Widgets.kheadinghome(context, "HIDDEN GEMS"),
                ),
              ),

              SizedBox(
                height: height * 0.010,
              ),

              SizedBox(
                // color: Colors.lightGreen,F
                // height: height * 0.650,
                // height: height*0.510,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: ScrollController(keepScrollOffset: true),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: _hidengemMap['hidenGem'].length,
                  itemBuilder: (context, index) {
                    _hidengemMap['hidenGem'][index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MixCategoryLandigPage(
                          //           heding: _hidengemMap['hidenGem'][index]
                          //           ['name'],
                          //           mapdata: _hidengemMap,
                          //           imglist: [],
                          //         )));
                          // builder: (context) => ConceptPage( )));
                          // builder: (context) =>  ProductDetailsScreen(img:"images/gridImg/bride.png")));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    _hidengemMap['hidenGem'][index]['img']),
                                fit: BoxFit.fill,
                              )
                            // image: DecorationImage(image: AssetImage(_hidengemMap['hidenGem'][index]['img']),fit: BoxFit.fill,)
                          ),
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.white,
                              minimumSize: const Size(100, 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              _hidengemMap['hidenGem'][index]['name'],
                              style: Styles.khomesubheadingStyle,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: height * 0.010,
              ),
              Image.asset(
                'assets/mus.png',

              ),
              SizedBox(
                height: height * 0.010,
              ),
              ///#MYFASHIONUTSAV

              const Text(
                "#MYFASHIONUTSAV",
                style: Styles.khomeheadingStyle,
              ),
              SizedBox(
                height: height * 0.010,
              ),
              Padding(
                padding:  EdgeInsets.only(left: width*0.025, right: width*0.025),
                child: const Text.rich(
                  TextSpan(
                    text:
                    'Show us how you celebrate with utsav and get featured. We are celebrating your love for Indian Fashion Follow us & get a ',
                    style: Styles.khomesubheadingStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: '₹500 Off Coupon.',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColorpink,
                          // decoration: TextDecoration
                          //     .lineThrough,
                        ),
                      ),
                      TextSpan(
                        text: ' To claim, message us on Instagram!',
                        style: Styles.khomesubheadingStyle,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              // Container(
              //   height: height / 4,
              //   child: ListView.builder(
              //     controller: _pageController,
              //     itemCount: items.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       final category = items[index];
              //       return GestureDetector(
              //         onTap: () {
              //           print(category);
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Container(
              //             child: Image.asset(
              //               'assets/insta.png',
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              SizedBox(
                height: height * 0.020,
              ),

              ///#CUSTOMER REVIEWS
              const Text(
                "CUSTOMER REVIEWS",
                style: Styles.khomeheadingStyle,
              ),

              SizedBox(
                height: height * 0.010,
              ),
              Container(
                height: height / 4,
                child: ListView.builder(
                  controller: _pageController,
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = items[index];
                    return GestureDetector(
                      onTap: () {
                        print(category);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.010),
                        child: Container(
                          // padding: const EdgeInsets.all(10.0),
                          width: width / 1.3,
                          height: height / width / 1.3,
                          color: Colors.grey.shade200,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            star,
                                            color: Colors.green,
                                          ),
                                          const Icon(
                                            star,
                                            color: Colors.green,
                                          ),
                                          const Icon(
                                            star,
                                            color: Colors.green,
                                          ),
                                          const Icon(
                                            star,
                                            color: Colors.green,
                                          ),
                                          const Icon(
                                            star,
                                            color: Colors.green,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.verified,
                                            size: 20,
                                          ),
                                          const Expanded(child: Text("Verified",style: Styles.khomesubheadingStyle,))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Good Quality",
                                      style: TextStyle(
                                        // color: AppColors.pricecolor,
                                        fontSize: 16,
                                        fontFamily: "SourceSansPro",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                    "Clothing came witin a few Discount ordering and was good quality",
                                    style: Styles.khomesubheadingStyle
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Woody wood , 2 days ago",
                                        style: Styles.khomesubheadingStyle)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10,),

              Padding(
                padding:  EdgeInsets.only(left: width*0.025, right: width*0.025),
                child: const Text.rich(
                  TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Rated ',
                          style: Styles.khomesubheadingStyle
                      ),
                      TextSpan(
                        text: '4.4 ',
                        style: TextStyle(
                          // color: AppColors.pricecolor,
                          fontSize: 16,
                          fontFamily: "SourceSansPro",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                          text: ' out of 5 based on ',
                          style: Styles.khomesubheadingStyle
                      ),
                      TextSpan(
                        text: '2319 reviews',
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                color: AppColors.Textcolorheadingblack,
                                offset: Offset(0, -2))
                          ],
                          decoration: TextDecoration.underline,
                          fontFamily: 'SourceSansPro',
                          color: Colors.transparent,
                          fontWeight: FontWeight.w600,
                          decorationColor: AppColors.Textcolorheadingblack,
                          decorationThickness: 1.5,
                          fontSize: 17,
                          decorationStyle:
                          TextDecorationStyle.solid,
                        ),

                        // style: TextStyle(
                        //   decoration: TextDecoration.underline,
                        //   color: Colors.black,
                        //   fontSize: 15,
                        //   fontFamily: "SourceSansPro",
                        //   fontWeight: FontWeight.w600,
                        // ),
                      ),
                      TextSpan(
                        text: ' Showing Our 4 & 5 stars Review',
                        style: Styles.khomesubheadingStyle,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    star,
                    color: Colors.green,
                  ),
                  const Text(
                    "Trustpilot",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.020,
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                // topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
                // bottomLeft: Radius.circular(40),
                // bottomLeft: Radius.circular(40),
              ),
              color: AppColors.primaryColorblue),
          height: height * 0.035,
          width: 75,
          // color:AppColors.primaryColorblue ,
          child: FloatingActionButton.extended(
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HelpScreen()));

              // Add your onPressed code here!
            },
            label: const Text('Help'),
            icon: Image.asset(
              'assets/flotbuttonicon.png',
              height: height * 0.020,
              width: height * 0.020,
            ),
            // icon: const Icon(Icons.question_mark),
            backgroundColor: AppColors.primaryColorblue,
          ),
        ),
      ),
    );
  }
  List<String> images = [
    "images/gridImg/bride.png",
    "images/gridImg/bridemom.png",
    "images/gridImg/bridemates.png",
    "images/gridImg/groom.png"
  ];

  Map<String, dynamic> _brideInfoMapold = {
    "bride": [
      {
        "img":
        "https://medias.utsavfashion.com/media/wysiwyg/home/2023/0203/bride.jpg",
        "name": "BRIDE"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/wysiwyg/home/2023/0203/bridesmom.jpg",
        "name": "BRIDE'S MOM"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/wysiwyg/home/2023/0203/bridesmaid.jpg",
        "name": "BRIDE'S MAID"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/wysiwyg/home/2023/0203/groom.jpg",
        "name": "GROOM"
      }
    ]
  };

  Map<String, dynamic> _brideInfoMap = {
    "bride": [
      // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/h/a/hand-embroidered-organza-lehenga-in-peach-v1-lad46.jpg", "name": "BRIDE"},
      // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-maroon-v1-lyc2451.jpg", "name": "BRIDE  "},
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-lehenga-in-maroon-v1-lyc1116.jpg",
        "name": "BRIDE  "
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-purple-v1-spta11138.jpg",
        "name": "BRIDE'S MOM"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/c/kch628_3.jpg",
        "name": "BRIDE'S MAID"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-sherwani-in-off-white-v1-muy521.jpg",
        "name": "GROOM"
      }
    ]
  };

  Map<String, dynamic> _brideInfoMapasstes = {
    "bride": [
      {"img": "images/gridImg/bride.png", "name": "BRIDE"},
      {"img": "images/gridImg/bridemom.png", "name": "BRIDE'S MOM"},
      {"img": "images/gridImg/bridemates.png", "name": "BRIDE'S MAID"},
      {"img": "images/gridImg/groom.png", "name": "GROOM"}
    ]
  };

  Map<String, dynamic> _ListviewMap = {
    "list": [
      {"img": "images/listViewimg/saree.png", "name": "Saree"},
      {"img": "images/listViewimg/kids.png", "name": "Kids"},
      {"img": "images/listViewimg/lhenga.png", "name": "Lehenga"},
      {"img": "images/listViewimg/men.png", "name": "Men "},
      {"img": "images/listViewimg/saree.png", "name": "Saree"},
      {"img": "images/listViewimg/kids.png", "name": "Kids"},
      {"img": "images/listViewimg/lhenga.png", "name": "Lehenga"},
      {"img": "images/listViewimg/men.png", "name": "Men "},
    ]
  };

  Map<String, dynamic> _hidengemMap = {
    "hidenGem": [
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-peach-v1-kch7785_2.jpg",
        "name": "PAKISTANI SUITS",
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-pakistani-suit-in-peach-v1-uku1349.jpg",
        "name": "PARTY WEAR FOR KIDS"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/t/stone-studded-earrings-v1-jdn211.jpg",
        "name": "MEENAKARI JEWELRY"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/a/bandhej-printed-cotton-tiered-kurta-in-black-v1-tzs90.jpg",
        "name": "FUSION KURTAS"
      },
    ]
  };
  Map<String, dynamic> _hidengemMap1 = {
    "hidenGem": [
      {
        "img": "images/gridImg/hiden4.png",
        "name": "PAKISTANI SUITS",
      },
      {"img": "images/gridImg/hiden1.png", "name": "PARTY WEAR FOR KIDS"},
      {"img": "images/gridImg/hiden2.png", "name": "MEENAKARI JEWELRY"},
      {"img": "images/gridImg/hiden3.png", "name": "FUSION KURTAS"},
    ]
  };

  Map<String, dynamic> _trendingMap = {
    "trending": [
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-grey-v1-kgzt4609.jpg",
        "name": "Embroidered Georgette Pakistani Suit in grey"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-off-white-v1-ssf8703.jpg",
        "name": "Embroidered Georgette Pakistani Suit in grey"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-organza-saree-in-navy-blue-v1-syc11090.jpg",
        "name": "Embroidered Georgette Pakistani Suit in grey"
      },
      // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-georgette-pakistani-suit-in-black-v1-kch2088_3.jpg",
      //   "name": "Embroidered Georgette Pakistani Suit in Brown"},
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-saree-in-off-white-v1-spf7548_1.jpg",
        "name": "Embroidered Georgette Pakistani Suit in Brown"
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-cream-v1-ssf13321.jpg",
        "name": "Embroidered Georgette Pakistani Suit in Brown"
      },
      // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/p/r/printed-pure-cotton-a-line-suit-in-sky-blue-v1-kpx73.jpg",
      //   "name": "Embroidered Georgette Pakistani Suit in grey"},
      // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-polyester-viscose-blazer-with-trousers-in-black-v1-mst852.jpg",
      //   "name": "Embroidered Georgette Coat"},
      {
        "img":
        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-sherwani-in-black-v1-muy482.jpg",
        "name": "Embroidered Georgette Coat"
      },
    ]
  };

  List<String> images2 = [
    "images/gridImg/frameGirl.png",
    "images/gridImg/frameGirl.png",
    "images/gridImg/frameGirl.png",
    "images/gridImg/frameGirl.png",
  ];
  List<String> coatimg = [
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-sherwani-in-black-v1-muy482.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-jodhpuri-suit-in-black-v1-muy310.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-jacquard-jacket-style-sherwani-in-black-v1-mgv1464.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-art-silk-kurta-jacket-set-in-black-v1-mhg1237_6.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-jacquard-asymmetric-sherwani-in-black-v1-mgv851.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-velvet-asymmetric-sherwani-in-black-v1-mhg1926.jpg",
    // "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-art-silk-jodhpuri-jacket-in-maroon-v1-mtr2209.jpg",
    // "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-tuxedo-in-black-and-white-v1-mtx720_3.jpg",
    // "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/w/o/woven-acrylic-cotton-suit-set-in-dark-blue-v1-mtx1296.jpg",
    // "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-polyester-viscose-blazer-with-trousers-in-black-v1-mst852.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-dupion-silk-side-slit-dhoti-kurta-in-white-v1-mve1816.jpg",
  ];

  List<String> trendingimg = [
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-grey-v1-kgzt4609.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-georgette-pakistani-suit-in-black-v1-kch2088_3.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/p/r/printed-pure-cotton-a-line-suit-in-sky-blue-v1-kpx73.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-polyester-viscose-blazer-with-trousers-in-black-v1-mst852.jpg",
  ];
  static const items = [
    'Saree',
    'Saree',
    'Saree',
    'Saree',
    'Saree',
    'Saree',
    'Saree',
    'Saree',
  ];
  static const Bitems = [
    'BRIDE',
    'BRIDE',
    'BRIDE',
    'Bridegroom',
  ];

  Map<String, dynamic> mapdata = {
    "data": [
      {
        "img":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_04.jpg",
        "bnrimg":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1901/bridal-treasures-concepts.jpg",
        "name": "Bridal "
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_05.jpg",
        "bnrimg":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/sangeet-gala-concept.jpg",
        "name": "Sangeet "
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_07.jpg",
        "bnrimg":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1901/bridesmaids-favorites-concepts.jpg",
        "name": "Bridesmaids "
      },
      {
        "img":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_08.jpg",
        "bnrimg":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1901/grooms-chattels-concepts.jpg",
        "name": "Grooms "
      },
    ]
  };
  int activeIndex = 0;
  var rating = 0.0;
  static const IconData star = IconData(0xe5f9, fontFamily: 'MaterialIcons');

}
