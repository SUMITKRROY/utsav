import 'package:flutter/material.dart';

class FestiveBlingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String , dynamic> jsonData = {
      "FESTIVE BLING": {
        "title": "All About Festive Bling",
        "img_url":
        "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1602/bling-bloom-page_03.jpg",
        "description":
        "What’s a festive look without a splash of bling? It’s fun to be flashy and flamboyant when you have family dinners, parties and musical soirees to conquer. Bling it up, girlies! Shop up these stunners with all-over sequins, pretty mirror work motifs, dainty bead patterns and glittering gota work. Go easy on the jewelry and voila, you are good to go!",
        "children": [
          {
            "img_url":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1602/bling-bloom-page_07.jpg",
            "url_key": "festival_sequins-work",
            "description":
            "Ah, the twinkling stars shine bright on you! Delicate patterns of sequins can charge up any outfit, and if you like georgette sarees with a dash of flash, gowns with sequined yokes or pakistani suits with embellished necklines, here’s where to look!",
            "button": [
              {"title": "VIEW COLLECTION", "url_key": "festival_sequins-work"}
            ]
          },
          {
            "img_url":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1602/bling-bloom-page_10.jpg",
            "url_key": "festival_gota-work",
            "description":
            "It can’t get better, so get your gota in place! You can’t do without exquisite gota embroidered ensembles for your festive closet, so get set for the prettiest sarees, salwar kameez and lehenga cholis of the season. Gota patterns and borders are droolworthy!",
            "button": [
              {"title": "VIEW COLLECTION", "url_key": "festival_gota-work"}
            ]
          },
          {
            "img_url":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1602/bling-bloom-page_11.jpg",
            "url_key": "festival_mirror-work",
            "description":
            "Ancient and yet so contemporary, mirror work takes the festive look a notch higher. And if you’ve stocked up on sarees, abayas and punjabi suits adorned with little mirror pieces, you’re going to turn heads. Dupattas and jackets too? Oh yes!",
            "button": [
              {"title": "VIEW COLLECTION", "url_key": "festival_mirror-work"}
            ]
          },
          {
            "img_url":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1602/bling-bloom-pages_14.jpg",
            "url_key": "festival_bead-work",
            "description":
            "It's time to let the beads do the talking! Lustrous beads on the cuffs of a kurta, the neckline of a blouse or on a men’s sherwani can be such a conversation starter. While on beads, jewelry is certainly top of mind. Flaunt chandbalis, matha pattis and neckpieces galore!",
            "button": [
              {"title": "VIEW COLLECTION", "url_key": "festival_bead-work"}
            ]
          }
        ]
      }
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("test json"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
             Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  jsonData['FESTIVE BLING']['title'].toUpperCase(),
                  style: TextStyle(
                    fontSize: 21,

                  ),
                ),
              ),

             // Text(jsonData['FESTIVE BLING']['title'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),

              Image.network(jsonData['FESTIVE BLING']['img_url']),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    jsonData['FESTIVE BLING']['description'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade900

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),


              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: jsonData['FESTIVE BLING']['children'].length,
                itemBuilder: (context, index) {
                  final childData = jsonData['FESTIVE BLING']['children'][index];
                  return Column(
                    children: [
                      Image.network(childData['img_url'],fit: BoxFit.fill,),
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
                            childData['button'][0]['title'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )


                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




