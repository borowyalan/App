import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../helpers/colourHelper.dart';
import '../../localization/localeKey.dart';
import '../../localization/translations.dart';

/*
Future<String> asyncInputDialog(BuildContext context, String title,
    {String defaultText, List<Widget> actions, TextInputType inputType}) async {
  String output = '';
  List<TextInputFormatter> inputFormatters = inputType == TextInputType.number
      ? <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly]
      : null;
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
          title: title == null ? null : Text(title),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                autofocus: true,
                controller: new TextEditingController(text: defaultText),
                keyboardType: inputType == null ? TextInputType.text : null,
                inputFormatters: inputFormatters,
                onChanged: (value) {
                  output = value;
                },
              ))
            ],
          ),
          actions: [
            FlatButton(
              child: Text(
                Translations.get(context, LocaleKey.close),
              ),
              onPressed: () {
                Navigator.of(context).pop('');
              },
            ),
            FlatButton(
              child: Text(
                Translations.get(context, LocaleKey.apply),
              ),
              onPressed: () {
                Navigator.of(context).pop(output);
              },
            ),
          ]);
    },
  );
}
*/
Future<String> asyncInputDialog(BuildContext context, String title,
    {String defaultText, List<Widget> actions, TextInputType inputType}) async {
  String output = '';
  List<TextInputFormatter> inputFormatters = inputType == TextInputType.number
      ? <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly]
      : null;
  var alertResult = await Alert(
    context: context,
    title: title,
    closeFunction: () {},
    style: AlertStyle(
      titleStyle: TextStyle(
        color: getIsDark(context) ? Colors.white : Colors.black,
      ),
    ),
    content: Row(
      children: <Widget>[
        Expanded(
            child: TextField(
          autofocus: true,
          controller: new TextEditingController(text: defaultText),
          keyboardType: inputType == null ? TextInputType.text : null,
          inputFormatters: inputFormatters,
          onChanged: (value) {
            output = value;
          },
        ))
      ],
    ),
    buttons: [
      DialogButton(
        child: Text(Translations.get(context, LocaleKey.close)),
        onPressed: () => Navigator.of(context).pop(false),
      ),
      DialogButton(
        child: Text(Translations.get(context, LocaleKey.apply)),
        onPressed: () => Navigator.of(context).pop(true),
      ),
    ],
  ).show(); // This is ugly, I know. Don't touch though, here be Dragons
  return alertResult ? output : null;
}
