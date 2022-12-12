import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/cast.dart';
import 'package:movie_app/data/services/casts_service.dart';
import 'package:movie_app/utils/dio_exceptions.dart';

part 'casts_event.dart';
part 'casts_state.dart';

class CastsBloc extends Bloc<CastsLoadEvent, CastsState> {
  final _castService = CastService();

  CastsBloc() : super(const CastsState()) {
    on<CastsLoadEvent>((event, emit) async {
      try {
        final result = await _castService.getCastList(event.id);
        emit(CastsState(casts: result));
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        emit(CastsState(errorMessage: errorMessage));
      }
    });
  }
}
