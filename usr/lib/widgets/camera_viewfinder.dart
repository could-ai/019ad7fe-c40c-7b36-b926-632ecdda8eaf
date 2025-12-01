import 'package:flutter/material.dart';

class CameraViewfinder extends StatelessWidget {
  const CameraViewfinder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Placeholder for actual camera feed
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 64,
                  color: Colors.white.withOpacity(0.2),
                ),
                const SizedBox(height: 16),
                Text(
                  'Camera Preview',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.2),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          
          // Grid Lines (Rule of Thirds)
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                    Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white10, width: 0.5)))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
