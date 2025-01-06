import 'package:flutter/material.dart';
import 'package:tinker_bootcamp_app/APIs/details_service.dart';
import 'package:tinker_bootcamp_app/APIs/trailer_service.dart';
import 'package:tinker_bootcamp_app/Core/constants/colors.dart';
import 'package:tinker_bootcamp_app/Core/constants/constants.dart';
import 'package:tinker_bootcamp_app/Models/trailer_model.dart';
import 'package:tinker_bootcamp_app/Screens/Trailer/widgets/book_mark_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerScreen extends StatelessWidget {
  final int id;
  const TrailerScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder<TrailerData>(
              future: getVideoId(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  YoutubePlayerController controller = YoutubePlayerController(
                      initialVideoId: snapshot.data!.key,
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                      ));

                  return YoutubePlayer(controller: controller);
                } else {
                  return Text('No Video to show');
                }
              },
            ),
            FutureBuilder(
              future: getDetails(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator.adaptive();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        kHeight_10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                softWrap: true,
                                data.title,
                                style: TextStyle(
                                    fontSize: 23, color: MyColors.white),
                              ),
                            ),
                            BookMarkButton(
                              data: data,
                              callBack: (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    dismissDirection: DismissDirection.down,
                                    backgroundColor: MyColors.purple,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(5),
                                    content: Text(value,
                                    style: TextStyle(
                                      color: MyColors.white,
                                    ),),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                        kHeight_5,
                        kHeight_10,
                        Text(
                          'Overview',
                          style: TextStyle(color: MyColors.white),
                        ),
                        Text(
                          data.description,
                          style: TextStyle(fontSize: 10, color: MyColors.grey),
                        ),
                        kHeight_10,
                        Text(
                          'Geners',
                          style: TextStyle(color: MyColors.white),
                        ),
                        kHeight_5,
                        Wrap(
                          spacing: 5,
                          children: List.generate(
                            data.geners.length,
                            (index) => Container(
                              decoration: BoxDecoration(
                                  color: MyColors.purple,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 8),
                                child: Text(
                                  data.geners[index]['name'],
                                  style: TextStyle(
                                      fontSize: 10, color: MyColors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Text('No Movie Details to show');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
