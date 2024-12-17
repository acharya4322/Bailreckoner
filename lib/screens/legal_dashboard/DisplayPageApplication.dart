// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class NotificationsPage extends StatelessWidget {
//   const NotificationsPage({Key? key}) : super(key: key);

//   // Function to delete a document from Firestore
//   Future<void> _deleteNotification(String docId, BuildContext context) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('legalAidRequests')
//           .doc(docId)
//           .delete();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Notification deleted successfully!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error deleting notification: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//         backgroundColor: Colors.indigo,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('legalAidRequests')
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(
//                 child: Text('No notifications yet.',
//                     style: TextStyle(fontSize: 16)));
//           }

//           // Display the list of notifications
//           return ListView(
//             children: snapshot.data!.docs.map((doc) {
//               final data = doc.data() as Map<String, dynamic>;
//               final docId = doc.id;

//               return Card(
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 elevation: 3,
//                 child: ListTile(
//                   leading:
//                       const Icon(Icons.notifications, color: Colors.indigo),
//                   title: Text(data['name'] ?? 'No Name Provided',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16)),
//                   subtitle: Text(
//                     data['reason'] ?? 'No Reason Provided',
//                     style: const TextStyle(fontSize: 14, color: Colors.black54),
//                   ),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {
//                           _deleteNotification(docId, context);
//                         },
//                       ),
//                       const Icon(Icons.chevron_right, color: Colors.grey),
//                     ],
//                   ),
//                   onTap: () {
//                     _showDetails(context, data);
//                   },
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }

//   // Function to show notification details
//   void _showDetails(BuildContext context, Map<String, dynamic> data) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(data['name'] ?? 'Details'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Contact: ${data['contact'] ?? 'N/A'}'),
//             const SizedBox(height: 8),
//             Text('Reason: ${data['reason'] ?? 'No Reason Provided'}'),
//             const SizedBox(height: 8),
//             if (data['documentUrl'] != null)
//               TextButton.icon(
//                 onPressed: () {
//                   // Open the uploaded document
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Opening Document: ${data['documentUrl']}'),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.download),
//                 label: const Text('View Attached Document'),
//               ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }
// }
