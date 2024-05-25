import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/model/shopping_item_model.dart';

final shoppingProvider =
    StateNotifierProvider<StateNotifierRepository, List<ShoppingItemModel>>(
  (ref) => StateNotifierRepository(),
);

class StateNotifierRepository extends StateNotifier<List<ShoppingItemModel>> {
  StateNotifierRepository()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              qty: 30,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '김밥',
              qty: 15,
              hasBought: true,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '라면',
              qty: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '사탕',
              qty: 35,
              hasBought: true,
              isSpicy: false,
            ),
          ],
        );

  void boughtToggle(String name) {
    state = state
        .map(
          (e) => e.name == name
              ? ShoppingItemModel(
                  name: e.name,
                  qty: e.qty,
                  hasBought: !e.hasBought,
                  isSpicy: e.isSpicy,
                )
              : e,
        )
        .toList();
  }
}
