import 'package:flutter/material.dart';
import 'package:tarea3/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool keepSessionOpen = false;

  @override
  Widget build(BuildContext context) {

    TextEditingController txtConUser = TextEditingController();
    TextEditingController txtConPass = TextEditingController();
    final txtUser = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(
        border: OutlineInputBorder()
      ),
    );

    final txtPass = TextField(
      controller: txtConPass,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder()
      )
    );


    final btnEntrar = FloatingActionButton.extended(
      icon: Icon(Icons.login),
      label: Text('Entrar'),
      onPressed: (){
        if (keepSessionOpen) {

        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      /*onPressed: () => 
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomeScreen()))*/
    );

    
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: .7,
            fit: BoxFit.fill,
            image: NetworkImage(
              'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80')
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 300,
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //color: Colors.white
                ),
                child: Column(
                  children: [
                    txtUser,
                    const SizedBox(height: 10,),
                    txtPass,
                    Row(
                      children: [
                        Checkbox(
                          value: keepSessionOpen,
                          onChanged: (bool? value) {
                            setState(() {
                              keepSessionOpen = value ?? false;
                            });
                        }
                        ),
                        Text('Mantener sesion abierta')
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: btnEntrar,
    );
    
  }
}