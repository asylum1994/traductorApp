import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleTranslator translator = GoogleTranslator();

  String selectValue = "elija un idioma";
  String inputText = "";
  String ouputText = "hola mundo";
  String selectIdioma = "";

  List<String> _items = [
    'elija un idioma',
    'inglish',
    'spanish',
    'hindu',
    'korean',
    'french'
  ];

  void translate() {
    translator.translate(inputText, to: selectIdioma).then((value) {
      setState(() {
        ouputText = value.text;
      });
    });
  }

  void getIdioma(String idioma) {
    switch (idioma) {
      case 'spanish':
        selectIdioma = 'es';
        break;
      case 'inglish':
        selectIdioma = 'en';
        break;
      case 'korean':
        selectIdioma = 'ko';
        break;
      case 'french':
        selectIdioma = 'fr';
        break;
      case 'hindu':
        selectIdioma = 'hi';
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("translate")),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: selectValue,
              items: _items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectValue = value.toString();
                  getIdioma(selectValue);
                });
              },
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              decoration: InputDecoration(
                  hintText: "ingresar texto",
                  prefixIcon: Icon(Icons.account_box),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  translate();
                });
              },
              child: const Text(
                "translate",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(200, 50)),
            ),
            const SizedBox(height: 20),
            Container(
                child: Center(child: Text(ouputText)),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20))),
          ],
        ),
      )),
    );
  }
}
