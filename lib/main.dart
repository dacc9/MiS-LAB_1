import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> clothes = [
    {
      'name' : 'ECKO Vintage Y2k Bomber',
      'image' : 'https://i.etsystatic.com/28328770/r/il/ab4d86/4009796955/il_1080xN.4009796955_p1dd.jpg',
      'description' : 'size: XL, colors: red, white, black',
      'price' : '2300 MKD'
    },
    {
      'name' : 'ECKO Beanie Black',
      'image' : 'https://kmartau.mo.cloudinary.net/c34c33de-f9e3-4501-b560-932f3b982193.jpg?tx=c_fill,w_3840,h_4800',
      'description' : 'colors: red, black',
      'price' : '600 MKD'
    },
    {
      'name' : 'ECKO Varsity Jacket',
      'image' : 'https://i.etsystatic.com/27501647/r/il/cb9516/3606615537/il_fullxfull.3606615537_s0bc.jpg',
      'description' : 'size: XL, colors: grey, black, white',
      'price' : '2200 MKD'
    },
    {
      'name' : 'ECKO Baggy Y2k Jeans',
      'image' : 'https://slimages.macysassets.com/is/image/MCY/products/3/optimized/16656843_fpx.tif?op_sharpen=1&wid=700&hei=855&fit=fit,1',
      'description' : 'size: L, colors: light blue',
      'price' : '2350 MKD'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('212027'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index){
          final item = clothes[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(item['image']),
              title: Text(item['name']),
              subtitle: Text(item['price']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  )
                );
              }
            )
          );
        },
      )
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailScreen({Key? key, required this.item}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(item['image'], height: 200),
            ),
            SizedBox(height: 20),
            Text(
              item['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              item['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Price: ${item['price']}',
              style: TextStyle(fontSize: 20, color: Colors.green)
            ),
          ],
        )
      ),
    );
  }
}