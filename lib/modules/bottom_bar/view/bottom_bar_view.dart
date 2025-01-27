import 'package:expense_tracker/modules/additem/view/add_item_view.dart';
import 'package:expense_tracker/modules/home/view/home_view.dart';
import 'package:expense_tracker/modules/receipt/view/receipt_view.dart';
import 'package:expense_tracker/modules/reminders/view/reminders_view.dart';
import 'package:expense_tracker/modules/statistics/view/statistics_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomBarView extends StatelessWidget {
  BottomBarView({super.key});

  static ValueNotifier<int> selectedPageIndex = ValueNotifier(0);
  List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  final pages = [
    const HomeView(),
    const ReceiptView(),
    const AddItemView(),
    const StatisticsView(),
    const RemindersView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBody: false,
      // extendBodyBehindAppBar: true, resizeToAvoidBottomInset: false,
      bottomNavigationBar: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: BottomBarView.selectedPageIndex,
            builder: (BuildContext context, int updatedIndex, Widget? _) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  ),
                  child: NavigationBarTheme(
                    data: NavigationBarThemeData(
                      labelTextStyle:
                          WidgetStateProperty.resolveWith<TextStyle>(
                        (Set<WidgetState> states) {
                          // Define the default text style
                          TextStyle defaultStyle = const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,

                            color: Colors
                                .black, // Default color for unselected labels
                          );

                          // Check if the selected state is included
                          if (states.contains(WidgetState.selected)) {
                            // Set the color for the selected label
                            return defaultStyle.copyWith(
                                color: const Color.fromARGB(255, 127, 56, 146),
                                // color: bottomBarIconColor,
                                fontWeight: FontWeight.bold);
                          }

                          // Return the default text style for other states
                          return defaultStyle;
                        },
                      ),
                    ),
                    child: NavigationBar(
                      labelBehavior:
                          NavigationDestinationLabelBehavior.alwaysShow,
                      shadowColor: const Color.fromARGB(255, 0, 0, 0),
                      indicatorShape: const RoundedRectangleBorder(),
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      height: 60,
                      surfaceTintColor: Colors.transparent,
                      selectedIndex: updatedIndex,
                      indicatorColor: Colors.transparent,
                      onDestinationSelected: (value) {
                        BottomBarView.selectedPageIndex.value = value;
                        //  BottombarView.selectedPageIndex2.value = value;
                      },
                      // showSelectedLabels: true,
                      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
                      elevation: 19,
                      // unselectedItemColor:
                      //     const Color.fromARGB(255, 0, 0, 0),
                      // showUnselectedLabels: true,
                      // selectedItemColor: bottomBarIconColor,
                      // currentIndex: updatedIndex,
                      // onTap: ((newIndex) {
                      //   BottombarView.selectedPageIndex.value = newIndex;
                      // }),
                      // type: BottomNavigationBarType.fixed,
                      destinations: const [
                        NavigationDestination(
                          selectedIcon: ImageIcon(
                            color: Color.fromARGB(255, 127, 56, 146),
                            AssetImage("assets/bottombar/Home icon.png"),
                            size: 22,
                          ),
                          icon: ImageIcon(
                            AssetImage("assets/bottombar/Home icon.png"),
                            size: 22,
                          ),
                          label: 'Home',
                        ),
                        NavigationDestination(
                          selectedIcon: ImageIcon(
                            color: Color.fromARGB(255, 127, 56, 146),
                            AssetImage("assets/bottombar/Receipt icon.png"),
                            size: 22,
                            // color: bottomBarIconColor,
                          ),
                          icon: ImageIcon(
                            AssetImage("assets/bottombar/Receipt icon.png"),
                            size: 22,
                          ),
                          label: 'Receipts',
                        ),
                        // Add empty BottomNavigationBarItem for space
                        NavigationDestination(
                          icon: SizedBox.shrink(),
                          label: '',
                        ),
                        NavigationDestination(
                          selectedIcon: ImageIcon(
                            color: Color.fromARGB(255, 127, 56, 146),
                            // color: bottomBarIconColor,
                            AssetImage("assets/bottombar/Statistic icon.png"),
                            size: 22,
                          ),
                          icon: ImageIcon(
                            AssetImage("assets/bottombar/Statistic icon.png"),
                            size: 22,
                          ),
                          label: 'Statistics',
                        ),
                        NavigationDestination(
                          selectedIcon: ImageIcon(
                            color: Color.fromARGB(255, 127, 56, 146),
                            // color: bottomBarIconColor,
                            AssetImage("assets/bottombar/Reminder icon.png"),
                            size: 22,
                          ),
                          icon: ImageIcon(
                            AssetImage("assets/bottombar/Reminder icon.png"),
                            size: 22,
                          ),
                          label: 'Reminders',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: BottomBarView.selectedPageIndex,
        builder: (BuildContext context, int index, Widget? _) {
          return Stack(
            children: [
              Navigator(
                key: navigatorKeys[index],
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => pages[index],
                  );
                },
              ),
            ],
          );
        },
      ),
      // Move floatingActionButtonLocation and floatingActionButton here
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          BottomBarView.selectedPageIndex.value = 2; // Index of PerformanceView
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ValueListenableBuilder(
            valueListenable: BottomBarView.selectedPageIndex,
            builder: (context, index, _) {
              return Container(
                height: 73,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.orange),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    "assets/bottombar/Vector.png",
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
