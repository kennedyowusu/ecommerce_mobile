class Product {
  int id;
  int productId;
  int userId;
  int quantity;
  double totalPrice;

  Product({
    required this.id,
    required this.productId,
    required this.userId,
    required this.quantity,
    required this.totalPrice,
  });
}

final List<Product> productList = [
  Product(
    id: 1,
    productId: 1,
    userId: 1,
    quantity: 2,
    totalPrice: 20.00,
  )
];
