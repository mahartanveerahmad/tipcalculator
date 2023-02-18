import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();

  bool selectButton1 = false;
  bool selectButton2 = false;
  bool selectButton3 = false;

  int percentageValue = 0;
  double tipPercentage = 0;

  void calculateTip() {
    final totalAmout = double.parse(controller.text);
    final selectedIndex = percentageValue;
    tipPercentage = (totalAmout * selectedIndex) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '\$${tipPercentage.toString()}',
              style: const TextStyle(fontSize: 30),
            ),
            const Text("Total Amount"),
            SizedBox(
              width: 70,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: '\$100.00'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectButton1 = !selectButton1;
                        selectButton2 = selectButton3 = false;
                        selectButton1
                            ? percentageValue = 10
                            : percentageValue = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selectButton1 ? Colors.blueAccent : Colors.white,
                        border: Border.all(
                          color: Colors.purple,
                        ),
                      ),
                      child: const Text("10%"),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectButton2 = !selectButton2;
                        selectButton1 = selectButton3 = false;

                        selectButton2
                            ? percentageValue = 15
                            : percentageValue = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selectButton2 ? Colors.blueAccent : Colors.white,
                        border: Border.all(
                          color: Colors.purple,
                        ),
                      ),
                      child: const Text("15%"),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectButton3 = !selectButton3;
                        selectButton1 = selectButton2 = false;

                        selectButton3
                            ? percentageValue = 20
                            : percentageValue = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selectButton3 ? Colors.blueAccent : Colors.white,
                        border: Border.all(
                          color: Colors.purple,
                        ),
                      ),
                      child: const Text("20%"),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calculateTip();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text("Calculate Tip"),
            ),
          ],
        ),
      ),
    );
  }
}
