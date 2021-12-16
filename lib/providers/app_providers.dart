import 'package:cascia_church_app/utility/utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final dashboardImagesProvider = FutureProvider<List<CardImage>>((ref) async {
//   final photosVMProvider = ref.read(dashboardViewModelProvider);
//   return photosVMProvider.fetchAllImages();
// });

// final dashboardViewModelProvider =
//     ChangeNotifierProvider<DashboardViewModel>((ref) {
//   return DashboardViewModel(ref: ref);
// });

//Utility Provider
final utilityProvider = Provider<Utility>((_) {
  final utility = Utility();
  return utility;
});

// final utilityProvider = ChangeNotifierProvider<Utility>((ref) {
//   final utility = Utility();
//   return utility;
// });

// //Image upload View Model Provider
// final uploadImageViewModelProvider =
//     Provider<UploadImageViewModel>((ref) => UploadImageViewModel(ref: ref));

// //Favorites Provider
// final myUploadsFetchProvider =
//     FutureProvider<void>((ProviderReference ref) async {
//   final myUploadsViewModel = ref.read(myUploadsViewModelProvider);
//   myUploadsViewModel.fetchAllUploadedImages();
// });

// final myUploadsViewModelProvider =
//     ChangeNotifierProvider<UploadImagesListViewModel>((ref) {
//   return UploadImagesListViewModel(ref: ref);
// });

// //Dashboard Provider
// final encyclopediaImagesProvider =
//     FutureProvider<List<Encyclopaedia>>((ref) async {
//   final encyclopediaVMProvider = ref.read(encyclopediaViewModelProvider);
//   var nextPage = ref.watch(encyclopediaViewModelProvider).page;
//   // final query = ref.read(filterViewModelProvider).getSearchQuery();
//   return encyclopediaVMProvider.fetchAllEncyclopediaImages(
//       query: "", nextPage: nextPage);
// });

// final encyclopediaViewModelProvider =
//     ChangeNotifierProvider<EncyclopediaViewModel>((ref) {
//   return EncyclopediaViewModel(ref: ref);
// });

// //Login
// final loginViewModelProvider =
//     Provider<LoginViewModel>((ref) => LoginViewModel(ref: ref));
