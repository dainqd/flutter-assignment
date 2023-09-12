import 'package:demo_app/widgets/home.dart';
import 'package:flutter/material.dart';
import './profile.dart';
import './favorite.dart';
import './search.dart';
import './detail.dart';

class EcoTourismSpot {
  final String image;
  final String name;
  final int stars;
  final String address;
  final double price;

  EcoTourismSpot(this.image, this.name, this.stars, this.address, this.price);
}

class ListTourArea extends StatelessWidget {
  final List<EcoTourismSpot> ecoTourismSpots = [
    EcoTourismSpot(
        'https://image.vietnamnews.vn/uploadvnnews/Article/2018/6/29/td11751221PM.jpg',
        'Làng Cổ Đường Lâm',
        4,
        'Sơn Tây, Hà Nội',
        100),
    EcoTourismSpot(
        'https://www.uncovervietnam.com/wp-content/uploads/2021/03/tam-dao-national-park-vietnam-lush-green-mountains-1600x1068.jpg',
        'Tam Đảo',
        5,
        'Tam Đảo, Vĩnh Phúc',
        150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khu Du Lịch Sinh Thái'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.purple[50],
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Destination!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ecoTourismSpots.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        ecoTourismSpots[index].image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ecoTourismSpots[index].name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Số sao: ${ecoTourismSpots[index].stars}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Địa chỉ: ${ecoTourismSpots[index].address}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Giá: ${ecoTourismSpots[index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple,
                                  ),
                                  child: Text(
                                      'Detail',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(width: 8),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchTourArea()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoriteScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
