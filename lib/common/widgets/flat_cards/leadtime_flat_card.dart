import 'package:flutter/material.dart';

class LeadTimeCard extends StatelessWidget {
  final int minQuantity;
  final int maxQuantity;
  final int dispatchDays;
  final int deliveryDays;

  LeadTimeCard({
    required this.minQuantity,
    required this.maxQuantity,
    required this.dispatchDays,
    required this.deliveryDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,        
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cronograma',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Para $minQuantity - $maxQuantity items',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            'Para mais de $maxQuantity items entre em contacto',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dispatch',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '$dispatchDays days',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '$deliveryDays days',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
