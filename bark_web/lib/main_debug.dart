import 'dart:async';
import "package:bark_web/bark_web.dart";

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey globalKey = GlobalKey();
  bool is_watermark = true;
  ScrollController watermark_scroll_controller = ScrollController();

  @override
  void initState() {
    super.initState();
    task();
  }

  Future<void> task() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: double.infinity, minWidth: double.infinity),
        child: Stack(
          children: [
            Positioned.fill(
              child: RepaintBoundary(
                key: globalKey,
                child: const IgnorePointer(
                  ignoring: false,
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: BarkWeb(),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: is_watermark,
              child: IgnorePointer(
                ignoring: true,
                child: Transform.rotate(
                  angle: 0.5,
                  child: GridView.builder(
                    controller: watermark_scroll_controller,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    padding: const EdgeInsets.all(5),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(36, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: Text(
                            "App By Azkadev",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              height: 1,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(1),
                                  offset: const Offset(0, 0),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Center(
        heightFactor: 1,
        child: InkWell(
          onTap: () async {
            // DateTime dateTime = DateTime.now();
            // showModalBottomSheet(context: context, builder: builder)
            // return showLicensePage(context: context);

            await showGeneralDialog(
              context: context,
              useRootNavigator: true,
              barrierDismissible: true,
              barrierLabel: "sok",
              // barrierLabel: "sp",
              // transitionDuration: Duration(milliseconds: 500),
              // transitionBuilder: (context, animation, secondaryAnimation, child) {
              //   if (animation.isCompleted) {
              //     return child;
              //   }
              //   return Center(child: CircularProgressIndicator());
              // },
              pageBuilder: (context, animation, secondaryAnimation) {
                // int count = 8;
                // Key key = const Key("sok");
                return StatefulBuilder(
                  builder: (context, setStat) {
                    return Padding(
                      padding: const EdgeInsets.all(25),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          home: Scaffold(
                            backgroundColor:
                                const Color.fromARGB(121, 255, 255, 255),
                            body: SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: MediaQuery.of(context).size.height,
                                  minWidth: MediaQuery.of(context).size.width,
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          is_watermark = !is_watermark;
                                        });
                                        setStat(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text("Watermark"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Icon(
                                              (is_watermark)
                                                  ? Icons.toggle_on
                                                  : Icons.toggle_off,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("Settings"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );

            return;
            // await Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return const App();
            //   },
            // ));
          },
          child: Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 1 / 4,
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
