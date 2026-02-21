class AppLink{
  //static String server = "http://10.0.2.2:8012/flymarket";
  //static String server = "http://10.0.2.2:8012/flymarket_php_api/app/customer";
  static String server = "http://46.101.225.45/flymarket/app/customer";

  //static String imageStatic = "http://10.0.2.2:8012/flymarket/upload";
  //static String imageStatic = "http://10.0.2.2:8012/flymarket_php_api/app/customer/upload";
  static String imageStatic = "http://46.101.225.45/flymarket/app/customer/upload";


  static String imageSupermarket = "$imageStatic/supermarket";
  static String imageCategories = "$imageStatic/categories";
  static String imageItems = "$imageStatic/items";



  static String test = "$server/test3.php";
  static String signUp = "$server/signup.php";
  static String verify_and_register = "$server/verify_and_register.php";
  static String login = "$server/login.php";
  static String loginverfy = "$server/loginverfy.php";
  static String verfiyCodeSignUp = "$server/verfiycode.php";

  // ============ Home ===============
  static String home = "$server/home.php";

  // ============ Items ==============
  static String categories = "$server/categories/view.php";
  static String categoriesAll = "$server/categories/categories_all.php";
  static String items = "$server/items/items.php";
  static String search = "$server/items/search.php";
  static String itemsAll = "$server/items/items_all.php";




  // ================= Favorite ==================
  static String favoriteAdd = "$server/favorite/add.php";
  static String favoriteRemove = "$server/favorite/remove.php";
  static String myFavorite = "$server/favorite/view.php";
  static String deleteFromFavorite = "$server/favorite/deletefromfavroite.php";





  // ================= Cart ==================
  static String cartView = "$server/cart/view.php";
  static String cartAdd = "$server/cart/add.php";
  static String cartDelete = "$server/cart/delete.php";
  static String getCountItems = "$server/cart/getcountitems.php";

  // ==================== Address ===============================

  static String addressView = "$server/address/view.php";
  static String addressAdd = "$server/address/add.php";
  static String addressEdit = "$server/address/edit.php";
  static String addressDelete = "$server/address/delete.php";



  // ==================== Coupon ===============================

  static String checkCoupon = "$server/coupon/checkcoupon.php";




}