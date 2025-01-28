import 'package:expense_tracker/modules/additem/view/add_item_view.dart';
import 'package:expense_tracker/modules/bottom_bar/view/bottom_bar_view.dart';
import 'package:expense_tracker/modules/home/view/home_view.dart';
import 'package:expense_tracker/modules/home/view/new_screen.dart';
import 'package:expense_tracker/modules/receipt/view/receipt_view.dart';
import 'package:expense_tracker/modules/reminders/view/reminders_view.dart';
import 'package:expense_tracker/modules/statistics/view/statistics_view.dart';
import 'package:expense_tracker/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: "/",
      name: MyAppRouteConstants.bottomRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(child: BottomBarView());
      },
    ),
    GoRoute(
      path: "/home",
      name: MyAppRouteConstants.homeRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: HomeView());
      },
    ),
    GoRoute(
      path: "/receipt",
      name: MyAppRouteConstants.receiptRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: ReceiptView());
      },
    ),
    GoRoute(
      path: "/reminders",
      name: MyAppRouteConstants.reminderRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: RemindersView());
      },
    ),
    GoRoute(
      path: "/statistics",
      name: MyAppRouteConstants.statisticRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: StatisticsView());
      },
    ),
    GoRoute(
      path: "/addItem",
      name: MyAppRouteConstants.addItemRouteName,
      pageBuilder: (context, state) {
        return const MaterialPage(child: AddItemView());
      },
    ),
    GoRoute(
      path: "/newScreen/:data",
      name: MyAppRouteConstants.newScreenRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(
            child: NewScreen(
          data: state.pathParameters['data']!,
        ));
      },
    ),
  ]);
}
