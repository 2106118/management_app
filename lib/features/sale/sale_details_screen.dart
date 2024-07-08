import 'package:flutter/material.dart';
import 'package:management_app/core/models/sale_model.dart';

class DetailScreen extends StatelessWidget {
  final Reseler reselers;

  const DetailScreen({Key? key, required this.reselers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reselers.buyer),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: Text(
                reselers.buyer,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Phone: ${reselers.phone}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: ${reselers.date}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Status: ${reselers.status}',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
