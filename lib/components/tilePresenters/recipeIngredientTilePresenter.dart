import 'package:flutter/material.dart';
import 'package:scrapmechanic_kurtlourens_com/contracts/gameItem/gameItem.dart';
import 'package:scrapmechanic_kurtlourens_com/pages/gameItem/gameItemDetailPage.dart';

import '../../constants/AppPadding.dart';
import '../../contracts/recipeIngredient/recipeIngredient.dart';
import '../../contracts/recipeIngredient/recipeIngredientDetail.dart';
import '../../contracts/results/resultWithValue.dart';
import '../../helpers/futureHelper.dart';
import '../../helpers/navigationHelper.dart';
import '../../helpers/snapshotHelper.dart';
import '../../pages/recipe/recipeDetailPage.dart';
import 'genericTilePresenter.dart';

Widget recipeIngredientTilePresenter(
    BuildContext context, RecipeIngredient recipeIngredient, int index) {
  return FutureBuilder<ResultWithValue<RecipeIngredientDetails>>(
    future: getRecipeIngredientDetailsFuture(context, recipeIngredient),
    builder: (BuildContext context,
        AsyncSnapshot<ResultWithValue<RecipeIngredientDetails>> snapshot) {
      Widget errorWidget = asyncSnapshotHandler(context, snapshot);
      if (errorWidget != null) return errorWidget;
      return recipeIngredientDetailTilePresenter(
          context, snapshot.data.value, index);
    },
  );
}

Widget recipeIngredientDetailTilePresenter(
    BuildContext context, RecipeIngredientDetails recipeIngredient, int index) {
  var tile = genericListTile(
    context,
    leadingImage: recipeIngredient.icon,
    name: recipeIngredient.title,
    onTap: () async => await navigateAwayFromHomeAsync(context,
        navigateTo: (context) => GameItemDetailPage(recipeIngredient.id)),
  );

  if (index != 0) return tile;

  return Padding(
    padding: AppPadding.listTopPadding,
    child: tile,
  );
}