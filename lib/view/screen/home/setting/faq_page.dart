import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/translate_database.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        "question_ar": "كيف أطلب من التطبيق؟",
        "question_en": "How do I order from the app?",
        "answer_ar": "اختر السوبرماركت القريب منك، أضف المنتجات إلى السلة، ثم أكمل الطلب وحدد موقعك.",
        "answer_en": "Choose a nearby supermarket, add items to your cart, then complete the order and set your location."
      },
      {
        "question_ar": "كم مدة توصيل الطلب؟",
        "question_en": "How long does delivery take?",
        "answer_ar": "عادة يتم التوصيل خلال 30 إلى 60 دقيقة حسب موقعك.",
        "answer_en": "Delivery usually takes 30 to 60 minutes depending on your location."
      },
      {
        "question_ar": "هل يمكنني تتبع الطلب؟",
        "question_en": "Can I track my order?",
        "answer_ar": "نعم، يمكنك متابعة حالة الطلب من داخل التطبيق بعد تأكيده.",
        "answer_en": "Yes, you can track your order status within the app after confirmation."
      },
      {
        "question_ar": "ما هي طرق الدفع المتاحة؟",
        "question_en": "What payment methods are available?",
        "answer_ar": "يمكنك الدفع عند الاستلام أو عبر الطرق الإلكترونية المتاحة.",
        "answer_en": "You can pay on delivery or via available electronic methods."
      },
      {
        "question_ar": "هل يمكنني إلغاء الطلب؟",
        "question_en": "Can I cancel my order?",
        "answer_ar": "يمكنك إلغاء الطلب قبل بدء التجهيز من خلال صفحة الطلبات.",
        "answer_en": "You can cancel your order before preparation starts from the orders page."
      },
      {
        "question_ar": "ماذا أفعل إذا وصلني طلب ناقص؟",
        "question_en": "What if my order is incomplete?",
        "answer_ar": "تواصل مع الدعم مباشرة وسيتم حل المشكلة بسرعة.",
        "answer_en": "Contact support directly and the issue will be resolved promptly."
      },
      {
        "question_ar": "هل الأسعار نفس أسعار السوبرماركت؟",
        "question_en": "Are prices the same as supermarkets?",
        "answer_ar": "نعم، الأسعار محدثة من السوبرماركت مع إضافة بسيطة لخدمة التوصيل إن وجدت.",
        "answer_en": "Yes, prices are updated from supermarkets with a small delivery fee if applicable."
      },
      {
        "question_ar": "هل التطبيق يعمل في كل المناطق؟",
        "question_en": "Is the app available in all areas?",
        "answer_ar": "الخدمة متوفرة حالياً في مناطق محددة ويتم التوسع تدريجياً.",
        "answer_en": "The service is currently available in selected areas and expanding gradually."
      },
    ];

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          translateDatabase("الأسئلة الشائعة", "FAQ"),
          style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColor.fourthColor, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // قسم الهيدر التوضيحي


            SizedBox(height: 10.h),

            // قائمة الأسئلة
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20.w),
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      iconColor: AppColor.primaryColor,
                      collapsedIconColor: AppColor.fourthColor,
                      tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      title: Text(
                        translateDatabase(
                          faqs[index]["question_ar"]!,
                          faqs[index]["question_en"]!,
                        ),
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.fourthColor,
                        ),
                      ),
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                          child: Text(
                            translateDatabase(
                              faqs[index]["answer_ar"]!,
                              faqs[index]["answer_en"]!,
                            ),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[700],
                              height: 1.6,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            
            SizedBox(height: 20.h),
            
            // تذييل بسيط
            Text(
              translateDatabase(
                "لم تجد ما تبحث عنه؟ تواصل مع الدعم",
                "Didn't find what you need? Contact Support",
              ),
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
