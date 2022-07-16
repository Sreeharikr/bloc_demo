import 'package:bloc_demo/constants/size_config.dart';
import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo>
    with TickerProviderStateMixin {
  List<String> imagesList = [
    "assets/plant1.png", "assets/plant2.png", "assets/plant3.png",
    "assets/plant4.png",

    // "https://www.kindpng.com/picc/m/18-187973_transparent-small-plant-png-png-download.png",
    // "https://m.media-amazon.com/images/I/71s4v4VacDL._SY879_.jpg",
    // "https://m.media-amazon.com/images/I/917D5gPUmoL._AC_UL400_.jpg",
    // "https://m.media-amazon.com/images/I/61WReFYCdtL._SX569_.jpg"
  ];
  List<String> nameList = [
    "Zamioculcas zamiifolia Indoor Plants Houseplant",
    "Dracaena reflexa var. angustifolia Houseplant",
    "Guiana Chestnut Houseplant Indoor Plants Potted, ",
    "Dieffenbachia seguine Plants Indoors Houseplant Dieffenbachia amoena,",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xFFE5F5E5),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          height: SizeConfig.screenheight,
          width: SizeConfig.screenwidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: SizedBox(
                                  //  width: SizeConfig.widthMultiplier * 45,
                                  height: SizeConfig.widthMultiplier * 40,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderOnForeground: false,
                                    elevation: 0.5,
                                    color: Colors.transparent,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(25),
                                      top: Radius.circular(25),
                                    )),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                            Color.fromARGB(255, 255, 255, 255),
                                            Colors.white
                                          ])),
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    imagesList[index],
                                    height: SizeConfig.widthMultiplier * 35,
                                  ),
                                  // CachedNetworkImage(
                                  //   imageUrl: imagesList[index],
                                  //   height: SizeConfig.widthMultiplier * 25,
                                  // ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    nameList[index],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF31754C),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "₹550/-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        2.5,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "₹500/-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        3.0),
                                          ),
                                        ],
                                      ),
                                      Hero(
                                        tag: "heart",
                                        child: Image.asset(
                                          "assets/heart.png",
                                          height:
                                              SizeConfig.widthMultiplier * 6,
                                          color: const Color(0xFF31754C),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
