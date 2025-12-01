import 'package:flutter/material.dart';

class TopSettingsBar extends StatelessWidget {
  final bool isFlashOn;
  final bool isHdrOn;
  final VoidCallback onFlashToggle;
  final VoidCallback onHdrToggle;
  final VoidCallback onSettingsPressed;

  const TopSettingsBar({
    super.key,
    required this.isFlashOn,
    required this.isHdrOn,
    required this.onFlashToggle,
    required this.onHdrToggle,
    required this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: onSettingsPressed,
          ),
          IconButton(
            icon: Icon(
              isHdrOn ? Icons.hdr_on : Icons.hdr_off,
              color: isHdrOn ? Colors.yellowAccent : Colors.white,
            ),
            onPressed: onHdrToggle,
          ),
          IconButton(
            icon: const Icon(Icons.timer_off_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.aspect_ratio, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              isFlashOn ? Icons.flash_on : Icons.flash_off,
              color: isFlashOn ? Colors.yellowAccent : Colors.white,
            ),
            onPressed: onFlashToggle,
          ),
        ],
      ),
    );
  }
}
