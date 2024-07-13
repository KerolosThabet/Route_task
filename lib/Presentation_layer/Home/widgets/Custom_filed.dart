

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/Utils/assets_manager.dart';
import '../../../shared/Utils/string_manager.dart';

class CustomFiled extends StatelessWidget {
  const CustomFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  REdgeInsets.only(right: 16,left: 16),

      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                  style: TextStyle(
                      fontSize: 14.sp
                  ),
                  decoration: InputDecoration(
                    hintText: "  ${StringManager.Search}",
                    hintStyle: Theme.of(context).textTheme.headlineSmall,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.sp),borderSide: BorderSide(width: 1,color: Theme.of(context).primaryColor,)),
                    prefix:  SvgPicture.asset(AssetsManager.searchIcon,height: 24.h,width: 24.w,),
                    ),
                  ),
                ),
           SizedBox(width: 26.w,),
           SizedBox(
             width: 24.w,
               height: 24.h,
               child: SvgPicture.asset(AssetsManager.cartIcon,width: 24.w, height: 24.h,)),
        ],
      ),
    );
  }
}
