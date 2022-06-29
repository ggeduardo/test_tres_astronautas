import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/matriz/model/slot.dart';
import 'package:tres_astronautas_test/matriz/ui/widgets/my_input.dart';
import 'package:tres_astronautas_test/nasa/ui/pages/nasa_page.dart';
import 'package:tres_astronautas_test/utils/matrices.dart';

class MatrizPage extends StatefulWidget {
  static const route = "/matriz_page";

  final Map<String, dynamic>? data;

  const MatrizPage({Key? key, this.data}) : super(key: key);

  @override
  State<MatrizPage> createState() => _MatrizPageState();
}

class _MatrizPageState extends State<MatrizPage> {
  Map<String, dynamic>? data;

  final rng = Random();

  late TextEditingController controller;
  late List<List<Slot>> slots = [];

  @override
  void initState() {
    super.initState();
    data = widget.data;
    controller = data!["controller"];
    slots = Matrices().getRandomSlots(int.parse(controller.text));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 1, 10, 59),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              if (int.parse(controller.text) > 2) {
                                controller.text =
                                    (int.parse(controller.text) - 1).toString();
                                slots = Matrices().getRandomSlots(
                                    int.parse(controller.text),
                                    slots: slots);

                                setState(() {});
                              }
                            },
                            icon: const Icon(Icons.remove,
                                size: 45, color: Colors.white)),
                        Expanded(child: Container()),
                        InputRange(
                          controller: controller,
                          width: 80,
                          disableInput: false,
                        ),
                        Expanded(child: Container()),
                        IconButton(
                            onPressed: () {
                              if (int.parse(controller.text) < 12) {
                                controller.text =
                                    (int.parse(controller.text) + 1).toString();
                                slots = Matrices().getRandomSlots(
                                    int.parse(controller.text),
                                    slots: slots);

                                setState(() {});
                              }
                            },
                            icon: const Icon(Icons.add,
                                size: 45, color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          "- Mezclar islas",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                            onTap: () {
                              slots = Matrices().getRandomSlots(
                                  int.parse(controller.text),
                                  slots: slots);

                              setState(() {});
                            },
                            child: const Icon(Icons.sync_rounded,
                                color: Colors.white)),
                      ],
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     const Text(
                    //       "- Validar diagonal",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: 16),
                    //     ),
                    //     Expanded(child: Container()),
                    //     const Icon(Icons.check_box, color: Colors.white),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: GridView.count(
                    crossAxisCount: int.parse(controller.text),
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: [
                      for (List<Slot> slot in slots)
                        for (Slot _slot in slot)
                          GestureDetector(
                            onTap: () {
                              int _j = slots.indexOf(slot);
                              int _i = slots[_j].indexOf(_slot);
                              slots[_j][_i].isActive = !slots[_j][_i].isActive!;
                              slots[_j][_i].color = slots[_j][_i].isActive!
                                  ? Colors.green[600]
                                  : Colors.blueAccent;
                              setState(() {});
                            },
                            child: Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: _slot.color,
                                borderRadius: BorderRadius.only(
                                    topLeft: _slot.position!.i == 0 &&
                                            _slot.position!.j == 0
                                        ? const Radius.circular(30)
                                        : const Radius.circular(10),
                                    topRight:
                                        _slot.position!.i == slots.length - 1 &&
                                                _slot.position!.j == 0
                                            ? const Radius.circular(30)
                                            : const Radius.circular(10),
                                    bottomLeft: _slot.position!.i == 0 &&
                                            _slot.position!.j ==
                                                slots.length - 1
                                        ? const Radius.circular(30)
                                        : const Radius.circular(10),
                                    bottomRight:
                                        _slot.position!.i == slots.length - 1 &&
                                                _slot.position!.j ==
                                                    slots.length - 1
                                            ? const Radius.circular(30)
                                            : const Radius.circular(10)),
                              ),
                            ),
                          )
                    ],
                  ),
                ),
              )),
              SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.green[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Text(" Tierra / ",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),
                    ]),
                    Row(children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Text(" Agua ",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "- Número de islas: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "${Matrices().getNumberOfLands(slots)}    ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "- Número de slots activos: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "${Matrices().getNumberOfSlots(slots)}    ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(NasaPage.route);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Ir a la siguiente página",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.grey)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
      )),
    );
  }
}
