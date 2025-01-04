import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tinker_bootcamp_app/Core/constants/colors.dart';
import 'package:tinker_bootcamp_app/Core/constants/constants.dart';
import 'package:tinker_bootcamp_app/Models/home_model.dart';
import 'package:tinker_bootcamp_app/Screens/Trailer/Pages/trailer_screen.dart';

class HeroBanner extends StatefulWidget {
  final List<HomeData> data;
  const HeroBanner({super.key, required this.data});

  @override
  State<HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  int index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        index = (index + 1) % 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: screenHeight * 0.7,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${widget.data[index].posterPath}'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          width: double.infinity,
          height: screenHeight * 0.7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [MyColors.black, MyColors.black.withAlpha(1)]),
          ),
        ),
        AnimatedContainer(
          duration: Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data[index].title,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.data[index].description,
                  textAlign: TextAlign.justify,
                  // maxLines: 3,
                  style: TextStyle(
                    fontSize: 10,
                    color: MyColors.white,
                  ),
                ),
                kHeight_5,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TrailerScreen(id: widget.data[index].id)));
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(MyColors.purple)
                    ),
                    child: Text('Watch Trailer',
                    style: TextStyle(
                      color: MyColors.white
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
