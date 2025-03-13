class CreatedByMe
{
  int id;
  String name;
  String totalGoal;
  String netGoal;
  String members;
  String image;

  CreatedByMe({
    required this.id,
    required this.name,
    required this.totalGoal,
    required this.netGoal,
    required this.members,
    required this.image,

  });

  static CreatedByMe get sample {
    return CreatedByMe(
        id: 0,
        name: "name",
        totalGoal: "\$10000",
        netGoal: "\$5000",
        members: "100",
        image: "assets/images/createdByMeImg1.png",
    );
  }
  CreatedByMe clone(){
    return CreatedByMe(id: id,name: name,totalGoal: totalGoal,netGoal: netGoal,members: members,image: image);
  }

}