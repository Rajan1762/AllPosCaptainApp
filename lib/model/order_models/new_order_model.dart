class NewOrderKOTModel {
  int? totalQuantity;
  int? totalItems;
  String? productSubtotal;
  String? productDiscount;
  String? orderDiscount;
  String? totalDiscount;
  String? productTaxable;
  String? productTax;
  String? productCess;
  String? productWithTaxCess;
  String? productChargeTaxable;
  String? productChargeTax;
  String? productChargeCess;
  String? productChargeWithTaxCess;
  String? orderChargeTaxable;
  String? orderChargeTax;
  String? orderChargeCess;
  String? orderChargeWithTaxCess;
  String? roundingOff;
  String? tipsAmount;
  String? adjustmentAmount;
  String? grandTotal;
  int? reprintCount;
  int? generateToken;
  int? isDue;
  bool? uIPartStatus;
  List<String>? saleInvoiceHistories;
  List<String>? saleInvoiceDiscounts;
  List<String>? saleInvoiceCharges;
  List<SaleInvoicePayments>? saleInvoicePayments;
  List<SaleInvoiceProducts>? saleInvoiceProducts;
  String? branchCode;
  String? tillCode;
  String? tillName;
  String? shiftRegisterNumber;
  String? cashRegisterNumber;
  String? saleOrderType;
  String? cashierCode;
  String? cashierName;
  String? receivedAmount;
  String? balanceAmount;
  String? invoiceStatus;
  String? paymentStatus;

  NewOrderKOTModel(
      {this.totalQuantity,
        this.totalItems,
        this.productSubtotal,
        this.productDiscount,
        this.orderDiscount,
        this.totalDiscount,
        this.productTaxable,
        this.productTax,
        this.productCess,
        this.productWithTaxCess,
        this.productChargeTaxable,
        this.productChargeTax,
        this.productChargeCess,
        this.productChargeWithTaxCess,
        this.orderChargeTaxable,
        this.orderChargeTax,
        this.orderChargeCess,
        this.orderChargeWithTaxCess,
        this.roundingOff,
        this.tipsAmount,
        this.adjustmentAmount,
        this.grandTotal,
        this.reprintCount,
        this.generateToken,
        this.isDue,
        this.uIPartStatus,
        this.saleInvoiceHistories,
        this.saleInvoiceDiscounts,
        this.saleInvoiceCharges,
        this.saleInvoicePayments,
        this.saleInvoiceProducts,
        this.branchCode,
        this.tillCode,
        this.tillName,
        this.shiftRegisterNumber,
        this.cashRegisterNumber,
        this.saleOrderType,
        this.cashierCode,
        this.cashierName,
        this.receivedAmount,
        this.balanceAmount,
        this.invoiceStatus,
        this.paymentStatus});

  NewOrderKOTModel.fromJson(Map<String, dynamic> json) {
    totalQuantity = json['Total_Quantity'];
    totalItems = json['Total_Items'];
    productSubtotal = json['Product_Subtotal'];
    productDiscount = json['Product_Discount'];
    orderDiscount = json['Order_Discount'];
    totalDiscount = json['Total_Discount'];
    productTaxable = json['Product_Taxable'];
    productTax = json['Product_Tax'];
    productCess = json['Product_Cess'];
    productWithTaxCess = json['Product_With_Tax_Cess'];
    productChargeTaxable = json['Product_Charge_Taxable'];
    productChargeTax = json['Product_Charge_Tax'];
    productChargeCess = json['Product_Charge_Cess'];
    productChargeWithTaxCess = json['Product_Charge_With_Tax_Cess'];
    orderChargeTaxable = json['Order_Charge_Taxable'];
    orderChargeTax = json['Order_Charge_Tax'];
    orderChargeCess = json['Order_Charge_Cess'];
    orderChargeWithTaxCess = json['Order_Charge_With_Tax_Cess'];
    roundingOff = json['Rounding_Off'];
    tipsAmount = json['Tips_Amount'];
    adjustmentAmount = json['Adjustment_Amount'];
    grandTotal = json['Grand_Total'];
    reprintCount = json['Reprint_Count'];
    generateToken = json['Generate_Token'];
    isDue = json['Is_Due'];
    uIPartStatus = json['UI_Part_Status'];
    saleInvoiceHistories = json['Sale_Invoice_Histories'].cast<String>();
    saleInvoiceDiscounts = json['Sale_Invoice_Discounts'].cast<String>();
    saleInvoiceCharges = json['Sale_Invoice_Charges'].cast<String>();
    if (json['Sale_Invoice_Payments'] != null) {
      saleInvoicePayments = <SaleInvoicePayments>[];
      json['Sale_Invoice_Payments'].forEach((v) {
        saleInvoicePayments!.add(SaleInvoicePayments.fromJson(v));
      });
    }
    if (json['Sale_Invoice_Products'] != null) {
      saleInvoiceProducts = <SaleInvoiceProducts>[];
      json['Sale_Invoice_Products'].forEach((v) {
        saleInvoiceProducts!.add(SaleInvoiceProducts.fromJson(v));
      });
    }
    branchCode = json['Branch_Code'];
    tillCode = json['Till_Code'];
    tillName = json['Till_Name'];
    shiftRegisterNumber = json['Shift_Register_Number'];
    cashRegisterNumber = json['Cash_Register_Number'];
    saleOrderType = json['Sale_Order_Type'];
    cashierCode = json['Cashier_Code'];
    cashierName = json['Cashier_Name'];
    receivedAmount = json['Received_Amount'];
    balanceAmount = json['Balance_Amount'];
    invoiceStatus = json['Invoice_Status'];
    paymentStatus = json['Payment_Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Total_Quantity'] = totalQuantity;
    data['Total_Items'] = totalItems;
    data['Product_Subtotal'] = productSubtotal;
    data['Product_Discount'] = productDiscount;
    data['Order_Discount'] = orderDiscount;
    data['Total_Discount'] = totalDiscount;
    data['Product_Taxable'] = productTaxable;
    data['Product_Tax'] = productTax;
    data['Product_Cess'] = productCess;
    data['Product_With_Tax_Cess'] = productWithTaxCess;
    data['Product_Charge_Taxable'] = productChargeTaxable;
    data['Product_Charge_Tax'] = productChargeTax;
    data['Product_Charge_Cess'] = productChargeCess;
    data['Product_Charge_With_Tax_Cess'] = productChargeWithTaxCess;
    data['Order_Charge_Taxable'] = orderChargeTaxable;
    data['Order_Charge_Tax'] = orderChargeTax;
    data['Order_Charge_Cess'] = orderChargeCess;
    data['Order_Charge_With_Tax_Cess'] = orderChargeWithTaxCess;
    data['Rounding_Off'] = roundingOff;
    data['Tips_Amount'] = tipsAmount;
    data['Adjustment_Amount'] = adjustmentAmount;
    data['Grand_Total'] = grandTotal;
    data['Reprint_Count'] = reprintCount;
    data['Generate_Token'] = generateToken;
    data['Is_Due'] = isDue;
    data['UI_Part_Status'] = uIPartStatus;
    data['Sale_Invoice_Histories'] = saleInvoiceHistories;
    data['Sale_Invoice_Discounts'] = saleInvoiceDiscounts;
    data['Sale_Invoice_Charges'] = saleInvoiceCharges;
    if (saleInvoicePayments != null) {
      data['Sale_Invoice_Payments'] =
          saleInvoicePayments!.map((v) => v.toJson()).toList();
    }
    if (saleInvoiceProducts != null) {
      data['Sale_Invoice_Products'] =
          saleInvoiceProducts!.map((v) => v.toJson()).toList();
    }
    data['Branch_Code'] = branchCode;
    data['Till_Code'] = tillCode;
    data['Till_Name'] = tillName;
    data['Shift_Register_Number'] = shiftRegisterNumber;
    data['Cash_Register_Number'] = this.cashRegisterNumber;
    data['Sale_Order_Type'] = this.saleOrderType;
    data['Cashier_Code'] = this.cashierCode;
    data['Cashier_Name'] = this.cashierName;
    data['Received_Amount'] = this.receivedAmount;
    data['Balance_Amount'] = this.balanceAmount;
    data['Invoice_Status'] = this.invoiceStatus;
    data['Payment_Status'] = this.paymentStatus;
    return data;
  }
}

class SaleInvoicePayments {
  String? amount;
  String? tenderedAmount;
  int? loyaltyPoints;
  String? branchCode;
  String? tillCode;
  String? cashRegisterNumber;
  String? paymentMode;
  String? paymentStatus;
  String? referenceNumber;

  SaleInvoicePayments(
      {this.amount,
        this.tenderedAmount,
        this.loyaltyPoints,
        this.branchCode,
        this.tillCode,
        this.cashRegisterNumber,
        this.paymentMode,
        this.paymentStatus,
        this.referenceNumber});

  SaleInvoicePayments.fromJson(Map<String, dynamic> json) {
    amount = json['Amount'];
    tenderedAmount = json['Tendered_Amount'];
    loyaltyPoints = json['Loyalty_Points'];
    branchCode = json['Branch_Code'];
    tillCode = json['Till_Code'];
    cashRegisterNumber = json['Cash_Register_Number'];
    paymentMode = json['Payment_Mode'];
    paymentStatus = json['Payment_Status'];
    referenceNumber = json['Reference_Number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Amount'] = this.amount;
    data['Tendered_Amount'] = this.tenderedAmount;
    data['Loyalty_Points'] = this.loyaltyPoints;
    data['Branch_Code'] = this.branchCode;
    data['Till_Code'] = this.tillCode;
    data['Cash_Register_Number'] = this.cashRegisterNumber;
    data['Payment_Mode'] = this.paymentMode;
    data['Payment_Status'] = this.paymentStatus;
    data['Reference_Number'] = this.referenceNumber;
    return data;
  }
}

class SaleInvoiceProducts {
  String? costPrice;
  int? productPrice;
  int? addonPrice;
  String? basePrice;
  int? uIBasePrice;
  int? quantity;
  String? subTotal;
  int? uISubTotal;
  int? productDiscountPercentage;
  String? productDiscountAmount;
  int? orderDiscountPercentage;
  String? orderDiscountAmount;
  int? totalDiscountPercentage;
  int? totalDiscountAmount;
  double? taxableAmount;
  String? taxPercentage;
  double? taxAmount;
  String? cessPercentage;
  int? cessAmount;
  int? salePrice;
  int? isCancelled;
  int? isInvoiced;
  List<SaleInvoiceProductTaxes>? saleInvoiceProductTaxes;
  List<String>? saleInvoiceProductDiscounts;
  List<String>? saleInvoiceProductCharges;
  List<String>? saleInvoiceProductAddons;
  String? kitchenName;
  String? productCode;
  String? sKUCode;
  String? hSNSACCode;
  String? productName;
  String? nativeName;
  String? productCategory;
  String? productType;
  String? productUOM;
  String? taxGroup;
  String? cookingNotes;
  String? kOTNumber;

  SaleInvoiceProducts(
      {this.costPrice,
        this.productPrice,
        this.addonPrice,
        this.basePrice,
        this.uIBasePrice,
        this.quantity,
        this.subTotal,
        this.uISubTotal,
        this.productDiscountPercentage,
        this.productDiscountAmount,
        this.orderDiscountPercentage,
        this.orderDiscountAmount,
        this.totalDiscountPercentage,
        this.totalDiscountAmount,
        this.taxableAmount,
        this.taxPercentage,
        this.taxAmount,
        this.cessPercentage,
        this.cessAmount,
        this.salePrice,
        this.isCancelled,
        this.isInvoiced,
        this.saleInvoiceProductTaxes,
        this.saleInvoiceProductDiscounts,
        this.saleInvoiceProductCharges,
        this.saleInvoiceProductAddons,
        this.kitchenName,
        this.productCode,
        this.sKUCode,
        this.hSNSACCode,
        this.productName,
        this.nativeName,
        this.productCategory,
        this.productType,
        this.productUOM,
        this.taxGroup,
        this.cookingNotes,
        this.kOTNumber});

  SaleInvoiceProducts.fromJson(Map<String, dynamic> json) {
    costPrice = json['Cost_Price'];
    productPrice = json['Product_Price'];
    addonPrice = json['Addon_Price'];
    basePrice = json['Base_Price'];
    uIBasePrice = json['UI_Base_Price'];
    quantity = json['Quantity'];
    subTotal = json['Sub_Total'];
    uISubTotal = json['UI_Sub_Total'];
    productDiscountPercentage = json['Product_Discount_Percentage'];
    productDiscountAmount = json['Product_Discount_Amount'];
    orderDiscountPercentage = json['Order_Discount_Percentage'];
    orderDiscountAmount = json['Order_Discount_Amount'];
    totalDiscountPercentage = json['Total_Discount_Percentage'];
    totalDiscountAmount = json['Total_Discount_Amount'];
    taxableAmount = json['Taxable_Amount'];
    taxPercentage = json['Tax_Percentage'];
    taxAmount = json['Tax_Amount'];
    cessPercentage = json['Cess_Percentage'];
    cessAmount = json['Cess_Amount'];
    salePrice = json['Sale_Price'];
    isCancelled = json['Is_Cancelled'];
    isInvoiced = json['Is_Invoiced'];
    if (json['Sale_Invoice_Product_Taxes'] != null) {
      saleInvoiceProductTaxes = <SaleInvoiceProductTaxes>[];
      json['Sale_Invoice_Product_Taxes'].forEach((v) {
        saleInvoiceProductTaxes!.add(new SaleInvoiceProductTaxes.fromJson(v));
      });
    }
    saleInvoiceProductDiscounts =
        json['Sale_Invoice_Product_Discounts'].cast<String>();
    saleInvoiceProductCharges =
        json['Sale_Invoice_Product_Charges'].cast<String>();
    saleInvoiceProductAddons =
        json['Sale_Invoice_Product_Addons'].cast<String>();
    kitchenName = json['Kitchen_Name'];
    productCode = json['Product_Code'];
    sKUCode = json['SKU_Code'];
    hSNSACCode = json['HSN_SAC_Code'];
    productName = json['Product_Name'];
    nativeName = json['Native_Name'];
    productCategory = json['Product_Category'];
    productType = json['Product_Type'];
    productUOM = json['Product_UOM'];
    taxGroup = json['Tax_Group'];
    cookingNotes = json['Cooking_Notes'];
    kOTNumber = json['KOT_Number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Cost_Price'] = this.costPrice;
    data['Product_Price'] = this.productPrice;
    data['Addon_Price'] = this.addonPrice;
    data['Base_Price'] = this.basePrice;
    data['UI_Base_Price'] = this.uIBasePrice;
    data['Quantity'] = this.quantity;
    data['Sub_Total'] = this.subTotal;
    data['UI_Sub_Total'] = this.uISubTotal;
    data['Product_Discount_Percentage'] = this.productDiscountPercentage;
    data['Product_Discount_Amount'] = this.productDiscountAmount;
    data['Order_Discount_Percentage'] = this.orderDiscountPercentage;
    data['Order_Discount_Amount'] = this.orderDiscountAmount;
    data['Total_Discount_Percentage'] = this.totalDiscountPercentage;
    data['Total_Discount_Amount'] = this.totalDiscountAmount;
    data['Taxable_Amount'] = this.taxableAmount;
    data['Tax_Percentage'] = this.taxPercentage;
    data['Tax_Amount'] = this.taxAmount;
    data['Cess_Percentage'] = this.cessPercentage;
    data['Cess_Amount'] = this.cessAmount;
    data['Sale_Price'] = this.salePrice;
    data['Is_Cancelled'] = this.isCancelled;
    data['Is_Invoiced'] = this.isInvoiced;
    if (this.saleInvoiceProductTaxes != null) {
      data['Sale_Invoice_Product_Taxes'] =
          this.saleInvoiceProductTaxes!.map((v) => v.toJson()).toList();
    }
    data['Sale_Invoice_Product_Discounts'] = this.saleInvoiceProductDiscounts;
    data['Sale_Invoice_Product_Charges'] = this.saleInvoiceProductCharges;
    data['Sale_Invoice_Product_Addons'] = this.saleInvoiceProductAddons;
    data['Kitchen_Name'] = this.kitchenName;
    data['Product_Code'] = this.productCode;
    data['SKU_Code'] = this.sKUCode;
    data['HSN_SAC_Code'] = this.hSNSACCode;
    data['Product_Name'] = this.productName;
    data['Native_Name'] = this.nativeName;
    data['Product_Category'] = this.productCategory;
    data['Product_Type'] = this.productType;
    data['Product_UOM'] = this.productUOM;
    data['Tax_Group'] = this.taxGroup;
    data['Cooking_Notes'] = this.cookingNotes;
    data['KOT_Number'] = this.kOTNumber;
    return data;
  }
}

class SaleInvoiceProductTaxes {
  double? taxPercentage;
  String? taxAmount;
  String? taxName;

  SaleInvoiceProductTaxes({this.taxPercentage, this.taxAmount, this.taxName});

  SaleInvoiceProductTaxes.fromJson(Map<String, dynamic> json) {
    taxPercentage = json['Tax_Percentage'];
    taxAmount = json['Tax_Amount'];
    taxName = json['Tax_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Tax_Percentage'] = this.taxPercentage;
    data['Tax_Amount'] = this.taxAmount;
    data['Tax_Name'] = this.taxName;
    return data;
  }
}