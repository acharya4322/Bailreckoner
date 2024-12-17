import 'package:flutter/material.dart';

class KnowYourRightsPage extends StatelessWidget {
  const KnowYourRightsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bail Application Preview',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A287A), Color(0xFF0F3C78)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Know Your Legal Rights',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'It is important to understand your legal rights to protect yourself and ensure fair treatment in all legal matters.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              // Right to Legal Representation
              _buildRightCard(
                context,
                title: 'Right to Legal Representation',
                description:
                    'You have the right to an attorney during any legal proceeding, whether criminal or civil. If you cannot afford one, the government may provide one for you.',
                color: Colors.indigo,
                videoUrl:
                    'https://www.example.com/video1', // Add video link or identifier
              ),
              const SizedBox(height: 16),

              // Right to a Fair Trial
              _buildRightCard(
                context,
                title: 'Right to a Fair Trial',
                description:
                    'Every individual is entitled to a fair trial by an impartial tribunal, and to be informed of the charges against them.',
                color: Colors.green,
                videoUrl:
                    'https://www.example.com/video2', // Add video link or identifier
              ),
              const SizedBox(height: 16),

              // Right to Remain Silent
              _buildRightCard(
                context,
                title: 'Right to Remain Silent',
                description:
                    'In certain legal proceedings, you have the right to remain silent and not to incriminate yourself.',
                color: Colors.orange,
                videoUrl:
                    'https://www.example.com/video3', // Add video link or identifier
              ),
              const SizedBox(height: 16),

              // Right to Appeal
              _buildRightCard(
                context,
                title: 'Right to Appeal',
                description:
                    'If you believe your trial was unfair or the verdict was incorrect, you have the right to appeal to a higher court.',
                color: Colors.blue,
                videoUrl:
                    'https://www.example.com/video4', // Add video link or identifier
              ),
              const SizedBox(height: 16),

              // Footer Section
              const SizedBox(height: 30),
              _buildFooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Right Info Card with "Know More" Button and Video Icon
  Widget _buildRightCard(
    BuildContext context, {
    required String title,
    required String description,
    required Color color,
    required String videoUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.info_outline, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.video_library, color: color),
                          onPressed: () {
                            // Open video (can navigate to a new screen or handle video URL)
                            _openVideo(videoUrl);
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // Show more information in dialog
                            _showMoreInfoDialog(context, title, description);
                          },
                          child: const Text(
                            'Know More',
                            style: TextStyle(
                                fontSize: 16, color: Colors.indigoAccent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Method to show additional information when 'Know More' is pressed
  void _showMoreInfoDialog(
      BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('More Information about $title'),
          content: SingleChildScrollView(
            child: Text(
              'Here is more information about the "$title":\n\n$description',
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Method to open the video (this can be customized to open an actual video player or external URL)
  void _openVideo(String url) {
    // Placeholder for actual video playing logic (e.g., use a video player plugin or web view)
    print("Opening video at URL: $url");
  }

  // Footer Section with Additional Resources
  Widget _buildFooterSection() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Additional Resources',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'For further assistance or questions about your legal rights, consider reaching out to one of the following resources:',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          _buildResourceCard(
            name: 'National Legal Aid',
            phone: '1800-123-4567',
            website: 'www.legalaid.org',
          ),
          const SizedBox(height: 12),
          _buildResourceCard(
            name: 'Public Defender Services',
            phone: '1800-987-6543',
            website: 'www.publicdefender.org',
          ),
        ],
      ),
    );
  }

  // Reusable Resource Card
  Widget _buildResourceCard({
    required String name,
    required String phone,
    required String website,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Phone: $phone',
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            'Website: $website',
            style: const TextStyle(fontSize: 14, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
