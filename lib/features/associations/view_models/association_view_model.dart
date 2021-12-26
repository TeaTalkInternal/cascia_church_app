import 'package:cascia_church_app/features/associations/models/association.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final associationViewModelProvider = Provider<AssociationViewModel>((ref) {
  return AssociationViewModel(ref: ref);
});

class AssociationViewModel {
  AssociationViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  final List<Association> _allAssociations = [
    Association(
        id: 'Catholic Sabha',
        title: 'Catholic Sabha',
        imageName: 'timings.png',
        shortDescription: 'A united group for a cause',
        fullDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    Association(
        id: 'ICYM',
        title: 'ICYM',
        imageName: 'timings.png',
        shortDescription: 'A group for youth',
        fullDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    Association(
        id: 'YCS',
        title: 'YCS',
        imageName: 'timings.png',
        shortDescription: 'A united group for a cause',
        fullDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    Association(
        id: 'SSVP',
        title: 'SSVP',
        imageName: 'timings.png',
        shortDescription: 'A united group for a cause',
        fullDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  ];

  List<Association> getAllAssociations() {
    return _allAssociations;
  }

  int getAllAssociationsCount() {
    return _allAssociations.length;
  }

  Association? _getAssociationAtIndex(int index) {
    return _allAssociations[index];
  }

  String getAssociationTitleAtIndex(int index) {
    final association = _getAssociationAtIndex(index);
    return (association != null) ? association.title : '--';
  }

  String getAssociationImageAtIndex(int index) {
    final association = _getAssociationAtIndex(index);
    return (association != null) ? association.imageName : '--';
  }

  String getAssociationShortDescriptionAtIndex(int index) {
    final association = _getAssociationAtIndex(index);
    return (association != null) ? association.shortDescription : '--';
  }

  String getAssociationFullDescriptionAtIndex(int index) {
    final association = _getAssociationAtIndex(index);
    return (association != null) ? association.fullDescription : '--';
  }
}
