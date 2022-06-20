import 'package:cascia_church_app/features/dashboard/models/dashboard_menu.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dashboardViewModelProvider = Provider<DashboardViewModel>((ref) {
  return DashboardViewModel(ref: ref);
});

class DashboardViewModel {
  DashboardViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  final List<DashboardMenu> _dashboardOptions = [
    DashboardMenu(
      id: 'mass_timings',
      title: 'mass_timings',
      imageName: 'timings.png',
    ),
    DashboardMenu(
      id: 'history',
      title: 'church_history_title',
      imageName: 'history1.png',
    ),
    DashboardMenu(
      id: 'associations',
      title: 'associations',
      imageName: 'associations.png',
    ),
    DashboardMenu(
      id: 'institutions',
      title: 'institutions',
      imageName: 'institutions.png',
    ),
    DashboardMenu(
      id: 'announcements',
      title: 'announcements',
      imageName: 'announcements.png',
    ),
    DashboardMenu(
      id: 'photos',
      title: 'photos',
      imageName: 'photos.png',
    ),
    DashboardMenu(
      id: 'wards_families',
      title: 'wards_families',
      imageName: 'wards_families.png',
    ),
    DashboardMenu(
      id: 'blogs',
      title: 'blogs',
      imageName: 'blogs.png',
    ),
    DashboardMenu(
      id: 'contact_us',
      title: 'contact_us',
      imageName: 'contact_us.png',
    ),
  ];
  // final List<Map<String, String>> _dashboardOptions = [
  //   {
  //     'title': 'mass_timings',
  //     'image_name': 'timings.png',
  //   },
  //   {
  //     'title': 'history',
  //     'image_name': 'history.png',
  //   },
  //   {
  //     'title': 'mass_timings',
  //     'image_name': 'timings.png',
  //   },
  //   {
  //     'title': 'mass_timings',
  //     'image_name': 'timings.png',
  //   }
  // ];

  List<DashboardMenu> getDashboardmenuOptions() {
    return _dashboardOptions;
  }
}
