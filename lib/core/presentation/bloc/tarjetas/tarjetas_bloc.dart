import 'package:bankingapp/core/presentation/bloc/tarjetas/tarjetas_event.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas/tarjetas_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_tarjetas_data.dart' as usecase;

class TarjetasBloc extends Bloc<TarjetasEvent, TarjetasState> {
  final usecase.LoadTarjetaData loadTarjetasData;

  TarjetasBloc(this.loadTarjetasData) : super(const TarjetasState()) {
    on<LoadTarjetasDataEvent>((event, emit) async {
      try {
        final tarjetasData = await loadTarjetasData();
        emit(TarjetasState.fromModel(tarjetasData));
      } catch (error) {
        emit(state.copyWith(
          errorMessage: error.toString(),
          isValid: false,
        ));
      }
    });
  }
}
