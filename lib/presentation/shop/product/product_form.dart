import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductFormScreen extends StatelessWidget {
  final String productId;

  ProductFormScreen({required this.productId});

  Future<List<String>> fetchProductImages() async {
    final supabase = Supabase.instance.client;

    final response = await supabase
        .from('product_image')
        .select('image_url')
        .eq('product_id', productId);

    // if (response.error != null) {
    //   print('Fetch error: ${response.error?.message}');
    //   return [];
    // }

    final data = response;
    return data.map((item) => item['image_url'] as String).toList();
  }

  Future<String?> uploadImage(XFile image) async {
    final supabase = Supabase.instance.client;
    final fileName =
        '${productId}_${DateTime.now().millisecondsSinceEpoch}.png';
    final filePath = 'product-images/$fileName';

    final response = await supabase.storage
        .from('your-bucket-name')
        .upload(filePath, image.path as File);

    // if (response.error != null) {
    //   print('Upload error: ${response.error?.message}');
    //   return null;
    // }

    final publicUrl =
        supabase.storage.from('your-bucket-name').getPublicUrl(filePath);
    return publicUrl;
  }

  Future<void> saveImageUrl(String imageUrl) async {
    final supabase = Supabase.instance.client;

    final response = await supabase.from('product_image').insert({
      'product_id': productId,
      'image_url': imageUrl,
    });

    if (response.error != null) {
      print('Insert error: ${response.error?.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<String>>(
            future: fetchProductImages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final images = snapshot.data ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.network(images[index]);
                    },
                  ),
                );
              }
            },
          ),
          ElevatedButton(
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                final imageUrl = await uploadImage(pickedFile);
                if (imageUrl != null) {
                  await saveImageUrl(imageUrl);
                }
              }
            },
            child: Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
