import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_detail_view_model.dart';
import 'package:tutor_finder_app/ui/widget/evaluate.dart';
import 'package:tutor_finder_app/ui/widget/infor.dart';
import 'package:tutor_finder_app/ui/widget/rating_box.dart';
import 'package:tutor_finder_app/ui/widget/schedule.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';

class TutorDetail extends StatefulWidget{
  final tutor;
  TutorDetail({this.tutor});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutorDetail(tutor: tutor);
  }
}
class _TutorDetail extends State<TutorDetail> with SingleTickerProviderStateMixin{
  final tutor;
  _TutorDetail({this.tutor});
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết'),
      ),
      body: ViewModelBuilder<TutorDetailViewModel>.reactive(
          builder:(context,model,child)=>_TutorDetailView,
          viewModelBuilder: ()=>TutorDetailViewModel(),
          // onModelReady: (model)=>
          //     model.getTutorById(
          //       id: idTutor,
          //       onLoading: (){
          //       },
          //       onSuccess: (){
          //         tutor=model.tutor;
          //     }),
        ),
      );
  }
  // ignore: non_constant_identifier_names
  Widget get _TutorDetailView=>
    Consumer<TutorDetailViewModel>(
        builder: (context,model,child){
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(model.tutor.name),
                  background: Image.network(
                    model.tutor.avatarPath,fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.0),
                  child: Transform.translate(
                    offset: const Offset(0, 24),
                    child: RaisedButton(
                      shape: StadiumBorder(),
                      child: Text("Click Here"),
                      onPressed: () {},
                    ),
                ),
              ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:NetworkImage(tutor.avatarPath??"https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png"),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    //RatingBox(rating: tutor.rating,)
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(tutor.name??"",style: TextStyle(fontSize: 30),)
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          width: 80,
                                          height: 30,
                                          padding: EdgeInsets.only(left: 5,right: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.blueAccent,
                                          ),
                                          child: Center(
                                              child: Text('Nhắn tin',style: TextStyle(fontSize: 15,color: Colors.white,),)
                                          ),
                                        ),
                                        onTap: (){

                                        },
                                      ),
                                      SizedBox(width: 20,),
                                      InkWell(
                                        child: Container(
                                            width: 80,
                                            height: 30,
                                            padding: EdgeInsets.only(left: 5,right: 5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Colors.green
                                            ),
                                            child: Center(
                                                child:  Text('Đặt lịch',style: TextStyle(fontSize: 15,color: Colors.white,),)
                                            )
                                        ),
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
                    SizedBox(height: 2,),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: Container(
                            height: 400,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TabBar(
                                  tabs: [
                                    Tab(child: Text('Thông tin',style: TextStyle(color: Colors.black),),), // you can specify pages here if you want
                                    Tab(child: Text('Lịch học',style: TextStyle(color: Colors.black),),),
                                    Tab(child: Text('Đánh giá',style: TextStyle(color: Colors.black),),)
                                  ],
                                  controller: _tabController,
                                ),
                                Flexible(
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      InforTutor(tutor: tutor,),
                                      Schedule(schedules: tutor.schedule,),
                                      EvaluateWidget(tutor: tutor,)
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                    )
                  ]
              ),
            ],
          );

          // return Container(
          //   color: Colors.grey,
          //   margin: EdgeInsets.only(bottom: 5),
          //   child: SingleChildScrollView(
          //     child:
          //   ),
          // );
        }
    );

}