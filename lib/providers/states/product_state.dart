import 'package:ecommerce_ui/models/product_model.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  const ProductInitial();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  const ProductLoading();

  @override
  List<Object> get props => [];
}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  const ProductSuccess({required this.products});

  @override
  List<Object> get props => [];
}

class ProductFailure extends ProductState {
  const ProductFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
