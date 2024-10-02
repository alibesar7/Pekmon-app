import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    var w = size.width;

    List<String> imagePaths = [
      'images/photo_2024-09-21_18-56-50.jpg',
      'images/photo_2024-09-21_18-56-55.jpg',
      'images/photo_2024-09-21_18-56-59.jpg',
      'images/photo_2024-09-21_18-57-04.jpg',
      'images/photo_2024-09-21_18-57-08.jpg',
      'images/photo_2024-09-21_18-57-12.jpg',
      'images/photo_2024-09-21_18-57-34.jpg',
      'images/photo_2024-09-21_18-57-39.jpg',
      'images/photo_2024-09-21_18-57-44.jpg',
      'images/photo_2024-09-21_18-57-57.jpg',
      'images/photo_2024-09-21_18-58-02.jpg',
      'images/photo_2024-09-21_18-58-05.jpg',
    ];

    List<String> names = [
      "Mew", "Gyarados", "Lapras", "Espeon", "Pikachu", "Snorlax", "Jigglypuff",
      "PokeFanon", "Ninetales", "Vaporeon", "Charmander", "Umbreon"
    ];
    List<String>hh=["1.1","2","3","1","3.2","1.2","2.1","1.02","2.03","0.9","2.6","1.9"];
    List<String>ww=["2.1","2.2","1.5","3.2","1.8","1.5","1.1","2.02","2.03","1.6","0.6","3.2"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Poke App",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        leading: Icon(Icons.list, size: 40, color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 23,
              crossAxisSpacing: 20,
            ),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        index: index,
                        imagePaths: imagePaths,
                        names: names, ww: [], hh: [], // Pass the names list here
                      ),
                    ),
                  );
                },
                child: Container(
                  width: w / 10,
                  height: h / 8,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white60,
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePaths[index],
                          height: h / 6.2,
                          width: w / 1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${names[index]}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final int index;
  final List<String> imagePaths;
  final List<String> names;
  final List<String>ww;
  final List<String>hh;
  const SecondScreen({super.key, required this.index, required this.imagePaths, required this.names, required this.ww, required this.hh});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    var w = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${names[index]}",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(width: w, height: h, color: Colors.blueAccent
            ,

            ),
            Center(
              child: Container(
                width: w / 1.2,
                height: h / 1.5,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120, top: 20),
              child: Container(
                width: w / 2.4,
                height: h / 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34,top: 240),
              child: Container( width: w / 1.2,height:h/2.1,color: Colors.white,
               child: Center(
                 child: Column(
                   children: [
                     Text("${names[index]}",style: TextStyle(
                       fontSize: 30,color: Colors.black87,
                       fontWeight: FontWeight.bold,
                     ),),
                     Text("Height :  ${ 0.99+index} cm",style: TextStyle(color: Colors.black54,fontSize: 20),),
                     SizedBox(height: 10,),
                     Text("Width :   ${ 1.2+index} kg",style: TextStyle(color: Colors.black54,fontSize: 20),),
                     SizedBox(height: 10,),
                     Text(" Types",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         ElevatedButton(onPressed:(){},
                             child:  Text("Grass",style: TextStyle(fontSize: 20),),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.yellow
                         )),
                         ElevatedButton(onPressed:(){},
                             child:  Text("Person",style: TextStyle(fontSize: 20))
                         , style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.yellow
                             )),

                       ],
                     ),
                     SizedBox(height: 10,),
                     Text("Weakrnees",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                     SizedBox(height: 15,),
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         ElevatedButton(onPressed:(){},
                             child:  Text("Fire",style: TextStyle(fontSize: 15,color: Colors.white),),
                             style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.redAccent
                             )),
                         ElevatedButton(onPressed:(){},
                             child:  Text("FLy",style: TextStyle(fontSize: 15,color: Colors.white))
                             , style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.redAccent
                             )),
                         ElevatedButton(onPressed:(){},
                             child:  Text("Ice",style: TextStyle(fontSize: 15,color: Colors.white))
                             , style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.redAccent
                             )),
                ]
                     ),
                     SizedBox(height: 5,),
                     Text("Next Evolution",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                     SizedBox(height: 5,),
                     ElevatedButton(onPressed:(){},
                         child:  Text("Verusaur",style: TextStyle(fontSize: 20,color: Colors.white))
                         , style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.green
                         )) ,

                   ],
                 ),
               ),


              ),
            )
          ],
        ),
      ),

      backgroundColor: Colors.blueAccent,
    );
  }
}
