import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(
        title: const Text('Today’s Collection'),
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
            // SUMMARY
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.softGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [

                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.home_work_outlined,
                      color: AppTheme.primaryGreen,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ward 12 • Chengannur',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.darkGreen,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '11 households remaining',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.textMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Assigned Households',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 12),

            // ------------------------------------------------
            // HOUSE 1
            // ------------------------------------------------

            _householdCard(
              context: context,
              houseNumber: 'House #12',
              name: 'Anitha',
              waste: 'Plastic + Paper',
              status: 'Pending',
            ),

            const SizedBox(height: 12),

            // ------------------------------------------------
            // HOUSE 2
            // ------------------------------------------------

            _householdCard(
              context: context,
              houseNumber: 'House #13',
              name: 'Rajesh',
              waste: 'Plastic',
              status: 'Pending',
            ),

            const SizedBox(height: 12),

            // ------------------------------------------------
            // HOUSE 3
            // ------------------------------------------------

            _householdCard(
              context: context,
              houseNumber: 'House #14',
              name: 'Meera',
              waste: 'Plastic + Glass',
              status: 'Collected',
            ),

            const SizedBox(height: 12),

            // ------------------------------------------------
            // HOUSE 4
            // ------------------------------------------------

            _householdCard(
              context: context,
              houseNumber: 'House #15',
              name: 'Suresh',
              waste: 'Paper + Plastic',
              status: 'Pending',
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // INFORMATION
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppTheme.border,
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Icon(
                    Icons.info_outline_rounded,
                    color: AppTheme.primaryGreen,
                    size: 25,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      'Complete each household collection after '
                          'verifying the waste and recording the quantity.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: AppTheme.textMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HOUSEHOLD CARD
  // ============================================================

  Widget _householdCard({
    required BuildContext context,
    required String houseNumber,
    required String name,
    required String waste,
    required String status,
  }) {
    final bool collected = status == 'Collected';

    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: collected
                      ? AppTheme.softGreen
                      : AppTheme.rewardLight,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  collected
                      ? Icons.check_circle_outline_rounded
                      : Icons.home_outlined,
                  color: collected
                      ? AppTheme.successGreen
                      : AppTheme.rewardOrange,
                  size: 26,
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      houseNumber,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.textDark,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.textMedium,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: collected
                      ? AppTheme.softGreen
                      : AppTheme.rewardLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: collected
                        ? AppTheme.successGreen
                        : AppTheme.rewardOrange,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [

              const Icon(
                Icons.recycling_outlined,
                size: 18,
                color: AppTheme.primaryGreen,
              ),

              const SizedBox(width: 7),

              Expanded(
                child: Text(
                  waste,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textMedium,
                  ),
                ),
              ),

              if (!collected)
                SizedBox(
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {
                      _showCollectionDialog(
                        context,
                        houseNumber,
                        name,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 38),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COLLECTION DIALOG
  // ============================================================

  void _showCollectionDialog(
      BuildContext context,
      String houseNumber,
      String name,
      ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [

                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppTheme.softGreen,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.recycling_rounded,
                      color: AppTheme.primaryGreen,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          houseNumber,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.darkGreen,
                          ),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.textMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                'Collection Actions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textDark,
                ),
              ),

              const SizedBox(height: 15),

              // AI VERIFICATION
              _bottomAction(
                icon: Icons.camera_alt_outlined,
                title: 'Verify Waste',
                subtitle: 'Take a photo for AI verification',
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Waste verification will be added next.',
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // RECORD WEIGHT
              _bottomAction(
                icon: Icons.scale_outlined,
                title: 'Record Waste Quantity',
                subtitle: 'Enter the collected waste weight',
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Waste quantity screen will be added next.',
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // COMPLETE
              _bottomAction(
                icon: Icons.check_circle_outline_rounded,
                title: 'Mark Collection Complete',
                subtitle: 'Finish this household collection',
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Collection marked as complete.',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // BOTTOM ACTION
  // ============================================================

  Widget _bottomAction({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.border,
          ),
        ),
        child: Row(
          children: [

            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppTheme.softGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppTheme.primaryGreen,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppTheme.textMedium,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppTheme.textMedium,
            ),
          ],
        ),
      ),
    );
  }
}