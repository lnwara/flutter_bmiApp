// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({ Key? key , 
  required this.age,
  required this.isMale,
  required this.result,
  }) : super(key: key);

  final int age;
  final bool isMale;
  final double result;

  String get resultPhrase
  {
    String resultPhrase ="";
    if(result>=30) resultPhrase="Obese";
    else if (result >25 && result <30) resultPhrase="Overwieght";
    else if (result >18.5 && result <24.9) resultPhrase="Normal";
    else  resultPhrase="Thin";
    
   
    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result'),),
      body: SafeArea(child: 
      Center(
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: 
      [
        Text('Gender : ${isMale? 'Male' : 'Female'}',
        style: Theme.of(context).textTheme.headline1 ,),
        Text('Age : ${age.toString()}',
        style: Theme.of(context).textTheme.headline1),
        Text('Result : ${result.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.headline1),
        Text('Healthness : $resultPhrase',
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,),
      ],),),),
    );
  }
}