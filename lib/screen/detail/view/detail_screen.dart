import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/model/home_model.dart';
import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? controller;
  PlanetModel? p1;

  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeProvider>().getPlanet();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    context.read<HomeProvider>().getPlanet();
    controller!.repeat();
    controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    p1 = ModalRoute.of(context)!.settings.arguments as PlanetModel;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Planets"),
          backgroundColor: providerW!.isTheme == true
              ? const Color(0xff0000)
              : const Color(0xff03346E),
          actions: [
            IconButton(onPressed: (){
              context.read<HomeProvider>().setBookMark(p1!.name!, p1!.image!);
              const SnackBar(content: Text("Saved Successfully"),);
            }, icon: const Icon(Icons.favorite_border_outlined))
          ],
        ),
        body: Stack(
          children: [
            // IconButton(
            //     onPressed: () {
            //       providerR!.setThemeData();
            //     },
            //     icon: Icon(
            //       providerW!.isTheme == false
            //           ? Icons.light_mode
            //           : Icons.dark_mode,
            //     )),
            Image.asset(
              providerW!.isTheme == true
                  ? "assets/image/dark.gif"
                  : "assets/image/light.jpg",
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "${p1!.image}",
                    height: 325,
                    width: 325,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText("Position of planet : ${p1!.position}",
                            textStyle: TextStyle(
                                fontFamily: 'Lugrasimo',
                                fontSize: 22,
                                color: providerW!.theme == true
                                    ? Colors.white
                                    : Colors.blue),)
                        ],
                      ),
                      const SizedBox(width: 20),
                      AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText("Name : ${p1!.name}",
                            textStyle: TextStyle(
                                fontFamily: 'Lugrasimo',
                                fontSize: 22,
                                color: providerW!.theme == true
                                    ? Colors.white
                                    : Colors.blue
                            ),),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ListView(
                        children: [
                          Text(
                            "Velocity : ${p1!.velocity}",
                            style: const TextStyle(
                              fontFamily: 'Lugrasimo',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Gravity : ${p1!.gravity}",
                            style: const TextStyle(
                              fontFamily: 'Lugrasimo',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Distance_from_Sun : ${p1!.distance_from_Sun}",
                            style: const TextStyle(
                              fontFamily: 'Lugrasimo',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Orbital_period : ${p1!.orbital_period}",
                            style: const TextStyle(
                              fontFamily: 'Lugrasimo',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Length of day : ${p1!.length_of_day}",
                            style: const TextStyle(
                              fontFamily: 'Lugrasimo',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Radius : ${p1!.radius}",
                            style: const TextStyle(
                              fontFamily: 'Lugrasimo',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "About : \n${p1!.description}",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontFamily: 'Lugrasimo',
                              fontSize: 18,
                              //fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
  @override
  void dispose() {
    controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

/*index != 0
                      ? RotationTransition(
                      turns: controller!,
                      child: Image.network(
                        "${p1!.image}",
                        height: 300,
                        width: MediaQuery.sizeOf(context).width,
                      ))
                      : Image.network(
                    "${providerR!.planetList[index].image}",
                    height: 300,
                    width: MediaQuery.sizeOf(context).width,
                  ),*/
