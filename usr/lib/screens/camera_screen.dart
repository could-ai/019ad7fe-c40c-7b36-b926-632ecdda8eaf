import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:couldai_user_app/screens/gallery_screen.dart';
import 'package:couldai_user_app/screens/settings_screen.dart';
import 'package:couldai_user_app/widgets/camera_viewfinder.dart';
import 'package:couldai_user_app/widgets/control_bar.dart';
import 'package:couldai_user_app/widgets/mode_selector.dart';
import 'package:couldai_user_app/widgets/top_settings_bar.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // State for UI controls
  int _selectedModeIndex = 2; // Default to 'Camera'
  bool _isFlashOn = false;
  bool _isHdrOn = true;
  double _zoomLevel = 1.0;

  final List<String> _modes = [
    'Night Sight',
    'Portrait',
    'Camera',
    'Video',
    'More'
  ];

  void _onModeChanged(int index) {
    setState(() {
      _selectedModeIndex = index;
    });
    HapticFeedback.selectionClick();
  }

  void _onShutterPressed() {
    HapticFeedback.heavyImpact();
    // Simulate capture animation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Capturing ${_modes[_selectedModeIndex]}...'),
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black87,
      ),
    );
  }

  void _navigateToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  void _navigateToGallery() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GalleryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top Settings Bar
            TopSettingsBar(
              isFlashOn: _isFlashOn,
              isHdrOn: _isHdrOn,
              onFlashToggle: () => setState(() => _isFlashOn = !_isFlashOn),
              onHdrToggle: () => setState(() => _isHdrOn = !_isHdrOn),
              onSettingsPressed: _navigateToSettings,
            ),
            
            // Main Camera Area (Viewfinder + Overlays)
            Expanded(
              child: Stack(
                children: [
                  // The Camera Preview (Mock)
                  const CameraViewfinder(),
                  
                  // Zoom Indicator / Leveler (Mock overlay)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // Cycle zoom levels on tap
                          setState(() {
                            if (_zoomLevel == 1.0) _zoomLevel = 2.0;
                            else if (_zoomLevel == 2.0) _zoomLevel = 5.0;
                            else _zoomLevel = 1.0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.zoom_in, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '${_zoomLevel.toStringAsFixed(1)}x',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Bottom Control Area
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                // Mode Selector
                ModeSelector(
                  modes: _modes,
                  selectedIndex: _selectedModeIndex,
                  onModeSelected: _onModeChanged,
                ),
                const SizedBox(height: 20),
                // Shutter and Main Controls
                ControlBar(
                  onShutterPressed: _onShutterPressed,
                  onSwitchCamera: () {},
                  onGalleryPressed: _navigateToGallery,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
