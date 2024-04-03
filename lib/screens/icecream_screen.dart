import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mastery/model/icecream.dart';
import 'dart:ui' as ui;

import 'package:flutter_mastery/themes.dart';

class IcecreamScreen extends StatelessWidget {
  const IcecreamScreen({super.key, this.restorationId});

  final String? restorationId;

  Future<List<Icecream>?> loadIcecreams() async {
    final rawIcecreams = await rootBundle.loadString("assets/icecreams.json");
    await Future.delayed(const Duration(seconds: 1));
    final icecreams = icecreamDataFromJson(rawIcecreams);
    return icecreams.icecreams;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = CupertinoTheme.of(context);
    return CustomScrollView(
      slivers: [
        const CupertinoSliverNavigationBar(
          largeTitle: Text("IceCreams"),
        ),
        
      SliverFillRemaining(
        fillOverscroll: true,
        child: FutureBuilder<List<Icecream>?>(
          future: loadIcecreams(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(0),
                restorationId: "list",
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final icecream = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {},
                    child: AnimatedPhysicalModel(
                      shadowColor: CupertinoColors.black,
                      duration: const Duration(milliseconds: 200),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                      color: CupertinoColors.lightBackgroundGray,
                      child: ClipRect(
                        child: Stack(children: [
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(icecream.image!)
                              )
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ui.ImageFilter.blur(sigmaX: 25,sigmaY: 25),
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: Color(0x90ffffff),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: FittedBox(
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                icecream.flavor,
                                                style: MyTheme.cardTitleText(themeData),
                                              ),
                                              Text(
                                                icecream.description!,
                                                style: MyTheme.cardDescriptionText(themeData),
                                              )
                                            ],
                                          ),
                                          Spacer(),
                                          Expanded(child: 
                                            Text(
                                              "\$${icecream.price}",
                                              style: MyTheme.cardTitleText(themeData),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          )
                        ],
                        ),
                      ),
                    ),
                  );
                }
              );
            }else if(snapshot.hasError) {
              return Center(
                child: Text("Error loading icecreams: ${snapshot.error}"),
              );
            }else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      )
    ]);
  }
}