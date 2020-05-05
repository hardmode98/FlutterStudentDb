import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UIHelper{

  Widget getRow(MainAxisAlignment mainAxisAlignment , widgets){
    return new Row(
      mainAxisAlignment: mainAxisAlignment,
      children: widgets,
    );
  }

  Padding getPadding(EdgeInsets edgeInsets , Widget child){
    return Padding(padding: edgeInsets  , child: child,);
  }

  Widget showLoading(Color color, {double size}) {
    return Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
            height: size == null ? 23.0 : size,
            width: size == null ? 23.0 : size,
          )
        ],
      ),
    );
  }




}