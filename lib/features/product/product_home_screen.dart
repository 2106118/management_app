import 'package:flutter/material.dart';
import 'package:management_app/core/models/product_model.dart';
import 'package:management_app/features/product/product_details_screen.dart';
import 'package:management_app/features/product/product_form_screen.dart';
import 'package:management_app/core/widgets/custom_navigator.dart';
import 'package:management_app/core/services/product_service.dart';

class productPages extends StatefulWidget {
  const productPages({Key? key}) : super(key: key);

  @override
  State<productPages> createState() => _productPagesState();
}

class _productPagesState extends State<productPages> {
  late Future<List<Product>> listProduct;
  final ProductService = ProductApi();

  @override
  void initState() {
    super.initState();
    listProduct = ProductService.fetchProducts();
  }

  void refreshProducts() {
    setState(() {
      listProduct = ProductService.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).popAndPushNamed('/add-product'),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: FutureBuilder<List<Product>>(
          future: listProduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> isiProduct = snapshot.data!;
              return ListView.builder(
                itemCount: isiProduct.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            products: isiProduct[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.grey[900],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isiProduct[index].nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.orange,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Price: Rp ${isiProduct[index].price}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Stock: ${isiProduct[index].qty}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductFormPage(
                                          product: isiProduct[index],
                                        ),
                                      ),
                                    ).then((_) => refreshProducts());
                                  },
                                  icon: const Icon(Icons.edit, color: Colors.orange),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    bool response = await ProductService.deleteProduct(isiProduct[index].id);
                                    if (response == true) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text("Product successfully deleted"),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text("Product failed to delete"),
                                        ),
                                      );
                                    }
                                    refreshProducts();
                                  },
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(
                "${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(type: 'product'),
    );
  }
}
