import 'package:flutter/material.dart';

class Pay extends StatelessWidget {
  const Pay({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCEBEC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  const Spacer(),
                  const Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3D4A6A),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Delivery to',
                style: TextStyle(color: Color(0xFF7B8AA0)),
              ),
              const SizedBox(height: 8),
              _infoCard(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        '', 
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Mansoura, 14, Porsaidi St',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Payment Method',
                style: TextStyle(color: Color(0xFF7B8AA0)),
              ),
              const SizedBox(height: 8),
              _infoCard(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.credit_card, color: Colors.red),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        '**** **** **** 0256',
                        style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _infoCard(
                      child: Row(
                        children: const [
                          Icon(Icons.settings),
                          SizedBox(width: 8),
                          Text('Add voucher'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE06475),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('Apply'),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Divider(),
              const SizedBox(height: 12),
              const Text(
                'PAYMENT SUMMARY',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3D4A6A),
                ),
              ),
              const SizedBox(height: 16),

              _summaryRow('Subtotal', '16.100 EGP'),
              _summaryRow('Shipping Fees', 'TO BE CALCULATED'),

              const Divider(height: 32),

              _summaryRow(
                'TOTAL + VAT',
                '16.100 EGP',
                isBold: true,
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE06475),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text(
                    'ORDER',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _infoCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFDCEBEC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF9DC5C8),
        ),
      ),
      child: child,
    );
  }

  static Widget _summaryRow(
    String title,
    String value, {
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}