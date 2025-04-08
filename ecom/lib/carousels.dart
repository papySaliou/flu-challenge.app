import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousels extends StatefulWidget {
  final String selectedColor;
  

  const Carousels({super.key, this.selectedColor = 'Bleu'});

  @override
  State<Carousels> createState() => _CarouselsState();
}

class _CarouselsState extends State<Carousels> {
  final List<String> colors = ['Bleu', 'Vert', 'Rose'];
  bool isFavorite = false;

  final Map<String, String> colorToImage = {
    'Bleu': 'assets/images/image3.png',
    'Vert': 'assets/images/image2.png',
    'Rose': 'assets/images/image1.png',
  };

  late String selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.shopping_bag_outlined),
          ),
          // SizedBox(width: 10),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),

        children: [
          // SizedBox(height: 10),

          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(8),
                child: Image.asset(
                  colorToImage[selectedColor]!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ],
            options: CarouselOptions(height: 180, aspectRatio: 16 / 8),
          ),

          SizedBox(height: 15),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Nouveau',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Color(0xFFFF8400),
              ),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Apple Airpods Max',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.star, color: Color(0xFFFFDD00), size: 15),
                SizedBox(width: 10),
                Text(
                  '4.5 (278 avis)',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  '32000 Fcfa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  '65000 Fcfa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    '-56%',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFFFF8400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(colors.length, (index) {
                final colorName = colors[index];
                final isSelected = selectedColor == colorName;

                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedColor = colorName;
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected ? Colors.black : Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      foregroundColor: isSelected ? Colors.black : Colors.grey,
                    ),
                    child: Text(
                      colorName,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color:  Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              child: Text(
                'Les AirPods Max réinventent le casque circum-\nauriculaire avec un transducteur conçu par Apple \npour un son haute fidélité.',
                // maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          
          
                Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
                // SizedBox(width: 30),
                Spacer(),
                TextButton(
  onPressed: () {},
  style: TextButton.styleFrom(
    backgroundColor: Color(0xFFFFDD00),
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  child: Text(
    "Ajouter au panier",
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      
    ),
  ),
),

                SizedBox(width: 30),
              ],
            ),
          ),
              ],
            ),
            );


  }
}
