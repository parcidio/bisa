import 'package:dona/common/widgets/icons/circular_icon.dart';
import 'package:dona/common/widgets/product/product_card/product_card_horizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../product_details/widgets/bottom_add_to_cart.dart';

class AppCartScreen extends StatefulWidget {
  const AppCartScreen({Key? key}) : super(key: key);

  @override
  _AppCartScreenState createState() => _AppCartScreenState();
}

class _AppCartScreenState extends State<AppCartScreen> {
  final TextEditingController _voucherController = TextEditingController();
  bool _voucherValidated = false;
  double _subtotal = 0;
  double _discount = 0;
  List<CartItem> cartItems = [
    const CartItem(id: '0', name: 'Product 1', price: 100, quantity: 2),
    const CartItem(id: '1', name: 'Product 2', price: 50, quantity: 1),
    const CartItem(id: '2', name: 'Product 3', price: 75, quantity: 3),
    const CartItem(id: '3', name: 'Product 3', price: 75, quantity: 4),
  ];

  @override
  Widget build(BuildContext context) {
    // Mock data for cart items

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fazer o Checkout'),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: AppCircularIcon(
              icon: cartItems.isEmpty ? null : CupertinoIcons.delete_simple,
              onPressed: () {},
            ),
          )
        ],
      ),
      // bottomNavigationBar: const AppBottomAddToCart(),
      body: cartItems.isEmpty
          ? Center(
              child: Container(
                  child: Column(
                children: [
                  Icon(Icons.low_priority),
                  Text('Nao ha itens no checkout',
                      style: Theme.of(context).textTheme.labelLarge)
                ],
              )),
            )
          : Stack(
              children: [
                ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    CartItem item = cartItems[index];
                    return Dismissible(
                      key: Key(item.id),
                      background: Container(
                        color: AppColors.error,
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.defaultSpace),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Item será descartado',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: AppColors.white))
                            ],
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          cartItems.removeAt(index);
                        });

                        // Then show a snackbar.
                        String cartItemName = item.name;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$cartItemName dismissed')));
                      },
                      child: const AppProductCardHorizontal(),
                    );
                  },
                ),
                SlidingUpPanel(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                  minHeight: AppSizes.appPanelHight,
                  maxHeight: AppSizes.appPanelHight * 2.5,
                  isDraggable: true,
                  renderPanelSheet: true,
                  panel: const Padding(
                    padding: EdgeInsets.all(AppSizes.defaultItems),
                    child: AppBottomAddToCart(),
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
  final String id;
  final String name;
  final double price;
  final int quantity;

  const CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}
