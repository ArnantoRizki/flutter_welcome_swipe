import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'welcome-model.dart';



class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static WelcomeModelListHandler welcomeHandler = new WelcomeModelListHandler(
    container: [
      WelcomeModel(title: "Cat 1", gambar: 'assets/images/cat-cover1.jpg', konten: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", backcolor: Colors.white),
      WelcomeModel(title: "Cat 2", gambar: 'assets/images/cat-cover2.jpg', konten: "Nunc id pulvinar turpis, sed sollicitudin diam. Mauris et elit sit amet sem condimentum egestas.", backcolor: Colors.white),
      WelcomeModel(title: "Cat 3", gambar: 'assets/images/cat-cover3.jpeg', konten: "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean vitae semper metus.", backcolor: Colors.white),
    ]
  );

  @override
  Widget build(BuildContext context) {
    final basicSlider = CarouselSlider(
      height: 3*MediaQuery.of(context).size.height/4,
      viewportFraction: 1.0,
      autoPlay: false,
      onPageChanged: (idx){
        setState(() {
          welcomeHandler.setWelcomeIndex(idx);
        });
      },
      items: welcomeHandler.container.map((i){
        return Builder(
          builder: (BuildContext context){
            return Padding(
              padding: const EdgeInsets.fromLTRB(10.0,30.0,10.0,8.0),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
                ),
                child: Container(              
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xfffd297b),Color(0xffff655b)],
                    ),
                    image: DecorationImage(
                      image: AssetImage(welcomeHandler.getWelcomeImage()),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 0.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                i.title,
                                textAlign: TextAlign.left,
                                style: TextStyle(color:Colors.white, fontSize: 48.0,  fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 50.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: <Widget>[
                              Text(i.konten, style: TextStyle(color: Colors.white, fontSize: 16.0, fontStyle: FontStyle.italic),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
      enableInfiniteScroll: false,
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(                  
                  color: Colors.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    welcomeHandler.getWelcomePosition()==welcomeHandler.getWelcomeLength()?
                    InkWell(
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0))
                        ),
                        child: Container(
                          width: 180.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xfffd297b),Color(0xffff655b)],
                            )
                          ),
                          child: Center(
                            child: Text('ENTER', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, wordSpacing: 1.0),),
                          ),
                        ),
                      ),
                      onTap: (){
                      },
                    ):
                    Container(),
                    Container(
                      height: 100.0,
                      // color: Colors.grey[50],
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 20.0,
                            bottom: 40.0,
                            child: InkWell(
                              child: Text('SKIP', style: TextStyle(fontSize: 16.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                              onTap: (){
                                setState(() {
                                  basicSlider.jumpToPage(2);
                                  welcomeHandler.setWelcomeIndex(2);
                                });
                              },
                            ),
                          ),
                          Center(
                            child: ListView.builder(
                              itemCount: welcomeHandler.getWelcomeLength(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: ((BuildContext context, int index){
                                return Padding(
                                  padding: welcomeHandler.getWelcomePosition()-1==index? const EdgeInsets.fromLTRB(16.0,8.0,16.0,8.0):const EdgeInsets.all(8.0),
                                  child: welcomeHandler.getWelcomePosition()-1==index?Icon(Icons.pets, color: Colors.red, size: 36.0,):Icon(Icons.pets, color: Colors.grey, size: 24.0),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            basicSlider,
          ],
        ),
      ),
    );
  }
}
