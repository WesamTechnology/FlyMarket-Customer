import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  final String name;
  final String image;

  const HeaderSection({
    super.key,
    required this.name,
    required this.image,
  });

  bool _isNetworkImage(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 240.h,
      backgroundColor: Colors.white,
      elevation: 1,
      foregroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        background: _isNetworkImage(image)
            ? Image.network(image, fit: BoxFit.cover)
            : Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
