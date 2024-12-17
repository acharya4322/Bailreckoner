// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FormPage extends StatefulWidget {
//   @override
//   _FormPageState createState() => _FormPageState();
// }

// class _FormPageState extends State<FormPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _contact = '';
//   String _reason = '';
//   PlatformFile? _file;
//   bool _isUploading = false;

//   // Function to pick a file
//   Future<void> _pickFile() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       setState(() {
//         _file = result.files.first;
//       });
//     }
//   }

//   // Function to upload data to Firebase
//   Future<void> _uploadData() async {
//     if (_formKey.currentState!.validate() && _file != null) {
//       _formKey.currentState!.save();
//       setState(() => _isUploading = true);

//       try {
//         // Upload file to Firebase Storage
//         String fileName = 'documents/${DateTime.now()}_${_file!.name}';
//         UploadTask uploadTask = FirebaseStorage.instance
//             .ref()
//             .child(fileName)
//             .putData(_file!.bytes!);

//         TaskSnapshot snapshot = await uploadTask;
//         String downloadUrl = await snapshot.ref.getDownloadURL();

//         // Save form data and file URL to Firestore
//         await FirebaseFirestore.instance.collection('legalAidRequests').add({
//           'name': _name,
//           'contact': _contact,
//           'reason': _reason,
//           'documentUrl': downloadUrl,
//           'timestamp': FieldValue.serverTimestamp(),
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Form submitted successfully!')),
//         );
//         Navigator.pushNamed(context, '/displayPage');
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: $e')),
//         );
//       } finally {
//         setState(() => _isUploading = false);
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Please fill all fields and attach a file')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Claim Government Legal Aid',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         _buildTextField(
//                           label: 'Name',
//                           onSave: (value) => _name = value!,
//                           validator: (value) =>
//                               value!.isEmpty ? 'Please enter your name' : null,
//                         ),
//                         const SizedBox(height: 16),
//                         _buildTextField(
//                           label: 'Contact Information',
//                           onSave: (value) => _contact = value!,
//                           validator: (value) => value!.isEmpty
//                               ? 'Please enter contact info'
//                               : null,
//                         ),
//                         const SizedBox(height: 16),
//                         _buildTextField(
//                           label: 'Reason for Assistance',
//                           onSave: (value) => _reason = value!,
//                           validator: (value) => value!.isEmpty
//                               ? 'Please explain the reason'
//                               : null,
//                           maxLines: 3,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextButton.icon(
//                   onPressed: _pickFile,
//                   icon: const Icon(Icons.attach_file, size: 24),
//                   label: const Text('Attach Document',
//                       style: TextStyle(fontSize: 16)),
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.blue.shade50,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//                 if (_file != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: ListTile(
//                       leading: const Icon(Icons.insert_drive_file,
//                           color: Colors.blue),
//                       title: Text(_file!.name),
//                       subtitle:
//                           Text('${(_file!.size / 1024).toStringAsFixed(2)} KB'),
//                     ),
//                   ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: _isUploading
//                       ? const CircularProgressIndicator()
//                       : ElevatedButton(
//                           onPressed: _uploadData,
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(double.infinity, 50),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: const Text(
//                             'Submit',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required void Function(String?) onSave,
//     required String? Function(String?) validator,
//     int maxLines = 1,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87)),
//         const SizedBox(height: 8),
//         TextFormField(
//           onSaved: onSave,
//           validator: validator,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.grey.shade100,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
