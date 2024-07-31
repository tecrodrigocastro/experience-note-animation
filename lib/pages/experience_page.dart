import 'dart:developer';

import 'package:flutter/material.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  final List<Color> _colors = <Color>[
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.greenAccent,
  ];
  final List<String> _labels = <String>[
    'Bad',
    'Not Bad',
    'Good',
  ];
  int _index = 0;
  double _indexSlider = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _colors[_index],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filled(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.25),
                    ),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.25),
                    ),
                    icon: const Icon(
                      Icons.info_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'How was yout shopping\n exeperience?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: size.width,
                height: size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: size.width * 0.2,
                          height: _index == 1
                              ? size.height * 0.04
                              : size.height * 0.1,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Transform.rotate(
                          angle: _indexSlider < 1 ? _indexSlider + 1 : 0,
                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            width: size.width * 0.2,
                            height: _indexSlider == 1
                                ? size.height * 0.04
                                : size.height * 0.1,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),

                            /*    transform: _indexSlider < 1
                              ? Transform.rotate(
                                  angle: _indexSlider + 1,
                                ).transform
                              : null, */
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
/*                     AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: size.width * 0.18,
                      height: size.height * 0.02,
                      child: CustomPaint(
                        painter: HappyFacePainter(),
                      ),
                    ), */
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: size.width * 0.18,
                      height: size.height * 0.02,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      //transform: Matrix4.translation(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: size.height * 0.2,
                width: size.width,
                //color: Colors.black.withOpacity(0.1),
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: _labels.map((label) {
                    final index = _labels.indexOf(label);
                    return Center(
                      child: AnimatedOpacity(
                        opacity: _indexSlider == index ? 1 : 0.3,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          label.toUpperCase(),
                          style: TextStyle(
                            fontSize: 50,
                            color: _index == index
                                ? Colors.black
                                : Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.bold,
                            letterSpacing: -5,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              /*    Text(
                _labels[_index].toUpperCase(),
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  letterSpacing: -5,
                ),
              ), */
              const SizedBox(height: 30),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 10,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 15,
                  ),
                  // overlayColor: Colors.amber,
                  activeTrackColor: Colors.white.withOpacity(0.3),
                  inactiveTrackColor: Colors.white.withOpacity(0.3),
                  thumbColor: _colors[_index],
                ),
                /* SliderThemeData(
                  trackHeight: 10,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 15,
                  ),
                  // overlayColor: Colors.amber,
                  activeTrackColor: Colors.white.withOpacity(0.3),
                  inactiveTrackColor: Colors.white.withOpacity(0.3),
                  thumbColor: _colors[_index],
                ), */
                child: Slider(
                  value: _indexSlider,
                  //divisions: 100,
                  max: 300,
                  min: 100,
                  onChanged: (value) {
                    log(value.toString());
                    setState(() {
                      _indexSlider = value;
                      _index = ((value / 100) - 1).floor();
                      /*  _pageController.animateToPage(
                        _index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ); */
                      _pageController.jumpTo(value);
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _labels.map((label) {
                  final index = _labels.indexOf(label);
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        _index = index;
                      });
                    },
                    child: Text(
                      label,
                      style: TextStyle(
                        color: _index == index
                            ? Colors.black
                            : Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
              /*         CustomPaint(
                size: const Size(200, 200),
                painter: SmileyPainter(),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}

class HappyFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Desenha a boca
    var path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.8,
        size.width * 0.8, size.height * 0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Desenhar os olhos
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.35),
        size.width * 0.15, paint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.35),
        size.width * 0.15, paint);

    // Desenhar a boca
    final Path path = Path();
    path.moveTo(size.width * 0.4, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.75,
        size.width * 0.6, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.65,
        size.width * 0.4, size.height * 0.6);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
