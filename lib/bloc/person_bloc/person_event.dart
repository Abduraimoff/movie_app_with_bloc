part of 'person_bloc.dart';

class PersonLoadEvent extends Equatable {
  final int id;
  const PersonLoadEvent(this.id);

  @override
  List<Object> get props => [id];
}
