import 'package:flutter/material.dart';
import 'package:adhd_app/screens/home_screen.dart';
import 'package:adhd_app/screens/focus_screen.dart';
import 'package:adhd_app/screens/profile_screen.dart';
import 'package:adhd_app/theme/colors.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    FocusScreen(),
    ProfilePage(),
  ];

  final List<IconData> _navIcons = [
    Icons.home_rounded,
    Icons.lightbulb,
    Icons.person_rounded,
  ];

  final List<String> _navLabels = [
    "Home",
    "Focus",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEFE),
      body: Stack(
        children: [
          /// ✅ STATE-PRESERVING SCREEN SWITCH
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),

          /// FLOATING BOTTOM NAV
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) {
                  final isActive = _currentIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() => _currentIndex = index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 320),
                      curve: Curves.easeOutCubic,
                      height: 48,
                      padding: EdgeInsets.symmetric(
                        horizontal: isActive ? 18 : 12,
                      ),
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primary.withOpacity(0.18)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _navIcons[index],
                            size: 24,
                            color: isActive
                                ? AppColors.primary
                                : const Color(0xFFBFBFBC),
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeOut,
                            child: isActive
                                ? Padding(
                              padding:
                              const EdgeInsets.only(left: 8),
                              child: Text(
                                _navLabels[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
