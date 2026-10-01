import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Backend data will be connected here later.
    const String rewardPoints = '--';

    const rewards = <Map<String, dynamic>>[];
    const activities = <Map<String, dynamic>>[];

    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(
        backgroundColor: AppTheme.background,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          'Rewards',
          style: TextStyle(
            color: AppTheme.darkGreen,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ------------------------------------------------
          // POINTS CARD
          // ------------------------------------------------

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.card_giftcard_rounded,
                  color: Colors.white,
                  size: 42,
                ),

                const SizedBox(height: 12),

                const Text(
                  'Your Reward Points',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  rewardPoints,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'points',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ------------------------------------------------
          // AVAILABLE REWARDS
          // ------------------------------------------------

          const Text(
            'Available Rewards',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: AppTheme.darkGreen,
            ),
          ),

          const SizedBox(height: 12),

          if (rewards.isEmpty)
            _buildEmptyState(
              icon: Icons.card_giftcard_outlined,
              message: 'Available rewards will appear here.',
            )
          else
            ...rewards.map(
                  (reward) => _rewardCard(
                icon: reward['icon'] as IconData,
                title: reward['title'] ?? '',
                points: reward['points'] ?? '',
              ),
            ),

          const SizedBox(height: 20),

          // ------------------------------------------------
          // RECENT REWARD ACTIVITY
          // ------------------------------------------------

          const Text(
            'Recent Reward Activity',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: AppTheme.darkGreen,
            ),
          ),

          const SizedBox(height: 12),

          if (activities.isEmpty)
            _buildEmptyState(
              icon: Icons.history_rounded,
              message: 'Your reward activity will appear here.',
            )
          else
            ...activities.map(
                  (activity) => _activityCard(
                title: activity['title'] ?? '',
                points: activity['points'] ?? '',
                date: activity['date'] ?? '',
              ),
            ),
        ],
      ),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _buildEmptyState({
    required IconData icon,
    required String message,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 42,
            color: AppTheme.textMedium.withValues(alpha: 0.55),
          ),

          const SizedBox(height: 10),

          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textMedium,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // REWARD CARD
  // ============================================================

  Widget _rewardCard({
    required IconData icon,
    required String title,
    required String points,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppTheme.softGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryGreen,
              size: 28,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkGreen,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  points,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textMedium,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          SizedBox(
            width: 80,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // Redemption will be connected to the backend later.
              },
              child: const Text(
                'Redeem',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTIVITY CARD
  // ============================================================

  Widget _activityCard({
    required String title,
    required String points,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.stars_rounded,
            color: AppTheme.primaryGreen,
            size: 30,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkGreen,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textMedium,
                  ),
                ),
              ],
            ),
          ),

          Text(
            points,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}