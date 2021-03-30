import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_detail_view.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_model_learner.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';

class HomeViewTutor extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeViewTutor();
  }
}
class _HomeViewTutor extends State<HomeViewTutor> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          color:Color.fromRGBO(246, 246, 246,0.8),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search,size: 15,),
                          SizedBox(width: 5,),
                          Text("Tìm gia sư")
                        ],
                      )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: TabBar(
                      isScrollable: false,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.cyan
                      ),
                      tabs: [
                        Tab(child: Text('Phù hợp',style: TextStyle(color: Colors.black),),), // you can specify pages here if you want
                        Tab(child: Text('Gần đây',style: TextStyle(color: Colors.black),),),
                        Container(
                            child: Tab(child: Text('Phổ biến',style: TextStyle(color: Colors.black),),)
                        )
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    height: MediaQuery.of(context).size.height-130,
                    color: Colors.white,
                    child: TabBarView(
                      children: [
                        Home(),
                        Icon(Icons.animation),
                        Icon(Icons.search)
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
// ignore: must_be_immutable
class Home extends StatelessWidget{
  List<Tutor> tutors;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ViewModelBuilder<HomeViewLearnerModel>.reactive(
        builder:(context,model,child)=>_listTutors,
        viewModelBuilder:()=> HomeViewLearnerModel(),
        onModelReady: (model)=>model.getTutors(
            onLoading: (){

            },
            onSuccess: (){
              tutors=model.tutorsResponse.tutors;
              //print(model.tutorsResponse.toJson());
            },
            onError: (error){
              print('Loi');
            }
        ),
      ),
    );
  }
  Widget get _listTutors=>
      Consumer<HomeViewLearnerModel>(
          builder:(context,model,child){
            if(model.tutorsResponse!=null){
              tutors=model.tutorsResponse.tutors.toList();
              print(model.tutorsResponse.tutors);
            }
            else{
              return Center(child: Text('No data'),);
            }
            return ListView.builder(
              itemBuilder: (context,index){
                return GestureDetector(
                  child: TutorElement(
                    tutor: tutors[index],
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>TutorDetail(tutor: tutors[index])
                    ));
                  },
                );
              },
              itemCount: tutors.length,
            );
          }
      );
}