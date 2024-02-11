import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepo)
      : super(const CryptoCoinDetailsState()) {
    on<LoadCryptoCoinDetails>(_load);
  }

  final AbstractCoinsRepo coinsRepo;

  Future<void> _load(
      LoadCryptoCoinDetails event,
      Emitter<CryptoCoinDetailsState> emit,
  ) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(const CryptoCoinDetailsLoading());
      }
      final coinsDetail = await coinsRepo.getCoinDetail(event.currencyCode);
      emit(CryptoCoinDetailsLoaded(coinsDetail));
    } catch (e, st) {
      emit(CryptoCoinDetailsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }

}