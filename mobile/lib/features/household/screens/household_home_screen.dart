import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class HouseholdHomeScreen extends StatelessWidget {
  const HouseholdHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      // --------------------------------------------------
      // APP BAR
      // --------------------------------------------------

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.darkGreen,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PACHAPP',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: AppTheme.darkGreen,
              ),
            ),
            Text(
              'Household',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textMedium,
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
              backgroundColor: AppTheme.softGreen,
              child: const Icon(
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
              'Hello! 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppTheme.darkGreen,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Let’s make our community cleaner today.',
              style: TextStyle(
                fontSize: 15,
                color: AppTheme.textMedium,
              ),
            ),

            const SizedBox(height: 22),

            // ------------------------------------------------
            // NEXT COLLECTION CARD
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primaryGreen,
                    AppTheme.darkGreen,
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryGreen.withValues(
                      alpha: 0.18,
                    ),
                    blurRadius: 15,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(
                            alpha: 0.18,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.recycling_rounded,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Text(
                          'Next Collection',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Tomorrow',
                          style: TextStyle(
                            color: AppTheme.primaryGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Plastic & Dry Waste',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.white70,
                        size: 18,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '10:00 AM – 12:00 PM',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white70,
                        size: 18,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Ward 12 • Chengannur',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppTheme.primaryGreen,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: const Text(
                        'View Collection Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // ------------------------------------------------
            // QUICK ACTIONS
            // ------------------------------------------------

            const Text(
              'Quick Actions',
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
                  child: _actionCard(
                    icon: Icons.local_shipping_outlined,
                    title: 'Request\nCollection',
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _actionCard(
                    icon: Icons.camera_alt_outlined,
                    title: 'Verify\nWaste',
                    onTap: () {},
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _actionCard(
                    icon: Icons.stars_outlined,
                    title: 'Rewards',
                    onTap: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            // ------------------------------------------------
            // REWARD CARD
            // ------------------------------------------------

            const Text(
              'My Rewards',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.rewardLight,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFF4D59B),
                ),
              ),
              child: Row(
                children: [

                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.stars_rounded,
                      color: AppTheme.rewardOrange,
                      size: 31,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Points',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.textMedium,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          '250 Points',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // ------------------------------------------------
            // WASTE SUMMARY
            // ------------------------------------------------

            const Text(
              'My Waste',
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
                  child: _summaryCard(
                    icon: Icons.recycling_rounded,
                    value: '12',
                    label: 'Collections',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _summaryCard(
                    icon: Icons.scale_outlined,
                    value: '8.5 kg',
                    label: 'Waste Collected',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            // ------------------------------------------------
            // ECO TIP
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
                    Icons.lightbulb_outline_rounded,
                    color: AppTheme.primaryGreen,
                    size: 27,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Eco Tip',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.darkGreen,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Keep plastic, paper, glass and organic '
                              'waste separated before collection.',
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.45,
                            color: AppTheme.textMedium,
                          ),
                        ),
                      ],
                    ),
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
            icon: Icon(Icons.stars_outlined),
            selectedIcon: Icon(Icons.stars_rounded),
            label: 'Rewards',
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
  // QUICK ACTION CARD
  // ============================================================

  Widget _actionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 105,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppTheme.border,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppTheme.primaryGreen,
              size: 30,
            ),

            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SUMMARY CARD
  // ============================================================

  Widget _summaryCard({
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
      child: Row(
        children: [

          Container(
            width: 44,
            height: 44,
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

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.darkGreen,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppTheme.textMedium,
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