import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home:BMICalculator(),
    );
  }
}
class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int currentindex=0;
  String result="";
  double last=0;
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "BMI - Calculator : ",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue,0),
                    radioButton("Women", Colors.pinkAccent,1),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Enter your height in meter. : ",
                style: TextStyle(
                  fontSize: 18,
                ),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: " Your height in meter  ",
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Enter your weight in kg. : ",
                  style: TextStyle(
                    fontSize: 18,
                  ),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: " Your weight in kg  ",
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(

                 // height: 70,
                  //alignment: Alignment.center,
                  child: FlatButton(
                    height: 50,
                    onPressed: (){
                      double height=double.parse(heightController.value.text);
                      double weight=double.parse(weightController.value.text);
                      calculateBmi(height,weight);
                      last=double.parse(result);
                    },
                    color: Colors.amber,
                    child:Text("Calculate - BMI",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                  ),

                ),
                SizedBox(height: 40,),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( "Your Body Mass Index is : $result",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                ),
                SizedBox(height: 30,),
                getWidget(currentindex,last),
              ],

            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi (double height, double weight){
    double a= weight/(height*height);
    String bmi= a.toStringAsFixed(2);
    setState(() {
      result=bmi;
    });
}
  void changeIndex(int index) {
    setState(() {
      currentindex=index;
    });
  }
  Widget radioButton (String value,Color color, int index){
    return Expanded(child: Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: FlatButton(
        color: currentindex== index ? color : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: (){
          changeIndex(index);
        },
        child: Text(value,
        style: TextStyle(
            color: currentindex==index? Colors.white : color,
            fontSize: 22 ,
            fontWeight: FontWeight.bold,
        ),
        ),
      ),
    ));
  }
  Widget getWidget(int currentIndex,double result)
  {
    if(currentindex==1)
      if(result<18.5){
       return Text("Hey !!! Women you are underweight.. : ",
       style: TextStyle(
         fontWeight: FontWeight.bold,
         color: Colors.pinkAccent,
         fontSize: 25,
       ),);}
      else{return Text("Hey !!! Women your weight is normal.. : ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.pinkAccent,
          fontSize: 25,
        ),);}

    else{
      if(result<18.5){
        return Text("Hey !!! Man you are underweight.. : ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 25,
          ),);}
      else{return Text("Hey !!! Man your weight is normal.. : ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontSize: 25,
        ),);}
    }


  }

}


