// ignore_for_file: file_names

import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

bool isMale = false;
double hight=155;
int age = 26;
int weight=48;

  @override
  Widget build(BuildContext context) {
       
    return Scaffold(
      appBar: AppBar(title: const Text('Body Mass Index'),centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(      
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  box(context,true),
                  const SizedBox(width: 20,),
                  box(context, false)
                ],
              ),
            ),
          ),
            Expanded(      
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                color:  Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Hieght', style: Theme.of(context).textTheme.headline2,),
                    const SizedBox(width: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                    Text(hight.toStringAsFixed(2), style: Theme.of(context).textTheme.headline1,),
                    Text('cm', style: Theme.of(context).textTheme.bodyText1,),
              
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Slider(
                      value: hight, 
                      min :90, 
                      max:220,
                      onChanged:(newValue){setState(() {
                        hight=newValue;
                      });} )
                    
                  ],
                ),
              ),
            ),
          ),
            Expanded(      
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12,vertical: MediaQuery.of(context).size.height/80),
              child: Row(
                children: [
                  boxWithCounter(context,'Age'),
                  const SizedBox(width: 20,),
                  boxWithCounter(context, 'Weight')
                ],
              ),
            ),
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Container
            (
              width: double.infinity,
              height: MediaQuery.of(context).size.height/10,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.teal),

              child: TextButton(
                child: Text('Calculate',
                style: Theme.of(context).textTheme.headline1,),
                onPressed: () 
                {
                  double result = weight /pow(hight/100, 2);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Result(age: age, isMale: isMale, result: result)));
                  
                },
                ),
                
            ),
          )
          ]),
      ),
    
    );
  }

  Expanded box(BuildContext context, bool type) {
    return Expanded(
          child: GestureDetector(
            onTap: (()=>setState(()=>isMale=type?true: false )),
            child: Container(
              decoration: BoxDecoration(
                color: (isMale && type)|| (!isMale&&!type)? Colors.teal: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(type ?Icons.male:Icons.female,
                   color: Theme.of(context).iconTheme.color,
                    size: 100,),
                   const SizedBox(height: 15,),
                   Text(type ?'Male':'Female', 
                   style: Theme.of(context).textTheme.headline2,),
            
               
                ],
              ),
            ),
          ),
        );
  }


  Expanded boxWithCounter(BuildContext context, String type) {
    return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color:  Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(type, 
                 style: Theme.of(context).textTheme.headline2,),
                 const SizedBox(height: 15,),
                 Text(type=='Age' ? '$age' : '$weight', 
                 style: Theme.of(context).textTheme.headline1,),
                 const SizedBox(height: 15,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     FloatingActionButton(
                      heroTag: type=='Age' ? 'age++' :'weight++',
                      child: const Icon(Icons.add ), 
                      mini: true,
                      onPressed: ()=> setState(() 
                     {
                       type=='Age' ? age++ :weight++;
                     })),
                     
                     FloatingActionButton( 
                      heroTag: type=='Age' ? 'age--' :'weight--',
                      child: const Icon(Icons.remove ), 
                      mini: true,
                      onPressed: ()=> setState(() 
                     {
                       type=='Age' ? age-- :weight--;
                     })
                     ),

                   ],
                 )
                 
          
             
              ],
            ),
          ),
        );
  }

}
