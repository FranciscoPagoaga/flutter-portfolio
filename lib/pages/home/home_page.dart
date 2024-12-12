import 'package:flutter/material.dart';
import 'package:flutter_portfolio/pages/home/widgets/personal_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              collapsedHeight: 80,
              toolbarHeight: 80,
              expandedHeight: 300,
              backgroundColor: Colors.white,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  final double appBarHeight = constraints.maxHeight;
                  final bool isCollapsed = appBarHeight <= kToolbarHeight-20;
                  return FlexibleSpaceBar(
                    title: isCollapsed
                        ? const Text(
                            'Francisco Pagoaga',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          )
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PersonalInfo(
                                name: 'Francisco Pagoaga',
                                role: 'Mobile Engineer',
                                location: 'Tegucigalpa',
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                    background: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipPath(
                          clipper: ParabolaClipper(),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(color: Color(0xFF00bbfa)),
                          ),
                        ),
                        Positioned(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              ClipOval(
                                child: Image.asset(
                                  fit: BoxFit.cover,
                                  'assets/me_2.jpg',
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Text('About Me'),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParabolaClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 50); // Start curve
    path.quadraticBezierTo(
      size.width / 2, size.height, // Control point
      size.width, size.height - 50, // End point
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
