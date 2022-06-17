import 'package:flutter/material.dart';
import 'package:flutter_poke_dex/constants/constants.dart';
import 'package:flutter_poke_dex/constants/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'assets/images/pokeball.png';
    return Padding(
      padding: UIHelper.getDefaultPadding(),
      child: SizedBox(
        height: UIHelper.getAppTitleWidgetHeight(),
        child: Stack(
          children: [
            
           Align (alignment: Alignment.centerLeft,child: Text(Constants.title,style: Constants.getTitleTextStyle(),)),
           Align(
             alignment: Alignment.centerRight,
             child: Image.asset(pokeballImageUrl,
             width: ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw,
             fit: BoxFit.fitWidth,))],
        ),
      ),
    );
  }
}
