// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:chalee/model/json/ProductModel.dart';

class CartModel extends ChangeNotifier {
/*  /// The private field backing [catalog].
  
  List<ProductModel> _catalog;

  /// The current catalog. Used to construct items from numeric ids.
  List<ProductModel> get catalog => _catalog;

  set catalog(List<ProductModel> newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// The current total price of all items.
  double get totalPrice =>
      _catalog.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(ProductModel item) {
    _catalog.add(item);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }*/

  /// Internal, private state of the cart.
  final List<ProductModel> _items = [];

  /// An unmodifiable view of the items in the cart.
 // UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  List<ProductModel> get products => _items;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(ProductModel item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}