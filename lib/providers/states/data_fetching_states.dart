import 'package:equatable/equatable.dart';

class DataFetchingState extends Equatable {
  const DataFetchingState();

  @override
  List<Object> get props => [];
}

class DataFetchingInitial extends DataFetchingState {
  const DataFetchingInitial();

  @override
  List<Object> get props => [];
}

class DataFetchingLoading extends DataFetchingState {
  const DataFetchingLoading();

  @override
  List<Object> get props => [];
}

class DataFetchingSuccess extends DataFetchingState {
  const DataFetchingSuccess();

  @override
  List<Object> get props => [];
}

class DataFetchingFailure extends DataFetchingState {
  const DataFetchingFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
