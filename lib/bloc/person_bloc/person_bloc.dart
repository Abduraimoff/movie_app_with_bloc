import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/person.dart';
import 'package:movie_app/data/services/person_service.dart';
import 'package:movie_app/utils/dio_exceptions.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonLoadEvent, PersonState> {
  final _personService = PersonService();

  PersonBloc() : super(PersonState(isLoading: true)) {
    on<PersonLoadEvent>((event, emit) async {
      try {
        final result = await _personService.loadPerson(event.id);
        emit(PersonState(person: result));
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        emit(PersonState(error: errorMessage));
      }
    });
  }
}
