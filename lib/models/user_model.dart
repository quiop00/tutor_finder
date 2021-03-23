class User{
  String id;
  String userName;
  String password;
  String gender;
  String email;
  String address;
  String phoneNumber;
  String avatar;
  String AuthorityId;
  User({this.id,this.userName,this.password,this.gender,this.email,this.address,this.phoneNumber,this.avatar,this.AuthorityId});
  User.loadDataFromJson(Map<String,dynamic> json){
    this.id= json["id"];
    this.userName= json["user_name"];
    this.password= json["password"];
    this.gender= json["gender"];
    this.email= json["email"];
    this.address= json["address"];
    this.phoneNumber= json["phoneNumber"];
    this.avatar=json["avatar"];
    this.AuthorityId=json["AuthorityId"];
  }

}