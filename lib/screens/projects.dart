import 'package:testapp/widgets/dashed_rect.dart';
import 'package:testapp/widgets/filter.dart';
import 'package:testapp/widgets/heading.dart';
import 'package:testapp/widgets/project_detail_card.dart';
import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blueAccent,
          centerTitle: false,

          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 0.0, top: 4.0),
              child: Container(
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                width: 80.0,
                height: 80.0,
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(children: [
                  SizedBox(
                    height: 22,
                  ),
//
                  Heading(
                    text: Text(
                      "My projects",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                    button: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(8),
                        color: Colors.grey,
                        child: Center(
                          child: Icon(
                            Icons.filter_list,
                            size: 28,
                            color: Colors.orange,
                          ),
                        ),
                        strokeWidth: 1,
                        dashPattern: [3, 4]),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  FiltersWidget(
                    updateFilter: () {},
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Heading(
                    text: Text(
                      "You have 11 projects",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500]),
                    ),
                    button: SizedBox(),
                  ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return ProjectDetailCard();
                      },
                    ),
                  )
                ]),
              ),
            );
          },
        ));
  }
}
