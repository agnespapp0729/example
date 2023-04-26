import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageSize extends StatefulWidget {
  const ImageSize({super.key});

  @override
  State<ImageSize> createState() => _ImageSizeState();
}

class _ImageSizeState extends State<ImageSize> {
  int? _width;
  int? _height;

  Future<void> getImageSize(String imageUrl) async {
    final ByteData data = await NetworkAssetBundle(Uri.parse(imageUrl))
        .load(imageUrl); //here we  read the bytes of an image
    final Uint8List bytes = data.buffer.asUint8List();

    final decodedImage = await decodeImageFromList(bytes); //we decode the bytes

    //then we can get the image dimensions

    setState(() {
      _width = decodedImage.width;
      _height = decodedImage.height;
    });
  }

  final imageUrl =
      'https://hips.hearstapps.com/hmg-prod/images/tunnel-of-love-unphotoshopped-places-1527093488.jpg?resize=480:*';

  @override
  void initState() {
    getImageSize(imageUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Parameters of an image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(imageUrl),
            Text("Width: $_width",
                style: const TextStyle(fontSize: 30, color: Colors.green)),
            Text("Height: $_height",
                style: const TextStyle(fontSize: 30, color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}
