// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/services.dart';
import 'package:movie_app/ui/screen_factory/screen_factory.dart';
import 'package:movie_app/utils/export_pack.dart';
import 'package:rive/rive.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  List<SMIInput<bool>?> inputs = [];
  List<Artboard> artboards = [];

  final List<Widget> _screens = [
    ScreenFactory.makeHomePage(),
    ScreenFactory.makeLoginPage(),
    ScreenFactory.makeIntroPage(),
    const Center(child: Text('analysis')),
    const Center(child: Text('analysis')),
  ];

  int _selectedIndex = 0;

  final List<String> _assetPaths = [
    'assets/rive/home.riv',
    'assets/rive/user.riv',
    'assets/rive/chat.riv',
    'assets/rive/star.riv',
    'assets/rive/bell.riv',
  ];

  Future<dynamic> _initArtboard() async {
    for (var path in _assetPaths) {
      final data = await rootBundle.load(path);

      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;

      SMIInput<bool>? input;

      final controller =
          StateMachineController.fromArtboard(artboard, 'State Machine 1');

      if (controller != null) {
        artboard.addController(controller);
        input = controller.findInput('active');
        input?.value = true;
      }
      inputs.add(input);
      artboards.add(artboard);
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _initArtboard();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.noenSecondaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: artboards.map<Widget>(
            (artboard) {
              final index = artboards.indexOf(artboard);
              return BottomAppBarItem(
                artboard: artboard,
                currentIndex: _selectedIndex,
                tabIndex: index,
                input: inputs[index],
                onPress: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  final Artboard? artboard;
  final VoidCallback onPress;
  final int currentIndex;
  final int tabIndex;
  final SMIInput<bool>? input;

  const BottomAppBarItem({
    super.key,
    required this.artboard,
    required this.onPress,
    required this.currentIndex,
    required this.tabIndex,
    this.input,
  });

  @override
  Widget build(BuildContext context) {
    if (input != null) {
      input!.value = currentIndex == tabIndex;
    }

    return SizedBox(
      width: 40.w,
      height: 40.h,
      child: GestureDetector(
        onTap: onPress,
        child: artboard == null
            ? const SizedBox()
            : Rive(
                artboard: artboard!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
