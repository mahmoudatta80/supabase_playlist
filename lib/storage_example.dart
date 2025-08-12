import 'dart:developer';
import 'dart:io';

import 'package:chat_app/supabase_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorageExample extends StatefulWidget {
  const StorageExample({super.key});

  @override
  State<StorageExample> createState() => _StorageExampleState();
}

class _StorageExampleState extends State<StorageExample> {
  String? imageUrl;

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    final File imageFile = File(image.path);
    return imageFile;
  }

  Future uploadImage() async {
    final imageFile = await pickImage();
    if (imageFile == null) return;
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final uniqueImagePath = '${timeStamp}_${imageFile.path.split('/').last}';
    // 1755005735301_44515647-3c9e-410d-9984-a02dee501f1f2750604744369829643.jpg
    try {
      await SupabaseHelper.client.storage
          .from('avatars')
          .upload(uniqueImagePath, imageFile);
      imageUrl = SupabaseHelper.client.storage
          .from('avatars')
          .getPublicUrl(uniqueImagePath);
      log(imageUrl!);
      setState(() {});
    } catch (error) {
      log('error is: ${error.toString()}');
    }
  }

  Future deleteImage() async {
    if (imageUrl == null) return;
    final imagePath = imageUrl!.split('/').last;
    try {
      await SupabaseHelper.client.storage.from('avatars').remove([imagePath]);
      setState(() {
        imageUrl = null;
      });
    } catch (error) {
      log('error is: ${error.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Supabase Storage Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl == null
                ? const Text('No image uploaded')
                : Image.network(imageUrl!, height: 250),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: uploadImage,
              child: const Text('Upload Image'),
            ),
            ElevatedButton(
              onPressed: deleteImage,
              child: const Text('Delete Image'),
            ),
          ],
        ),
      ),
    );
  }
}
