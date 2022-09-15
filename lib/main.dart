import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyClipper(),
  ));
}

class MyClipper extends StatelessWidget {
  const MyClipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                width: width * 0.6,
                height: height * 0.2,
                color: Colors.white,
              ),
            ),
            ClipPath(
              clipper: MyBazierClipper(),
              child: Container(
                width: width * 0.6,
                height: height * 0.2,
                color: Colors.white,
              ),
            ),
            ClipPath(
              clipper: MyCubicClipper(),
              child: Container(
                width: width * 0.6,
                height: height * 0.2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: ClipPath(
                clipper: MyCustomArcToPoint(),
                child: Container(
                  width: width * 0.6,
                  height: height * 0.2,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomArcToPoint extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30;
    Path path = Path()
      ..moveTo(size.width * 0.2, 0)
      ..lineTo(size.width * 0.8, 0)
      ..arcToPoint(Offset(size.width, size.height * 0.2),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width, size.height * 0.8)
      ..arcToPoint(
          Offset(
            size.width * 0.8,
            size.height,
          ),
          radius: Radius.circular(radius),
          clockwise: true)
      ..lineTo(size.width * 0.2, size.height)
      ..arcToPoint(Offset(0, size.height * 0.8),
          radius: const Radius.circular(30.0), clockwise: false)
      ..lineTo(0, size.height * 0.2)
      ..arcToPoint(Offset(size.width * 0.2, 0),
          radius: Radius.circular(radius), clockwise: true)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyCubicClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height * 0.9)
      ..cubicTo(size.width * 0.2, size.height * 0.6, size.width * 0.7,
          size.height, size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyBazierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width * 0.5, 0)
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 2, size.height / 2, size.width, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height * 0.4)
      ..lineTo(0, size.height * 0.6)
      ..lineTo(size.width * 0.8, size.height * 0.6)
      ..lineTo(size.width * 0.8, size.height * 0.7)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width * 0.8, size.height * 0.3)
      ..lineTo(size.width * 0.8, size.height * 0.4)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
