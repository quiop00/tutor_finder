import 'package:flutter/material.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/suggestion_response.dart';
import 'package:tutor_finder_app/services/response/suggestions_response.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;

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
        title: Text("Danh sách lời mời dạy"),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 50,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(children: [
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: _api.client.getSuggestion(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  suggestions = snapshot.data;
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
                          'Nguyễn Văn A đã gửi yêu cầu nhận lớp',
                          style: TextStyle(fontSize: 15),
                          maxLines: 1,
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
                                    await _api.client.acceptSuggestion(
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
