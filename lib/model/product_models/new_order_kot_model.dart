import 'package:captain_app/model/product_models/product_model.dart';

// class NewOrderKotModel {
//   String? branchCode;
//   String? tillCode;
//   String? shiftRegisterNumber;
//   String? cashRegisterNumber;
//   String? orderReferenceNumber;
//   String? saleOrderType;
//   String? captainCode;
//   String? captainName;
//   String? floorName;
//   String? tableName;
//   String? chairs;
//   String? ledgerCode;
//   String? ledgerName;
//   String? mobile;
//   String? email;
//   String? address;
//   String? gSTNumber;
//   String? saleOrderNotes;
//   String? generateToken;
//   List<SaleOrderProducts>? saleOrderProducts;
//
//   NewOrderKotModel(
//       {this.branchCode,
//         this.tillCode,
//         this.shiftRegisterNumber,
//         this.cashRegisterNumber,
//         this.orderReferenceNumber,
//         this.saleOrderType,
//         this.captainCode,
//         this.captainName,
//         this.floorName,
//         this.mobile,
//         this.email,
//         this.address,
//         this.gSTNumber,
//         this.tableName,
//         this.chairs,
//         this.ledgerCode,
//         this.ledgerName,
//         this.saleOrderNotes,
//         this.generateToken,
//         this.saleOrderProducts});
//
//   NewOrderKotModel.fromJson(Map<String, dynamic> json) {
//     branchCode = json['Branch_Code'];
//     tillCode = json['Till_Code'];
//     shiftRegisterNumber = json['Shift_Register_Number'];
//     cashRegisterNumber = json['Cash_Register_Number'];
//     orderReferenceNumber = json['Order_Reference_Number'];
//     saleOrderType = json['Sale_Order_Type'];
//     captainCode = json['Captain_Code'];
//     captainName = json['Captain_Name'];
//     floorName = json['Floor_Name'];
//     tableName = json['Table_Name'];
//     chairs = json['Chairs'];
//     ledgerCode = json['Ledger_Code'];
//     ledgerName = json['Ledger_Name'];
//     mobile = json['Mobile'];
//     email = json['Email'];
//     address = json['Address'];
//     gSTNumber = json['GST_Number'];
//     saleOrderNotes = json['Sale_Order_Notes'];
//     generateToken = json['Generate_Token'];
//     if (json['Sale_Invoice_Products'] != null) {
//       saleOrderProducts = <SaleOrderProducts>[];
//       json['Sale_Invoice_Products'].forEach((v) {
//         saleOrderProducts!.add(new SaleOrderProducts.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['Branch_Code'] = this.branchCode;
//     data['Till_Code'] = this.tillCode;
//     data['Shift_Register_Number'] = this.shiftRegisterNumber;
//     data['Cash_Register_Number'] = this.cashRegisterNumber;
//     data['Order_Reference_Number'] = this.orderReferenceNumber;
//     data['Sale_Order_Type'] = this.saleOrderType;
//     data['Captain_Code'] = this.captainCode;
//     data['Captain_Name'] = this.captainName;
//     data['Floor_Name'] = this.floorName;
//     data['Table_Name'] = this.tableName;
//     data['Chairs'] = this.chairs;
//     data['Ledger_Code'] = this.ledgerCode;
//     data['Ledger_Name'] = this.ledgerName;
//     data['Mobile'] = this.mobile;
//     data['Email'] = this.email;
//     data['Address'] = this.address;
//     data['GST_Number'] = this.gSTNumber;
//     data['Sale_Order_Notes'] = this.saleOrderNotes;
//     data['Generate_Token'] = this.generateToken;
//     data['Sale_Invoice_Charges'] = [];
//     data['Sale_Invoice_Discounts'] = [];
//     data['Sale_Invoice_Histories'] = [];
//     data['Sale_Invoice_Payments'] = [];
//     if (this.saleOrderProducts != null) {
//       data['Sale_Invoice_Products'] =
//           this.saleOrderProducts!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class SaleOrderProducts {
//   String? kitchenName;
//   String? cookingNotes;
//   String? productCode;
//   String? sKUCode;
//   String? hSNSACCode;
//   String? productName;
//   String? nativeName;
//   String? productCategory;
//   String? productType;
//   String? productUOM;
//   String? productPrice;
//   String? addonPrice;
//   String? basePrice;
//   String? quantity;
//   String? subTotal;
//   String? discountPercentage;
//   String? discountAmount;
//   String? taxableAmount;
//   String? taxGroup;
//   String? taxPercentage;
//   String? taxAmount;
//   String? cessPercentage;
//   String? cessAmount;
//   String? totalTaxAmount;
//   String? salePrice;
//   String? productAddons;
//   String? totalPrice;
//
//   SaleOrderProducts(
//       {this.kitchenName,
//         this.cookingNotes,
//         this.productCode,
//         this.sKUCode,
//         this.hSNSACCode,
//         this.productName,
//         this.nativeName,
//         this.productCategory,
//         this.productType,
//         this.productUOM,
//         this.productPrice,
//         this.addonPrice,
//         this.basePrice,
//         this.quantity,
//         this.subTotal,
//         this.discountPercentage,
//         this.discountAmount,
//         this.taxableAmount,
//         this.taxGroup,
//         this.taxPercentage,
//         this.taxAmount,
//         this.cessPercentage,
//         this.cessAmount,
//         this.totalTaxAmount,
//         this.salePrice,
//         this.productAddons,
//         this.totalPrice});
//
//   SaleOrderProducts.fromProductList(ProductList productList) {
//     kitchenName = productList.kitchenName;
//     productCode = productList.productCode;
//     sKUCode = productList.sKUCode;
//     hSNSACCode = productList.hSNSACCode;
//     productName = productList.productName;
//     nativeName = productList.nativeName;
//     productCategory = productList.productCategory;
//     productType = productList.productType;
//     productUOM = productList.productUOM;
//     productPrice = productList.salePrice1; // assuming salePrice1 is the default
//     discountPercentage = productList.discountPercentage;
//     taxGroup = productList.taxGroup;
//     taxPercentage = productList.taxPercentage;
//     cessPercentage = productList.cessPercentage;
//     salePrice = productList.salePrice1; // assuming salePrice1 is the default
//   }
//
//   SaleOrderProducts.fromJson(Map<String, dynamic> json) {
//     kitchenName = json['Kitchen_Name'];
//     cookingNotes = json['Cooking_Notes'];
//     productCode = json['Product_Code'];
//     sKUCode = json['SKU_Code'];
//     hSNSACCode = json['HSN_SAC_Code'];
//     productName = json['Product_Name'];
//     nativeName = json['Native_Name'];
//     productCategory = json['Product_Category'];
//     productType = json['Product_Type'];
//     productUOM = json['Product_UOM'];
//     productPrice = json['Product_Price'];
//     addonPrice = json['Addon_Price'];
//     basePrice = json['Base_Price'];
//     quantity = json['Quantity'];
//     subTotal = json['Sub_Total'];
//     discountPercentage = json['Discount_Percentage'];
//     discountAmount = json['Discount_Amount'];
//     taxableAmount = json['Taxable_Amount'];
//     taxGroup = json['Tax_Group'];
//     taxPercentage = json['Tax_Percentage'];
//     taxAmount = json['Tax_Amount'];
//     cessPercentage = json['Cess_Percentage'];
//     cessAmount = json['Cess_Amount'];
//     totalTaxAmount = json['Total_Tax_Amount'];
//     salePrice = json['Sale_Price'];
//     productAddons = json['Product_Addons'];
//     totalPrice = json['Total_Price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Kitchen_Name'] = this.kitchenName;
//     data['Cooking_Notes'] = this.cookingNotes;
//     data['Product_Code'] = this.productCode;
//     data['SKU_Code'] = this.sKUCode;
//     data['HSN_SAC_Code'] = this.hSNSACCode;
//     data['Product_Name'] = this.productName;
//     data['Native_Name'] = this.nativeName;
//     data['Product_Category'] = this.productCategory;
//     data['Product_Type'] = this.productType;
//     data['Product_UOM'] = this.productUOM;
//     data['Product_Price'] = this.productPrice;
//     data['Addon_Price'] = this.addonPrice;
//     data['Base_Price'] = this.basePrice;
//     data['Quantity'] = this.quantity;
//     data['Sub_Total'] = this.subTotal;
//     data['Discount_Percentage'] = this.discountPercentage;
//     data['Discount_Amount'] = this.discountAmount;
//     data['Taxable_Amount'] = this.taxableAmount;
//     data['Tax_Group'] = this.taxGroup;
//     data['Tax_Percentage'] = this.taxPercentage;
//     data['Tax_Amount'] = this.taxAmount;
//     data['Cess_Percentage'] = this.cessPercentage;
//     data['Cess_Amount'] = this.cessAmount;
//     data['Total_Tax_Amount'] = this.totalTaxAmount;
//     data['Sale_Price'] = this.salePrice;
//     data['Product_Addons'] = this.productAddons;
//     data['Total_Price'] = this.totalPrice;
//     data['Sale_Invoice_Product_Addons'] = [];
//     data['Sale_Invoice_Product_Charges'] = [];
//     data['Sale_Invoice_Product_Discounts'] = [];
//     data['Sale_Invoice_Product_Taxes'] = [];
//     return data;
//   }
// }
