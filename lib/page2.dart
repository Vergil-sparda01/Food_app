import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String imageUrl;
  fi String description;

  const Page2({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  @override
  // ignore: library_private_types_in_public_api
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int likeCount = 0;
  int dislikeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL(widget.videoUrl),
              child: const Text('ไปที่ YouTube'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () {
                    setState(() {
                      likeCount++;
                    });
                  },
                ),
                Text('Likes: $likeCount'),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.thumb_down),
                  onPressed: () {
                    setState(() {
                      dislikeCount++;
                    });
                  },
                ),
                Text('Dislikes: $dislikeCount'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }
}
