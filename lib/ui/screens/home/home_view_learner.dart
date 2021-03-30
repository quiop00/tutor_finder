import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_detail_view.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_details_view.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_model_learner.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';

class HomeViewLearner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeViewLearner();
  }
}
class _HomeViewLearner extends State<HomeViewLearner> with SingleTickerProviderStateMixin{
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
        backgroundColor: Color.fromARGB(255,49,243,208),
        title: Text("Gia sư"),
      ),
      body: Container(
        color:Color.fromRGBO(246, 246, 246,0.8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 6+MediaQuery.of(context).size.height*0.06,
                      )
                  ),
                  Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.04,
                      color: Color.fromARGB(255,49,243,208),
                    ),
                  ),
                  Positioned(
                    top:5,
                    left: MediaQuery.of(context).size.width*0.15,
                    child: Center(
                      child: Container(
                          padding: EdgeInsets.all(6),
                          width: MediaQuery.of(context).size.width*0.7,
                          height: MediaQuery.of(context).size.height*0.06,
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search,size: 18,),
                              SizedBox(width: 5,),
                              Text("Tìm gia sư",style: TextStyle(fontSize: 18),)
                            ],
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text("Gia sư nổi bật")
              ),
              Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height-130,
                  color: Colors.white,
                  child: TutorList(),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
// ignore: must_be_immutable
class TutorList extends StatelessWidget{
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
                    builder: (context)=>TutorsDetail(tutor: tutors[index])
                ));
              },
            );
          },
          itemCount: tutors.length,
        );
      }
    );
}