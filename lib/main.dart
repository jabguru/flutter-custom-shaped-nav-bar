import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              width: size.width,
              height: 80.0,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80.0),
                    painter: NavBarPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      onPressed: () => print('hi'),
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.shopping_bag),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(Icons.home),
                            onPressed: () => print('home')),
                        IconButton(
                            icon: Icon(Icons.restaurant_menu),
                            onPressed: () => print('menu')),
                        SizedBox(width: size.width * 0.20),
                        IconButton(
                            icon: Icon(Icons.bookmark),
                            onPressed: () => print('save')),
                        IconButton(
                            icon: Icon(Icons.notifications),
                            onPressed: () => print('notifications')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 20);
    path
      ..quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0)
      ..quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20)
      ..arcToPoint(
        Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0),
        clockwise: false,
      )
      ..quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0)
      ..quadraticBezierTo(size.width * 0.80, 0, size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
