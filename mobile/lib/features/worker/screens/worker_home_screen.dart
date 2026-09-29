import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'collection_screen.dart';

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      // --------------------------------------------------
      // APP BAR
      // --------------------------------------------------

      appBar: AppBar(
        backgroundColor: AppTheme.primaryGreen,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PACHAPP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Green Army',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_rounded,
                color: AppTheme.primaryGreen,
              ),
            ),
          ),
        ],
      ),

      // --------------------------------------------------
      // BODY
      // --------------------------------------------------

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------------------------------------
            // GREETING
            // ------------------------------------------------

            const Text(
              'Good morning! 👋',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: AppTheme.darkGreen,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Ready for today’s collection?',
              style: TextStyle(
                fontSize: 15,
                color: AppTheme.textMedium,
              ),
            ),

            const SizedBox(height: 22),

            // ------------------------------------------------
            // TODAY'S AREA CARD
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.softGreen,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.border,
                ),
              ),
              child: Row(
                children: [

                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.location_on_rounded,
                      color: AppTheme.primaryGreen,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today’s Assigned Area',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.textMedium,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Ward 12 • Chengannur',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.darkGreen,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.primaryGreen,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // TODAY'S SUMMARY
            // ------------------------------------------------

            const Text(
              'Today’s Collection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                Expanded(
                  child: _statCard(
                    icon: Icons.home_work_outlined,
                    value: '18',
                    label: 'Households',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _statCard(
                    icon: Icons.check_circle_outline_rounded,
                    value: '7',
                    label: 'Completed',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _statCard(
                    icon: Icons.pending_actions_rounded,
                    value: '11',
                    label: 'Remaining',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            // ------------------------------------------------
            // MAIN COLLECTION BUTTON
            // ------------------------------------------------

            const Text(
              'Collection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 62,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CollectionScreen(),
                    ),
                  );
                },


                icon: const Icon(
                  Icons.recycling_rounded,
                  size: 28,
                ),
                label: const Text(
                  'Start Today’s Collection',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // AI VERIFICATION
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.border,
                ),
              ),
              child: Row(
                children: [

                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppTheme.softGreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: AppTheme.primaryGreen,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AI Waste Verification',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textDark,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Capture waste images for automatic '
                              'verification.',
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: AppTheme.textMedium,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 17,
                    color: AppTheme.textMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // PERFORMANCE
            // ------------------------------------------------

            const Text(
              'My Performance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                Expanded(
                  child: _performanceCard(
                    icon: Icons.recycling_rounded,
                    value: '126',
                    label: 'Collections',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _performanceCard(
                    icon: Icons.scale_outlined,
                    value: '84 kg',
                    label: 'Waste Collected',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // REWARD CARD
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.rewardLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [

                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.stars_rounded,
                      color: AppTheme.rewardOrange,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Worker Rewards',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textMedium,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          '1,250 Points',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textDark,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Keep up the great work!',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textMedium,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 17,
                    color: AppTheme.rewardOrange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // --------------------------------------------------
      // BOTTOM NAVIGATION
      // --------------------------------------------------

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.recycling_outlined),
            selectedIcon: Icon(Icons.recycling_rounded),
            label: 'Collection',
          ),

          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history_rounded),
            label: 'History',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STAT CARD
  // ============================================================

  Widget _statCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppTheme.primaryGreen,
            size: 23,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppTheme.darkGreen,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: AppTheme.textMedium,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PERFORMANCE CARD
  // ============================================================

  Widget _performanceCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppTheme.primaryGreen,
            size: 25,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: AppTheme.darkGreen,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.textMedium,
            ),
          ),
        ],
      ),
    );
  }
}