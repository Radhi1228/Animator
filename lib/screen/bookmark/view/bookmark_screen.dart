import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getBookMark();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Screen"),
          backgroundColor: providerW!.isTheme == true
              ? const Color(0xff03346E)
              : const Color(0xff0F67B1),
        ),
        body: Stack(
          children: [
            context.read<HomeProvider>().isTheme
                ? Image.asset(
                    "assets/image/bookmark.jpg",
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/image/galaxy.jpg",
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    fit: BoxFit.cover,
                  ),
            Expanded(
              child: ListView.builder(
                itemCount: providerW!.nameList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                  colors: [Colors.white10, Colors.black26])),
                          child: Row(
                            children: [
                              Image.asset(
                                providerR!.imageList[index],
                                height: 80,
                                width: 80,
                              ),
                              Text(
                                providerW!.nameList[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                              // Text(
                              //     "${providerW!.planetList[index].position}",
                              //   style: const TextStyle(fontSize: 20),
                              // ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    providerW!.removeBookMark(
                                        providerW!.nameList[index],
                                        providerW!.imageList[index]);
                                    const SnackBar(content: Text("Unsaved Successfully"),);
                                  },
                                  icon: const Icon(Icons.favorite))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
