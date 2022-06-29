import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tres_astronautas_test/routes/routes.dart';

import 'matriz/ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => {runApp(const MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'futurab'),
      title: 'Tres astronautas',
      home: const HomePage(),
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}

class MyHomePageState {
  final matriz = [
    [1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1],
    [0, 0, 1, 0, 0, 1],
    [0, 1, 0, 0, 1, 1],
    [1, 0, 0, 0, 0, 1],
    [0, 1, 0, 1, 0, 1]
  ];

  int numeroDeIslas(List<List<int>> matriz) {
    /// Implementación del código
    int nxn = matriz.length;

    List<Map<String, dynamic>> islasLaterales = [];

    List<Map<String, dynamic>> islas = [];

    for (int j = 0; j < nxn; j++) {
      for (int i = 0; i < nxn; i++) {
        if (matriz[j][i] == 1) {
          if (islasLaterales.isEmpty) {
            islasLaterales.add({
              "coordenadas": [
                {"j": j, "i": i}
              ]
            });
          } else {
            bool hayIslaLateral = false;
            int index = 0;

            for (var islaLateral in islasLaterales) {
              islaLateral["coordenadas"].forEach((coordenada) {
                if (coordenada["i"] == i - 1 && coordenada["j"] == j) {
                  hayIslaLateral = true;
                  index = islasLaterales.indexOf(islaLateral);
                }
              });
            }
            if (hayIslaLateral) {
              islasLaterales[index]["coordenadas"].add({"j": j, "i": i});
            } else {
              islasLaterales.add({
                "coordenadas": [
                  {"j": j, "i": i}
                ]
              });
            }
          }
        }
      }
    }
    List<Map<String, dynamic>> _islasLaterales = [];
    for (var isla in islasLaterales) {
      _islasLaterales.add(isla);
    }

    while (_islasLaterales.isNotEmpty) {
      for (var islaLateral in islasLaterales) {
        if (islas.isEmpty) {
          islas.add(islaLateral);
          _islasLaterales.remove(islaLateral);
        } else {
          bool sonLaMismaIsla = false;
          int index = 0;
          for (var isla in islas) {
            isla["coordenadas"].forEach((coordenada) {
              islaLateral["coordenadas"].forEach((coordenadaIslaLateral) {
                if (coordenadaIslaLateral["i"] == coordenada["i"] &&
                    (coordenadaIslaLateral["j"] - 1 == coordenada["j"] ||
                        coordenadaIslaLateral["j"] + 1 == coordenada["j"])) {
                  sonLaMismaIsla = true;
                  index = islas.indexOf(isla);
                }
              });
            });
          }

          if (sonLaMismaIsla) {
            for (var coordenadaIslaLateral in islaLateral["coordenadas"]) {
              islas[index]["coordenadas"].add(coordenadaIslaLateral);
            }
          } else {
            islas.add(islaLateral);
          }
          _islasLaterales.remove(islaLateral);
        }
      }

      islasLaterales = [];
      for (var _islaLateral in _islasLaterales) {
        islasLaterales.add(_islaLateral);
      }
    }

    print(islasLaterales);

    return islas.length;
  }
}
