import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/model/shopping_item_model.dart';
import 'package:riverpod_prac/repository/state_notifier_repo.dart';

enum FilteredStatus {
  spicy,
  notSpicy,
  all,
}

final providerInProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final shoppingListState = ref.watch(shoppingProvider);

    final filteredState = ref.watch(filteredProvider);

    if (filteredState == FilteredStatus.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where(
          (e) => filteredState == FilteredStatus.spicy ? e.isSpicy : !e.isSpicy,
        )
        .toList();
  },
);

final filteredProvider = StateProvider<FilteredStatus>(
  (ref) => FilteredStatus.all,
);
