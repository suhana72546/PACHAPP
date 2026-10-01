import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class CollectionHistoryScreen extends StatelessWidget {
  const CollectionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Backend collection data will be connected here later.
    const collections = <Map<String, dynamic>>[];

    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(
        backgroundColor: AppTheme.background,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          'Collection History',
          style: TextStyle(
            color: AppTheme.darkGreen,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: collections.isEmpty
          ? _buildEmptyState()
          : ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSummaryCard(collections.length),

          const SizedBox(height: 24),

          const Text(
            'Recent Collections',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: AppTheme.darkGreen,
            ),
          ),

          const SizedBox(height: 12),

          ...collections.map(
                (collection) => _collectionCard(
              date: collection['date'] ?? '',
              waste: collection['waste'] ?? '',
              quantity: collection['quantity'] ?? '',
              points: collection['points'] ?? '',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(int totalCollections) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.recycling_rounded,
            color: Colors.white,
            size: 42,
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Collections',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                totalCollections.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.recycling_rounded,
              size: 70,
              color: AppTheme.textMedium.withValues(alpha: 0.5),
            ),

            const SizedBox(height: 16),

            const Text(
              'No collection history',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Your waste collection records will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _collectionCard({
    required String date,
    required String waste,
    required String quantity,
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.softGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.delete_outline_rounded,
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
                  waste,
                  style: const TextStyle(
                    fontSize: 16,
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

                const SizedBox(height: 4),

                Text(
                  'Quantity: $quantity',
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
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}