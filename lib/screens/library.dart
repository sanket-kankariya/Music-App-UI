import 'package:flutter/material.dart';
import 'package:musicplayerui/constants.dart';
import 'package:musicplayerui/screens/nowplaying.dart';

class Library extends StatelessWidget {


  //Now we will create a template for Genre Card
  Widget genreCard(String img,String title, String foll){
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(gcard)
        ),
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 50,
          ),
          SizedBox(height: 15,),
          Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          SizedBox(height: 5,),
          Text('$foll Followers',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13
            ),
          )
        ],
      )
    );
  }
  //Now we will create a template for Song List
  Widget songsCard(int sr,String img,String title,String artist,String time){
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("$sr"),
            SizedBox(width: 20,),
            CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 30,
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                SizedBox(height: 5,),
                Text(artist,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13
                  ),
                )
              ],
            ),
            Spacer(),
            Text(time),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cwhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text('POPULAR',
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: cblue
              ),
            ),
          ),
          ////Now we will create a Scroll views for different Genres
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                //Now we will call Genre card
                genreCard(pop,"Pop",'751,475'),
                genreCard(hiphop,"HipHop",'548,458'),
                genreCard(country,"Country",'698,125'),
                genreCard(heavymetal,"Heavy Metal",'235,568'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,top: 20),
            child: Text('TRENDING ALBUMS',
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: cblue
              ),
            ),
          ),
          //Container For Trending Songs
          Container(
            width: MediaQuery.of(context).size.width,
            height: 330,
            padding: EdgeInsets.fromLTRB(45, 30, 45, 25),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(scard)
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  songsCard(1, art1, "Blinding Lights","The Weeknd", '3.11'),
                  songsCard(2, art2, "The Box","Roddy Rich", '2.15'),
                  songsCard(3, art3, "Dont Start Now","Dua Lipa", '3.52'),
                  songsCard(4, art4, "Circles","Post Malone", '3.02'),
                  songsCard(5, art5, "Intensions","Justin Bieber", '2.59'),
                ],
              ),
            ),
          ),
          //Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(home,
               scale: 1.1,
              ),
              GestureDetector(
                child: Image.asset(list,
                  scale: 1.1,
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NowPlaying()),
                  );
                },
              ),
              Image.asset(podcast,
               scale: 1.1,
              ),
              Image.asset(search,
               scale: 1.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}