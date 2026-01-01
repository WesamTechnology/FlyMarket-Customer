class AppLink{
  static String server = "http://10.0.2.2:8012/flymarket";

  static String imageStatic = "http://10.0.2.2:8012/flymarket/upload";


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
  static String itemsAll = "$server/items/items_all.php";




  // ================= Favorite ==================
  static String favoriteAdd = "$server/favorite/add.php";
  static String favoriteRemove = "$server/favorite/remove.php";
  static String myFavorite = "$server/favorite/view.php";
  static String deleteFromFavorite = "$server/favorite/deletefromfavroite.php";




}