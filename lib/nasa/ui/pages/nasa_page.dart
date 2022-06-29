import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tres_astronautas_test/nasa/model/data_model.dart';
import 'package:tres_astronautas_test/nasa/repository/data_repository.dart';

class NasaPage extends StatefulWidget {
  static const route = '/nasa_page';
  const NasaPage({Key? key}) : super(key: key);

  @override
  State<NasaPage> createState() => _NasaPageState();
}

class _NasaPageState extends State<NasaPage> {
  var _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: FutureBuilder(
            future: DataRepository().getData(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: Column(
                        children: [
                          const TopMenu(),
                          const Favorites(),
                          const TabMenu(),
                          const TextCustom(),
                          ListCards(response: snapshot.data as Response)
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      )),
      backgroundColor: Colors.white,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black.withOpacity(0.4),
            ),
            title: const Text("Home", style: TextStyle(color: Colors.black)),
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.black.withOpacity(1),
            ),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Colors.black.withOpacity(0.4),
            ),
            activeIcon: Icon(
              Icons.calendar_month_rounded,
              color: Colors.black.withOpacity(1),
            ),
            title:
                const Text("Calendary", style: TextStyle(color: Colors.black)),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black.withOpacity(0.4),
            ),
            activeIcon: Icon(
              Icons.search,
              color: Colors.black.withOpacity(1),
            ),
            title: const Text("Search", style: TextStyle(color: Colors.black)),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.favorite_outline_rounded,
              color: Colors.black.withOpacity(0.4),
            ),
            activeIcon: Icon(
              Icons.favorite_outline_rounded,
              color: Colors.black.withOpacity(1),
            ),
            title:
                const Text("Favoritos", style: TextStyle(color: Colors.black)),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class TabMenu extends StatefulWidget {
  const TabMenu({Key? key}) : super(key: key);

  @override
  State<TabMenu> createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  String _selectedTab = "Happy Hours";
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = "All";
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                    decoration: BoxDecoration(
                        color: _selectedTab == "All"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(3, 5),
                          ),
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Text("All",
                            style: TextStyle(
                                color: _selectedTab == "All"
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w400)))),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = "Happy Hours";
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                    decoration: BoxDecoration(
                        color: _selectedTab == "Happy Hours"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(3, 5),
                          ),
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Text("Happy Hours",
                            style: TextStyle(
                                color: _selectedTab == "Happy Hours"
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w400)))),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = "Drinks";
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                    decoration: BoxDecoration(
                        color: _selectedTab == "Drinks"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(3, 5),
                          ),
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Text("Drinks",
                            style: TextStyle(
                                color: _selectedTab == "Drinks"
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w400)))),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = "Beer";
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                    decoration: BoxDecoration(
                        color: _selectedTab == "Beer"
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(3, 5),
                          ),
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Text("Beer",
                            style: TextStyle(
                                color: _selectedTab == "Beer"
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w400)))),
              ),
            )
          ]),
        ));
  }
}

class ListCards extends StatelessWidget {
  final Response? response;
  const ListCards({Key? key, this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataModel data;
    List<Datum>? list = [];
    if (response!.statusCode == 200) {
      data = dataModelFromJson(response!.body);
      list = data.data;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.45,
        child: ListView.builder(
            itemCount: list!.length,
            itemBuilder: ((context, index) {
              late AnimationController animationController;

              return Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.159,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.135,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CachedNetworkImage(
                                  placeholder: (context, _) {
                                    return JumpingDotsProgressIndicator(
                                        fontSize: 40.0,
                                        dotSpacing: 3,
                                        color: Colors.grey);
                                  },
                                  errorWidget: (context, error, img) =>
                                      const Icon(
                                    Icons.image,
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                  imageUrl:
                                      list![index].images!.original!.url ?? "",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: ClipOval(
                                child: GestureDetector(
                                  onTap: () {
                                    animationController.reset();
                                    animationController.forward();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Pulse(
                                      manualTrigger: true,
                                      animate: false,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      controller: (controller) =>
                                          animationController = controller,
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.orange,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          list[index].title ?? "",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            })),
      ),
    );
  }
}

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late AnimationController animationController;

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const Text(
              "Favorites",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            Expanded(
              child: Container(),
            ),
            GestureDetector(
                onTap: () {
                  animationController.reset();
                  animationController.forward();
                },
                child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(3, 5),
                          ),
                        ]),
                    child: SizedBox(
                      height: 25,
                      child: Flash(
                        manualTrigger: true,
                        animate: false,
                        duration: const Duration(milliseconds: 1000),
                        controller: (controller) =>
                            animationController = controller,
                        child: Image.asset("assets/imagen4.png",
                            fit: BoxFit.fitHeight),
                      ),
                    ))),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class TextCustom extends StatefulWidget {
  const TextCustom({Key? key}) : super(key: key);

  @override
  State<TextCustom> createState() => _TextCustomState();
}

class _TextCustomState extends State<TextCustom> {
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const Text(
            "Happy Hours",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 25),
          ),
          Expanded(
            child: Container(),
          ),
          GestureDetector(
              onTap: () {
                animationController.reset();
                animationController.forward();
              },
              child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: const Offset(2, 5),
                        ),
                      ]),
                  child: Roulette(
                    manualTrigger: true,
                    animate: false,
                    duration: const Duration(milliseconds: 1000),
                    controller: (controller) =>
                        animationController = controller,
                    child: const SizedBox(
                      height: 20,
                      child: Icon(Icons.delete_outline_rounded),
                    ),
                  ))),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class TopMenu extends StatefulWidget {
  const TopMenu({Key? key}) : super(key: key);

  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  late AnimationController animationController;
  late AnimationController animationController1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: -25,
            child: SizedBox(
                height: 160,
                width: 160,
                child: Image.asset(
                  "assets/img1.png",
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                    onTap: () {
                      animationController1.reset();
                      animationController1.forward();
                    },
                    child: SizedBox(
                        height: 25,
                        child: Swing(
                          manualTrigger: true,
                          animate: false,
                          duration: const Duration(milliseconds: 500),
                          controller: (controller) =>
                              animationController1 = controller,
                          child: Image.asset("assets/imagen2.png",
                              fit: BoxFit.fitHeight),
                        ))),
                const SizedBox(
                  width: 25,
                ),
                GestureDetector(
                    onTap: () {
                      animationController.reset();
                      animationController.forward();
                    },
                    child: SpinPerfect(
                      manualTrigger: true,
                      animate: false,
                      duration: const Duration(milliseconds: 500),
                      controller: (controller) =>
                          animationController = controller,
                      child: SizedBox(
                          height: 25,
                          child: Image.asset("assets/imagen3.png",
                              fit: BoxFit.fitHeight)),
                    )),
                const SizedBox(
                  width: 13,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
