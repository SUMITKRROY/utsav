import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utsav/utils/app_color.dart';
import 'package:utsav/utils/widgets.dart';

import '../utils/Utils.dart';
import '../utils/styles.dart';
import 'HomePage.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({Key? key}) : super(key: key);

  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  int pageIndex = 0;
  bool open = false;
  int _selectedIndex = 0;

  final ScreenList = [
    const HomePage(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/welcome_icon.png",
          height: 40,
          width: 55,
          // color: Colors.grey,
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        open == true ? open = false : open = true;
                      });
                    },
                    icon: Icon(
                      open == true ? Icons.close_rounded : Icons.search_rounded,
                      size: 30,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
              )
            ],
          )
        ],
      ),
      drawer: const firstdrawer(),
      body: Center(
        child: ScreenList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          // height: height*0.10,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            // iconSize: 25,
            onTap: _onItemTapped,
            elevation: 0,
            selectedItemColor: AppColors.primaryColorpink,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle:
                const TextStyle(color: Colors.white, fontSize: 14),
            // fixedColor: Colors.red,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/home.png',
                  scale: 1.5,
                  width: width * 0.060,
                  // height: 20,
                  color: _selectedIndex == 0
                      ? AppColors.primaryColorpink
                      : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/navShop.png',
                  scale: 1.5,
                  width: width * 0.060,
                  // height: 20,
                  color: _selectedIndex == 1
                      ? AppColors.primaryColorpink
                      : Colors.grey,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/navWishlist.png',
                  scale: 1.5,
                  width: width * 0.060,
                  // height: 20,
                  color: _selectedIndex == 2
                      ? AppColors.primaryColorpink
                      : Colors.grey,
                ),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/navAccount.png',
                  scale: 1.7,
                  width: width * 0.060,
                  // height: 20,
                  color: _selectedIndex == 3
                      ? AppColors.primaryColorpink
                      : Colors.grey,
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Widget>('ScreenList', ScreenList));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class firstdrawer extends StatefulWidget {
  const firstdrawer({Key? key}) : super(key: key);

  @override
  State<firstdrawer> createState() => _firstdrawerState();
}

class _firstdrawerState extends State<firstdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 50.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: const Icon(
                        Icons.person,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  (Utils.checkLogin == true)
                      ? Container(
                          // color: Colors.cyan,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Umair Siddiqui",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "de-umair@mobiloitte.com",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 12,
                                    color: AppColors.textgreyordersummaary,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          // color: Colors.cyan,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Guest User",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w700),
                              ),
                              // Text(
                              //   "de-umair@mobiloitte.com",
                              //   textAlign: TextAlign.left,
                              //   style: TextStyle(
                              //       fontFamily: 'NotoSans',
                              //       fontSize: 12,
                              //       color: AppColors.textgreyordersummaary,
                              //       fontWeight: FontWeight.w400),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.primaryColorpink,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // handle the icon button press here
                },
              ),
            ],
          ),
          drawer: SecondDrawer(),
          body: ListView(
            children: [
              Container(
                // color: Colors.cyan,
                // height: height,
                height: 54.0 * Utils.FilteredData.length,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Utils.FilteredData.length,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // boxheight = Utils.menu[index]['Menu'].length;
                    // print("here is my height>>>>>>${height / 1.9}");
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          // color: Colors.cyan,
                          // height: 42,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 15.0),
                            dense: true,
                            onTap: () {
                              Utils.indexname =
                                  Utils.FilteredData[index]['name'].toString();
                              // Utils.Position = Utils.FilteredData[index]['name'].toString();

                              if (kDebugMode) {
                                print(Utils.indexname);
                              }
                              Utils.submenu.clear();
                              Utils.submenu.addAll(
                                  Utils.FilteredData[index]['children_data']);
                              //  Utils.childrenData.addAll(Utils.submenu[index]['children_data']);
                              if (kDebugMode) {
                                print(Utils.submenu);
                              }
                              Scaffold.of(context).openDrawer();
                            },
                            title: Text(
                              Utils.FilteredData[index]['name'].toString(),
                              textAlign: TextAlign.start,
                              style: Styles.SidemenuTextStyle,
                            ),
                            trailing: SizedBox(
                              width: 45,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      height: 25,
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                      )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.cyan,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 5,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15, 10, 15),
                    child: Column(
                      children: [
                        InkWell(
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "My Account",
                              style: Styles.drwerStyle500,
                            ),
                          ),
                          onTap: () {
                            /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const AccountDashBoard()));*/
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "My Order",
                              style: Styles.drwerStyle500,
                            ),
                          ),
                          onTap: () {
                            /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Myorder()));*/
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Explore More",
                              style: Styles.drwerStyle500,
                            ),
                          ),
                          onTap: () {
                            /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ExploreMoreAccount()));*/
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "My Notifications",
                              style: Styles.drwerStyle500,
                            ),
                          ),
                          onTap: () {
                            /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const MyNotificationExplore()));*/
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 5,
                  ),
                  const SizedBox(height: 15),
                  /*  Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 5, 10, 5),
                      child: Column(
                        children: [
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My Personalized Store",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PersionalStoreNosto()));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Arrived This Week",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListingLandingPage(
                                            imglist: const [],
                                            name: 'Arrived This Week',
                                            more: '',
                                          )));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Weekly Bestsellers",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MixCategoryLandigPage(
                                            heding: "This Week's Best Sellers",
                                            mapdata: _hidengemMap,
                                            imglist: const [],
                                          )));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Ready to Ship",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ReadyToShip()));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "End of Season Sale",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MixCategoryLandigPage(
                                            heding: "End of Season Sale",
                                            mapdata: _hidengemMap,
                                            imglist: const [],
                                          )));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         const Sale()));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "What’s Now",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Whatsnow()));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Trends We Love",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConceptLandingPagesec()));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Fashion Stories",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MixCategoryLandigPage(
                                            heding: "Fashion Stories",
                                            mapdata: _hidengemMap,
                                            imglist: const [],
                                          )));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Spring's Trends",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Map<String, dynamic> _trendingMap = {
                                "trending": [
                                  {
                                    "img":
                                        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-grey-v1-kgzt4609.jpg",
                                    "name":
                                        "Embroidered Georgette Pakistani Suit in grey"
                                  },
                                  {
                                    "img":
                                        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-off-white-v1-ssf8703.jpg",
                                    "name":
                                        "Embroidered Georgette Pakistani Suit in grey"
                                  },
                                  {
                                    "img":
                                        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-organza-saree-in-navy-blue-v1-syc11090.jpg",
                                    "name":
                                        "Embroidered Georgette Pakistani Suit in grey"
                                  },
                                  // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-georgette-pakistani-suit-in-black-v1-kch2088_3.jpg",,
                                  //   "name": "Embroidered Georgette Pakistani Suit in Brown"},
                                  {
                                    "img":
                                        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-saree-in-off-white-v1-spf7548_1.jpg",
                                    "name":
                                        "Embroidered Georgette Pakistani Suit in Brown"
                                  },
                                  {
                                    "img":
                                        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-cream-v1-ssf13321.jpg",
                                    "name":
                                        "Embroidered Georgette Pakistani Suit in Brown"
                                  },

                                  {
                                    "img":
                                        "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-sherwani-in-black-v1-muy482.jpg",
                                    "name": "Embroidered Georgette Coat"
                                  },
                                ]
                              };
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SeasonScreen(
                                            heding: "Spring's Trends",
                                            mapdata: _trendingMap,
                                          )));
                            },
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Wedding Shop",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ConceptPage(img: _brideInfoMap['bride'][index]['img'], )));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WeddingPage()));
                            },
                          ),
                        ],
                      ),
                    ),*/
                  SizedBox(
                    // color: Colors.cyan,
                    // height: height,
                    height: 39.0 *
                        Utils
                            .categoriesList['children_data'][13]
                                ['children_data']
                            .length,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Utils
                          .categoriesList['children_data'][13]['children_data']
                          .length,
                      // scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 15, bottom: 14),

                              // color: Colors.cyan,
                              // height: 42,

                              child: InkWell(
                                onTap: () {
                                  Utils.indexname = Utils.categoriesList[index]
                                          ['name']
                                      .toString();
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Text(
                                  Utils.categoriesList['children_data'][13]
                                          ['children_data'][index]['name']
                                      .toString(),
                                  textAlign: TextAlign.start,
                                  style: Styles.SidemenuTextStyle,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}

class SecondDrawer extends StatefulWidget {
  const SecondDrawer({Key? key}) : super(key: key);

  @override
  State<SecondDrawer> createState() => _SecondDrawerState();
}

class _SecondDrawerState extends State<SecondDrawer> {
  var isChecked;
  var isExpend;
  var selected;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
        child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,

                iconTheme: const IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
              ),
              body: ListView(
                children: [
                  Container(
                    height: 50,
                    color: Colors.cyan,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Utils.indexname,
                            style: const TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                  Container(
                    // color: Colors.pink,
                    height: height - 150,
                    // height: height,
                    child: ListView.builder(
                      key: Key('builder ${selected.toString()}'), //attention
                      itemCount: Utils.submenu.length + 1,
                      itemBuilder: (context, idx) {
                        if (idx >= Utils.submenu.length) {
                          return Column(
                            children: [
                              Container(
                                height: 50,
                                color: Colors.grey.shade300,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Shop Collection:",
                                        style: TextStyle(fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ),
                              InkWell(
                                child: const SizedBox(
                                  height: 50,
                                  // color: Colors.grey,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "New Arrivals",
                                          style: Styles.SidemenuTextStyle,
                                        )),
                                  ),
                                ),
                                onTap: () {},
                              ),
                              const Divider(
                                height: 1,
                              ),
                              InkWell(
                                child: Container(
                                  height: 50,
                                  // color: Colors.grey,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Best Sellers",
                                          style: Styles.SidemenuTextStyle,
                                        )),
                                  ),
                                ),
                                onTap: () {},
                              ),
                              const Divider(
                                height: 1,
                              ),
                              InkWell(
                                child: Container(
                                  height: 50,
                                  // color: Colors.grey,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Ready To Ship",
                                          style: Styles.SidemenuTextStyle,
                                        )),
                                  ),
                                ),
                                onTap: () {

                                },
                              ),
                              const Divider(
                                height: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }
                        return Column(
                          children: [
                            ListTileTheme(
                              dense: true,
                              child: ExpansionTile(
                                  iconColor: Colors.cyan,
                                  collapsedIconColor: Colors.cyan,
                                  key: Key(idx.toString()),
                                  //attention
                                  initiallyExpanded: idx == selected,
                                  //attention
                                  title: Text(
                                    Utils.submenu[idx]['name'],
                                    style: Styles.SidemenuTextStyle,
                                  ),
                                  onExpansionChanged: ((newState) {
                                    if (newState) {
                                      setState(() {
                                        selected = idx;
                                      });
                                    } else {
                                      setState(() {
                                        selected = -1;
                                      });
                                    }
                                  }),
                                  children: [
                                    Container(
                                      height: 52.0 *
                                          Utils.submenu[idx]['children_data'].length,
                                      child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: Utils.submenu[idx]['name'].length,
                                        itemBuilder: (context, ind) {
                                          return Column(
                                            children: [
                                              const Divider(
                                                // color: Colors.grey,
                                                height: 5,
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(left: 8.0),
                                                child: ListTileTheme(
                                                  dense: true,
                                                  child: ListTile(
                                                  /*  onTap: () {
                                                      print(Utils.submenu[idx]['children_data']
                                                      ['name'] == 'New Curations');
                                                      var baner =
                                                          'https://medias.utsavfashion.com/media/wysiwyg/promotions/2021/2406/mughal-inspired-concepts.jpg';
                                                      if (Utils.submenu[idx]
                                                      ['name'] ==
                                                          'New Curations' ||
                                                          Utils.submenu[idx]
                                                          ['name'] ==
                                                              'Our Best Ever' ||
                                                          Utils.submenu[idx]
                                                          ['name'] ==
                                                              'Wedding Stories' ||
                                                          Utils.submenu[idx]
                                                          ['name'] ==
                                                              'Worth a Glance' ||
                                                          Utils.submenu[idx]
                                                          ['name'] ==
                                                              'Fashion Perfect') {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              // builder: (context) => MixCategoryLandigPage(heding: hidengemMap['hidenGem'][index]['name'], mapdata: hidengemMap, )));
                                                              // builder: (context) => ConceptPage( )));
                                                                builder: (context) =>
                                                                    ConceptPage(
                                                                      img: '',
                                                                      bnrimg: baner,
                                                                      name: Utils.submenu[
                                                                      idx]
                                                                      ['name']
                                                                      [
                                                                      ind]['name'],
                                                                      imglist:Utils.submenu[idx] ,
                                                                    )));
                                                      } else {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ListingLandingPage(
                                                                      imglist: Utils.submenu[
                                                                      idx]
                                                                      ['name']
                                                                      [
                                                                      ind]["imglist"],
                                                                      name: Utils.submenu[
                                                                      idx]
                                                                      ['name']
                                                                      [
                                                                      ind]['name'],
                                                                      more: Utils
                                                                          .submenu[
                                                                      idx]['name'],
                                                                    )));
                                                      }
                                                    },*/
                                          onTap:(){},
                                                    // trailing: FTextStyle.arrowButtonforward,
                                                    title: Text(
                                                      Utils.submenu[idx]['children_data'][ind]['name'],
                                                      // menu[index]['Menu']['submenu'],
                                                      style: const TextStyle(
                                                          fontFamily: 'NotoSans',
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.pink),
                                                    ),
                                                    // backgroundColor: Colors.grey.shade200,
                                                    // childrenPadding: EdgeInsets.only(left: 60), //children padding
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),

                                    //more child menu
                                  ]),
                            ),
                            const Divider(
                              // color: Colors.grey,
                              height: 0.5,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
