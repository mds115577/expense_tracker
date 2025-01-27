import 'package:expense_tracker/modules/home/provider_class/home_provider.dart';
import 'package:expense_tracker/modules/home/widgets/bar_graph.dart';
import 'package:expense_tracker/modules/home/widgets/home_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Balance",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "12,560.00",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 66, 34, 74)),
                ),
                const BarGraph(),
                const SizedBox(
                  height: 10,
                ),
                Consumer<HomeProvider>(builder: (context, itemProvider, _) {
                  return Row(
                    children: [
                      HomeButtons(
                        color: homeProvider.isSelected == 0
                            ? const Color.fromARGB(255, 207, 182, 212)
                            : const Color.fromARGB(255, 225, 225, 225),
                        name: "Today",
                        onTap: () {
                          homeProvider.sortData(0);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      HomeButtons(
                        color: homeProvider.isSelected == 1
                            ? const Color.fromARGB(255, 207, 182, 212)
                            : const Color.fromARGB(255, 225, 225, 225),
                        name: "Weekly",
                        onTap: () {
                          homeProvider.sortData(1);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      HomeButtons(
                        color: homeProvider.isSelected == 2
                            ? const Color.fromARGB(255, 207, 182, 212)
                            : const Color.fromARGB(255, 225, 225, 225),
                        name: "Monthly",
                        onTap: () {
                          homeProvider.sortData(2);
                        },
                      )
                    ],
                  );
                }),
              ],
            ),
          );
        },
      )),
    );
  }
}
