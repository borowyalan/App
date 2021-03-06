import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../contracts/search/dropdownOption.dart';
import '../../helpers/colourHelper.dart';
import '../../helpers/dialogHelper.dart';
import '../../localization/localeKey.dart';
import '../../localization/translations.dart';
import '../tilePresenters/genericTilePresenter.dart';

void showOptionsDialog(context, String title, List<DropdownOption> options,
    {String selectedValue = '', Function(String value) onSuccess}) {
  List<DialogButton> buttons = List<DialogButton>();
  buttons.add(DialogButton(
    child: Text(
      Translations.get(context, LocaleKey.close),
      style: TextStyle(
        color: getIsDark(context) ? Colors.black : Colors.white,
      ),
    ),
    onPressed: () => Navigator.of(context).pop(),
  ));

  var tempOnChange = (String value) {
    if (onSuccess != null) onSuccess(value);
    Navigator.of(context).pop();
  };

  showSimpleDialog(
    context,
    title ?? Translations.get(context, LocaleKey.quantity),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: options
          .map((opt) => genericListTile(
                context,
                leadingImage: null,
                name: opt.title,
                onTap: () => tempOnChange(opt.value),
              ))
          .toList(),
    ),
    buttons: buttons,
  );
}
