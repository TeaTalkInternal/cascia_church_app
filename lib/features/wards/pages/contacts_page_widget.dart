import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:cascia_church_app/features/wards/pages/search_textfield_widget.dart';
import 'package:cascia_church_app/features/wards/view_model/contacts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../common_widgets/list_cells/contacts_line_list_tile_widget.dart';
import '../../../common_widgets/list_cells/single_line_list_tile_widget.dart';
import '../../../common_widgets/top_app_bar_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../wards/model/contact.dart';

class ContactsPageWidget extends ConsumerStatefulWidget {
  const ContactsPageWidget({Key? key}) : super(key: key);

  @override
  ContactsPageWidgetState createState() => ContactsPageWidgetState();
}

class ContactsPageWidgetState extends ConsumerState<ContactsPageWidget> {
  bool _isLoading = true;

  List<Contact> _allContacts = [];
  List<Contact> _filteredContacts = [];
  final _placeNameTextController = TextEditingController();
  Function? onPlaceSelected;
  final String hintText = '';

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  _fetchContacts() {
    final _fetchedPhotos =
        ref.read(contactViewModelProvider).fetchAllContacts();
    _fetchedPhotos.then((value) {
      setState(() {
        _isLoading = false;
        _allContacts = value;
        _filteredContacts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('families'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: Column(
        children: [
          SearchTextFieldWidget(
            searchTextDidChange: _searchTextDidChange,
            onValueSubmitted: _onValueSubmitted,
            placeNameTextController: _placeNameTextController,
            hintText: hintText,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                bottom: 20.0,
                top: 10.0,
              ),
              child: _getContactsList(
                context: context,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getContactCard({
    required String name,
    required String mobile,
    required String landline,
    required BuildContext context,
  }) {
    return Container(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 10.0,
          ),
          Image.asset(
            'assets/images/drawer-icon.png',
            width: 35.0,
            height: 17.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Contact Details",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                "Name: ",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
              ),
              Text(
                "$name",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                "Landline Number : ",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
              ),
              Text(
                "$landline",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                "Mobile Number: ",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
              ),
              Text(
                "$mobile",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ]),
      ),
      color: Colors.white,
    );
  }

  void _filterContacts(String query) {
    setState(() {
      _filteredContacts = _allContacts
          .where((element) =>
              element.nameKn.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _searchForQuery(BuildContext context, String value) async {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    _timer = Timer(Duration(seconds: 1), () {
      _filterContacts(value);
    });
  }

  //TextField search methods
  void _searchTextDidChange(BuildContext context, String value) {
    _searchForQuery(context, value);
  }

  void _onValueSubmitted(BuildContext context, String value) {
    _searchForQuery(context, value);
  }

  Widget _getContactsList({required BuildContext context}) {
    return (_allContacts.isEmpty && _isLoading)
        ? Center(
            child: SizedBox(
              height: 120.0,
              child: Image.asset('assets/images/loader.gif'),
            ),
          )
        : (_allContacts.isEmpty && _isLoading == false)
            ? Text(
                'No contacts found at this time. Please try Refreshing again.')
            : _buildContactsListView(
                contacts: _filteredContacts,
                context: context,
              );
  }

  Widget _buildContactsListView(
      {required List<Contact> contacts, required BuildContext context}) {
    final conatctViewModel = ref.read(contactViewModelProvider);
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      itemBuilder: (listContext, index) {
        final contact = _filteredContacts[index];
        final name = appLanguage.isEnglishLocale
            ? conatctViewModel.getContactEnglishName(contact)
            : conatctViewModel.getContactKonkaniName(contact);
        final mobile = conatctViewModel.getContactMobileNumber(contact);
        final landline = conatctViewModel.getContactLandlineNumber(contact);
        return ContactsLineListTileWidget(
          title: name,
          mobileNumber: mobile,
          landlineNumber: landline,
          onTap: () => showCupertinoModalBottomSheet(
            context: context,
            backgroundColor: Colors.white,
            builder: (context) => getContactCard(
                name: name,
                mobile: mobile,
                landline: landline,
                context: context),
          ),
        );
      },
      separatorBuilder: (listContext, index) {
        return Divider(
          indent: 60,
          height: 0.2,
          color: utility.appGreyColor,
        );
      },
      itemCount: _filteredContacts.length,
    );
  }
}
