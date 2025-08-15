import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Deserunt velit veniam sint do irure commodo enim consequat.',
    imageUrl: 'assets/Images/1.png',
  ),
  SlideInfo(
    title: 'Entrega rápida',
    caption:
        'Tempor adipisicing aliqua cillum qui ullamco aliquip sunt proident sit eu incididunt quis.',
    imageUrl: 'assets/Images/2.png',
  ),
  SlideInfo(
    title: 'disfruta la comida',
    caption:
        'Proident tempor ad id est ea irure sunt proident exercitation est amet nulla culpa.',
    imageUrl: 'assets/Images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('App Tutorial')),
      body: _AppTutorialView(),
    );
  }
}

class _AppTutorialView extends StatefulWidget {
  const _AppTutorialView({super.key});

  @override
  State<_AppTutorialView> createState() => _AppTutorialViewState();
}

class _AppTutorialViewState extends State<_AppTutorialView> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageViewController,
          physics: BouncingScrollPhysics(),
          children:
              slides
                  .map(
                    (slideData) => _SlidesView(
                      slideData.title,
                      slideData.caption,
                      slideData.imageUrl,
                    ),
                  )
                  .toList(),
        ),
        Positioned(
          right: 20,
          top: 40,
          child: TextButton(
            onPressed: () => context.pop(),
            child: Text('Saltar'),
          ),
        ),
        endReached
            ? Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay:Duration(milliseconds: 50),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: Text('Empezar'),
                ),
              ),
            )
            : SizedBox(),
      ],
    );
  }
}

class _SlidesView extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _SlidesView(this.title, this.caption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final titleStyke = Theme.of(context).textTheme.titleLarge;
    final captionStyke = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            // Image.asset('assets/Images/1.png'),
            SizedBox(height: 20),
            Text(title, style: titleStyke),
            SizedBox(height: 10),
            Text(caption, style: captionStyke),
          ],
        ),
      ),
    );
  }
}
