import 'package:flutter/material.dart';

class MenuItem {
  final String itemName;
  final String itemDescription;
  final String itemPrice;
  final String imageUrl;
  final String category;

  const MenuItem({
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.imageUrl,
    required this.category,
  });
}

class MenuPage extends StatelessWidget {
  final List<MenuItem> itemList = const [
    MenuItem(
      itemName: 'Çay',
      itemDescription: 'Sıcak ve rahatlatıcı bir içecek',
      itemPrice: '5',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'İçecekler',
    ),
    MenuItem(
      itemName: 'Kahve',
      itemDescription: 'Taze kavrulmuş kahve',
      itemPrice: '7',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'İçecekler',
    ),
    MenuItem(
      itemName: 'Hamburger',
      itemDescription: 'Leziz bir hamburger menüsü',
      itemPrice: '20',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'Yiyecekler',
    ),
    MenuItem(
      itemName: 'Pizza',
      itemDescription: 'Fırından yeni çıkmış nefis pizza',
      itemPrice: '30',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'Yiyecekler',
    ),
    MenuItem(
      itemName: 'Salata',
      itemDescription: 'Taze ve sağlıklı salatalar',
      itemPrice: '15',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'Yiyecekler',
    ),
    MenuItem(
      itemName: 'Makarna',
      itemDescription: 'İtalyan usulü nefis makarna çeşitleri',
      itemPrice: '25',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'Yiyecekler',
    ),
    MenuItem(
      itemName: 'Meyve Suyu',
      itemDescription: 'Taze sıkılmış meyve suları',
      itemPrice: '8',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'İçecekler',
    ),
    MenuItem(
      itemName: 'Tatlı',
      itemDescription: 'Lezzetli tatlılar',
      itemPrice: '12',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'Yiyecekler',
    ),
    MenuItem(
      itemName: 'Çorba',
      itemDescription: 'Ev yapımı çorbalar',
      itemPrice: '10',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'Yiyecekler',
    ),
    MenuItem(
      itemName: 'Meyve',
      itemDescription: 'Hoş meyveler',
      itemPrice: '17',
      imageUrl: 'https://i.imgur.com/eo2bvjQ.jpeg',
      category: 'Yiyecekler',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Restoran Menüsü',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                _CustomTab(icon: Icons.local_cafe, text: 'İçecekler'),
                _CustomTab(icon: Icons.fastfood, text: 'Yiyecekler'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MenuCategory(itemList: itemList, category: 'İçecekler'),
              MenuCategory(itemList: itemList, category: 'Yiyecekler'),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTab extends StatelessWidget {
  final IconData icon;
  final String text;

  const _CustomTab({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}

class MenuCategory extends StatelessWidget {
  final List<MenuItem> itemList;
  final String category;

  const MenuCategory({Key? key, required this.itemList, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        itemList.where((item) => item.category == category).toList();

    int crossAxisCount = MediaQuery.of(context).size.width ~/ 300;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              (MediaQuery.of(context).size.width - crossAxisCount * 300) / 2),
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 3.3,
          ),
          padding: EdgeInsets.zero,
          itemCount: filteredItems.length,
          itemBuilder: (BuildContext context, int index) {
            return MenuItemCard(item: filteredItems[index]);
          },
        ),
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    item.imageUrl,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    item.itemName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Fiyat: ${item.itemPrice} TL',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    item.itemDescription,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Kapat'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.itemName,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Fiyat: ${item.itemPrice} TL',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}