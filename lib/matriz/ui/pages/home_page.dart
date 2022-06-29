import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tres_astronautas_test/matriz/ui/pages/matriz_page.dart';
import 'package:tres_astronautas_test/matriz/ui/widgets/my_input.dart';

class HomePage extends StatelessWidget {
  static const route = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        height: _size.height,
        width: _size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: IntroductionImage(),
            ),
            Align(alignment: Alignment.bottomCenter, child: GetRangeInput())
          ],
        ),
      )),
    );
  }
}

class IntroductionImage extends StatelessWidget {
  const IntroductionImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        "assets/imageCenter.gif",
        fit: BoxFit.cover,
      ),
    );
  }
}

class GetRangeInput extends StatefulWidget {
  const GetRangeInput({Key? key}) : super(key: key);

  @override
  State<GetRangeInput> createState() => _GetRangeInputState();
}

class _GetRangeInputState extends State<GetRangeInput> {
  final TextEditingController rangeController =
      TextEditingController(text: "1");
  late AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: size.width,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 1, 10, 59),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 45),
            const Text(
              "¡Bienvenid@ Viajer@!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              "Ops! pido disculpas me he perdido en la nave.\n\n¿Quieres intentar algo increible?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            const Text(
              "Coloca un número y presiona ' Empezar '",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            const SizedBox(height: 20),
            Pulse(
              manualTrigger: true,
              animate: false,
              duration: const Duration(milliseconds: 300),
              controller: (controller) => animationController = controller,
              child: InputRange(
                controller: rangeController,
                width: 80,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.red))),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.red[400]!.withOpacity(0.9))),
                onPressed: () {
                  if (int.parse(rangeController.value.text) > 1) {
                    Navigator.of(context).pushNamed(MatrizPage.route,
                        arguments: {"controller": rangeController});
                  } else {
                    animationController.reset();
                    animationController.forward();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 12),
                  child: Text("Empezar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600)),
                ))
          ],
        ),
      ),
    );
  }
}
