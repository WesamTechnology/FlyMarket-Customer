import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/supermarket_model.dart';



class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavorite;

  const ProductCard({
    super.key,
    required this.product,
    this.onAddToCart,
    this.onFavorite,
  });

  bool _isNetworkImage(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14.r),
        onTap: () {
          // TODO: Navigate to product details
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// --- Product Image ---
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(14.r),
                      ),
                      child: _isNetworkImage(product.image)
                          ? Image.network(
                              product.image,
                              fit: BoxFit.fitHeight,
                              width: double.infinity,
                              height: double.infinity,
                            )
                          : Image.asset(
                              product.image,
                              fit: BoxFit.fitHeight,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                    ),
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints.tight(Size(32.w, 32.w)),
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 18.sp,
                            color: Colors.redAccent,
                          ),
                          onPressed: onFavorite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// --- Product Info ---
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${product.price}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: onAddToCart,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 6.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              elevation: 0,
                              backgroundColor: Colors.green[600],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  size: 14.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "Add",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
