import 'package:flutter/material.dart';
import 'package:lixo/app_controller.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  
  int counter = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column
        (children: [
            UserAccountsDrawerHeader(
            accountName: Text('Ricardo dos Santos'), 
            accountEmail: Text('ricardo@ricardo.com'),
            currentAccountPicture: Image.
            network('https://www.morrademedo.com/wp-content/uploads/2014/09/Hypno.gif'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              subtitle: Text('tela de início'),
              onTap: (){
                print('home');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
        ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          CustomSwitch()
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Contador: $counter'),
          Container(height: 10),
          CustomSwitch(),
          Container(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              )
            ],
          )
        ],
      ),
      ),
         floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
            setState(() {
              counter++;
            });
        },
        ),
      );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
          value: AppController.instance.isDarkTheme,
          onChanged: (value){
            AppController.instance.changeTheme();
          },);
  }
}