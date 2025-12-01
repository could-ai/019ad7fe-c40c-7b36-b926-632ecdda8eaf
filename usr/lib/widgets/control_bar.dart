import 'package:flutter/material.dart';

class ControlBar extends StatelessWidget {
  final VoidCallback onShutterPressed;
  final VoidCallback onSwitchCamera;
  final VoidCallback onGalleryPressed;

  const ControlBar({
    super.key,
    required this.onShutterPressed,
    required this.onSwitchCamera,
    required this.onGalleryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Gallery Preview
          GestureDetector(
            onTap: onGalleryPressed,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/100'), // Placeholder
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Shutter Button
          GestureDetector(
            onTap: onShutterPressed,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                color: Colors.transparent,
              ),
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          // Switch Camera
          IconButton(
            onPressed: onSwitchCamera,
            icon: const Icon(
              Icons.cameraswitch_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
