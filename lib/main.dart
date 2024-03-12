import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController  = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(child: Text('Your BMI')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('BMI', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),

                SizedBox (height: 21,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kg.'),
                    prefixIcon: Icon(Icons.line_weight_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox (height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in Feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox (height: 11,),

                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox (height: 21),

                ElevatedButton(onPressed: () {

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();

                  if(wt!="" && ft!="" && inch!=''){
                    // BMI Calculation

                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (ift*12)+ iInch;

                    var tcm = tInch*2.54;

                    var tm = tcm/100;

                    var bmi = iwt/(tm*tm);
                    var msg = "";

                    if(bmi>25){
                      msg = "You are Overweight!!!";
                      bgColor = Colors.orange;
                    }else if(bmi<18){
                      msg = 'You are Underweight!!!';
                      bgColor = Colors.red;
                    }else {
                      msg = "You are Healthy";
                      bgColor = Colors.green;
                    }

                          setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(3)}";
                    });
                    //result = "Your BMI is: $bmi";

                  }else{
                    setState(() {
                      result = "Please fill all the required Blanks!!";
                    });
                  }
                }, child: Text('Calculate')),

                SizedBox (height: 11,),

                Text(result, style:  TextStyle(fontSize: 15),)
              ],
            ),
          ),
        ),
      )

    );
  }
}
