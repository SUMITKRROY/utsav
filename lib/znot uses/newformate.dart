import 'package:flutter/material.dart';

class SareesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map<String , dynamic> jsonData = {
      "DRAPES_OF_YOUR_SHAPE": {
        "title": "SAREES FOR EVERY BODY TYPE",
        "img_url": "https://medias.utsavfashion.com/media/wysiwyg/0109/saree-for-body-type-page_02.jpg",
        "description": "Love Sarees but not sure which style best suits your body type? Don’t worry, we’re here to help! Utsav has made splendid curations for every body type. Scroll to find your perfect fit today. From plain to glamorous, all sorts of Sarees await you here.",
        "children": [
          {
            "img_url": "https://medias.utsavfashion.com/media/wysiwyg/0109/saree-for-body-type-page_04.jpg",
            "url_key": "saree/embroidered-work",
            "header": "Narrow Shoulders, Slender Figure, & Broad Bottom Half",
            "description": "All you Pear shaped beauties, here comes an enchanting galore of Plain Sarees paired with Embroidered Blouses. It is your perfect match. You also don’t want to miss out on our trendy curations of Embroidered & Embellished Sarees.",
            "button": [
              {
                "title": "EMBROIDERED SAREES",
                "url_key": "saree/embroidered-work"
              },
              {
                "title": "PLAIN SAREES",
                "url_key": "saree/plain-sarees"
              }
            ]
          },
          {
            "img_url": "https://medias.utsavfashion.com/media/wysiwyg/0109/saree-for-body-type-page_05.jpg",
            "url_key": "saree/lycra",
            "header": "Straight & Slender Sillhouette With Long Legs",
            "description": "Show off those long legs with Ruffled Sarees and Cotton & Linen Handloom Sarees. You can also add dimension to your slender figure with Big Bold Prints. This curation is a suitable fit for your Column shaped body.",
            "button": [
              {
                "title": "LYCRA SAREES",
                "url_key": "saree/lycra"
              },
              {
                "title": "COTTON SAREES",
                "url_key": "saree/cotton"
              }
            ]
          },
          {
            "img_url": "https://medias.utsavfashion.com/media/wysiwyg/0109/saree-for-body-type-page_09.jpg",
            "url_key": "saree/georgette_embroidered-work",
            "header": "Broad Upper Torso & Slender Bottom Half",
            "description": "Draw attention to your shoulders and neckline with Sarees with uniform prints & scalloped borders. Embroidered as well as Silk Sarees will also fit your Apple Body Type perfectly. Have faith in our fashion knowledge-- this curation is what you need!",
            "button": [
              {
                "title": "SHOP NOW",
                "url_key": "saree/georgette_embroidered-work"
              }
            ]
          },
          {
            "img_url": "https://medias.utsavfashion.com/media/wysiwyg/0109/saree-for-body-type-page_14.jpg",
            "url_key": "saree/art-silk",
            "header": "Defined Waistline With Balanced Shoulders & Hips",
            "description": "Got an hourglass figure? You’re one of the lucky ones. Beautiful Sheer, Woven Art Silk, & Cotton Silk Sarees best suit your silhouette. Talking about fabrics, Chiffon & Net should be your go-to choice. Go on, stun the crowd with Utsav's jaw-droppers, curated just for you.",
            "button": [
              {
                "title": "SHOP NOW",
                "url_key": "saree/art-silk"
              }
            ]
          },
          {
            "img_url": "https://medias.utsavfashion.com/media/wysiwyg/0109/saree-for-body-type-page_15.jpg",
            "url_key": "saree/half-half",
            "header": "Wide Shoulders, Small Hips & Thin Legs",
            "description": "Your body type shines best when paired with Chanderi, Ombre, Half and Half, & Tie-n-Dye Sarees. They add volume to your lower half and balance out your silhouette. You can’t find these perfect fits for your Inverted Triangle shaped body anywhere but here.",
            "button": [
              {
                "title": "SHOP NOW",
                "url_key": "saree/half-half"
              }
            ]
          }
        ]
      }
    };
    return Scaffold(
      appBar: AppBar(
        title:Text("test page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                jsonData['DRAPES_OF_YOUR_SHAPE']['title'].toUpperCase(),
                style: TextStyle(
                  fontSize: 21,

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.network(jsonData['DRAPES_OF_YOUR_SHAPE']['img_url']),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        jsonData['DRAPES_OF_YOUR_SHAPE']['description'],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade900

                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: jsonData['DRAPES_OF_YOUR_SHAPE']['children'].length,
              itemBuilder: (context, index) {
                var childData = jsonData['DRAPES_OF_YOUR_SHAPE']['children'][index];
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(childData['img_url']),
                      SizedBox(height: 16.0),
                      Text(childData['header'], style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            childData['description'],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade900

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      SizedBox(height: 16.0),
                      if (childData['button'].length == 1) ...[
                        Center(
                          child:    Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button click
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                  TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                              child: Text(
                                childData['button'][0]['title'],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ] else ...[
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 2.5,
                          children: List.generate(childData['button'].length, (buttonIndex) {
                            var button = childData['button'][buttonIndex];
                            return
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle button click
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    textStyle: MaterialStateProperty.all<TextStyle>(
                                      TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide(color: Colors.black, width: 1),
                                    ),
                                  ),
                                  child: Text(
                                    button['title'],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                          }),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
