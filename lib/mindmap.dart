// import 'package:flutter/material.dart';

// class MindmapScreen extends StatelessWidget {
//   const MindmapScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mindmapify'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0), // Padding around the screen
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // -- Mindmap Message
//             const Text(
//               'Here is your converted mindmap. Enjoy learning!',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 20),

//             // -- Mindmap Visualization (Image)
//             // Here we are displaying the mindmap image from the assets folder
//             Container(
//               width: double.infinity,
//               height: 300,
//               decoration: BoxDecoration(
//                 color: Colors.blue[50], // Light blue background
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(
//                   'assets/images/mindmap_image.png', // Path to your mindmap image
//                   fit: BoxFit.cover, // Make the image cover the container area
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // -- Optional: Any additional content or buttons related to Mindmap
//             ElevatedButton(
//               onPressed: () {
//                 // Handle any additional logic here (if needed)
//               },
//               child: const Text('Share Mindmap'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';

class MindmapScreen extends StatelessWidget {
  const MindmapScreen({super.key});

  // Method to show the share dialog
  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Share Your Mindmap'),
          content: const Text('Select a method to share your mindmap.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _shareViaEmail(); // Share via email
              },
              child: const Text('Share via Email'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _shareViaSocialMedia(); // Share via social media
              },
              child: const Text('Share via Social Media'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _shareViaLink(); // Share via link (if applicable)
              },
              child: const Text('Share via Link'),
            ),
          ],
        );
      },
    );
  }

  // Method to share the mindmap via email
  void _shareViaEmail() {
  // Path to the mindmap image
  const String mindmapImagePath = 'assets/images/mindmap_image.png'; 

  // Convert the file path to an XFile
  XFile mindmapFile = XFile(mindmapImagePath);

  // Share the mindmap image using the Share plugin
  Share.shareXFiles([mindmapFile], text: 'Here is my mindmap!');
}

  // Method to share the mindmap via social media (e.g., Facebook, Twitter)
  void _shareViaSocialMedia() {
  // Path to the mindmap image
  const String mindmapImagePath = 'assets/images/mindmap_image.png'; 

  // Convert the file path to an XFile
  XFile mindmapFile = XFile(mindmapImagePath);

  // Share the mindmap image using the Share plugin
  Share.shareXFiles([mindmapFile], text: 'Check out my mindmap!');
}

  // Method to share the mindmap via a link (useful for online resources)
  void _shareViaLink() {
    const String mindmapLink = 'https://example.com/mindmap'; // Replace with your link
    Share.share(mindmapLink, subject: 'Check out my mindmap!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindmapify'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding around the screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Mindmap Message
            const Text(
              'Here is your converted mindmap. Enjoy learning!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // -- Mindmap Visualization (Image)
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue[50], // Light blue background
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/mindmap_image.png', // Path to your mindmap image
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // -- Share Button
            ElevatedButton(
              onPressed: () {
                _showShareDialog(context); // Show the share dialog
              },
              child: const Text('Share Mindmap'),
            ),
          ],
        ),
      ),
    );
  }
}
