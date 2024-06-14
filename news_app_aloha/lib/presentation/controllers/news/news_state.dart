part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

/// Get All News States
class LoadingAllNewsState extends NewsState {}

class FailGetAllNewsState extends NewsState {
  final String failMessage;

  FailGetAllNewsState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessGetAllNewsState extends NewsState {}

/// Filter All News States
class LoadFilteringAllNewsState extends NewsState {}

class FailFilterAllNewsState extends NewsState {
  final String failMessage;

  FailFilterAllNewsState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessFilterAllNewsState extends NewsState {}
