import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_details_view.dart';
import 'package:tutor_finder_app/ui/screens/search/search_view_model.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';
import 'package:tutor_finder_app/settings.dart' as setting;

class SearchView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchView();
  }
}

class _SearchView extends State<SearchView> {
  List<String> subjects = setting.subjects;
  List<String> grades = setting.grades;
  List<String> subject;
  List<String> grade;
  var _grades;
  var _subjects;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _grades = grades.map((e) => MultiSelectItem<String>(e, e)).toList();
    _subjects = subjects.map((e) => MultiSelectItem<String>(e, e)).toList();
    subject = [];
    grade = [];
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) => Scaffold(
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
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MultiSelectDialogField(
                        listType: MultiSelectListType.LIST,
                        searchable: true,
                        buttonText: Text("Chọn môn học"),
                        title: Text("Môn"),
                        items: _subjects,
                        onConfirm: (values) {
                          setState(() {
                            //model.tutor.subjects = values;
                          });
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          items: subject
                              ?.map((e) => MultiSelectItem<String>(e, e))
                              ?.toList(),
                          onTap: (value) {
                            setState(() {
                              subject.remove(value);
                            });
                          },
                        ),
                      ),
                      MultiSelectDialogField(
                        listType: MultiSelectListType.LIST,
                        searchable: true,
                        buttonText: Text("Chọn lớp"),
                        title: Text("Lớp"),
                        items: _grades,
                        onConfirm: (values) {
                          setState(() {
                            //model.tutor.subjects = values;
                          });
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          items: grade
                              ?.map((e) => MultiSelectItem<String>(e, e))
                              ?.toList(),
                          onTap: (value) {
                            setState(() {
                              grade.remove(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Lọc'),
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
          )),
    );
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
