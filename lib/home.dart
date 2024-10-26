import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Product_detail.dart';
import 'cart.dart';

class MainDrawer extends StatefulWidget {
  final ZoomDrawerController drawerController;

  const MainDrawer({Key? key, required this.drawerController}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int _selectedIndex = 2;
  int _selectedSampleIndex = 0; // Declare the variable to track the selected sample index
  final List<String> sampleTitles = [
    "Sample 1",
    "Sample 2",
    "Sample 3",
    "Sample 4"
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0C2740),
                Color(0xff264350),
                Color(0xff465055),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              // Top icons and store location
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        widget.drawerController.toggle!(); // Use the ZoomDrawerController to toggle the drawer
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Store Location",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on, color: Colors.red),
                              SizedBox(width: 5),
                              Text(
                                "Chennai, Tamil Nadu",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyCartPage()),
                        );
                        // Navigate to ProductDetailsScreen
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintText: "Looking for shoes...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Sample selection buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(sampleTitles.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            // Navigate to ProductDetailsScreen when Sample 1 is clicked
                            String productName = "Sample 1"; // Product Name
                            String productDescription = "A stylish shoe for your collection"; // Product Description
                            double productPrice = 49.99; // Product Price
                            String productImageUrl = "assets/images/shoes-removebg-preview.png"; // Product Image URL
                            List<String> galleryImages = [
                              "assets/images/shoes-removebg-preview.png",
                              "assets/images/shoes-removebg-preview.png",
                              "assets/images/shoe.png"
                            ]; // Gallery Images

                            // Navigate to ProductDetailsScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  productName: productName,
                                  productDescription: productDescription,
                                  productPrice: productPrice,
                                  productImageUrl: productImageUrl,
                                  galleryImages: galleryImages,
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              _selectedSampleIndex = index; // Change selected sample for other samples
                            });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            sampleTitles[index],
                            style: TextStyle(
                              color: _selectedSampleIndex == index ? Colors.blue : Colors.grey,
                              fontWeight: _selectedSampleIndex == index ? FontWeight.bold : FontWeight.normal,
                              fontSize: screenWidth < 600 ? 14 : 18, // Responsive font size
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Popular Shoes and See All Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Shoes",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to see all screen
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Sample Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _buildSampleCard(0, "Sample 1", "assets/images/soe-removebg-preview.png", "Best Seller", 49.99),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: _buildSampleCard(1, "Sample 2", "assets/images/soe-removebg-preview.png", "Best Seller", 59.99),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildSampleCard(2, "Sample 3", "assets/images/soe-removebg-preview.png", "New Arrival", 69.99, fillEntireColumn: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0C2740),
              Color(0xff264350),
              Color(0xff465055),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          items: <Widget>[
            _buildGradientIcon(Icons.home),
            _buildGradientIcon(Icons.favorite),
            _buildGradientIcon(Icons.shopping_cart),
            _buildGradientIcon(Icons.notifications),
            _buildGradientIcon(Icons.person),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          index: _selectedIndex,
        ),
      ),
    );
  }

  Widget _buildGradientIcon(IconData icon) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0C2740),
            Color(0xff264350),
            Color(0xff465055),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildSampleCard(int index, String title, String imageUrl, String tag, double price, {bool fillEntireColumn = false}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imageUrl,
                  fit: fillEntireColumn ? BoxFit.fill : BoxFit.cover,
                  height: fillEntireColumn ? 250 : 150,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(tag, style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 5),
                    Text("\$$price", style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTapDown: (details) {
                // Handle tap down animation (optional)
                setState(() {
                  // You can manage any animations here
                });
              },
              onTapUp: (details) {
                // Handle increment action and release animation
                print('$title added to cart');
                // You can manage animations back here if needed
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), // Match the card's top left corner
                    bottomLeft: Radius.circular(15), // Attach to the card
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    if (index == 0) {
                      // Navigate to ProductDetailsScreen when Sample 1 is clicked
                      String productName = "Sample 1"; // Product Name
                      String productDescription = "A stylish shoe for your collection"; // Product Description
                      double productPrice = 49.99; // Product Price
                      String productImageUrl = "assets/images/soe-removebg-preview.png"; // Product Image URL
                      List<String> galleryImages = [
                        "assets/images/shoes.png",
                        "assets/images/shoes.png",
                        "assets/images/shoe.png"
                      ]; // Gallery Images

                      // Navigate to ProductDetailsScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            productName: productName,
                            productDescription: productDescription,
                            productPrice: productPrice,
                            productImageUrl: productImageUrl,
                            galleryImages: galleryImages,
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        _selectedSampleIndex = index; // Change selected sample for other samples
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
