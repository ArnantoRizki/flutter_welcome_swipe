import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class WelcomeModel{  
  String title;
  String gambar;
  String konten;  
  Color backcolor;

  WelcomeModel({
      this.backcolor:Colors.white,
      @required this.title,
      @required this.gambar,
      @required this.konten
    });
}

class WelcomeModelListHandler{
  List<WelcomeModel> container;
  int position = 0;

  WelcomeModelListHandler({
    @required this.container
  });

  int getWelcomePosition(){
    return position + 1;
  }

  void setWelcomePosition(SlideCommand commarg){
    if(commarg == SlideCommand.naik){
      position == container.length-1?position=position:position=position+1;
    }else if(commarg == SlideCommand.turun){      
      position == 0?position=position:position=position-1;
    }    
  }

  void setWelcomeIndex(int idx){
    position = idx;
  }

  String getWelcomeTitle(){
    return container[position].title;
  }

  String getWelcomeImage(){
    return container[position].gambar;
  }

  String getWelcomeKonten(){
    return container[position].konten;
  }

  int getWelcomeLength(){
    return container.length;
  }

  Color getWelcomeBackColor(){
    return container[position].backcolor;
  }
}

enum SlideCommand{
  naik,
  turun
}