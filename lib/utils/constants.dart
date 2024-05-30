import '../model/dummy_model.dart';

const String baseUrl = "https://api.mybotpos.com";
const String loginUrl = '$baseUrl/api/employees/login';
const String dealsUrl = "/api/GetProdcut?branch=B00001";
const String floorTableUrl = '/api/pos/table-orders/B01';
const String supplierUrl = '/api/pos/captain-list/B01';
const String productListUrl = '$baseUrl/api/pos/product-list/B01';
const String tillListUrl = '$baseUrl/api/tills/list/B01';
const String posUrl = '$baseUrl/api/organization/pos-settings';
const String getOrdersURL = '$baseUrl/api/sale-orders/list-pending/';
const String customerListUrl = '$baseUrl/api/pos/cutomer-list';
const String newUserSaveURL = '$baseUrl/api/ledgers';
const String updateUserURL = '$baseUrl/api/ledgers/L001';
const String orderDetailURL = '$baseUrl/api/sale-orders/details/';

const String tableAssetImage = 'assets/images/table.png';
const String kOrganizationCode = 'Organization_Code';
const String kEmployeeCode = 'Employee_Code';
const String kEmployeeName = 'Employee_Name';
const String kIsCaptain = 'Is_Captain';
const String kAuthToken = 'AuthToken';
const String kBranchCodeString = 'BranchCode';
const String kTillString = 'Till';
String kOrganizationCodeVal = '';
String kEmployeeCodeVal = '';
String kIsCaptainVal = '';
String kAuthTokenVal = '';
String kBranchCodeVal = '';
String kEmployeeNameVal = '';
String kTillVal = '';
const String kAvailableStatusString = 'Free';
const String kOccupiedString = 'Occupied';
const String kOfflineImage = "assets/images/offline_image.jpg";
// const String kUserDummyImage = "assets/images/userDummyImage.jpg";
const String kFoodDummyImage = "assets/images/food_image1.jpg";

List<DealsCardModel>? dealsCardList;

const String rupeeSymbol = '\u{20B9}';
const String kUserDummyImage = 'assets/images/userDummyImage.png';
