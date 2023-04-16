import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/bloc/account/wallet/wallet_bloc.dart';
import 'package:m7card/model/wallet.dart';
import 'package:meta/meta.dart';

import '../../../network/api_provider.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitial()) {
    on<WalletEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

getWallet(getWalletDate event, Emitter<WalletState> emit) async {
  ApiProvider apiProvider = ApiProvider();

  emit(GetWalleWaiting());

  try {
    Wallet wallet = await apiProvider.getWallet();
    emit(GetWalletSuccess(wallet: wallet));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetWalleError(errorMessage: ex.toString()));
    }
  }
}

