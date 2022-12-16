// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/data/data_provider/session_data_provider.dart';
import 'package:movie_app/ui/screen_factory/screen_factory.dart';
import 'package:movie_app/ui/widgets/bottom_icons_list.dart';
import 'package:movie_app/utils/export_pack.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final List<Widget> _screens = [
    ScreenFactory.makeHomePage(),
    ScreenFactory.makeLoginPage(),
    ScreenFactory.makeIntroPage(),
    const Center(child: Text('analysis')),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                    setState(() {
                      if (index == 4) {
                        _selectedIndex = index - 1;
                      } else if (index == 3) {
                        _selectedIndex = index - 1;
                      } else {
                        _selectedIndex = index;
                      }
                    });
                  },
                  icon: Icon(
                    BottomIconsList.icons[index],
                    size: 30,
                    color: _selectedIndex == index ? Colors.white : Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
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
