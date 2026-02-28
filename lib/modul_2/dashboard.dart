import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle('A. Container'),

            // A. Simple Container
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  'Simple Container',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const SectionTitle('B. Row and Column'),

            // B. Row and Column combination
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  // Left: Column with text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Subtitle or description goes here.'),
                      ],
                    ),
                  ),

                  // Right: vertically stacked icons
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(height: 8),
                      Icon(Icons.share, color: Colors.blue),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const SectionTitle('C. Stack'),

            // C. Stack demo
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    // Background image
                    Positioned.fill(
                      child: Image.network(
                        'https://picsum.photos/800/400',
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Semi-transparent overlay label
                    const Positioned(
                      left: 12,
                      top: 12,
                      child: ColoredBox(
                        color: Colors.black54,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Text('Featured', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),

                    // Positioned button
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: FloatingActionButton.small(
                        onPressed: () {},
                        child: const Icon(Icons.play_arrow),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const SectionTitle('D. GridView and ListView'),

            // GridView inside a fixed-height container (use shrinkWrap when nested)
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200),
              ),
              padding: const EdgeInsets.all(8),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(
                  6,
                  (i) => Container(
                    decoration: BoxDecoration(
                      color: Colors.primaries[i % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('Item ${i + 1}', style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Horizontal ListView example
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) => Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.primaries[index % Colors.primaries.length],
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Card ${index + 1}'),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const SectionTitle('E. Container inside Column (example)'),

            // Example: multiple Containers inside a Column
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(child: Text('Container 1', style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(child: Text('Container 2', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Small helper for section titles
class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
    );
  }
}
