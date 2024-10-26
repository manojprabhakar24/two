import 'package:flutter/material.dart';

import 'cart.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImageUrl;
  final List<String> galleryImages;

  ProductDetailsScreen({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImageUrl,
    required this.galleryImages,
  });

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedImage = '';
  String selectedSize = '9';
  List<int> selectedQuantities = []; // List to store quantities for each variant

  @override
  void initState() {
    super.initState();
    selectedImage = widget.productImageUrl; // Set the default main image
    selectedQuantities = List.generate(4, (index) => 0); // Initialize quantities to zero for 4 variants
  }

  void _updateSelectedImage(String imageUrl) {
    setState(() {
      selectedImage = imageUrl; // Update the main image to the selected gallery image
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      selectedQuantities[index]++; // Increment quantity for the specific variant
    });
  }

  void _decrementQuantity(int index) {
    if (selectedQuantities[index] > 0) { // Change to allow decrementing only if greater than 0
      setState(() {
        selectedQuantities[index]--; // Decrement quantity, ensuring it's not negative
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Men's Shoes",
            style: TextStyle(color: Colors.white), // Set the title text color to white
          ),
        ),
        backgroundColor: Color(0xFF0C2740), // Custom background color
        iconTheme: IconThemeData(color: Colors.white), // Set all icons (including back icon) to white
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart), // No need to set color again; it inherits from iconTheme
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCartPage()),
              );
              // Handle add to cart action
            },
          ),
        ],
      ),

      body: Stack(
        children: [
          // Main content
          Container(
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  SizedBox(height: 56), // Adjust the height for the gap
                  Container(
                    height: 300,
                    width: screenWidth,
                    child: Image.network(
                      selectedImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(child: Text('Image not available')),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),

                  // BEST SELLER Text
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'BEST SELLER',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Sample 1 Text
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Sample 1',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  // Product Title and Price
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\$${widget.productPrice.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(height: 8),

                        // Description about the shoes
                        Text(
                          widget.productDescription, // Use the product description passed to the widget
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 16),

                        // Gallery Header
                        Text(
                          'Gallery',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 8),

                        // Gallery Images
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: widget.galleryImages.map((imageUrl) {
                            return GestureDetector(
                              onTap: () => _updateSelectedImage(imageUrl),
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                width: 60,
                                height: 60,
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: Center(child: Text('Image not available')),
                                    );
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 16),

                        // Size Selection
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Size',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Row(
                              children: ['EU', 'US', 'UK'].map((label) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    label,
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),

                        // Size Options
                        Row(
                          children: ['7', '8', '9', '10', '11'].map((size) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedSize == size ? Colors.blue : Colors.transparent,
                                  border: Border.all(
                                    color: selectedSize == size ? Colors.blue : Colors.grey,
                                  ),
                                ),
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: selectedSize == size ? Colors.white : Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 16),

                        // Price, Stock, and Quantity Table
                        Table(
                          border: TableBorder.all(color: Colors.grey),
                          children: [
                            TableRow(
                              children: [
                                Container(
                                  color: Colors.blue, // Blue background for the header
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Variants', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  color: Colors.blue, // Blue background for the header
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Price', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  color: Colors.blue, // Blue background for the header
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Stock', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  color: Colors.blue, // Blue background for the header
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Quantity', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            ...['Color 1', 'Color 2', 'Color 3', 'Color 4'].asMap().entries.map((entry) {
                              int index = entry.key;
                              String variant = entry.value;
                              return TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(variant, style: TextStyle(color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('\$${widget.productPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('100', style: TextStyle(color: Colors.white)),
                                  ),
                                  Flexible( // Added Flexible here
                                    child: // Quantity controls
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: IconButton(
                                            icon: Icon(Icons.remove, color: Colors.white),
                                            onPressed: () => _decrementQuantity(index),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            selectedQuantities[index].toString(),
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Flexible(
                                          child: IconButton(
                                            icon: Icon(Icons.add, color: Colors.white),
                                            onPressed: () => _incrementQuantity(index),
                                          ),
                                        ),
                                      ],
                                    )

                                  ),
                                ],
                              );

                            }).toList(),
                          ],
                        ),
                        SizedBox(height: 16),

                        // Total Price and Add to Cart Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total: \$${(widget.productPrice * selectedQuantities.reduce((a, b) => a + b)).toStringAsFixed(2)}', // Total price based on quantity
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to MyCartPage when Add to Cart button is pressed
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyCartPage()),
                                );
                              },
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Button color
                              ),
                            ),
                          ],
                        ),
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
