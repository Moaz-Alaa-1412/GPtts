import 'package:testapp/views/VideoTopics.dart';
import 'package:flutter/material.dart';
import 'package:testapp/models/courses.dart';
import 'package:testapp/servies/api_servies.dart';
import 'package:grafpix/pixloaders/pix_loader.dart';


class CourseWidget extends StatelessWidget {
  String slug ;
  CourseWidget({this.slug});

  Widget listViewWidgetCourses(List<Course> course, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: listSpecificCourses.length,
          padding: const EdgeInsets.all(5.0),
          itemBuilder: (context, position) {
            return Container(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Card(
                  elevation: 2,
                  color: Color(0xFF5ABD8C),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Wrap(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                        width: 50,
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: new ClipRRect(
                            borderRadius: new BorderRadius.circular(15.0),
                            child: FadeInImage(
                              image: NetworkImage(
                                  course[position].image_filename
                              ),
                              placeholder: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.fill,
                              height: 150.0,
                              width: 100.0,
                            ),
                          ),
                        ),
                        title: Text(
                          '${(course[position].name)}',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new VTopics(slug: course[position].slug , description: course[position].description),
                          );
                          Navigator.of(context).push(route);
                        },
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                    ],
                  ),
                ));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5ABD8C),
      ),
      body: new FutureBuilder(
          future: getSpecificCourses(slug),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidgetCourses(snapshot.data, context)
                : Center(child:  PixLoader(
                loaderType: LoaderType.Rocks,
                faceColor: Color(0xffef4234) , ),
            );
          }),
    );
  }
}
