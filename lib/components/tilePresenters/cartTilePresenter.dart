import 'package:flutter/cupertino.dart';

import '../../contracts/recipeIngredient/recipeIngredientDetail.dart';
import '../../helpers/navigationHelper.dart';
import '../../helpers/popupMenuButtonHelper.dart';
import '../../pages/gameItem/gameItemDetailPage.dart';
import 'genericTilePresenter.dart';

Widget cartTilePresenter(BuildContext context,
        RecipeIngredientDetails recipeIngredient, int index,
        {Function onTap, Function onEdit, Function onDelete}) =>
    genericListTile(
      context,
      leadingImage: recipeIngredient.icon,
      name: recipeIngredient.title,
      quantity: recipeIngredient.quantity,
      onTap: onTap ??
          () async => await navigateAwayFromHomeAsync(
                context,
                navigateTo: (context) =>
                    GameItemDetailPage(recipeIngredient.id),
              ),
      trailing: popupMenu(context, onEdit: onEdit, onDelete: onDelete),
    );
