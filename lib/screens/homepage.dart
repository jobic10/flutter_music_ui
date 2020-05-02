import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermusicui/constants/constants.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _val = 1.1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(Constants.artistThumb),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Constants.songTitle,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              Constants.artistName,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            )
          ],
        ),
        actions: <Widget>[
          ButtonedIcon(
            icon: Icons.queue_music,
            size: 32,
          ),
          ButtonedIcon(
            icon: Icons.more_vert,
            size: 32,
          )
        ],
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).orientation == Orientation
                  .landscape ? MediaQuery.of(context).size.height / 2 :
              MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              child: Image.asset(
                Constants.artistAvatar,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonedIcon(
                  size: 25,
                  icon: Icons.repeat,
                ),
                ButtonedIcon(
                  size: 25,
                  icon: Icons.skip_previous,
                ),
                CircleAvatar(
                  minRadius: 30,
                  backgroundColor: Colors.redAccent,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    iconSize: 25,
                    onPressed: () {},
                  ),
                ),
                ButtonedIcon(
                  size: 25,
                  icon: Icons.skip_next,
                ),
                ButtonedIcon(
                  size: 25,
                  icon: Icons.shuffle,
                )
              ],
            ),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 10),
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Text("${_val.toStringAsFixed(2).replaceFirst(".", ":")}"),
                 Expanded(
                   child: Slider(
                     activeColor: Colors.redAccent,
                     onChanged: (val){
                       setState(() {
                         _val =val;
                       });
                     },

                     min: 0,
                     max: 4.23,
                     value: _val,
                   ),
                 ),
                 Text("4:23")
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}

class ButtonedIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const ButtonedIcon(
      {Key key,
      @required this.icon,
      @required this.size,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
      icon,
      color: color,
      size: size,
    ));
  }
}
