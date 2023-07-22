import 'package:ecommerce_ui/models/favorite_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteStateNotifier extends StateNotifier<List<FavoriteModel>> {
  FavoriteStateNotifier() : super([]);

  void addProductToFavorite(FavoriteModel favoriteModel) {
    state = [...state, favoriteModel];
  }

  void removeProductFromFavorite(FavoriteModel favoriteModel) {
    state = state.where((element) => element.id != favoriteModel.id).toList();
  }

  void clearFavorite() {
    state = [];
  }
}

final StateNotifierProvider<FavoriteStateNotifier, List<FavoriteModel>>
    favoriteStateNotifierProvider =
    StateNotifierProvider<FavoriteStateNotifier, List<FavoriteModel>>(
  (ref) => FavoriteStateNotifier(),
);
