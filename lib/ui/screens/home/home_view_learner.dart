import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_details_view.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_model_learner.dart';
import 'package:tutor_finder_app/ui/screens/search/search_view.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';

class HomeViewLearner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewLearner();
  }
}

class _HomeViewLearner extends State<HomeViewLearner> {
  final key = GlobalKey<_TutorList>();
  final api = locator<Api>();
  List<TutorResponse> data = [];
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    await api.client.getTutors().then((value) => {data = value.tutors});
    print('here');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
        title: Text("Gia sư"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Stack(
            children: [
              Positioned(
                  child: Container(
                height: 6 + MediaQuery.of(context).size.height * 0.065,
              )),
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  color: Color.fromARGB(255, 49, 243, 208),
                ),
              ),
              Positioned(
                top: 5,
                left: MediaQuery.of(context).size.width * 0.15,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Autocomplete<TutorResponse>(
                    optionsBuilder: (textEditingValue) {
                      return data
                          .where((element) => element.name
                              .toLowerCase()
                              .startsWith(textEditingValue.text.toLowerCase()))
                          .toList();
                    },
                    displayStringForOption: (option) => option.name,
                    onSelected: (tutor) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TutorsDetail(id: tutor.id)));
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: 100,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home_banner.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text("Gia sư nổi bật",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height - 50,
              color: Colors.white,
              child: TutorList(),
            ),
          ),
        ]),
      ),
    );
  }
}

class TutorList extends StatefulWidget {
  TutorList({Key key}) : super(key: key);
  @override
  _TutorList createState() => _TutorList();
}

class _TutorList extends State<TutorList> {
  List<TutorResponse> tutors;
  final api = locator<Api>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.client.getTutors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            tutors = snapshot.data.tutors;
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
                                TutorsDetail(id: tutors[index].id)));
                  },
                );
              },
              itemCount: tutors.length,
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
