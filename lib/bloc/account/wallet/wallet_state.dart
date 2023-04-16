part of 'wallet_bloc.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}

class GetWalleError extends WalletState {
  final String errorMessage;
  GetWalleError({
    required this.errorMessage,
  });
}

class GetWalleWaiting extends WalletState {}

class GetWalletSuccess  extends WalletState {
  Wallet wallet;
  GetWalletSuccess({required this.wallet});
}
