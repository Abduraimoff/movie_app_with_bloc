import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/person_bloc/person_bloc.dart';
import 'package:movie_app/utils/export_pack.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final person = context.watch<PersonBloc>().state.person;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Text(person?.name ?? ''),
    );
  }
}
