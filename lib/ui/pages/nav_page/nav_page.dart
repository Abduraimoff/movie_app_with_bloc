// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:movie_app/data/data_provider/session_data_provider.dart';
import 'package:movie_app/ui/widgets/bottom_icons_list.dart';
import 'package:movie_app/utils/export_pack.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final _selectedIndex = context.watch<NavigationCubit>().index;
        final _screens = context.read<NavigationCubit>().screens;
        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const CustomFloatingActionButton(),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            color: Colors.white.withOpacity(0.12),
            child: SizedBox(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  BottomIconsList.icons.length,
                  (index) {
                    if (index == 2) {
                      return SizedBox(width: 30.w);
                    }
                    return IconButton(
                      onPressed: () {
                        print("Index: $index");
                        context.read<NavigationCubit>().setIndex(index);
                      },
                      icon: Icon(
                        BottomIconsList.icons[index],
                        size: 30,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

_iconPressed(int length, int index, BuildContext context) {
  if (index > length) {
    int _index = index - 1;
    context.read<NavigationCubit>().setIndex(_index);
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionData = SessionDataProvider();

    return GestureDetector(
      onTap: () {
        sessionData.deleteSessionId();
      },
      child: Container(
        width: 60.w,
        height: 60.h,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.pinkColor,
              AppColors.noenPrimaryColor,
            ],
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            backgroundBlendMode: BlendMode.hardLight,
            color: AppColors.bgColor.withOpacity(1),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
