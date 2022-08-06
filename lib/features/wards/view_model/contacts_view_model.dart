import 'package:cascia_church_app/network/network_manager.dart';
import 'package:cascia_church_app/network/url_manager.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../wards/model/contact.dart';

final contactViewModelProvider = Provider<ContactsViewModel>((ref) {
  return ContactsViewModel(ref: ref);
});

class ContactsViewModel {
  ContactsViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  List<Contact> _allContacts = [];

  Future<List<Contact>> fetchAllContacts() async {
    final networkMangerProvider = ref.read(networkManagerProvider);
    final urlProvider = ref.read(urlManagerProvider);
    final url = urlProvider.allContactsURL;
    print("url : ${url}");
    try {
      final _response = await networkMangerProvider.getRequest(url: url);
      if (_response != null) {
        final Map<String, dynamic> _contactsJson =
            Map<String, dynamic>.from(_response as Map<String, dynamic>);

        if (_contactsJson.isNotEmpty) {
          final List<dynamic> _parsedContacts =
              _contactsJson['contacts'] as List<dynamic>;
          // final List<Map<String, dynamic>> _itemsJson =
          //     List<Map<String, dynamic>>.from(_parsedContacts);
          final List<Contact> _contacts = _parsedContacts.map((_contactObj) {
            return Contact.fromJson(_contactObj as Map<String, dynamic>);
          }).toList();
          _setAllContacts(_contacts);
          return _contacts;
        }
        return [];
      } else {
        throw DioErrorType.other;
      }
    } catch (_) {
      rethrow;
    }
  }

  // List<Contact> getAllContacts() {
  //   return _allContacts;
  // }

  // int getAllContactsCount() {
  //   return _allContacts.length;
  // }

  void _setAllContacts(List<Contact> contacts) {
    print("contacts : ${contacts.length}");
    _allContacts = contacts;
  }

  String getContactKonkaniName(Contact? contact) {
    return contact?.nameKn ?? '--';
  }

  String getContactEnglishName(Contact? contact) {
    return contact?.name ?? '--';
  }

  String getContactMobileNumber(Contact? contact) {
    return contact?.mobileNumber ?? '--';
  }

  String getContactLandlineNumber(Contact? contact) {
    return contact?.landlineNumber ?? '--';
  }

  // Contact? getContactAtIndex(int index) {
  //   return _allContacts[index];
  // }

  // bool getContactIsGurkar(int index) {
  //   final contact = getContactAtIndex(index);
  //   return (contact != null) ? contact.isGurkar : false;
  // }
}
