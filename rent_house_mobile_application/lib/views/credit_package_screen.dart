import 'package:flutter/material.dart';

import '../models/CreditPackage.dart';
import '../services/CreditService.dart';


class CreditPackageScreen extends StatefulWidget {
  const CreditPackageScreen({super.key});

  @override
  State<CreditPackageScreen> createState() => _CreditPackageScreenState();
}

class _CreditPackageScreenState extends State<CreditPackageScreen> {
  late Future<List<CreditPackage>> futureCreditPackages;
  final CreditService creditService = CreditService(baseUrl: "http://10.0.2.2:8080/api");

  @override
  void initState() {
    super.initState();
    futureCreditPackages = creditService.getAllCreditPackages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credit Packages"),
      ),
      body: FutureBuilder<List<CreditPackage>>(
        future: futureCreditPackages,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No credit packages available."));
          }

          final packages = snapshot.data!;
          return ListView.builder(
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final pkg = packages[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(pkg.name),
                  subtitle: Text("Credits: ${pkg.creditAmount}"),
                  trailing: Text("\$${pkg.price.toStringAsFixed(2)}"),
                  onTap: () {
                    // TODO: Implement purchase logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Selected package: ${pkg.name}")),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
