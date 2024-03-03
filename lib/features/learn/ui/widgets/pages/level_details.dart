import 'package:fluent_hands/features/learn/data/models/learn_response.dart';
import 'package:fluent_hands/features/learn/ui/widgets/pages/content.dart';
import 'package:fluent_hands/features/learn/ui/widgets/pages/level_details_top_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelDetails extends StatefulWidget {
   LevelDetails({super.key,required this.response,required this.index,required this.levelName,required this.levelDef});
  List<ListSuccess> response;
  int index;
  String levelName;
  String levelDef;
  @override
  State<LevelDetails> createState() => _LevelDetailsState();
}

class _LevelDetailsState extends State<LevelDetails> {
  @override
  void initState() {
    print("From Level Detailss ${widget.response}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

  //  print(response.listSuccess?.length??0);
    return Scaffold(
      backgroundColor: Color(0xfffee7ef),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             LevelDetailsTopection(levelName: widget.levelName,levelDef: widget.levelDef,),
            SizedBox(
              height: 11.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 40.h),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: ContentSection(ind: widget.index,)
            ),
          ],
        ),
      ),
    );
  }
}
