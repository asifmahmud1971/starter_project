import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/features/patient_portal/home/model/blog_model.dart';

class BlogDetailScreen extends StatelessWidget {
  final BlogData? blogData;
  const BlogDetailScreen({super.key, this.blogData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomImage(baseUrl: blogData?.image,fit: BoxFit.cover,),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    blogData?.title??"",
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Author and Date
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: colors.primary.withOpacity(0.2),
                        radius: 18,
                        child: const Icon(Icons.person, size: 18),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Med Pilot",
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            DateFormat('MMM dd, yyyy').format(DateTime.parse(blogData?.date??"")),
                            style: textTheme.bodySmall?.copyWith(
                              color: theme.hintColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Article Content
                  Text(
                    blogData?.description??"",
                    style: textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button for Reading Options

    );
  }

  String _getFullImageUrl(String relativePath) {
    // In real app, you would have your base URL here
    return 'https://your-api-domain.com/$relativePath';
  }

  Widget _buildKeyTakeaways() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(GetContext.context).colorScheme.primaryContainer.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline,
                color: Theme.of(GetContext.context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                'Key Takeaways',
                style: Theme.of(GetContext.context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _TakeawayItem(text: 'Magnesium is essential for cardiovascular health, nerves, muscles and bones'),
          const _TakeawayItem(text: 'Adults need 320-420mg of magnesium daily'),
          const _TakeawayItem(text: 'Most people get enough magnesium through a healthy diet'),
          const _TakeawayItem(text: 'Supplements may benefit those with deficiencies or pregnancy complications'),
        ],
      ),
    );
  }


  Widget _buildRelatedArticles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Related Articles',
          style: Theme.of(GetContext.context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _RelatedArticleCard(
                title: 'Counting steps is good — is combining steps and heart rate better?',
                image: 'app_service/blog/2025-07-0711:20:20.jpg',
              ),
              _RelatedArticleCard(
                title: 'The benefits of Vitamin D for immune health',
                image: 'app_service/blog/vitamin-d.jpg',
              ),
              _RelatedArticleCard(
                title: 'Understanding the Mediterranean diet',
                image: 'app_service/blog/med-diet.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TakeawayItem extends StatelessWidget {
  final String text;

  const _TakeawayItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 8,
              color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class _RelatedArticleCard extends StatelessWidget {
  final String title;
  final String image;

  const _RelatedArticleCard({
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: 'https://your-api-domain.com/$image',
              height: 120,
              width: 180,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
              ),
              errorWidget: (context, url, error) => Container(
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Title
          Text(
            title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}