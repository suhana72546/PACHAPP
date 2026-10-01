import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class CollectionDetailsScreen extends StatefulWidget {
  const CollectionDetailsScreen({super.key});

  @override
  State<CollectionDetailsScreen> createState() =>
      _CollectionDetailsScreenState();
}

class _CollectionDetailsScreenState
    extends State<CollectionDetailsScreen> {
  final TextEditingController _quantityController =
  TextEditingController();

  String wasteType = '--';
  String aiQuantity = '--';
  String collectionStatus = '--';

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(
        title: const Text('Collection Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------------------------------------
            // INFORMATION
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.softGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Icon(
                    Icons.assignment_outlined,
                    color: AppTheme.primaryGreen,
                    size: 27,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      'Review the waste information and '
                          'record the actual collected quantity.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: AppTheme.darkGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // WASTE INFORMATION
            // ------------------------------------------------

            const Text(
              'Waste Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 12),

            _infoCard(
              icon: Icons.recycling_outlined,
              title: 'Waste Category',
              value: wasteType,
            ),

            const SizedBox(height: 10),

            _infoCard(
              icon: Icons.auto_awesome_outlined,
              title: 'AI Estimated Quantity',
              value: aiQuantity,
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // ACTUAL QUANTITY
            // ------------------------------------------------

            const Text(
              'Actual Collected Quantity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Enter the actual quantity collected from the household.',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textMedium,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _quantityController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                hintText: 'Enter quantity',
                suffixText: 'kg',
                prefixIcon: const Icon(
                  Icons.scale_outlined,
                  color: AppTheme.primaryGreen,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppTheme.border,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppTheme.border,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppTheme.primaryGreen,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // COLLECTION STATUS
            // ------------------------------------------------

            const Text(
              'Collection Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 12),

            _infoCard(
              icon: Icons.check_circle_outline_rounded,
              title: 'Status',
              value: collectionStatus,
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // NOTES
            // ------------------------------------------------

            const Text(
              'Notes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Add notes if required',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppTheme.border,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppTheme.border,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppTheme.primaryGreen,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ------------------------------------------------
            // SAVE BUTTON
            // ------------------------------------------------

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Collection saving will be connected to the backend later.',
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.save_outlined,
                ),
                label: const Text(
                  'Save Collection',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // INFORMATION CARD
  // ============================================================

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: Row(
        children: [

          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppTheme.softGreen,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryGreen,
              size: 23,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textMedium,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}