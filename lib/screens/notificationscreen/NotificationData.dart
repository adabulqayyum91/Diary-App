class MyNotification{
  String title;
  String date;
  MyNotification({this.title,this.date});

}

List notificationdata (){
  List mynotification = <MyNotification>[
    MyNotification(title: "For Micheal Hopkinson, diary for English subject is updated.",date: "Today at 3:31pm"),
    MyNotification(title: "For Ria Hopkinson, diary for Science subject is updated.",date: "Today at 2:22pm"),
    MyNotification(title: "For Micheal Hopkinson, diary for Maths subject is updated.",date: "Today at 3:31pm"),
    MyNotification(title: "James Hopkinson is added into the Kids list",date: "Today at 2:22pm"),
    MyNotification(title: "For Micheal Hopkinson, diary for Maths subject is updated.",date: "Today at 3:31pm"),
    MyNotification(title: "James Hopkinson is added into the Kids list",date: "Today at 2:22pm"),
    MyNotification(title: "For Micheal Hopkinson, diary for Maths subject is updated.",date: "Today at 3:31pm"),
    MyNotification(title: "James Hopkinson is added into the Kids list",date: "Today at 2:22pm"),
    MyNotification(title: "For Micheal Hopkinson, diary for Maths subject is updated.",date: "Today at 3:31pm"),
    MyNotification(title: "James Hopkinson is added into the Kids list",date: "Today at 2:22pm"),


  ];
  return mynotification;
}