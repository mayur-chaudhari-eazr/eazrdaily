import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Notification',
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                // Handle "Read All" action
              },
              child: Text(
                'Read All',
                style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[850]
                    : Colors.grey[300], // Background color for unselected tabs
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white // Active tab color in dark mode
                      : Colors.black, // Active tab color in light mode
                  borderRadius: BorderRadius.circular(8.0), // Rounded edges for active tab
                ),
                labelColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black // Active label color in dark mode
                    : Colors.white, // Active label color in light mode
                unselectedLabelColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white70 // Unselected label color in dark mode
                    : Colors.black, // Unselected label color in light mode
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                tabs: const [
                  Tab(text: 'Mailbox'),
                  Tab(text: 'Balance Fluctuation'),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  MailboxTab(),
                  BalanceFluctuationTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MailboxTab extends StatelessWidget {
  const MailboxTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        Text('Today', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        NotificationTile(
          title: 'Self-generating profit up to 4.2%/year',
          description: 'Just 1 touch to turn on the automatic profit feature...',
        ),
        SizedBox(height: 16),
        Text('Yesterday', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        NotificationTile(
          title: 'Automatically generate up to 1.6%',
          description: 'Just one touch activates the auto-profit feature...',
        ),
        NotificationTile(
          title: 'Auto-earning profit',
          description: 'One touch activates the auto-profit feature...',
        ),
        SizedBox(height: 16),
        Text('16 May 2024', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        NotificationTile(
          title: 'Self-generating profit up to 20%/year',
          description: 'Just 1 touch to turn on the automatic profit feature...',
        ),
      ],
    );
  }
}

class BalanceFluctuationTab extends StatelessWidget {
  const BalanceFluctuationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        Text('Today', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        NotificationTile(
          title: 'Account: Thanh Nhan Pham',
          description: 'Transaction amount: + USD 200.00\nMessage: Bredar transfers money',
        ),
        NotificationTile(
          title: 'Account: My Credit Card',
          description: 'Transaction amount: + USD 16.20\nMessage: Contribution to the group f...',
        ),
        SizedBox(height: 16),
        Text('Yesterday', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        NotificationTile(
          title: 'Account: Thanh Nhan Pham',
          description: 'Transaction amount: + USD 300.14\nMessage: Gift for your birthday',
        ),
        SizedBox(height: 16),
        Text('16 May 2024', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        NotificationTile(
          title: 'Account: Thanh Nhan Pham',
          description: 'Transaction amount: + USD 21.31\nMessage: Monthly rent payment',
        ),
      ],
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;

  const NotificationTile({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[850]
          : Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
