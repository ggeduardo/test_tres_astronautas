import 'package:flutter/material.dart';

class InputRange extends StatelessWidget {
  final TextEditingController? controller;
  final double? width;
  final bool? disableInput;
  const InputRange({Key? key, this.disableInput, this.controller, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 85,
      width: width ?? 55,
      child: TextField(
        showCursor: false,
        readOnly: false,
        controller: controller,
        enabled: disableInput ?? true,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromARGB(186, 11, 2, 67),
            fontSize: 35,
            fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 2,
        decoration: InputDecoration(
          counter: const Offstage(),
          filled: true,
          fillColor: const Color.fromRGBO(248, 244, 244, 1),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: Color.fromRGBO(248, 244, 244, 1),
              ),
              borderRadius: BorderRadius.circular(size.width * 0.03)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: Color.fromRGBO(32, 29, 52, 1)),
              borderRadius: BorderRadius.circular(size.width * 0.03)),
        ),
      ),
    );
  }
}
