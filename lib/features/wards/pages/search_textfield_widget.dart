import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({
    Key? key,
    required Function searchTextDidChange,
    required Function onValueSubmitted,
    required TextEditingController placeNameTextController,
    required String hintText,
  })  : _searchTextDidChange = searchTextDidChange,
        _onValueSubmitted = onValueSubmitted,
        _hintText = hintText,
        _placeNameTextController = placeNameTextController,
        super(key: key);

  final TextEditingController _placeNameTextController;
  final Function _searchTextDidChange;
  final Function _onValueSubmitted;
  final String _hintText;

  @override
  _SearchTextFieldWidgetState createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  bool _showClearButton = false;
  @override
  void initState() {
    super.initState();
    _showClearButton = widget._placeNameTextController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final _searchTextStyle = TextStyle(color: Colors.black54);
    return Container(
      // padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 0.2),
        ],
      ),
      margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),

      height: 44.0,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: TextField(
              controller: widget._placeNameTextController,
              autofocus: true,
              style: _searchTextStyle,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                border: InputBorder.none,
                hintText: 'Search name here',
                labelStyle: _searchTextStyle,
                hintStyle: _searchTextStyle,
                suffixIcon: _showClearButton
                    ? IconButton(
                        iconSize: 20.0,
                        color: Colors.black54,
                        onPressed: () {
                          setState(() {
                            widget._placeNameTextController.clear();
                            _showClearButton = false;
                          });
                          widget._searchTextDidChange(context, '');
                        },
                        icon: Icon(Icons.clear_rounded),
                      )
                    : null,
              ),
              cursorColor: Colors.black38,
              onChanged: (value) {
                setState(() {
                  _showClearButton =
                      widget._placeNameTextController.text.isNotEmpty;
                });
                widget._searchTextDidChange(context, value);
              },
              onSubmitted: (value) => widget._onValueSubmitted(context, value),
            ),
          ),
        ],
      ),
    );
  }
}
