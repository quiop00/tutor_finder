import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_detail_view_model.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';

class TutorDetail extends StatefulWidget{
  final idTutor;
  TutorDetail({this.idTutor});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutorDetail(idTutor: idTutor);
  }
}
class _TutorDetail extends State<TutorDetail>{
  final idTutor;
  _TutorDetail({this.idTutor});
  Tutor tutor;
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết'),
      ),
      body: ViewModelBuilder<TutorDetailViewModel>.reactive(
        builder:(context,model,child)=>_TutorDetailView,
        viewModelBuilder: ()=>TutorDetailViewModel(),
        onModelReady: (model)=>
            model.getTutorById(
              id: idTutor,
              onLoading: (){
              },
              onSuccess: (){
                tutor=model.tutor;
            }),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget get _TutorDetailView=>
    Consumer<TutorDetailViewModel>(
        builder: (context,model,child){
          return Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.cyan
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:NetworkImage(tutor.avatarPath??"https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png"),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(tutor.name??"",style: TextStyle(fontSize: 30),),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Icon(Icons.message,size: 20,color: Colors.blueAccent,),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Icon(Icons.call,size: 20,color: Colors.green,),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 10,
                          child: TabBar(
                            tabs: [

                            ],
                            controller: _tabController,
                          ),
                        ),
                        Positioned(
                          top:20,
                          left: 5,
                          child: TabBarView(
                            controller: _tabController,
                            children: [

                            ],
                          )
                        )
                      ],
                    )
                  )
                ]
            ),
          );
        }
    );

}