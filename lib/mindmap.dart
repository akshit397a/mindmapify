// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:cross_file/cross_file.dart';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

// class MindmapScreen extends StatelessWidget {
//   const MindmapScreen({super.key});

//   // Method to show the share dialog
//   void _showShareDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Share Your Mindmap'),
//           content: const Text('Select a method to share your mindmap.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _shareViaEmail(); // Share via email
//               },
//               child: const Text('Share via Email'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _shareViaSocialMedia(); // Share via social media
//               },
//               child: const Text('Share via Social Media'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _shareViaLink(); // Share via link (if applicable)
//               },
//               child: const Text('Share via Link'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Method to share the mindmap via email
//   void _shareViaEmail() {
//     const String mindmapImagePath = 'assets/mindmapify1.jpg'; 
//     XFile mindmapFile = XFile(mindmapImagePath);
//     Share.shareXFiles([mindmapFile], text: 'Here is my mindmap!');
//   }

//   // Method to share the mindmap via social media (e.g., Facebook, Twitter)
//   void _shareViaSocialMedia() {
//     const String mindmapImagePath = 'assets/mindmapify1.jpg'; 
//     XFile mindmapFile = XFile(mindmapImagePath);
//     Share.shareXFiles([mindmapFile], text: 'Check out my mindmap!');
//   }

//   // Method to share the mindmap via a link
//   void _shareViaLink() {
//     const String mindmapLink = 'https://example.com/mindmap'; 
//     Share.share(mindmapLink, subject: 'Check out my mindmap!');
//   }

//   // Method to download the mindmap image
//   Future<void> _downloadMindmap(BuildContext context) async {
//     // Simulate the process of downloading the mindmap
//     const String mindmapImagePath = 'assets/mindmapify1.jpg'; 
//     try {
//       // Show loading indicator
//       _showDownloadDialog(context);

//       // Get the directory to save the file
//       final directory = await getExternalStorageDirectory();
//       final String filePath = '${directory?.path}/mindmapify1.jpg';

//       // Simulate a file download with a delay
//       await Future.delayed(const Duration(seconds: 3));

//       // Using Dio to download (you can replace this with actual download logic if needed)
//       await Dio().download(mindmapImagePath, filePath);

//       // After download completes, close the dialog and show a success message
//       Navigator.pop(context); // Close loading dialog

//       // Show success message
//       _showDownloadCompleteDialog(context, filePath);
//     } catch (e) {
//       Navigator.pop(context); // Close loading dialog
//       _showDownloadErrorDialog(context);
//     }
//   }

//   // Method to show the "Downloading" dialog
//   void _showDownloadDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return const AlertDialog(
//           title: Text('Downloading Mindmap...'),
//           content: CircularProgressIndicator(),
//         );
//       },
//     );
//   }

//   // Method to show the "Download Complete" dialog
//   void _showDownloadCompleteDialog(BuildContext context, String filePath) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Download Complete'),
//           content: Text('Your mindmap has been downloaded to $filePath'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Method to show the "Download Error" dialog
//   void _showDownloadErrorDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Download Failed'),
//           content: Text('An error occurred while downloading your mindmap. Please try again.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mindmapify'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blue, Colors.purple],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // -- Mindmap Message
//               const Text(
//                 'Here is your converted mindmap. Enjoy learning!',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // -- Mindmap Visualization (Image)
//               Center(
//                 child: Container(
//                   width: double.infinity,
//                   height: 300,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 8,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.asset(
//                       'assets/mindmapify1.jpg', // Your mindmap image asset
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // -- Share Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showShareDialog(context); // Show the share dialog
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple, // Button color
//                     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30), // Rounded corners
//                     ),
//                     textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   child: const Text('Share Mindmap'),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // -- Download Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _downloadMindmap(context); // Trigger the download
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green, // Download button color
//                     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30), // Rounded corners
//                     ),
//                     textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   child: const Text('Download Mindmap'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class MindmapScreen extends StatefulWidget {
  const MindmapScreen({super.key});

  @override
  _MindmapScreenState createState() => _MindmapScreenState();
}

class _MindmapScreenState extends State<MindmapScreen> {
  // List to store the downloaded mindmaps
  List<String> downloadedMindmaps = [];

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
    const String mindmapImagePath = 'assets/images/mindmapify2.png'; 
    XFile mindmapFile = XFile(mindmapImagePath);
    Share.shareXFiles([mindmapFile], text: 'Here is my mindmap!');
  }

  // Method to share the mindmap via social media (e.g., Facebook, Twitter)
  void _shareViaSocialMedia() {
    const String mindmapImagePath = 'assets/images/mindmapify2.png'; 
    XFile mindmapFile = XFile(mindmapImagePath);
    Share.shareXFiles([mindmapFile], text: 'Check out my mindmap!');
  }

  // Method to share the mindmap via a link
  void _shareViaLink() {
    const String mindmapLink = 'https://example.com/mindmap'; 
    Share.share(mindmapLink, subject: 'Check out my mindmap!');
  }

  // Method to download the mindmap image
  Future<void> _downloadMindmap(BuildContext context) async {
    const String mindmapImagePath = 'assets/images/mindmapify2.png'; 

    try {
      // Show loading indicator
      _showDownloadDialog(context);

      // Get the directory to save the file
      final directory = await getExternalStorageDirectory();
      final String filePath = '${directory?.path}/images/mindmapify2.png';

      // Simulate a file download with a delay
      await Future.delayed(const Duration(seconds: 3));

      // Using Dio to download (you can replace this with actual download logic if needed)
      await Dio().download(mindmapImagePath, filePath);

      // After download completes, close the dialog and show a success message
      Navigator.pop(context); // Close loading dialog

      // Add downloaded file to the list
      setState(() {
        downloadedMindmaps.add(filePath);
      });

      // Show success message
      _showDownloadCompleteDialog(context, filePath);
    } catch (e) {
      Navigator.pop(context); // Close loading dialog
      _showDownloadErrorDialog(context);
    }
  }

  // Method to show the "Downloading" dialog
  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Downloading Mindmap...'),
          content: CircularProgressIndicator(),
        );
      },
    );
  }

  // Method to show the "Download Complete" dialog
  void _showDownloadCompleteDialog(BuildContext context, String filePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Download Complete'),
          content: Text('Your mindmap has been downloaded to $filePath'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Method to show the "Download Error" dialog
  void _showDownloadErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Download Failed'),
          content: Text('An error occurred while downloading your mindmap. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Method to display downloaded mindmaps
  Widget _buildDownloadsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: downloadedMindmaps.length,
      itemBuilder: (context, index) {
        final mindmapPath = downloadedMindmaps[index];
        return ListTile(
          leading: Image.file(File(mindmapPath), width: 50, height: 50),
          title: Text('Downloaded Mindmap #${index + 1}'),
          subtitle: Text(mindmapPath),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                downloadedMindmaps.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindmapify'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Mindmap Message
              const Text(
                'Here is your converted mindmap. Enjoy learning!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // -- Mindmap Visualization (Image)
              Center(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/mindmapify2.png', // Your mindmap image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // -- Share Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showShareDialog(context); // Show the share dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Share Mindmap'),
                ),
              ),
              const SizedBox(height: 20),

              // -- Download Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _downloadMindmap(context); // Trigger the download
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Download button color
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Download Mindmap'),
                ),
              ),
              const SizedBox(height: 20),

              // -- Downloads List
              const Text(
                'Downloaded Mindmaps:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Expanded(child: _buildDownloadsList()), // Display downloaded mindmaps
            ],
          ),
        ),
      ),
    );
  }
}
