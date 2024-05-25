import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectRepository, ShoppingItemModel>(
  (ref) {
    return SelectRepository();
  },
);

class SelectRepository extends StateNotifier<ShoppingItemModel> {
  SelectRepository()
      : super(
          ShoppingItemModel(
            name: '김치 불고기 페페로니 피자',
            qty: 10,
            hasBought: false,
            isSpicy: true,
          ),
        );

  void toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

  void toggleIsSpicy() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
