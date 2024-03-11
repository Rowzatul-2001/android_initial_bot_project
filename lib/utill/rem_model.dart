class RemModel{
  final int? id;
  final String? title;
  final String? desc;
  final String? dateandtime;

  RemModel({this.id,this.title,this.desc,this.dateandtime});

  RemModel.fromMap(Map<String,dynamic>res)
  : id=res['id'],
  title=res['title'],
  desc=res['desc'],
  dateandtime=res['dateandtime'];

  Map<String,Object?>remMap(){
    return{
      "id" : id,
      "title" : title,
      "desc" : desc,
      "dateandtime" : dateandtime,
    };
  }
}