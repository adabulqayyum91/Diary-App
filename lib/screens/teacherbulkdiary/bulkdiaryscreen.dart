import 'package:diary/res/customfonts.dart';
import 'package:diary/teacherdairycontroller/bulkdiarycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


import 'bulkdairydata.dart';

class BulkDiaryScreen extends StatelessWidget {
  final String classname;
  BulkDiaryScreen({this.classname});
  bool check;
  TextEditingController dairycontroller=TextEditingController();
  PanelController panelController = PanelController();
  ScrollController scrollController = ScrollController();
  BulkDiaryController bulkDiaryController = Get.put(BulkDiaryController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F9),
      body: Obx(
        () => SlidingUpPanel(
          borderRadius: BorderRadius.circular(20),
          controller: panelController,
          maxHeight: MediaQuery.of(context).size.height - 100,
          minHeight: 0,
          panelBuilder: (scrollController) => BulkPanel(
            scrollController: scrollController,
            panelController: panelController,
          ),
          body: Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25, right: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios_rounded),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          Text("Bulk Diary $classname",
                              style: TextStyle(
                                  color: Color(0xFF253274),
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.05)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFffffff),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView(
                      controller: scrollController,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      shrinkWrap: true,

                      children: [

                        Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 10,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              panelController.open();
                            },
                            child: bulkDiaryController.select.isEmpty
                                ? Container(
                                height: 230,
                                width: size.width - 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFC3C6D8), width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text("Select the student"),
                                    ),
                                  ],
                                ))
                                : Container(
                              height: 230,
                              width: size.width - 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFFC3C6D8), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Scrollbar(
                                child: GridView.builder(
                                    itemCount:
                                    bulkDiaryController.select.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(10),
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3.5,
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder:
                                        (BuildContext ctx, int index) {
                                      return Text(
                                          "${bulkDiaryController.select[index]},");
                                    }),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Diary",
                              style: TextStyle(
                                  color: Color(0xff7C84AC),
                                  fontFamily: sfprodisplay,
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          controller: dairycontroller,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Write diary here...",
                            hintStyle: TextStyle(
                                color: Color(0xFF253274).withOpacity(0.3)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: Color(0xFFC3C6D8))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),


                        Container(
                          height: size.height * 0.09,
                          decoration: BoxDecoration(
                              color: Color(0xff7189FF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "Send",
                            style: TextStyle(
                                color: Color(0xFFffffff),
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.05),
                          )),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BulkPanel extends StatelessWidget {
  BulkPanel({this.scrollController, this.panelController});
  PanelController panelController;
  final ScrollController scrollController;
  BulkDiaryController bulkDiaryController = Get.put(BulkDiaryController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 30),
          controller: scrollController,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 40,
                    child: TextField(
                      onChanged: (value) {},
                      controller: bulkDiaryController.textfieldcontroller.value,
                      decoration: InputDecoration(
                        hintText: "Write diary here...",
                        hintStyle: TextStyle(
                            color: Color(0xFF253274).withOpacity(0.3),
                            fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFFC3C6D8))),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Scrollbar(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: bulkstudentdata().length,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, int index) {
                    var sdata = bulkstudentdata()[index];
                    bulkDiaryController.check.add(false);

                    return GestureDetector(
                      onTap: () {
                        if (bulkDiaryController.check[index] == false) {
                          bulkDiaryController.check[index] = true;
                          bulkDiaryController.select.add(sdata.name);
                          print(bulkDiaryController.select);
                        } else {
                          bulkDiaryController.check[index] = false;
                          bulkDiaryController.select.remove(sdata.name);
                          print(bulkDiaryController.select);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: bulkDiaryController.check[index] == false
                                ? Colors.black12
                                : Color(0xFF253274),
                            borderRadius: BorderRadius.circular(10)),
                        height: 150,
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Image.asset(sdata.image),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(sdata.name,style: TextStyle(color: bulkDiaryController.check[index] == false
                                ?Color(0xFF253274):Colors.white),)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
              child: Row(
                children: [
                  Expanded( flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        for (int v = 0; v < bulkstudentdata().length; v++) {
                          bulkDiaryController.select
                              .remove(bulkstudentdata()[v].name);
                          bulkDiaryController.check[v] = false;
                        }
                        for (int v = 0; v < bulkstudentdata().length; v++) {
                          bulkDiaryController.select
                              .add(bulkstudentdata()[v].name);
                          bulkDiaryController.check[v] = true;
                        }
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                            color: Color(0xFF7189FF),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Select All",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      for (int v = 0; v < bulkstudentdata().length; v++) {
                        bulkDiaryController.select
                            .remove(bulkstudentdata()[v].name);
                        bulkDiaryController.check[v] = false;
                      }
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF7189FF)),
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Select None",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF7189FF),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ))
                ],
              )),
        )
      ],
    );
  }
}
