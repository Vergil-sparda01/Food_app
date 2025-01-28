import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // ใช้สำหรับเปิด URL

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Map<String, String>> foodDetails = [
    {
      'videoUrl': 'https://www.youtube.com/watch?v=ZzLPUoetSHw',
      'title': 'ซูชิ (Sushi)',
      'imageUrl': 'https://res.cloudinary.com/jnto/image/upload/w_750,h_450,c_fill,f_auto,fl_lossy,q_60/v1/media/filer_public/21/76/21763f20-40f4-4eca-a420-b193b1dff048/aug24_sushi_12_fkbdja',
      'description': 'ซูชิ (Sushi) มีหลายชินเล็กๆทำให้ทานง่ายมีหลายรสชาติให้เลือกกิน'
    },
    {
      'videoUrl': 'https://www.youtube.com/watch?v=r3_tcQiyGG8',
      'title': 'ราเมง/ราเมน (Ramen)',
      'imageUrl': 'https://shoppingcenter.centralpattana.co.th/images/default-source/center/blog/japanese-ramen-mobile-1200x630px9fb95856-fd7b-471c-9ea9-621c5bf8c5ff.jpg?sfvrsn=c34bf323_13',
      'description': 'ราเมง/ราเมน (Ramen) เป็นอาหารเส้นที่นุ่มชุ่มปากมากๆมีรสปรุงได้หลากหลาย'
    },
    {
      'videoUrl': 'https://www.youtube.com/watch?v=UuOI5uT00T4',
      'title': 'ข้าวแกงกะหรี่ (Curry Rice)',
      'imageUrl': 'https://cdn.media.amplience.net/i/japancentre/Category-769-curry-stew/Buy-Japanese-Curry-And-Stew-Online?&w=1200&h=630&sm=c&fmt=auto',
      'description': 'ข้าวแกงกะหรี่ (Curry Rice) เป็นอาหารที่กินแล้วอิ่มมากเพราะมีวัตถุดิบที่เข้มข้นมีเนื้อมีมันและซอสหร่อยมากๆ'
    },
    {
      'videoUrl': 'https://www.youtube.com/watch?v=AmC9SmCBUj4',
      'title': 'สเต็ก (steak)',
      'imageUrl': 'https://img.kapook.com/u/2015/surauch/cook2/steak-1.jpg',
      'description': 'สเต็ก (steak) ได้อารมคนชอบกินเนื้อหรืออาหารที่ไม่ยุ่งยากในการทำมากๆ'
    },
  ];

  final List<Map<String, String>> dessertDetails = [
    {
      'videoUrl': 'https://www.youtube.com/watch?v=fEf1cMnaPkY',
      'title': 'ทาร์ตไข่ (Egg Tart)',
      'imageUrl': 'https://www.verasu.com/media/amasty/blog/egg_tart_880x518.jpg',
      'description': 'ทาร์ตไข่ (Egg Tart) ขนมหวานๆกินไปละลายในปากอร่อยมากๆ'
    },
    {
      'videoUrl': 'https://www.youtube.com/watch?v=sTlbqr12bQk',
      'title': 'โมจิ (Mochi)',
      'imageUrl': 'https://image.makewebcdn.com/makeweb/m_1920x0/DFCAvdp6Z/DefaultData/%E0%B9%84%E0%B8%97%E0%B8%9F%E0%B8%B9%E0%B8%81%E0%B8%B8%E0%B9%82%E0%B8%A1%E0%B8%88%E0%B8%B4.jpg',
      'description': 'โมจิ (Mochi) นุ่มเหนียวเขี้ยวมันมากๆ'
    },
    {
      'videoUrl': 'https://www.youtube.com/watch?v=X9hKRIQ3uxc&t=358s',
      'title': 'บราวนี่ (Brownies)',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Several_brownies.jpg/200px-Several_brownies.jpg',
      'description': 'บราวนี่ (Brownies) มีรสช็อกโกแลตเข้มข้นหอมหวานอร่อยมากๆ'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pongsakorn Wongyai'),
        backgroundColor: Colors.blue,
      ),
      body: CustomScrollView(
        slivers: [
          // ส่วนอาหาร
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'อาหารแนะนำ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildMenuLink(
                  foodDetails[index]['title']!,
                  context,
                  foodDetails[index]['videoUrl']!,
                  foodDetails[index]['imageUrl']!,
                  foodDetails[index]['description']!,
                );
              },
              childCount: foodDetails.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'อาหารว่าง',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildMenuLink(
                  dessertDetails[index]['title']!,
                  context,
                  dessertDetails[index]['videoUrl']!,
                  dessertDetails[index]['imageUrl']!,
                  dessertDetails[index]['description']!,
                );
              },
              childCount: dessertDetails.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuLink(String title, BuildContext context, String videoUrl, String imageUrl, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imageUrl,
            width: 45,
            height: 25,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Icon(Icons.error));
            },
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page2(
                  videoUrl: videoUrl,
                  title: title,
                  imageUrl: imageUrl,
                  description: description,
                ),
              ),
            );
          },
          child: const Text('หน้าถัดไป'),
        ),
      ],
    );
  }
}

class Page2 extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String imageUrl;
  final String description;

  const Page2({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  @override
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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }
}

