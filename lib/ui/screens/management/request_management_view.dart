import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/suggestion_response.dart';
import 'package:tutor_finder_app/services/response/suggestions_response.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;
import 'package:tutor_finder_app/ui/screens/detail/tutor_details_view.dart';

class RequestManagementView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RequestManagementView();
  }
}

class _RequestManagementView extends State<RequestManagementView> {
  final _api = locator<Api>();
  SuggestionsResponse suggestions = SuggestionsResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
        title: Text("Thông báo"),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 50,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 40,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.symmetric(
                    vertical: BorderSide(color: Colors.grey, width: 5),
                    horizontal: BorderSide(color: Colors.grey, width: 3))),
            child: Center(
              child: Text(
                'Thông báo',
                style: TextStyle(color: Colors.blueAccent, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: _api.client.getSuggestion(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  suggestions = snapshot.data;
                  print(suggestions.toJson());
                  if (suggestions.suggestions.length != 0)
                    return Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 70,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: ListView.builder(
                          itemBuilder: (context, index) => SuggestionElement(
                            suggestions.suggestions[index],
                          ),
                          itemCount: suggestions.suggestions.length,
                        ),
                      ),
                    );
                  return Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 70,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Center(
                          child: Text(
                        'Không có thông báo',
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              })
        ]),
      )),
    );
  }

  Widget SuggestionElement(SuggestionResponse suggestion) {
    return Container(
      height: 100,
      child: Card(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TutorsDetail(
                              id: suggestion.idTutor,
                            )));
              },
              child: Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(suggestion.avatar ?? ''),
                        fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          suggestion.nameTutor +
                              ' đã gửi yêu cầu nhận lớp ' +
                              suggestion.titlePost,
                          style: TextStyle(fontSize: 15),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 150,
                            height: 25,
                            padding: EdgeInsets.only(right: 5, bottom: 1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: suggestion.status == 0
                                ? ElevatedButton(
                                    onPressed: () async {
                                      await dialog.onLoading(
                                          context, 'Đang xử lý');
                                      await _api.client.acceptSuggestion(
                                          suggestion.idPost,
                                          suggestion.idTutor);
                                      dialog.showAlertDialog(
                                          context,
                                          'Thông báo',
                                          'Đã chấp nhận thành công');
                                    },
                                    child: Center(child: Text('Chấp nhận')),
                                  )
                                : ElevatedButton(
                                    onPressed: null,
                                    child: Center(
                                        child: Text(suggestion.status == 1
                                            ? 'Đã chấp nhận'
                                            : 'Chấp nhận')),
                                  )),
                        Container(
                          width: 90,
                          height: 25,
                          padding: EdgeInsets.only(right: 5, bottom: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: suggestion.status == 0
                              ? ElevatedButton(
                                  onPressed: () async {
                                    await dialog.onLoading(
                                        context, 'Đang xử lý');
                                    await _api.client.denySuggestion(
                                        suggestion.idPost, suggestion.idTutor);
                                    dialog.showAlertDialog(context, 'Thông báo',
                                        'Đã từ chối thành công');
                                  },
                                  child: Center(child: Text('Từ chối')),
                                )
                              : ElevatedButton(
                                  onPressed: null,
                                  child: Center(
                                      child: Text(suggestion.status == 2
                                          ? 'Đã từ chối'
                                          : 'Từ chối')),
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
