part of 'tiket_bloc.dart';

@immutable
abstract class TiketState {}

class TiketInitial extends TiketState {}

class PostTiketError extends TiketState {
  final String errorMessage;
  PostTiketError({
    required this.errorMessage,
  });
}

class PostTiketWaiting extends TiketState {}

class PostTiketSuccess extends TiketState {}


