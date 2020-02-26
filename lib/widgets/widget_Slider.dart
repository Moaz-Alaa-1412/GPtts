import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:testapp/models/channel.dart';
import 'package:testapp/servies/api_servies.dart';
import 'package:testapp/widgets/Vertcail-courses.dart';
import 'package:grafpix/pixloaders/pix_loader.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  Widget sliderWidget(List<Channel> channel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: MediaQuery.of(context).size.height * 0.31,
      child: CarouselSlider.builder(
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 15),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeIn,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          height: MediaQuery.of(context).size.height * 0.31,
          itemCount: listOFChannel.length,
          itemBuilder: (BuildContext context, int position) {
            var name = "${channel[position].short_name}";
            var name2 = name.replaceAll('=>', '');

            return Container(
              width: MediaQuery.of(context).size.width * 0.70,
              child: new GestureDetector(
                onTap: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new CourseWidget(slug: channel[position].slug),
                  );
                  Navigator.of(context).push(route);
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  borderOnForeground: true,
                  child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        image: new DecorationImage(
                          //image: new ExactAssetImage('assets/images/404.jpg'),
                          image: new NetworkImage(
                              channel[position].photographs[0].path),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.6), BlendMode.dstATop),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Chip(
                            backgroundColor: Colors.transparent,
                            // backgroundColor: Color(0xffc8f0dd),
                            label: Text(
                              name2.replaceAll('&', ''),
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataOFChannels(),
        builder: (context, snapshot) {
          return snapshot.data != null
              ? sliderWidget(snapshot.data)
              : Center(
                  child: PixLoader(
                      loaderType: LoaderType.Rocks,
                      faceColor: Color(0xffef4234)),
                );
        });
  }
}
