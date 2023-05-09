import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/Utils.dart';
import '../../utils/app_color.dart';
import '../../utils/styles.dart';
import '../navbarbottom.dart';
import 'bloc/data/posts_service.dart';
import 'bloc/mix_landing_page_bloc.dart';

class mixlandingpage extends StatefulWidget {

   mixlandingpage({Key? key, }) : super(key: key);

  @override
  State<mixlandingpage> createState() => _mixlandingpageState();


}

/*class _mixlandingpageState extends State<mixlandingpage> {
  final scrollController = ScrollController();


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    BlocProvider.of<MixLandingPageBloc>(context).loadPosts();
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(

body: BlocBuilder<MixLandingPageBloc, MixLandingPageState>(

  builder: (context, state) {

    if (state is UserLoadingState && state.isFirstFetch) {
      return _loadingIndicator();
    }
    bool isLoading = false;
    if (state is UserLoadingState) {
      Utils.items = state.oldPosts;
      isLoading = true;
    } else if (state is UserLoadedState) {
      Utils.items = state.posts;

    }
    return ListView(
      controller: scrollController,
      children: [
        // Text("Mob"),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.bordergrey,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/SHIPSIN.png",
                          height: height * 0.020,
                          width: height * 0.020,
                          // color: Colors.grey,
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          'SHIPS IN',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: AppColors.Textcolorheading,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Utils.showPickerShipin(context);
                  },
                ),
              ),

              Expanded(
                child: InkWell(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            width: 1.0, color: AppColors.bordergrey),
                        left: BorderSide(
                            width: 1.0, color: AppColors.bordergrey),
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Filter.png",
                          height: height * 0.020,
                          width: height * 0.020,
                          // color: Colors.grey,
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          'FILTER',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: AppColors.Textcolorheading,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                   /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilterList()));*/
                  },
                ),
              ),
              // VerticalDivider(
              //   width: 2.0,
              //   color: Colors.black,
              //   indent: 10.0,
              //   endIndent: 10.0,
              // ),
              Expanded(
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/filter-circle.png",
                          height: height * 0.020,
                          width: height * 0.020,
                          // color: Colors.grey,
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          'SORT',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: AppColors.Textcolorheading,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Utils.showPickershort(
                      context,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.010,
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Widgets.ksizedBox(context),
              Row(
                children: [
                  Text(
                    "shop",
                    style: Styles.H1Headings,
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  const Text(
                    'Found 3248 items',
                    style: Styles.SkUStyle,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Widgets.ksizedBox(context),
              const SizedBox(
                height: 10,
              ),
              widget.position == 'This Week\'s Best Sellers'
                  ? SizedBox() /*SizedBox(
                      height: 80,
                      child: ListView.builder(
                        controller: _pageController,
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final category = items[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         const CmsLandingPage()));
                              // (Route<dynamic> route) => false);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0),
                              child: Column(
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: const Color(0xffCAE6F1FF), // background
                                      ),
                                      label: Text(
                                        items[index].toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons
                                            .keyboard_arrow_right_outlined,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )*/
                  : const SizedBox(),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: ScrollController(keepScrollOffset: true),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 0.50,),
                itemCount: Utils.items.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < Utils.items.length) {
                    return InkWell(
                      onTap: () {
                        var img = Utils.items[index]['images'][0]['url'];
                        var price = Utils.currencySymbol + Utils.items[index]
                        ['price_info'][
                        'minimal_regular_price']
                            .toString();
                        var name =     Utils.items[index]['name'];

                      /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Utils
                                    .checkLogin == true
                                    ? SimpleProdWithLogin(img: img, price: price, name: name,

                                )
                                    : SimpleProdWithOutLogin(img: img)));*/

                        /* else if (index == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? BundleProdWithLogin(img: img)
                                                : BundleProdWithOutLogin(
                                                img: img)));
                                  }
                                  else if (index == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? SoldPrdWithLogin(img: img)
                                                : SoldPrdWtLogin(img: img)));
                                  } else if (index == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? ConfigProdwithLogin(img: img)
                                                : ConfigProdwithoutLogin(img: img)));
                                  }
                                  else if (index == 4) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? SimpleProdWithLogin(img: img)
                                                : SimpleProdWithOutLogin(
                                                img: img)));
                                  } else if (index == 5) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? BundleProdWithLogin(img: img)
                                                : BundleProdWithOutLogin(img: img)));
                                  } else if (index == 6) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin == true
                                                ? SoldPrdWithLogin(img: img)
                                                : SoldPrdWtLogin(img: img)));
                                  } else if (index == 7) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? ConfigProdwithLogin(img: img)
                                                : ConfigProdwithoutLogin(img: img)));
                                  }

                                  if (Utils.checkLogin == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SoldPrdWithLogin(
                                                  img: img,
                                                )));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SoldPrdWtLogin(
                                                  img: img,
                                                )));
                                  }*/

                      },
                      child: Card(
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  Utils.items[index]['images'][0]
                                  ['url'],
                                  height: height / 3.4,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    onPressed: () {
                                      if (Utils.checkLogin == false) {
                                        Utils.ShowDialoglogin(context,
                                            "To Like our Product Please Login");
                                      }
                                    },
                                    // icon: Icon(Icons.heart_broken,color: Colors.pinkAccent,),
                                    icon: InkWell(
                                        child: Container(
                                            width: 42,
                                            height: 52,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .shade200,
                                                    width: 1),
                                                shape:
                                                BoxShape.circle,
                                                color: Colors.white),
                                            child: isLoading
                                                ? Image.asset(
                                              'assets/images/fillheart.png',
                                              scale: 5,
                                              width: 60,
                                              // height: 20,
                                              color: AppColors
                                                  .primaryColorpink,
                                            )
                                                : Image.asset(
                                              'assets/images/navWishlist.png',
                                              scale: 5,
                                              width:
                                              width * 0.060,
                                              // height: 20,
                                              color: AppColors
                                                  .primaryColorpink,
                                            )),
                                        onTap: () {
                                        /*  if (Utils.checkLogin ==
                                              false) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const loginScreen()));
                                            // Utils.ShowDialoglogin(context,"To Like our Product Please Login");
                                          } else {
                                            setState(() {
                                              wishvalue[index] =
                                              !wishvalue[index];
                                            });
                                          }*/
                                        }),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5.0,
                                  // right: 0.0,
                                  right: 0.0,
                                  child: IconButton(
                                    onPressed: () {
                                      // Use the controller to change the current page
                                      // carouselController.previousPage();
                                    },
                                    icon: InkWell(
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: const BoxDecoration(
                                            // border: Border.all(color: Colors.grey, width: 1),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Icon(Icons.view_array_rounded,size: width * 0.060,color: Colors.grey,)
                                        ),
                                        onTap: () {
                                          Utils.showPickerBottom(
                                            context,
                                            Utils.items[index]
                                            ['images'][0]['url'],
                                          );
                                          // _showPicker(context, widget
                                          //     .mapdata['hidenGem'][index]['img']);
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                Utils.items[index]['name'],
                                textAlign: TextAlign.left,
                                style: Styles.decStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Align(
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
                                        text: Utils.currencySymbol +
                                            Utils.items[index]
                                            ['price_info'][
                                            'minimal_regular_price']
                                                .toString(),
                                        style:
                                        Styles.prizeStyle3),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text.rich(
                                    TextSpan(
                                      text: '',
                                      children: <TextSpan>[
                                        TextSpan(
                                          // text: itemname[index],
                                          text: "25%",
                                          style: Styles
                                              .offprizeStyle,
                                        ),
                                        // TextSpan(
                                        //   text: '         Ready to Ship',
                                        //   style: TextStyle(
                                        //     color: AppColors.pricecolor,
                                        //     // decoration: TextDecoration.lineThrough,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // margin: EdgeInsets.all(10),
                      ),
                    );
                  } else {
                    Timer(Duration(milliseconds: 30), () {
                      scrollController.jumpTo(scrollController.position.maxScrollExtent);
                    });
                    return _loadingIndicator();

                  }
                },
              ),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),

        // EdgeInsets.fromLTRB(10,0,10,0),
      ],
    );

  },
),
    ));
  }
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<MixLandingPageBloc>(context).loadPosts();
        }
      }
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}*/

class _mixlandingpageState extends State<mixlandingpage> {
//  PageController _pageController = PageController(initialPage: 1, viewportFraction: 0.4);
  final scrollController = ScrollController();
  // bool wishvalue = true;
  late List<bool> wishvalue;

  List<String> images = [
    "images/gridImg/bride.png",
    "images/gridImg/bridemom.png",
    "images/gridImg/bridemates.png",
    "images/gridImg/groom.png"
  ];
  static const items = [
    'Must have',
    "Month's Best Look",
    'Top Rated Styles',
  ];
  @override
  void initState() {
    BlocProvider.of<MixLandingPageBloc>(context).loadPosts();
    // wishvalue =
    //     List.generate(widget.mapdata['hidenGem'].length, (index) => false);
    super.initState();
  }

  /* List itemname = [
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25 % Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25 % Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25 % Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25 % Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
  ];*/
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    setupScrollController(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: AppColors.white,
        /*  appBar: widget == "Shop"
              ? null
              : AppBar(
            centerTitle: true,
            elevation: 1,
            backgroundColor: Colors.white,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(
                  "images/appBarIcon/menuIcon.png",
                  height: 14,
                  width: 22,
                  // color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            }),
            title: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const dashboardScreen(

                        )));
              },
              child: Image.asset(
                "images/welcome_icon.png",
                height: 40,
                width: 55,
                // color: Colors.grey,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Image.asset(
                  "images/appBarIcon/search.png",
                  height: 20,
                  width: 20,
                  // color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Stack(
                  children: <Widget>[
                    InkWell(
                        child: Container(
                          // color: Colors.cyan,
                          width: 30,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "images/appBarIcon/cart.png",
                            height: 25,
                            width: 25,
                            // color: Colors.grey,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const ShoppingBag()));
                          // (Route<dynamic> route) => false);
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          '5',
                          style: TextStyle(
                              color: AppColors.primaryColorpink,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),*/
          // body: bottomNavigationBar,
          body: BlocBuilder<MixLandingPageBloc, MixLandingPageState>(
            builder: (context, state) {
              if (state is UserLoadingState && state.isFirstFetch) {
                return _loadingIndicator();
              }
              bool isLoading = false;
              if (state is UserLoadingState) {
                Utils.items = state.oldPosts;
                isLoading = true;
              } else if (state is UserLoadedState) {
                Utils.items = state.posts;

              }
              return ListView(
                controller: scrollController,
                children: [
                  // Text("Mob"),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.bordergrey,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/SHIPSIN.png",
                                    height: height * 0.020,
                                    width: height * 0.020,
                                    // color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10.0),
                                  const Text(
                                    'SHIPS IN',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Utils.showPickerShipin(context);
                            },
                          ),
                        ),

                        Expanded(
                          child: InkWell(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      width: 1.0, color: AppColors.bordergrey),
                                  left: BorderSide(
                                      width: 1.0, color: AppColors.bordergrey),
                                ),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/Filter.png",
                                    height: height * 0.020,
                                    width: height * 0.020,
                                    // color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10.0),
                                  const Text(
                                    'FILTER',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                            /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FilterList()));*/
                            },
                          ),
                        ),
                        // VerticalDivider(
                        //   width: 2.0,
                        //   color: Colors.black,
                        //   indent: 10.0,
                        //   endIndent: 10.0,
                        // ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/filter-circle.png",
                                    height: height * 0.020,
                                    width: height * 0.020,
                                    // color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10.0),
                                  const Text(
                                    'SORT',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Utils.showPickershort(
                                context,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Widgets.ksizedBox(context),
                        Row(
                          children: [
                            Text(
                              "shop",
                              style: Styles.H1Headings,
                              textAlign: TextAlign.left,
                            ),
                            const Spacer(),
                            const Text(
                              'Found 3248 items',
                              style: Styles.SkUStyle,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Widgets.ksizedBox(context),
                        const SizedBox(
                          height: 10,
                        ),
                        widget == 'This Week\'s Best Sellers'
                            ? SizedBox() /*SizedBox(
                      height: 80,
                      child: ListView.builder(
                        controller: _pageController,
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final category = items[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         const CmsLandingPage()));
                              // (Route<dynamic> route) => false);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0),
                              child: Column(
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: const Color(0xffCAE6F1FF), // background
                                      ),
                                      label: Text(
                                        items[index].toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons
                                            .keyboard_arrow_right_outlined,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )*/
                            : const SizedBox(),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: ScrollController(keepScrollOffset: true),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                            childAspectRatio: 0.50,),
                          itemCount: Utils.items.length + (isLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index < Utils.items.length) {
                              return InkWell(
                              /*  onTap: () {
                                  var img = Utils.items[index]['images'][0]['url'];
                                  var price = Utils.currencySymbol + Utils.items[index]
                                  ['price_info'][
                                  'minimal_regular_price']
                                      .toString();
                                  var name =     Utils.items[index]['name'];

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Utils
                                              .checkLogin == true
                                              ? SimpleProdWithLogin(img: img, price: price, name: name,

                                          )
                                              : SimpleProdWithOutLogin(img: img)));

                                  /* else if (index == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? BundleProdWithLogin(img: img)
                                                : BundleProdWithOutLogin(
                                                img: img)));
                                  }
                                  else if (index == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? SoldPrdWithLogin(img: img)
                                                : SoldPrdWtLogin(img: img)));
                                  } else if (index == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? ConfigProdwithLogin(img: img)
                                                : ConfigProdwithoutLogin(img: img)));
                                  }
                                  else if (index == 4) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? SimpleProdWithLogin(img: img)
                                                : SimpleProdWithOutLogin(
                                                img: img)));
                                  } else if (index == 5) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? BundleProdWithLogin(img: img)
                                                : BundleProdWithOutLogin(img: img)));
                                  } else if (index == 6) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin == true
                                                ? SoldPrdWithLogin(img: img)
                                                : SoldPrdWtLogin(img: img)));
                                  } else if (index == 7) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Utils
                                                .checkLogin ==
                                                true
                                                ? ConfigProdwithLogin(img: img)
                                                : ConfigProdwithoutLogin(img: img)));
                                  }

                                  if (Utils.checkLogin == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SoldPrdWithLogin(
                                                  img: img,
                                                )));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SoldPrdWtLogin(
                                                  img: img,
                                                )));
                                  }*/

                                },*/
                                child: Card(
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.network(
                                            Utils.items[index]['images'][0]
                                            ['url'],
                                            height: height / 3.4,
                                            fit: BoxFit.cover,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                              onPressed: () {
                                                if (Utils.checkLogin == false) {
                                                  Utils.ShowDialoglogin(context,
                                                      "To Like our Product Please Login");
                                                }
                                              },
                                              // icon: Icon(Icons.heart_broken,color: Colors.pinkAccent,),
                                              icon: InkWell(
                                                  child: Container(
                                                      width: 42,
                                                      height: 52,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade200,
                                                              width: 1),
                                                          shape:
                                                          BoxShape.circle,
                                                          color: Colors.white),
                                                      child: isLoading
                                                          ? Image.asset(
                                                        'assets/images/fillheart.png',
                                                        scale: 5,
                                                        width: 60,
                                                        // height: 20,
                                                        color: AppColors
                                                            .primaryColorpink,
                                                      )
                                                          : Image.asset(
                                                        'assets/images/navWishlist.png',
                                                        scale: 5,
                                                        width:
                                                        width * 0.060,
                                                        // height: 20,
                                                        color: AppColors
                                                            .primaryColorpink,
                                                      )),
                                                  onTap: () {
                                                    // if (!PrefUtils.getLogin()) {
                                                    if (Utils.checkLogin ==
                                                        false) {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //         ));
                                                      // Utils.ShowDialoglogin(context,"To Like our Product Please Login");
                                                    } else {
                                                      setState(() {
                                                        wishvalue[index] =
                                                        !wishvalue[index];
                                                      });
                                                    }
                                                    // Navigator.push(s
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) => const WelcomeScreen()));
                                                    // (Route<dynamic> route) => false);
                                                  }),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5.0,
                                            // right: 0.0,
                                            right: 0.0,
                                            child: IconButton(
                                              onPressed: () {
                                                // Use the controller to change the current page
                                                // carouselController.previousPage();
                                              },
                                              icon: InkWell(
                                                  child: Container(
                                                    width: 32,
                                                    height: 32,
                                                    decoration: const BoxDecoration(
                                                      // border: Border.all(color: Colors.grey, width: 1),
                                                        shape: BoxShape.circle,
                                                        color: Colors.white),
                                                    child: Image.asset(
                                                      'assets/Cards.png',
                                                      scale: 4,
                                                      width: width * 0.060,
                                                      // height: 20,
                                                      // color: Colors.grey,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Utils.showPickerBottom(
                                                      context,
                                                      Utils.items[index]
                                                      ['images'][0]['url'],
                                                    );
                                                    // _showPicker(context, widget
                                                    //     .mapdata['hidenGem'][index]['img']);
                                                  }),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          Utils.items[index]['name'],
                                          textAlign: TextAlign.left,
                                          style: Styles.decStyle,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Align(
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
                                                  text: Utils.currencySymbol +
                                                      Utils.items[index]
                                                      ['price_info'][
                                                      'minimal_regular_price']
                                                          .toString(),
                                                  style:
                                                  Styles.prizeStyle3),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text.rich(
                                              TextSpan(
                                                text: '',
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    // text: itemname[index],
                                                    text: "25%",
                                                    style: Styles
                                                        .offprizeStyle,
                                                  ),
                                                  // TextSpan(
                                                  //   text: '         Ready to Ship',
                                                  //   style: TextStyle(
                                                  //     color: AppColors.pricecolor,
                                                  //     // decoration: TextDecoration.lineThrough,
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // margin: EdgeInsets.all(10),
                                ),
                              );
                            } else {
                              Timer(Duration(milliseconds: 30), () {
                                scrollController.jumpTo(scrollController.position.maxScrollExtent);
                              });
                              return _loadingIndicator();

                            }
                          },
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  // EdgeInsets.fromLTRB(10,0,10,0),
                ],
              );

            },
          ),
        ),
      ),
    );
  }

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<MixLandingPageBloc>(context).loadPosts();
        }
      }
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  void _showPicker(context, img) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext bc) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                height: height / 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        child: Container(
                          height: 5,
                          width: 30,
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            // border: Border.all(color: Colors.grey, width: 0.0),
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(100, 50)),
                          ),
                          child: const Text('     '),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(' ',
                          textScaleFactor: 1.0, textAlign: TextAlign.start),
                      Expanded(
                        child: CarouselSlider.builder(
                          itemCount: 3,
                          options: CarouselOptions(
                              height: height / 1.5,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 3 / 2,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                              viewportFraction: 1,
                              enableInfiniteScroll: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  // activeIndexpd = index;
                                });
                              }),
                          itemBuilder: (context, index, realIndex) {
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  // left: 20.0, right: 20, bottom: 50, top: 20),
                                    left: 0,
                                    right: 0,
                                    bottom: 30,
                                    top: 0),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  height: height * 0.0400,
                                  width: double.infinity,
                                  child: Image.asset(
                                    img,
                                    fit: BoxFit.fill,
                                  ),
                                  // decoration: BoxDecoration(
                                  //   // color: Colors.cyan,
                                  //   image: DecorationImage(
                                  //     fit: BoxFit.fill,
                                  //     image:
                                  //
                                  //
                                  //     NetworkImage(
                                  //       // images/prdDetpgBan/pdban.png
                                  //       widget.img,
                                  //     ),
                                  //   ),
                                  //
                                  //   // borderRadius:
                                  //   // BorderRadius.all(Radius.circular(10)),
                                  // ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ]),
              ),
            ),
          );
        });
  }
}
