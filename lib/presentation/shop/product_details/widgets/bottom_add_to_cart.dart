import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppBottomAddToCart extends StatelessWidget {
  const AppBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal: \$',
              style: TextStyle(fontSize: 18),
            ),
            // if (_discount > 0)
            //   Text(
            //     'Discount: \$',
            //     style: TextStyle(fontSize: 18),
            //   ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate voucher
                // _validateVoucher();
              },
              child: const Text('Validate Voucher'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          // controller: _voucherController,
          decoration: const InputDecoration(
            labelText: 'Enter Voucher Code',
            suffixIcon: Icon(Icons.check, color: Colors.green),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Proceed to checkout
            Navigator.pushNamed(context, '/checkout');
          },
          child: const Text('Proceed to Checkout'),
        ),
      ],
    );
  }
}
