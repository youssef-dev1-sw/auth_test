
import 'package:auth_test/views/firstbage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auth_test/models/product_request.dart';
import 'package:auth_test/notifiers/product_notifier.dart';
import 'package:auth_test/providers/product_provider.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> addProduct() async {
    final name = nameController.text.trim();
    final price = double.tryParse(priceController.text.trim());

    if (name.isEmpty || price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter a valid name and price'),
        ),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final product = ProductRequest(
        name: name,
        price: price, 
      );

      await ref
          .read(productNotifierProvider.notifier)
          .productUser(product);

      if (!mounted) return;

      nameController.clear();
      priceController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully'),
        ),
        
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Firstbage(),));
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding product: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Product Price',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : addProduct,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Add Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
