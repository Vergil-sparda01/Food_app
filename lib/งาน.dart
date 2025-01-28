// ignore: duplicate_ignore
// ignore: file_names, duplicate_ignore
// ignore: file_names, duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

library;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แนะนำอาหารและของว่าง',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const FoodAndSnackScreen(),
    );
  }
}

class FoodAndSnackScreen extends StatelessWidget {
  const FoodAndSnackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("แนะนำอาหารและของว่าง"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "อาหาร",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < 5; i++) FoodItemCard(index: i),
          const SizedBox(height: 24),
          const Text(
            "ของว่าง",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < 3; i++) SnackItemCard(index: i),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'เพิ่ม',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final int index;

  const FoodItemCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final List<String> foodNames = [
      "ซูชิ (Sushi)",
      "ราเมง/ราเมน (Ramen)",
      "ข้าวแกงกะหรี่ (Curry Rice)",
      "สเต็ก (steak)",
      "ร้านเก็ตตี้คาโบนาร่า (Getty Carbonara Shop)"
    ];
    final List<String> foodImages = [
      "https://res.cloudinary.com/jnto/image/upload/w_750,h_450,c_fill,f_auto,fl_lossy,q_60/v1/media/filer_public/21/76/21763f20-40f4-4eca-a420-b193b1dff048/aug24_sushi_12_fkbdja",
      "https://shoppingcenter.centralpattana.co.th/images/default-source/center/blog/japanese-ramen-mobile-1200x630px9fb95856-fd7b-471c-9ea9-621c5bf8c5ff.jpg?sfvrsn=c34bf323_13",
      "https://cdn.media.amplience.net/i/japancentre/Category-769-curry-stew/Buy-Japanese-Curry-And-Stew-Online?&w=1200&h=630&sm=c&fmt=auto",
      "https://img.kapook.com/u/2015/surauch/cook2/steak-1.jpg",
      "https://www.cpbrandsite.com/contents/images/jx3yq7bse5i7aoel78fcq1xbzp7e2e50cxtepunj.png",
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailScreen(foodName: foodNames[index]),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        child: ListTile(
          leading: Image.network(
            foodImages[index],
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            foodNames[index],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FoodDetailScreen(foodName: foodNames[index]),
                ),
              );
            },
            child: const Text("ดูรายละเอียด"),
          ),
        ),
      ),
    );
  }
}

class SnackItemCard extends StatelessWidget {
  final int index;

  const SnackItemCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final List<String> snackNames = [
      "ทาร์ตไข่ (Egg Tart)",
      "โมจิ (Mochi)",
      "บราวนี่ (Brownies)"
    ];
    final List<String> snackImages = [
      "https://www.verasu.com/media/amasty/blog/egg_tart_880x518.jpg",
      "https://image.makewebcdn.com/makeweb/m_1920x0/DFCAvdp6Z/DefaultData/%E0%B9%84%E0%B8%97%E0%B8%9F%E0%B8%B9%E0%B8%81%E0%B8%B8%E0%B9%82%E0%B8%A1%E0%B8%88%E0%B8%B4.jpg",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Several_brownies.jpg/200px-Several_brownies.jpg",
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SnackDetailScreen(snackName: snackNames[index]),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        child: ListTile(
          leading: Image.network(
            snackImages[index],
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            snackNames[index],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SnackDetailScreen(snackName: snackNames[index]),
                ),
              );
            },
            child: const Text("ดูรายละเอียด"),
          ),
        ),
      ),
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final String foodName;

  const FoodDetailScreen({super.key, required this.foodName});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> foodDetails = {};

    return Scaffold(
      appBar: AppBar(title: Text("รายละเอียด $foodName")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ชื่ออาหาร: $foodName",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "รายละเอียด: ${foodDetails[foodName] ?? 'ชินเล็กกินง่ายมีหลายรสชาติ'}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SnackDetailScreen extends StatelessWidget {
  final String snackName;

  const SnackDetailScreen({super.key, required this.snackName});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> snackDetails = {};

    return Scaffold(
      appBar: AppBar(title: Text("รายละเอียด $snackName")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ชื่อขนม: $snackName",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "รายละเอียด: ${snackDetails[snackName] ?? 'มีรสหวาน สัมผัสนุ่มลิ้นละลายในปาก'}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
