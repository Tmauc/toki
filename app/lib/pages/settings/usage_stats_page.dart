import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:omi/models/user_usage.dart';
import 'package:omi/providers/usage_provider.dart';
import 'package:omi/utils/l10n_extensions.dart';

class UsageStatsPage extends StatefulWidget {
  const UsageStatsPage({super.key});

  @override
  State<UsageStatsPage> createState() => _UsageStatsPageState();
}

class _UsageStatsPageState extends State<UsageStatsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _periods = ['today', 'monthly', 'yearly', 'all_time'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_onTabChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsageProvider>().fetchUsageStats(period: 'today');
    });
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      context.read<UsageProvider>().fetchUsageStats(period: _periods[_tabController.index]);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  String _formatSeconds(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    if (h > 0) {
      return '$h${context.l10n.hours[0]} ${m.toString().padLeft(2, '0')}m';
    }
    return '$m ${context.l10n.minutes}';
  }

  String _formatNumber(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return n.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(context.l10n.usageStatistics, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.deepPurple,
          tabs: [
            Tab(text: context.l10n.today),
            Tab(text: context.l10n.thisMonth),
            Tab(text: context.l10n.thisYear),
            Tab(text: context.l10n.allTime),
          ],
        ),
      ),
      body: Consumer<UsageProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.deepPurple));
          }

          final usage = _getUsageForTab(provider);
          if (usage == null) {
            return Center(
              child: Text(context.l10n.noDataYet, style: const TextStyle(color: Colors.grey, fontSize: 16)),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildStatCard(
                  icon: Icons.mic,
                  color: Colors.deepPurple,
                  title: context.l10n.transcriptionTime,
                  value: _formatSeconds(usage.transcriptionSeconds),
                ),
                const SizedBox(height: 12),
                _buildStatCard(
                  icon: Icons.text_fields,
                  color: Colors.blue,
                  title: context.l10n.wordsTranscribed,
                  value: _formatNumber(usage.wordsTranscribed),
                ),
                const SizedBox(height: 12),
                _buildStatCard(
                  icon: Icons.lightbulb_outline,
                  color: Colors.amber,
                  title: context.l10n.insightsGained,
                  value: _formatNumber(usage.insightsGained),
                ),
                const SizedBox(height: 12),
                _buildStatCard(
                  icon: Icons.auto_awesome,
                  color: Colors.teal,
                  title: context.l10n.memoriesCreated,
                  value: _formatNumber(usage.memoriesCreated),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  UsageStats? _getUsageForTab(UsageProvider provider) {
    switch (_tabController.index) {
      case 0:
        return provider.todayUsage;
      case 1:
        return provider.monthlyUsage;
      case 2:
        return provider.yearlyUsage;
      case 3:
        return provider.allTimeUsage;
      default:
        return null;
    }
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
