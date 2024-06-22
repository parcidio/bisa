import 'package:dona/common/widgets/product/product_card/product_card_horizontal.dart';
import 'package:flutter/material.dart';

class AppCartScreen extends StatefulWidget {
  const AppCartScreen({Key? key}) : super(key: key);

  @override
  _AppCartScreenState createState() => _AppCartScreenState();
}

class _AppCartScreenState extends State<AppCartScreen> {
  TextEditingController _voucherController = TextEditingController();
  bool _voucherValidated = false;
  double _subtotal = 0;
  double _discount = 0;

  @override
  Widget build(BuildContext context) {
    // Mock data for cart items
    final List<CartItem> cartItems = [
      CartItem(name: 'Product 1', price: 100, quantity: 2),
      CartItem(name: 'Product 2', price: 50, quantity: 1),
      CartItem(name: 'Product 3', price: 75, quantity: 3),
      CartItem(name: 'Product 3', price: 75, quantity: 3),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return AppProductCardHorizontal();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal: \$$_subtotal',
                      style: TextStyle(fontSize: 18),
                    ),
                    if (_discount > 0)
                      Text(
                        'Discount: \$$_discount',
                        style: TextStyle(fontSize: 18),
                      ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${calculateTotal(cartItems)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate voucher
                        _validateVoucher();
                      },
                      child: Text('Validate Voucher'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _voucherController,
                  decoration: InputDecoration(
                    labelText: 'Enter Voucher Code',
                    suffixIcon: _voucherValidated
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Proceed to checkout
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Text('Proceed to Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calculateTotal(List<CartItem> cartItems) {
    double total = _subtotal - _discount;
    return total;
  }

  void _calculateSubtotal(List<CartItem> cartItems) {
    _subtotal = 0;
    for (var item in cartItems) {
      _subtotal += item.price * item.quantity;
    }
  }

  void _validateVoucher() {
    // Here you can implement the logic to validate the voucher code
    // For demonstration purpose, let's just check if the entered code is 'DISCOUNT20'
    final enteredCode = _voucherController.text.trim();
    if (enteredCode == 'DISCOUNT20') {
      setState(() {
        _discount = 20; // Apply $20 discount
        _voucherValidated = true;
      });
    } else {
      setState(() {
        _discount = 0; // Reset discount
        _voucherValidated = false;
      });
    }
  }

  @override
  void dispose() {
    _voucherController.dispose();
    super.dispose();
  }
}

class CartItem {
  final String name;
  final double price;
  final int quantity;

  const CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
