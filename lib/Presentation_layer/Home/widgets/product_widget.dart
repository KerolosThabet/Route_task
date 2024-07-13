import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_task/shared/Utils/assets_manager.dart';

import '../../../Data_layer/model/product_response/Products.dart';
import '../../../shared/Utils/string_manager.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      decoration: BoxDecoration(
        border: Border.all(width: 2.w, color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding:   REdgeInsets.only(left: 10,right: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)),
                  child: CachedNetworkImage(
                    height: 128.h,
                    width: 191.w,
                    fit: BoxFit.cover,
                    imageUrl: product.images?[0] ?? "" ,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SvgPicture.asset(
                  AssetsManager.IconAdd,
                  height: 40.h,
                  width: 40.w,
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "${product.title ?? ""}\n",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            Text(
              "${product.description ?? ""}\n",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text(
                  "EGP ${product.discountPercentage}",
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                 SizedBox(
                  width: 16.w,
                ),
                Text(
                  "${product.price}EGP",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Theme.of(context)
                          .colorScheme.primary.withOpacity(0.6),
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Theme.of(context).colorScheme.primary.withOpacity(0.6)),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(children: [
              Text(
                "${StringManager.review} (${product.rating})",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 3.w,),
              SvgPicture.asset(
                AssetsManager.IconStar,
                height: 15.h,
                width: 15.w,
              ),
              Spacer(),
              SvgPicture.asset(
                AssetsManager.Iconplus,
                height: 30.h,
                width: 30.w,
              ),
            ]),
          ],
        ),
      ),
    );
  }

}