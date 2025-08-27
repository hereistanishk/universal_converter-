import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Data model for a converter module
class ConverterModule {
  final String title;
  final String iconAsset;
  final VoidCallback onTap;

  ConverterModule({
    required this.title,
    required this.iconAsset,
    required this.onTap,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List to hold the configuration for our 7 converter modules.
  late final List<ConverterModule> _modules;

  @override
  void initState() {
    super.initState();
    // Initialize the modules. In a real app, the onTap would navigate to a
    // specific screen for that conversion type. For now, it prints to console.
    _modules = [
      ConverterModule(
        title: 'Video → Audio',
        iconAsset: 'assets/icons/video_to_audio.svg',
        onTap: () => _onModuleTapped('Video to Audio'),
      ),
      ConverterModule(
        title: 'Video → Video',
        iconAsset: 'assets/icons/video_to_video.svg',
        onTap: () => _onModuleTapped('Video to Video'),
      ),
      ConverterModule(
        title: 'Audio → Audio',
        iconAsset: 'assets/icons/audio_to_audio.svg',
        onTap: () => _onModuleTapped('Audio to Audio'),
      ),
      ConverterModule(
        title: 'Image → Image',
        iconAsset: 'assets/icons/image_to_image.svg',
        onTap: () => _onModuleTapped('Image to Image'),
      ),
      ConverterModule(
        title: 'Image → PDF',
        iconAsset: 'assets/icons/image_to_pdf.svg',
        onTap: () => _onModuleTapped('Image to PDF'),
      ),
      ConverterModule(
        title: 'Archive (File → File)',
        iconAsset: 'assets/icons/archive.svg',
        onTap: () => _onModuleTapped('Archive'),
      ),
      ConverterModule(
        title: 'Text → PDF',
        iconAsset: 'assets/icons/text_to_pdf.svg',
        onTap: () => _onModuleTapped('Text to PDF'),
      ),
    ];
  }

  void _onModuleTapped(String moduleName) {
    // Placeholder function for navigation.
    // In the next phases, this will navigate to the respective converter screen.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$moduleName module tapped!')),
    );
    print('$moduleName tapped');
    // Example navigation:
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ImageToPdfScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universal Converter'),
        // This makes the app bar background blend with the scrollable content, a common M3 pattern.
        surfaceTintColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              // The grid will have 2 columns.
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.0, // Makes the cards square
              ),
              itemCount: _modules.length,
              itemBuilder: (context, index) {
                final module = _modules[index];
                return ModuleCard(
                  title: module.title,
                  iconAsset: module.iconAsset,
                  onTap: module.onTap,
                );
              },
            ),
          ),
          // Placeholder for the banner ad we will add in a later phase.
          _buildBannerAdPlaceholder(),
        ],
      ),
    );
  }

  Widget _buildBannerAdPlaceholder() {
    // This container simulates the space a banner ad would take.
    return Container(
      width: double.infinity,
      height: 50, // Standard banner ad height
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
      child: Center(
        child: Text(
          'Banner Ad Placeholder',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

// A reusable widget for our module cards on the home screen.
class ModuleCard extends StatelessWidget {
  final String title;
  final String iconAsset;
  final VoidCallback onTap;

  const ModuleCard({
    super.key,
    required this.title,
    required this.iconAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      // Using filled tonal card style from Material 3.
      elevation: 0,
      color: colorScheme.secondaryContainer,
      clipBehavior: Clip.antiAlias, // Ensures the InkWell ripple is clipped
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Using SvgPicture to render our vector icons.
              SvgPicture.asset(
                iconAsset,
                width: 48,
                height: 48,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSecondaryContainer,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
