# test_tres_astronautas

Prueba de ingreso

            Preguntas Algoritmica

Pregunta 1
Respuesta c

Pregunta 2
Respuesta c

Pregunta 3
Respuesta c

            Preguntas tecnicas

int getNumberOfLands(List<List<Slot>> slots, {bool? validateDiagonal}) {
int nxn = slots.length;

    List<Map<String, dynamic>> islasLaterales = [];

    List<Map<String, dynamic>> islas = [];

    for (int j = 0; j < nxn; j++) {
      for (int i = 0; i < nxn; i++) {
        if (slots[j][i].isActive!) {
          if (islasLaterales.isEmpty) {
            islasLaterales.add({
              "coordenadas": [
                {"j": j, "i": i}
              ],
              "islasAnexada": []
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
                ],
                "islasAnexada": []
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
          List<int> index = [];
          for (var isla in islas) {
            isla["coordenadas"].forEach((coordenada) {
              islaLateral["coordenadas"].forEach((coordenadaIslaLateral) {
                if (coordenadaIslaLateral["i"] == coordenada["i"] &&
                    (coordenadaIslaLateral["j"] - 1 == coordenada["j"] ||
                        coordenadaIslaLateral["j"] + 1 == coordenada["j"])) {
                  sonLaMismaIsla = true;
                  if (!index.contains(islas.indexOf(isla))) {
                    index.add(islas.indexOf(isla));
                  }
                }
              });
            });
          }

          if (sonLaMismaIsla) {
            for (var coordenadaIslaLateral in islaLateral["coordenadas"]) {
              islas[index.first]["coordenadas"].add(coordenadaIslaLateral);
            }
            for (int i in index) {
              islas[i]["islasAnexada"].add(islaLateral["coordenadas"]);
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

    if (islas.length > 1) {
      List<Map<String, dynamic>> _guardarIslas = [];
      List<Map<String, dynamic>> _guardarIslas1 = [];

      for (var isla in islas) {
        _guardarIslas.add(isla);
      }

      while (islas.length >= 2 && _guardarIslas.isNotEmpty) {
        for (int k = 0; k < islas.length; k++) {
          bool sonLaMismaIsla = false;

          Map<String, dynamic> isla1 = islas[k];
          Map<String, dynamic> isla2 = k + 1 >= islas.length
              ? {"isTheEnd": "true", "coordenadas": [], "islasAnexada": []}
              : islas[k + 1];
          for (var islaAnexada1 in isla1["islasAnexada"]) {
            for (var islaAnexada2 in isla2["islasAnexada"]) {
              islaAnexada1.forEach((coordenada) {
                islaAnexada2.forEach((coordenadaIslaLateral) {
                  if (coordenada == coordenadaIslaLateral) {
                    sonLaMismaIsla = true;
                  }
                });
              });
            }
          }

          if (sonLaMismaIsla) {
            _guardarIslas1.add(isla1);

            for (var coordenadas in isla2["coordenadas"]) {
              _guardarIslas1.last["coordenadas"].add(coordenadas);
            }
            _guardarIslas1.remove(isla2);
          } else {
            bool hayUnaIsla = false;
            isla1["coordenadas"].forEach((coordenada) {
              for (var isla in _guardarIslas1) {
                isla["coordenadas"].forEach((coordenadaIsla) {
                  if (coordenadaIsla == coordenada) {
                    hayUnaIsla = true;
                  }
                });
              }
            });
            if (!hayUnaIsla) _guardarIslas1.add(isla1);
          }
          _guardarIslas.remove(isla1);
        }
        islas = [];
        for (var isla in _guardarIslas1) {
          islas.add(isla);
        }
      }
    }

    return islas.length;

}
