import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:busyist/todo.dart';
import 'package:busyist/new_todo.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:busyist/mains.dart';

//import 'package:todo_app_ui/CardItemModel.dart';

void main() => runApp(new MyApp());

class CardItemModel {

  String cardTitle;
  IconData icon;
  int tasksRemaining;
  double taskCompletion;

  CardItemModel(this.cardTitle, this.icon, this.tasksRemaining, this.taskCompletion);

}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  //TodoIst

  List<Todo> list = List<Todo>();
  SharedPreferences sharedPreferences;

  var appColors = [Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(111, 194, 173, 1.0)];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(231, 129, 109, 1.0);
  var prevImage =  [AssetImage('assets/images/whit.jpg'),AssetImage('assets/images/home.jpg'),AssetImage('assets/images/ocean.jpg'),];

  var cardsList = [CardItemModel("Essay", Icons.assignment, 9, 0.83),CardItemModel("Work", Icons.work, 12, 0.24),CardItemModel("Home", Icons.home, 7, 0.32)];
  
  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  DateTime now = new DateTime.now();
  String cow = DateFormat.yMMMMd("en_US").format(DateTime.now());
//DateFormat('yyyy-MM-dd  kk:mm').format(now);



  



  @override
  Widget build(BuildContext context) {
    var scaffold = new Scaffold(
      backgroundColor: currentColor,
      appBar: new AppBar(
        title: new Text("MELAKU", style: TextStyle(fontSize: 16.0),),
        backgroundColor: currentColor,
        centerTitle: true,
        
        
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          ),
        ],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //onPressed: () => HomeState(),
        onPressed: () {
  Navigator.push(
    context, new MaterialPageRoute(builder: (context) => Home()),
  );
}

      ),
      body: resView(), 
   
    
      drawer: Drawer(),
      
    );
    return scaffold;
  }


  Widget resView(){
    return Center(
        
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    
                    
                  //  const SizedBox(height: 20.0,),
                  Align( 
                    alignment: Alignment.center,
                    child: new CircleAvatar(
                      radius: 35.0,
                      backgroundColor: const Color(0xFF778899),
                    // borderRadius: BorderRadius.circular(25),
                      backgroundImage: AssetImage(
                              'assets/images/wait.jpg', 
                      ), //For Image Asset

                    ),

                    ),
                       Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      
                ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,12.0),
                      child: Text("Hello, Jeniar.", style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w400),),
                    ),
                    Text("Looks like its gonna be a great day!", style: TextStyle(color: Colors.white),),
                    Text("You have 3 tasks to do today.", style: TextStyle(color: Colors.white,),),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                  child: Text("TODAY :  $cow ", style: TextStyle(color: Colors.white),),
                ),
              
                    
                Container(
                 
                  height: 280.0,
                
                  child: ListView.builder(
                                   
                    
                    itemCount: 3,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    //where we are on the count
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        onTap: () {
                            Navigator.push(
                            context, new MaterialPageRoute(builder: (context) => Home()),
                              );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Container(
                              width: 230.0,
                              
                              /* Perfect background, needs padding*/
                              decoration: BoxDecoration(
                                
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              image: DecorationImage(
                              image: prevImage[position], 
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
               
                            )),
                        
                        child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                   


                                        Icon(cardsList[position].icon, color: appColors[position],),
                                        
                                     /*   Icon(Icons.more_vert, color: Colors.grey,),
                                        IconButton(
                                             icon: Icon(Icons.add_circle, color: Colors.orange, size: 40.0),
                                          onPressed: () {
  Navigator.push(
    context, new MaterialPageRoute(builder: (context) => Home()),
  );
}),
*/
                    
                                      ],
                                  
                                    ),
                                  ),
  
                            
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                      
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: <Widget>[
                                       
                                        Padding(

                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                          child: Text("${cardsList[position].tasksRemaining} Tasks", style: TextStyle(color: Colors.grey),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                          child: Text("${cardsList[position].cardTitle}", style: TextStyle(fontSize: 28.0),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: LinearProgressIndicator(value: cardsList[position].taskCompletion,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                             
    
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            
                          ),
                        ),
                        onHorizontalDragEnd: (details) {

                          animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
                          curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
                          animationController.addListener(() {
                            setState(() {
                              currentColor = colorTween.evaluate(curvedAnimation);
                            });
                          });

                          if(details.velocity.pixelsPerSecond.dx > 0) {
                            if(cardIndex>0) {
                              
                              cardIndex--;
                              colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
                            }
                          }else {
                            if(cardIndex<2) {
                              cardIndex++;
                              colorTween = ColorTween(begin: currentColor,
                                  end: appColors[cardIndex]);
                            }
                          }
                          setState(() {
                            scrollController.animateTo((cardIndex)*256.0, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                          });

                          colorTween.animate(curvedAnimation);

                          animationController.forward( );

                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
       // ),
      ),
    );
  }

}



class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin{
  List<Todo> list = new List<Todo>();
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    loadSharedPreferencesAndData();
    super.initState();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Essay Goals',
          key: Key('main-app-title'),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>goToNewItemView(),
      ),
      body: list.isEmpty ? emptyList() : buildListView()
    );
  }

  Widget emptyList(){
    return Center(
    child:  Text('No items')
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context,int index){
        return buildItem(list[index], index);
      },
    );
  }

  Widget buildItem(Todo item, index){
    return Dismissible(
      key: Key('${item.hashCode}'),
      background: Container(color: Colors.red[700]),
      onDismissed: (direction) => removeItem(item),
      direction: DismissDirection.startToEnd,
      child: buildListTile(item, index),
    );
  }

  Widget buildListTile(Todo item, int index){
    print(item.completed);
    return ListTile(
      onTap: () => changeItemCompleteness(item),
      onLongPress: () => goToEditItemView(item),
      title: Text(
        item.title,
        key: Key('item-$index'),
        style: TextStyle(
          color: item.completed ? Colors.grey : Colors.black,
          decoration: item.completed ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Icon(item.completed
        ? Icons.check_box
        : Icons.check_box_outline_blank,
        key: Key('completed-icon-$index'),
      ),
    );
  }

  void goToNewItemView(){
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return NewTodoView();
    })).then((title){
      if(title != null) {
        addItem(Todo(title: title));
      }
    });
  }

  void addItem(Todo item){
    // Insert an item into the top of our list, on index zero
    list.insert(0, item);
    saveData();
  }

  void changeItemCompleteness(Todo item){
    setState(() {
      item.completed = !item.completed;
    });
    saveData();
  }

  void goToEditItemView(item){
    // We re-use the NewTodoView and push it to the Navigator stack just like
    // before, but now we send the title of the item on the class constructor
    // and expect a new title to be returned so that we can edit the item
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return NewTodoView(item: item);
    })).then((title){
      if(title != null) {
        editItem(item, title);
      }
    });
  }

  void editItem(Todo item ,String title){
    item.title = title;
    saveData();
  }

  void removeItem(Todo item){
    list.remove(item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    if(listString != null){
      list = listString.map(
        (item) => Todo.fromMap(json.decode(item))
      ).toList();
      setState((){});
    }
  }

  void saveData(){
    List<String> stringList = list.map(
      (item) => json.encode(item.toMap()
    )).toList();
    sharedPreferences.setStringList('list', stringList);
  }
}

