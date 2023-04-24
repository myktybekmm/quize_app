import 'package:flutter/material.dart';
import 'package:quize_app/models/quize_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool a = false;
  final successIcon = const Icon(Icons.check, color: Colors.green);
  final errorIcon = const Icon(Icons.clear, color: Colors.red);
  int count = 0;
  int totalCorrect = 0;

  List<Icon> listIcons = [];

  void checkAnswer(bool isCorrect) {
    setState(
      () {
        if (quections.length > count) {
          if (quections[count].isCorrect == isCorrect) {
            totalCorrect++;
            listIcons.add(successIcon);
          } else {
            listIcons.add(errorIcon);
          }
        }
        count++;
        debugPrint(totalCorrect.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 61, 55, 55),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Тапшырма 7",
            style: TextStyle(
              color: Color.fromARGB(255, 12, 12, 12),
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: quections.length > count
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quections[count].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () => checkAnswer(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 67),
                    ),
                    child: const Text("Туура"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => checkAnswer(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 67),
                    ),
                    child: const Text("Туура эмес"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listIcons.length,
                      itemBuilder: (context, index) {
                        return listIcons[index];
                      },
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      "Cиз $totalCorrect суроого туура жооп бердиниз!",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      listIcons = [];
                      totalCorrect = 0;
                      count = 0;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.refresh),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Кайра баштоо"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
