import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animation_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? controller;

  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeProvider>().getPlanet();
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    context.read<HomeProvider>().getPlanet();
    controller!.repeat();
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planets"),
        backgroundColor: providerW!.isTheme == true
            ? const Color(0xff0000)
            : const Color(0xff03346E),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         providerR!.setThemeData();
        //       },
        //       icon: Icon(
        //         providerW!.isTheme == false
        //             ? Icons.light_mode
        //             : Icons.dark_mode,
        //       )),
        //   ],
      ),
      body: Stack(
        children: [
          Image.asset(
            providerW!.isTheme == true
                ? "assets/image/dark.gif"
                : "assets/image/light.jpg",
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          PageView.builder(
            itemCount: providerR!.planetList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'detail',
                      arguments: providerR!.planetList[index]);
                },
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: AnimatedTextKit(
                          totalRepeatCount: 50,
                          animatedTexts: [
                            WavyAnimatedText(
                              "${providerR!.planetList[index].name}",
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lugrasimo',
                                  color: providerW!.isTheme == true
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff6EACDA)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    index != 0
                        ? RotationTransition(
                            turns: controller!,
                            child: Image.asset(
                              "${providerR!.planetList[index].image}",
                              height: 300,
                              width: MediaQuery.sizeOf(context).width,
                            ))
                        : Image.asset(
                            "${providerR!.planetList[index].image}",
                            height: 300,
                            width: MediaQuery.sizeOf(context).width,
                          ),
                    const SizedBox(height: 50),
                    AnimatedTextKit(totalRepeatCount: 50, animatedTexts: [
                      FadeAnimatedText(
                        "Position of planet : ${providerR!.planetList[index].position}",
                        textStyle: TextStyle(
                          fontFamily: 'Lugrasimo',
                          // shadows: [Shadow(color: Colors.red),],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: providerW!.isTheme == true
                              ? const Color(0xffFFFFFF)
                              : const Color(0xff433D8B),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
                    const SizedBox(height: 10),
                    AnimatedTextKit(totalRepeatCount: 50, animatedTexts: [
                      FadeAnimatedText(
                          "Radius of planet : ${providerR!.planetList[index].radius}",
                          textStyle: TextStyle(
                            fontFamily: 'Lugrasimo',
                            fontSize: 20,
                            color: providerW!.isTheme == true
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff433D8B),
                            //433D8B
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                "More Functionalities",
                style: TextStyle(fontSize: 20),
              )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      " Saved Planets",
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'bookmark');
                      },
                      icon: const Icon(Icons.bookmark_add_outlined),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Theme",
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {
                          providerR!.setThemeData();
                        },
                        icon: Icon(
                          providerW!.isTheme == false
                              ? Icons.light_mode
                              : Icons.dark_mode,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
