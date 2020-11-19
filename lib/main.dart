import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List lista;

  TextEditingController _listaController;

  void entregarLista(){
    setState(() {
      lista=_listaController.text.toString().split(",");
    });
  }

   @override
  void initState(){
    super.initState();
    _listaController = TextEditingController();
    //_listaController.addListener(() {entregarLista();});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body:SingleChildScrollView(child:
        Center(child:Column(
          children:[
            TextField(controller: _listaController,textAlign: TextAlign.center,),
            RaisedButton(onPressed: ()=> entregarLista(),child: Text("Go"),color: Colors.yellow[700],),
            Container(
              //height: MediaQuery.of(context).size.height,
              //width: MediaQuery.of(context).size.width,
              child:LayoutBuilder(
                builder: (context, contrains) {
                    if (contrains.maxWidth > 600) {
                      return _buildWideContainers();
                    } else {
                      return _buildNormalContainer();
                    }
                },
              ),
            ),
          ]
        ),
      ),
    )
    );
  }

  Widget _buildNormalContainer() {
    return Row(children: [
      for(int i=0;i<lista.length;i++)...{
          Expanded(
            child:
            Container(
              alignment: Alignment.topCenter,
              width: 100*(double.parse(lista[i])),
              height: 10*(double.parse(lista[i])),
              decoration: BoxDecoration(border: Border.all(color:Colors.blue)),
              child:Column(children: [
                Text(lista[i],textAlign: TextAlign.center,),
              ],)
            )
        )
      }
    ],);
    
    
    
   
  }

  Widget _buildWideContainers() {
        return Row(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      );
  }


}
