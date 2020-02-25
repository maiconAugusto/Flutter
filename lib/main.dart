import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}
class MyAppState  extends State<MyApp>{
  TextEditingController peso = TextEditingController();
  TextEditingController altura  = TextEditingController();
  String score = '';

  analyze(){
      if(peso.text == null || peso.text == ""){
         setState(() {
           score = "Dados icompletos";
         });
         return;
      }
    setState(() {
      double pesoUsuario = double.parse(peso.text);
      double alturaUsuario = double.parse(altura.text);
      double imc = pesoUsuario / (alturaUsuario * alturaUsuario);
      print("$pesoUsuario $alturaUsuario");
      if(imc < 18.5){
        score = "Abaixo do peso: ${imc.toStringAsPrecision(3)}";
      }
      if( imc >= 18.6 && imc < 24.9){
        score = "Saudável: IMC ${imc.toStringAsPrecision(3)}";
      }
      if(imc >= 25 && imc < 29.9){
        score = "Sobre peso: IMC ${imc.toStringAsPrecision(3)}";
      }
      if(imc >= 30 && imc < 34.9){
        score = "Obesidade 1: IMC ${imc.toStringAsPrecision(3)}";
      }
      if(imc >= 35 && imc <= 39.9){
        score = "Obesidade 2: IMC ${imc.toStringAsPrecision(3)}";
      }
      if(imc >40){
        score = "Obesidade 3: IMC ${imc.toStringAsPrecision(3)}";
      }
    });
  }
  resetStates(){
    peso.text = "";
    altura.text = "";
    setState(() {
      score="";
    });
  }
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("IMC"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: resetStates,
              icon: Icon(Icons.refresh, color: Colors.blue[50],),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: 
            Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Icon( Icons.person,color: Colors.blue[300],size: 70 ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso'
                  ),
                  controller: peso,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Altura'
                  ),
                  controller: altura,
                ),
              ],),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              height: 50.0,
              child: RaisedButton(
                color: Colors.blue[400],
                onPressed: analyze, 
                child: Text('Calcular',style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            ),
            Center(child: Text(score,style: TextStyle(fontSize: 16,color: Colors.red)))
          ]),
        )
      ),
    );
  }
}

class MyApp extends StatefulWidget{
  MyAppState createState(){
    return MyAppState();
  }
}