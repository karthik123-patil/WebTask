import 'package:flutter/material.dart';

class BottomRideBar extends StatefulWidget {
  const BottomRideBar({super.key});

  @override
  State<BottomRideBar> createState() => _BottomRideBarState();
}

class _BottomRideBarState extends State<BottomRideBar> {
  // Track currently selected tab index (Default is 0, matching the first tab)
  int _selectedIndex = 0;

  final List<String> _tabImages = [
    'assets/images/bot1.png',
    'assets/images/bot2.png',
    'assets/images/bot3.png',
    'assets/images/bot4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 14,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: List.generate(_tabImages.length, (index) {
          final isSelected = _selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  _selectedIndex = index; // Update selected index on tap
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  // Apply gradient only if this tab is selected
                  gradient: isSelected
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFFFFEDD1),
                            // Figma color 1
                            const Color(0xFFEAEAEA).withValues(alpha: 0.0),
                            // Figma color 2 with 0% opacity
                          ],
                        )
                      : null,
                  border: isSelected
                      ? const Border(
                          right: BorderSide(color: Color(0xFFD4D8DE)),
                          left: BorderSide(color: Color(0xFFD4D8DE)),
                        )
                      : null,
                ),
                child: Center(
                  child: Image.asset(_tabImages[index], fit: BoxFit.contain),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
