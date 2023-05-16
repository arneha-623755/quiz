import 'package:flutter/material.dart';
import 'package:quiz/qu2.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(margin: EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 250),
            child: Text(
              getQus(),
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),

          ),
        ),SizedBox(
          height: 15,
        ),
        TextButton(style:TextButton.styleFrom(backgroundColor: Colors.green,fixedSize:Size(100, 30) ),
            onPressed: (){check(true);}, child: Text('true',style: TextStyle(color: Colors.white),)),
        SizedBox(
          height: 15,
        ),
        TextButton(style:TextButton.styleFrom(backgroundColor: Colors.red,fixedSize:Size(100, 30) ),
            onPressed: (){check(false);}, child: Text('false',style: TextStyle(color: Colors.white),)),
        SizedBox(
          height: 15,
        ),
Row(
  children:ico,
),
      ],
      ),
      ),
    );
  }
  List question=[
    Quiz(qus: "car have four wheels",ans: true),
    Quiz(qus: "bike have three wheels",ans: false),
    Quiz(qus: "sky color is blue",ans: true),
    Quiz(qus: "human blood color is green",ans: false),
    Quiz(qus: "kerala is the state of america ",ans: false),
    Quiz(qus: "india is a asian country",ans: true),
    Quiz(qus: "malayalam is the mother tongue of kerala",ans: true),
    Quiz(qus: "lional messi is a cricket player",ans: false),
    Quiz(qus: "125 less than 25",ans: false),
    Quiz(qus: "cat have four legs",ans: true)
  ];
  List<Icon> ico=[];
  int count=0;
  int _qusNo=0;
  void nextQus(){
    if(_qusNo < question.length){
      _qusNo++;

    }
  }
  String getQus(){
    return question[_qusNo].qus;
  }
  bool getAns(){
    return question[_qusNo].ans;
  }
  bool isFinished(){
    if(_qusNo >= question.length - 1){
      return true;
    }else{
      return false;
    }
  }
  int reset(){
    _qusNo=0;
    count=0;
    return _qusNo;
  }
  void check(bool answer){
    bool value=getAns();
    setState(() {
      if(isFinished()==true){
        if(count <= 5){
          Alert(context:context,title:'THE END',desc:'YOU ARE FAILED')
              .show();
          reset();
          ico = [];
        }
        else{
          Alert(context:context,
          title:'THE END',
          desc:'YOU ARE PASSED WITH $count marks')
              .show();
          reset();
          ico=[];
        }

      }
      else{
        if(value==answer){
          print(count);
          ico.add(Icon(Icons.check,color: Colors.green,));
          count++;
        }else{
          ico.add(Icon(Icons.close,color: Colors.red,));

        }
        nextQus();
      }
    });
  }
}
