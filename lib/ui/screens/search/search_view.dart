import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_details_view.dart';
import 'package:tutor_finder_app/ui/screens/search/search_view_model.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';

class SearchView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchView();
  }
}

class _SearchView extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tìm kiếm gia sư'),
          backgroundColor: Color.fromARGB(255, 49, 243, 208),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 40) * 0.35,
                      height: 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          color: Color.fromARGB(255, 49, 243, 208)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.map,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            'Bản đồ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Container(
                      height: 40,
                      width: (MediaQuery.of(context).size.width - 40) * 0.35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Color.fromARGB(255, 49, 243, 208)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Bộ lọc',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height - 130,
                  color: Colors.white,
                  child: RecommendedSearch(),
                ),
              ),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class RecommendedSearch extends StatelessWidget {
  List<TutorResponse> tutors;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) => _listTutors,
      viewModelBuilder: () => SearchViewModel(),
      onModelReady: (model) => model.getTutors(onSuccess: () {
        tutors = model.tutorsResponse.tutors.toList();
      }),
    );
  }

  Widget get _listTutors =>
      Consumer<SearchViewModel>(builder: (context, model, child) {
        if (model.tutorsResponse != null) {
          tutors = model.tutorsResponse.tutors.toList();
          print(model.tutorsResponse.tutors);
        } else {
          return Center(
            child: Text('No data'),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              child: TutorElement(
                tutor: tutors[index],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TutorsDetail(tutor: tutors[index])));
              },
            );
          },
          itemCount: tutors.length,
        );
      });
}
