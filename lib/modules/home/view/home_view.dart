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
                  return Column(
                    children: [
                      Row(
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 47,
                                width: 47,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 207, 182, 212),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Image.asset(
                                      "assets/bottombar/Home icon.png"),
                                ),
                              ),
                              title: const Text(
                                "Shopping",
                                style: TextStyle(fontSize: 16),
                              ),
                              subtitle: const Text(
                                "Clothes an watch",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                              trailing: const Text(
                                "1101.00",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                            );
                          })
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
