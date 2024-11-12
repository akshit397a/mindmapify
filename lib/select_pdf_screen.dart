import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SelectPdfScreen extends StatefulWidget {
  const SelectPdfScreen({super.key});

  @override
  _SelectPdfScreenState createState() => _SelectPdfScreenState();
}

class _SelectPdfScreenState extends State<SelectPdfScreen> {
  Map<String, String> _fileDetails = {
    'fileName': 'No file selected',
    'fileSize': '',
    'filePath': '',
  };

  // Method to pick the PDF file
  Future<void> _pickPdfFile() async {
    // Pick a PDF file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // If a file is selected, update the file details
      String fileName = result.files.single.name;
      String fileSize = _formatFileSize(result.files.single.size);
      String filePath = result.files.single.path ?? "Unknown Path";

      setState(() {
        _fileDetails = {
          'fileName': fileName,
          'fileSize': fileSize,
          'filePath': filePath,
        };
      });

      // Optionally, show a dialog with file details
      _showFileDetailsDialog();
    } else {
      // If no file is selected, update the message
      setState(() {
        _fileDetails = {'fileName': 'No file selected', 'fileSize': '', 'filePath': ''};
      });
    }
  }

  // Helper function to format file size
  String _formatFileSize(int size) {
    if (size < 1024) {
      return '$size bytes';
    } else if (size < 1024 * 1024) {
      return '${(size / 1024).toStringAsFixed(2)} KB';
    } else {
      return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
  }

  // Show the file details in a dialog
  void _showFileDetailsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("File Selected"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('File Name: ${_fileDetails['fileName']}'),
            Text('File Size: ${_fileDetails['fileSize']}'),
            Text('File Path: ${_fileDetails['filePath']}'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select from Device'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Select PDF Section
            const Text(
              'Select a PDF file from your device:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickPdfFile,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Browse PDF"),
            ),
            const SizedBox(height: 20),

            // Display the file details
            _fileDetails['fileName'] == 'No file selected'
                ? const Text(
                    'No file selected yet.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                : Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.picture_as_pdf, color: Colors.red),
                              const SizedBox(width: 10),
                              const Text(
                                'File Name:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Text(_fileDetails['fileName'] ?? ''),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.insert_drive_file, color: Colors.blue),
                              const SizedBox(width: 10),
                              const Text(
                                'File Size:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Text(_fileDetails['fileSize'] ?? ''),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.folder_open, color: Colors.green),
                              const SizedBox(width: 10),
                              const Text(
                                'File Path:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  _fileDetails['filePath'] ?? '',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
