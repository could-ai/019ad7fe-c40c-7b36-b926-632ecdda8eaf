import 'package:flutter/material.dart';

class ModeSelector extends StatelessWidget {
  final List<String> modes;
  final int selectedIndex;
  final Function(int) onModeSelected;

  const ModeSelector({
    super.key,
    required this.modes,
    required this.selectedIndex,
    required this.onModeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: modes.length,
        padding: const EdgeInsets.symmetric(horizontal: 150), // Center the initial item
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onModeSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Text(
                modes[index],
                style: TextStyle(
                  color: isSelected ? Colors.yellowAccent : Colors.white70,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                  shadows: isSelected
                      ? [
                          const Shadow(
                            color: Colors.black,
                            blurRadius: 4,
                          )
                        ]
                      : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
