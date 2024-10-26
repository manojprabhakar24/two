import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two/signin.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
    _controller?.forward();

    Future.delayed(Duration(seconds: 3), () {
      // Keep it here if you want auto navigation or remove for manual control
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
  void navigateToScreen(int index) {
    if (index == 1) {
      // Navigate to AnotherSplashScreen
      Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AnotherSplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Start from the right
          const end = Offset.zero; // End at the current position
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ));
    }
  }

  void navigateToNextScreen() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AnotherSplashScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from the right
        const end = Offset.zero; // End at the current position
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background pattern with reduced opacity
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), // Replace with your background pattern image
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), // Adjust the opacity here
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),

          // FadeTransition for your logo and text
          Center(
            child: FadeTransition(
              opacity: _animation!,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Move the image higher using Padding
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Image.asset(
                      'assets/images/soe-removebg-preview.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Text "Start Journey" and "With Shoes"
                  Text(
                    "Start Journey",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "With Shoes",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Tagline text
                  Text(
                    "Smart, Gorgeous & Fashionable Collection",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // "Get Started" Button at the bottom-right corner
          Positioned(
            bottom: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: () {
                navigateToNextScreen(); // Navigate to the next screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent[100],
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: DotIndicator(
              currentIndex: 0,
              totalDots: 2,
              onDotTap: navigateToScreen, // Pass the navigate function
            ),
          ),

        ],
      ),
    );
  }
}

// The second splash screen with the same design




class AnotherSplashScreen extends StatefulWidget {
  @override
  _AnotherSplashScreenState createState() => _AnotherSplashScreenState();
}

class _AnotherSplashScreenState extends State<AnotherSplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
    _controller?.forward();

    Future.delayed(Duration(seconds: 3), () {
      // Navigate further if required
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
  void navigateToScreen(int index) {
    if (index == 0) {
      // Navigate back to SplashScreen
      Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0); // Start from the left
          const end = Offset.zero; // End at the current position
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ));
    }
  }

  void navigateToHomeScreen() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Start from the bottom
        const end = Offset.zero; // End at the current position
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background pattern with reduced opacity
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), // Same background image
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), // Adjust the opacity here
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),

          // FadeTransition for your logo and text
          Center(
            child: FadeTransition(
              opacity: _animation!,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Move the image higher using Padding
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Image.asset(
                      'assets/images/soe-removebg-preview.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Text "Follow Latest" and "Style Shoes"
                  Text(
                    "Follow Latest",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Style Shoes",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Tagline text split into two lines
                  Text(
                    "There Are Many Beautiful And",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    "Attractive Plants To Your Room",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // "Next" Button at the bottom-right corner
          Positioned(
            bottom: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: () {
                navigateToHomeScreen();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent[100],
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          // Dot Indicator at the bottom left
          Positioned(
            bottom: 30,
            left: 30,
            child: DotIndicator(
              currentIndex: 1,
              totalDots: 2,
              onDotTap: navigateToScreen, // Pass the navigate function
            ),
          ),

        ],
      ),
    );
  }
}


class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalDots;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double activeDotSize;
  final Function(int) onDotTap; // Add this line

  DotIndicator({
    required this.currentIndex,
    required this.totalDots,
    required this.onDotTap, // Update constructor
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.dotSize = 8.0,
    this.activeDotSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(totalDots, (index) {
        return GestureDetector(
          onTap: () => onDotTap(index), // Call the callback on tap
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300), // Animation duration
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: index == currentIndex ? activeDotSize : dotSize,
            height: index == currentIndex ? activeDotSize : dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex ? activeColor : inactiveColor,
            ),
          ),
        );
      }),
    );
  }
}
