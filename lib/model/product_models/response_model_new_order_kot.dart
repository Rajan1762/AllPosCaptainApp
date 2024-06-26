class ResponseModelNewOrderKot {
  bool? status;
  String? statusCode;
  Data? data;
  String? message;
  Error? error;
  String? log;

  ResponseModelNewOrderKot(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  ResponseModelNewOrderKot.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    data['log'] = this.log;
    return data;
  }
}

class Data {
  SaleOrder? saleOrder;
  SaleInvoice? saleInvoice;

  Data({this.saleOrder, this.saleInvoice});

  Data.fromJson(Map<String, dynamic> json) {
    saleOrder = json['Sale_Order'] != null
        ? new SaleOrder.fromJson(json['Sale_Order'])
        : null;
    saleInvoice = json['Sale_Invoice'] != null
        ? new SaleInvoice.fromJson(json['Sale_Invoice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.saleOrder != null) {
      data['Sale_Order'] = this.saleOrder!.toJson();
    }
    if (this.saleInvoice != null) {
      data['Sale_Invoice'] = this.saleInvoice!.toJson();
    }
    return data;
  }
}

class SaleOrder {
  String? branchCode;
  String? branchName;
  String? tillCode;
  String? tillName;
  String? shiftRegisterNumber;
  String? cashRegisterNumber;
  String? orderReferenceNumber;
  String? saleOrderNumber;
  String? saleOrderDate;
  String? saleOrderTime;
  String? saleOrderType;
  String? captainCode;
  String? captainName;
  String? floorName;
  String? tableName;
  String? chairs;
  String? ledgerCode;
  String? ledgerName;
  String? mobile;
  String? email;
  String? address;
  String? gSTNumber;
  String? saleOrderNotes;
  String? saleOrderStatus;
  String? tokenNumber;
  String? tokenStatus;
  List<SaleOrderProducts>? saleOrderProducts;
  List<SaleOrderComplete>? saleOrderComplete;

  SaleOrder(
      {this.branchCode,
        this.branchName,
        this.tillCode,
        this.tillName,
        this.shiftRegisterNumber,
        this.cashRegisterNumber,
        this.orderReferenceNumber,
        this.saleOrderNumber,
        this.saleOrderDate,
        this.saleOrderTime,
        this.saleOrderType,
        this.captainCode,
        this.captainName,
        this.floorName,
        this.tableName,
        this.chairs,
        this.ledgerCode,
        this.ledgerName,
        this.mobile,
        this.email,
        this.address,
        this.gSTNumber,
        this.saleOrderNotes,
        this.saleOrderStatus,
        this.tokenNumber,
        this.tokenStatus,
        this.saleOrderProducts,
        this.saleOrderComplete});

  SaleOrder.fromJson(Map<String, dynamic> json) {
    branchCode = json['Branch_Code'];
    branchName = json['Branch_Name'];
    tillCode = json['Till_Code'];
    tillName = json['Till_Name'];
    shiftRegisterNumber = json['Shift_Register_Number'];
    cashRegisterNumber = json['Cash_Register_Number'];
    orderReferenceNumber = json['Order_Reference_Number'];
    saleOrderNumber = json['Sale_Order_Number'];
    saleOrderDate = json['Sale_Order_Date'];
    saleOrderTime = json['Sale_Order_Time'];
    saleOrderType = json['Sale_Order_Type'];
    captainCode = json['Captain_Code'];
    captainName = json['Captain_Name'];
    floorName = json['Floor_Name'];
    tableName = json['Table_Name'];
    chairs = json['Chairs'];
    ledgerCode = json['Ledger_Code'];
    ledgerName = json['Ledger_Name'];
    mobile = json['Mobile'];
    email = json['Email'];
    address = json['Address'];
    gSTNumber = json['GST_Number'];
    saleOrderNotes = json['Sale_Order_Notes'];
    saleOrderStatus = json['Sale_Order_Status'];
    tokenNumber = json['Token_Number'];
    tokenStatus = json['Token_Status'];
    if (json['Sale_Order_Products'] != null) {
      saleOrderProducts = <SaleOrderProducts>[];
      json['Sale_Order_Products'].forEach((v) {
        saleOrderProducts!.add(new SaleOrderProducts.fromJson(v));
      });
    }
    if (json['Sale_Order_Complete'] != null) {
      saleOrderComplete = <SaleOrderComplete>[];
      json['Sale_Order_Complete'].forEach((v) {
        saleOrderComplete!.add(new SaleOrderComplete.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch_Code'] = this.branchCode;
    data['Branch_Name'] = this.branchName;
    data['Till_Code'] = this.tillCode;
    data['Till_Name'] = this.tillName;
    data['Shift_Register_Number'] = this.shiftRegisterNumber;
    data['Cash_Register_Number'] = this.cashRegisterNumber;
    data['Order_Reference_Number'] = this.orderReferenceNumber;
    data['Sale_Order_Number'] = this.saleOrderNumber;
    data['Sale_Order_Date'] = this.saleOrderDate;
    data['Sale_Order_Time'] = this.saleOrderTime;
    data['Sale_Order_Type'] = this.saleOrderType;
    data['Captain_Code'] = this.captainCode;
    data['Captain_Name'] = this.captainName;
    data['Floor_Name'] = this.floorName;
    data['Table_Name'] = this.tableName;
    data['Chairs'] = this.chairs;
    data['Ledger_Code'] = this.ledgerCode;
    data['Ledger_Name'] = this.ledgerName;
    data['Mobile'] = this.mobile;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['GST_Number'] = this.gSTNumber;
    data['Sale_Order_Notes'] = this.saleOrderNotes;
    data['Sale_Order_Status'] = this.saleOrderStatus;
    data['Token_Number'] = this.tokenNumber;
    data['Token_Status'] = this.tokenStatus;
    if (this.saleOrderProducts != null) {
      data['Sale_Order_Products'] =
          this.saleOrderProducts!.map((v) => v.toJson()).toList();
    }
    if (this.saleOrderComplete != null) {
      data['Sale_Order_Complete'] =
          this.saleOrderComplete!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaleOrderProducts {
  String? saleOrderProductId;
  String? saleOrderNumber;
  String? kOTNumber;
  String? kitchenName;
  String? cookingNotes;
  String? orderStatus;
  String? orderTime;
  String? productCode;
  String? sKUCode;
  String? hSNSACCode;
  String? productName;
  String? nativeName;
  String? productCategory;
  String? productType;
  String? productUOM;
  String? productPrice;
  String? addonPrice;
  String? basePrice;
  String? quantity;
  String? subTotal;
  String? discountPercentage;
  String? discountAmount;
  String? taxableAmount;
  String? taxGroup;
  String? taxPercentage;
  String? taxAmount;
  String? cessPercentage;
  String? cessAmount;
  String? salePrice;
  String? productAddons;
  String? isCancelled;
  String? isInvoiced;

  SaleOrderProducts(
      {this.saleOrderProductId,
        this.saleOrderNumber,
        this.kOTNumber,
        this.kitchenName,
        this.cookingNotes,
        this.orderStatus,
        this.orderTime,
        this.productCode,
        this.sKUCode,
        this.hSNSACCode,
        this.productName,
        this.nativeName,
        this.productCategory,
        this.productType,
        this.productUOM,
        this.productPrice,
        this.addonPrice,
        this.basePrice,
        this.quantity,
        this.subTotal,
        this.discountPercentage,
        this.discountAmount,
        this.taxableAmount,
        this.taxGroup,
        this.taxPercentage,
        this.taxAmount,
        this.cessPercentage,
        this.cessAmount,
        this.salePrice,
        this.productAddons,
        this.isCancelled,
        this.isInvoiced});

  SaleOrderProducts.fromJson(Map<String, dynamic> json) {
    saleOrderProductId = json['Sale_Order_Product_Id'];
    saleOrderNumber = json['Sale_Order_Number'];
    kOTNumber = json['KOT_Number'];
    kitchenName = json['Kitchen_Name'];
    cookingNotes = json['Cooking_Notes'];
    orderStatus = json['Order_Status'];
    orderTime = json['Order_Time'];
    productCode = json['Product_Code'];
    sKUCode = json['SKU_Code'];
    hSNSACCode = json['HSN_SAC_Code'];
    productName = json['Product_Name'];
    nativeName = json['Native_Name'];
    productCategory = json['Product_Category'];
    productType = json['Product_Type'];
    productUOM = json['Product_UOM'];
    productPrice = json['Product_Price'];
    addonPrice = json['Addon_Price'];
    basePrice = json['Base_Price'];
    quantity = json['Quantity'];
    subTotal = json['Sub_Total'];
    discountPercentage = json['Discount_Percentage'];
    discountAmount = json['Discount_Amount'];
    taxableAmount = json['Taxable_Amount'];
    taxGroup = json['Tax_Group'];
    taxPercentage = json['Tax_Percentage'];
    taxAmount = json['Tax_Amount'];
    cessPercentage = json['Cess_Percentage'];
    cessAmount = json['Cess_Amount'];
    salePrice = json['Sale_Price'];
    productAddons = json['Product_Addons'];
    isCancelled = json['Is_Cancelled'];
    isInvoiced = json['Is_Invoiced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sale_Order_Product_Id'] = this.saleOrderProductId;
    data['Sale_Order_Number'] = this.saleOrderNumber;
    data['KOT_Number'] = this.kOTNumber;
    data['Kitchen_Name'] = this.kitchenName;
    data['Cooking_Notes'] = this.cookingNotes;
    data['Order_Status'] = this.orderStatus;
    data['Order_Time'] = this.orderTime;
    data['Product_Code'] = this.productCode;
    data['SKU_Code'] = this.sKUCode;
    data['HSN_SAC_Code'] = this.hSNSACCode;
    data['Product_Name'] = this.productName;
    data['Native_Name'] = this.nativeName;
    data['Product_Category'] = this.productCategory;
    data['Product_Type'] = this.productType;
    data['Product_UOM'] = this.productUOM;
    data['Product_Price'] = this.productPrice;
    data['Addon_Price'] = this.addonPrice;
    data['Base_Price'] = this.basePrice;
    data['Quantity'] = this.quantity;
    data['Sub_Total'] = this.subTotal;
    data['Discount_Percentage'] = this.discountPercentage;
    data['Discount_Amount'] = this.discountAmount;
    data['Taxable_Amount'] = this.taxableAmount;
    data['Tax_Group'] = this.taxGroup;
    data['Tax_Percentage'] = this.taxPercentage;
    data['Tax_Amount'] = this.taxAmount;
    data['Cess_Percentage'] = this.cessPercentage;
    data['Cess_Amount'] = this.cessAmount;
    data['Sale_Price'] = this.salePrice;
    data['Product_Addons'] = this.productAddons;
    data['Is_Cancelled'] = this.isCancelled;
    data['Is_Invoiced'] = this.isInvoiced;
    return data;
  }
}

class SaleOrderComplete {
  String? status;
  String? message;

  SaleOrderComplete({this.status, this.message});

  SaleOrderComplete.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    return data;
  }
}

class SaleInvoice {
  String? branchCode;
  String? branchName;
  String? tillCode;
  String? tillName;
  String? shiftRegisterNumber;
  String? cashRegisterNumber;
  String? orderReferenceNumber;
  String? fiscalYearCode;
  String? fiscalYearInvNo;
  String? saleInvoiceNumber;
  String? saleInvoiceDate;
  String? saleInvoiceTime;
  String? saleOrderType;
  String? saleTaxType;
  String? cashierCode;
  String? cashierName;
  String? captainCode;
  String? captainName;
  String? floorName;
  String? tableName;
  String? chairs;
  String? ledgerCode;
  String? ledgerName;
  String? mobile;
  String? email;
  String? address;
  String? gSTNumber;
  String? tokenNumber;
  String? totalQuantity;
  String? totalItems;
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
  String? invoiceStatus;
  String? paymentStatus;
  String? reprintCount;
  String? reprintDateTime;
  List<SaleInvoiceHistories>? saleInvoiceHistories;
  List<String>? saleInvoiceDiscounts;
  List<String>? saleInvoiceCharges;
  List<String>? saleInvoiceChargeTaxes;
  List<SaleInvoicePayments>? saleInvoicePayments;
  List<SaleInvoiceProducts>? saleInvoiceProducts;
  List<SaleInvoiceProductTaxes>? saleInvoiceProductTaxes;
  List<String>? saleInvoiceProductDiscounts;
  List<String>? saleInvoiceProductCharges;
  List<String>? saleInvoiceProductChargeTaxes;
  List<String>? saleInvoiceProductAddons;
  List<SaleInvoiceTaxSummary>? saleInvoiceTaxSummary;

  SaleInvoice(
      {this.branchCode,
        this.branchName,
        this.tillCode,
        this.tillName,
        this.shiftRegisterNumber,
        this.cashRegisterNumber,
        this.orderReferenceNumber,
        this.fiscalYearCode,
        this.fiscalYearInvNo,
        this.saleInvoiceNumber,
        this.saleInvoiceDate,
        this.saleInvoiceTime,
        this.saleOrderType,
        this.saleTaxType,
        this.cashierCode,
        this.cashierName,
        this.captainCode,
        this.captainName,
        this.floorName,
        this.tableName,
        this.chairs,
        this.ledgerCode,
        this.ledgerName,
        this.mobile,
        this.email,
        this.address,
        this.gSTNumber,
        this.tokenNumber,
        this.totalQuantity,
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
        this.invoiceStatus,
        this.paymentStatus,
        this.reprintCount,
        this.reprintDateTime,
        this.saleInvoiceHistories,
        this.saleInvoiceDiscounts,
        this.saleInvoiceCharges,
        this.saleInvoiceChargeTaxes,
        this.saleInvoicePayments,
        this.saleInvoiceProducts,
        this.saleInvoiceProductTaxes,
        this.saleInvoiceProductDiscounts,
        this.saleInvoiceProductCharges,
        this.saleInvoiceProductChargeTaxes,
        this.saleInvoiceProductAddons,
        this.saleInvoiceTaxSummary});

  SaleInvoice.fromJson(Map<String, dynamic> json) {
    branchCode = json['Branch_Code'];
    branchName = json['Branch_Name'];
    tillCode = json['Till_Code'];
    tillName = json['Till_Name'];
    shiftRegisterNumber = json['Shift_Register_Number'];
    cashRegisterNumber = json['Cash_Register_Number'];
    orderReferenceNumber = json['Order_Reference_Number'];
    fiscalYearCode = json['Fiscal_Year_Code'];
    fiscalYearInvNo = json['Fiscal_Year_InvNo'];
    saleInvoiceNumber = json['Sale_Invoice_Number'];
    saleInvoiceDate = json['Sale_Invoice_Date'];
    saleInvoiceTime = json['Sale_Invoice_Time'];
    saleOrderType = json['Sale_Order_Type'];
    saleTaxType = json['Sale_Tax_Type'];
    cashierCode = json['Cashier_Code'];
    cashierName = json['Cashier_Name'];
    captainCode = json['Captain_Code'];
    captainName = json['Captain_Name'];
    floorName = json['Floor_Name'];
    tableName = json['Table_Name'];
    chairs = json['Chairs'];
    ledgerCode = json['Ledger_Code'];
    ledgerName = json['Ledger_Name'];
    mobile = json['Mobile'];
    email = json['Email'];
    address = json['Address'];
    gSTNumber = json['GST_Number'];
    tokenNumber = json['Token_Number'];
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
    invoiceStatus = json['Invoice_Status'];
    paymentStatus = json['Payment_Status'];
    reprintCount = json['Reprint_Count'];
    reprintDateTime = json['Reprint_DateTime'];
    if (json['Sale_Invoice_Histories'] != null) {
      saleInvoiceHistories = <SaleInvoiceHistories>[];
      json['Sale_Invoice_Histories'].forEach((v) {
        saleInvoiceHistories!.add(new SaleInvoiceHistories.fromJson(v));
      });
    }
    saleInvoiceDiscounts = json['Sale_Invoice_Discounts'].cast<String>();
    saleInvoiceCharges = json['Sale_Invoice_Charges'].cast<String>();
    saleInvoiceChargeTaxes = json['Sale_Invoice_Charge_Taxes'].cast<String>();
    if (json['Sale_Invoice_Payments'] != null) {
      saleInvoicePayments = <SaleInvoicePayments>[];
      json['Sale_Invoice_Payments'].forEach((v) {
        saleInvoicePayments!.add(new SaleInvoicePayments.fromJson(v));
      });
    }
    if (json['Sale_Invoice_Products'] != null) {
      saleInvoiceProducts = <SaleInvoiceProducts>[];
      json['Sale_Invoice_Products'].forEach((v) {
        saleInvoiceProducts!.add(new SaleInvoiceProducts.fromJson(v));
      });
    }
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
    saleInvoiceProductChargeTaxes =
        json['Sale_Invoice_Product_Charge_Taxes'].cast<String>();
    saleInvoiceProductAddons =
        json['Sale_Invoice_Product_Addons'].cast<String>();
    if (json['Sale_Invoice_Tax_Summary'] != null) {
      saleInvoiceTaxSummary = <SaleInvoiceTaxSummary>[];
      json['Sale_Invoice_Tax_Summary'].forEach((v) {
        saleInvoiceTaxSummary!.add(new SaleInvoiceTaxSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch_Code'] = this.branchCode;
    data['Branch_Name'] = this.branchName;
    data['Till_Code'] = this.tillCode;
    data['Till_Name'] = this.tillName;
    data['Shift_Register_Number'] = this.shiftRegisterNumber;
    data['Cash_Register_Number'] = this.cashRegisterNumber;
    data['Order_Reference_Number'] = this.orderReferenceNumber;
    data['Fiscal_Year_Code'] = this.fiscalYearCode;
    data['Fiscal_Year_InvNo'] = this.fiscalYearInvNo;
    data['Sale_Invoice_Number'] = this.saleInvoiceNumber;
    data['Sale_Invoice_Date'] = this.saleInvoiceDate;
    data['Sale_Invoice_Time'] = this.saleInvoiceTime;
    data['Sale_Order_Type'] = this.saleOrderType;
    data['Sale_Tax_Type'] = this.saleTaxType;
    data['Cashier_Code'] = this.cashierCode;
    data['Cashier_Name'] = this.cashierName;
    data['Captain_Code'] = this.captainCode;
    data['Captain_Name'] = this.captainName;
    data['Floor_Name'] = this.floorName;
    data['Table_Name'] = this.tableName;
    data['Chairs'] = this.chairs;
    data['Ledger_Code'] = this.ledgerCode;
    data['Ledger_Name'] = this.ledgerName;
    data['Mobile'] = this.mobile;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['GST_Number'] = this.gSTNumber;
    data['Token_Number'] = this.tokenNumber;
    data['Total_Quantity'] = this.totalQuantity;
    data['Total_Items'] = this.totalItems;
    data['Product_Subtotal'] = this.productSubtotal;
    data['Product_Discount'] = this.productDiscount;
    data['Order_Discount'] = this.orderDiscount;
    data['Total_Discount'] = this.totalDiscount;
    data['Product_Taxable'] = this.productTaxable;
    data['Product_Tax'] = this.productTax;
    data['Product_Cess'] = this.productCess;
    data['Product_With_Tax_Cess'] = this.productWithTaxCess;
    data['Product_Charge_Taxable'] = this.productChargeTaxable;
    data['Product_Charge_Tax'] = this.productChargeTax;
    data['Product_Charge_Cess'] = this.productChargeCess;
    data['Product_Charge_With_Tax_Cess'] = this.productChargeWithTaxCess;
    data['Order_Charge_Taxable'] = this.orderChargeTaxable;
    data['Order_Charge_Tax'] = this.orderChargeTax;
    data['Order_Charge_Cess'] = this.orderChargeCess;
    data['Order_Charge_With_Tax_Cess'] = this.orderChargeWithTaxCess;
    data['Rounding_Off'] = this.roundingOff;
    data['Tips_Amount'] = this.tipsAmount;
    data['Adjustment_Amount'] = this.adjustmentAmount;
    data['Grand_Total'] = this.grandTotal;
    data['Invoice_Status'] = this.invoiceStatus;
    data['Payment_Status'] = this.paymentStatus;
    data['Reprint_Count'] = this.reprintCount;
    data['Reprint_DateTime'] = this.reprintDateTime;
    if (this.saleInvoiceHistories != null) {
      data['Sale_Invoice_Histories'] =
          this.saleInvoiceHistories!.map((v) => v.toJson()).toList();
    }
    data['Sale_Invoice_Discounts'] = this.saleInvoiceDiscounts;
    data['Sale_Invoice_Charges'] = this.saleInvoiceCharges;
    data['Sale_Invoice_Charge_Taxes'] = this.saleInvoiceChargeTaxes;
    if (this.saleInvoicePayments != null) {
      data['Sale_Invoice_Payments'] =
          this.saleInvoicePayments!.map((v) => v.toJson()).toList();
    }
    if (this.saleInvoiceProducts != null) {
      data['Sale_Invoice_Products'] =
          this.saleInvoiceProducts!.map((v) => v.toJson()).toList();
    }
    if (this.saleInvoiceProductTaxes != null) {
      data['Sale_Invoice_Product_Taxes'] =
          this.saleInvoiceProductTaxes!.map((v) => v.toJson()).toList();
    }
    data['Sale_Invoice_Product_Discounts'] = this.saleInvoiceProductDiscounts;
    data['Sale_Invoice_Product_Charges'] = this.saleInvoiceProductCharges;
    data['Sale_Invoice_Product_Charge_Taxes'] =
        this.saleInvoiceProductChargeTaxes;
    data['Sale_Invoice_Product_Addons'] = this.saleInvoiceProductAddons;
    if (this.saleInvoiceTaxSummary != null) {
      data['Sale_Invoice_Tax_Summary'] =
          this.saleInvoiceTaxSummary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaleInvoiceHistories {
  String? invoiceStatus;
  String? createdOn;
  String? createdBy;

  SaleInvoiceHistories({this.invoiceStatus, this.createdOn, this.createdBy});

  SaleInvoiceHistories.fromJson(Map<String, dynamic> json) {
    invoiceStatus = json['Invoice_Status'];
    createdOn = json['Created_On'];
    createdBy = json['Created_By'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Invoice_Status'] = this.invoiceStatus;
    data['Created_On'] = this.createdOn;
    data['Created_By'] = this.createdBy;
    return data;
  }
}

class SaleInvoicePayments {
  String? branchCode;
  String? tillCode;
  String? cashRegisterNumber;
  String? paymentMode;
  String? paymentDate;
  String? paymentTime;
  String? amount;
  String? paymentStatus;
  String? referenceNumber;
  String? tenderedAmount;
  String? loyaltyPoints;
  String? createdOn;
  String? createdBy;
  String? updatedOn;
  String? updatedBy;

  SaleInvoicePayments(
      {this.branchCode,
        this.tillCode,
        this.cashRegisterNumber,
        this.paymentMode,
        this.paymentDate,
        this.paymentTime,
        this.amount,
        this.paymentStatus,
        this.referenceNumber,
        this.tenderedAmount,
        this.loyaltyPoints,
        this.createdOn,
        this.createdBy,
        this.updatedOn,
        this.updatedBy});

  SaleInvoicePayments.fromJson(Map<String, dynamic> json) {
    branchCode = json['Branch_Code'];
    tillCode = json['Till_Code'];
    cashRegisterNumber = json['Cash_Register_Number'];
    paymentMode = json['Payment_Mode'];
    paymentDate = json['Payment_Date'];
    paymentTime = json['Payment_Time'];
    amount = json['Amount'];
    paymentStatus = json['Payment_Status'];
    referenceNumber = json['Reference_Number'];
    tenderedAmount = json['Tendered_Amount'];
    loyaltyPoints = json['Loyalty_Points'];
    createdOn = json['Created_On'];
    createdBy = json['Created_By'];
    updatedOn = json['Updated_On'];
    updatedBy = json['Updated_By'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch_Code'] = this.branchCode;
    data['Till_Code'] = this.tillCode;
    data['Cash_Register_Number'] = this.cashRegisterNumber;
    data['Payment_Mode'] = this.paymentMode;
    data['Payment_Date'] = this.paymentDate;
    data['Payment_Time'] = this.paymentTime;
    data['Amount'] = this.amount;
    data['Payment_Status'] = this.paymentStatus;
    data['Reference_Number'] = this.referenceNumber;
    data['Tendered_Amount'] = this.tenderedAmount;
    data['Loyalty_Points'] = this.loyaltyPoints;
    data['Created_On'] = this.createdOn;
    data['Created_By'] = this.createdBy;
    data['Updated_On'] = this.updatedOn;
    data['Updated_By'] = this.updatedBy;
    return data;
  }
}

class SaleInvoiceProducts {
  String? saleOrderNumber;
  String? kOTNumber;
  String? kitchenName;
  String? productLineItemNo;
  String? productCode;
  String? sKUCode;
  String? hSNSACCode;
  String? productName;
  String? nativeName;
  String? productCategory;
  String? productType;
  String? productUOM;
  String? costPrice;
  String? productPrice;
  String? addonPrice;
  String? basePrice;
  String? quantity;
  String? subTotal;
  String? productDiscountPercentage;
  String? productDiscountAmount;
  String? orderDiscountPercentage;
  String? orderDiscountAmount;
  String? totalDiscountPercentage;
  String? totalDiscountAmount;
  String? taxableAmount;
  String? taxGroup;
  String? taxPercentage;
  String? taxAmount;
  String? cessPercentage;
  String? cessAmount;
  String? salePrice;
  String? isCancelled;
  String? createdOn;
  String? updatedOn;
  String? updatedBy;

  SaleInvoiceProducts(
      {this.saleOrderNumber,
        this.kOTNumber,
        this.kitchenName,
        this.productLineItemNo,
        this.productCode,
        this.sKUCode,
        this.hSNSACCode,
        this.productName,
        this.nativeName,
        this.productCategory,
        this.productType,
        this.productUOM,
        this.costPrice,
        this.productPrice,
        this.addonPrice,
        this.basePrice,
        this.quantity,
        this.subTotal,
        this.productDiscountPercentage,
        this.productDiscountAmount,
        this.orderDiscountPercentage,
        this.orderDiscountAmount,
        this.totalDiscountPercentage,
        this.totalDiscountAmount,
        this.taxableAmount,
        this.taxGroup,
        this.taxPercentage,
        this.taxAmount,
        this.cessPercentage,
        this.cessAmount,
        this.salePrice,
        this.isCancelled,
        this.createdOn,
        this.updatedOn,
        this.updatedBy});

  SaleInvoiceProducts.fromJson(Map<String, dynamic> json) {
    saleOrderNumber = json['Sale_Order_Number'];
    kOTNumber = json['KOT_Number'];
    kitchenName = json['Kitchen_Name'];
    productLineItemNo = json['Product_Line_Item_No'];
    productCode = json['Product_Code'];
    sKUCode = json['SKU_Code'];
    hSNSACCode = json['HSN_SAC_Code'];
    productName = json['Product_Name'];
    nativeName = json['Native_Name'];
    productCategory = json['Product_Category'];
    productType = json['Product_Type'];
    productUOM = json['Product_UOM'];
    costPrice = json['Cost_Price'];
    productPrice = json['Product_Price'];
    addonPrice = json['Addon_Price'];
    basePrice = json['Base_Price'];
    quantity = json['Quantity'];
    subTotal = json['Sub_Total'];
    productDiscountPercentage = json['Product_Discount_Percentage'];
    productDiscountAmount = json['Product_Discount_Amount'];
    orderDiscountPercentage = json['Order_Discount_Percentage'];
    orderDiscountAmount = json['Order_Discount_Amount'];
    totalDiscountPercentage = json['Total_Discount_Percentage'];
    totalDiscountAmount = json['Total_Discount_Amount'];
    taxableAmount = json['Taxable_Amount'];
    taxGroup = json['Tax_Group'];
    taxPercentage = json['Tax_Percentage'];
    taxAmount = json['Tax_Amount'];
    cessPercentage = json['Cess_Percentage'];
    cessAmount = json['Cess_Amount'];
    salePrice = json['Sale_Price'];
    isCancelled = json['Is_Cancelled'];
    createdOn = json['Created_On'];
    updatedOn = json['Updated_On'];
    updatedBy = json['Updated_By'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sale_Order_Number'] = this.saleOrderNumber;
    data['KOT_Number'] = this.kOTNumber;
    data['Kitchen_Name'] = this.kitchenName;
    data['Product_Line_Item_No'] = this.productLineItemNo;
    data['Product_Code'] = this.productCode;
    data['SKU_Code'] = this.sKUCode;
    data['HSN_SAC_Code'] = this.hSNSACCode;
    data['Product_Name'] = this.productName;
    data['Native_Name'] = this.nativeName;
    data['Product_Category'] = this.productCategory;
    data['Product_Type'] = this.productType;
    data['Product_UOM'] = this.productUOM;
    data['Cost_Price'] = this.costPrice;
    data['Product_Price'] = this.productPrice;
    data['Addon_Price'] = this.addonPrice;
    data['Base_Price'] = this.basePrice;
    data['Quantity'] = this.quantity;
    data['Sub_Total'] = this.subTotal;
    data['Product_Discount_Percentage'] = this.productDiscountPercentage;
    data['Product_Discount_Amount'] = this.productDiscountAmount;
    data['Order_Discount_Percentage'] = this.orderDiscountPercentage;
    data['Order_Discount_Amount'] = this.orderDiscountAmount;
    data['Total_Discount_Percentage'] = this.totalDiscountPercentage;
    data['Total_Discount_Amount'] = this.totalDiscountAmount;
    data['Taxable_Amount'] = this.taxableAmount;
    data['Tax_Group'] = this.taxGroup;
    data['Tax_Percentage'] = this.taxPercentage;
    data['Tax_Amount'] = this.taxAmount;
    data['Cess_Percentage'] = this.cessPercentage;
    data['Cess_Amount'] = this.cessAmount;
    data['Sale_Price'] = this.salePrice;
    data['Is_Cancelled'] = this.isCancelled;
    data['Created_On'] = this.createdOn;
    data['Updated_On'] = this.updatedOn;
    data['Updated_By'] = this.updatedBy;
    return data;
  }
}

class SaleInvoiceProductTaxes {
  String? productLineItemNo;
  String? taxName;
  String? taxPercentage;
  String? taxAmount;

  SaleInvoiceProductTaxes(
      {this.productLineItemNo,
        this.taxName,
        this.taxPercentage,
        this.taxAmount});

  SaleInvoiceProductTaxes.fromJson(Map<String, dynamic> json) {
    productLineItemNo = json['Product_Line_Item_No'];
    taxName = json['Tax_Name'];
    taxPercentage = json['Tax_Percentage'];
    taxAmount = json['Tax_Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Product_Line_Item_No'] = this.productLineItemNo;
    data['Tax_Name'] = this.taxName;
    data['Tax_Percentage'] = this.taxPercentage;
    data['Tax_Amount'] = this.taxAmount;
    return data;
  }
}

class SaleInvoiceTaxSummary {
  String? taxName;
  String? taxPercentage;
  String? taxableAmount;
  String? taxAmount;

  SaleInvoiceTaxSummary(
      {this.taxName, this.taxPercentage, this.taxableAmount, this.taxAmount});

  SaleInvoiceTaxSummary.fromJson(Map<String, dynamic> json) {
    taxName = json['Tax_Name'];
    taxPercentage = json['Tax_Percentage'];
    taxableAmount = json['Taxable_Amount'];
    taxAmount = json['Tax_Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Tax_Name'] = this.taxName;
    data['Tax_Percentage'] = this.taxPercentage;
    data['Taxable_Amount'] = this.taxableAmount;
    data['Tax_Amount'] = this.taxAmount;
    return data;
  }
}

class Error {
  String? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
// -------------------------------------------------------------------
// class ResponseModelNewOrderKot {
//   bool status;
//   String statusCode;
//   Data data;
//   String message;
//   Error error;
//   String log;
//
//   ResponseModelNewOrderKot({
//     required this.status,
//     required this.statusCode,
//     required this.data,
//     required this.message,
//     required this.error,
//     required this.log,
//   });
//
// }
//
// class Data {
//   SaleOrder saleOrder;
//   SaleInvoice saleInvoice;
//
//   Data({
//     required this.saleOrder,
//     required this.saleInvoice,
//   });
//
// }
//
// class SaleInvoice {
//   String branchCode;
//   String branchName;
//   String tillCode;
//   String tillName;
//   String shiftRegisterNumber;
//   String cashRegisterNumber;
//   String orderReferenceNumber;
//   String fiscalYearCode;
//   String fiscalYearInvNo;
//   String saleInvoiceNumber;
//   String saleInvoiceDate;
//   String saleInvoiceTime;
//   String saleOrderType;
//   String saleTaxType;
//   String cashierCode;
//   String cashierName;
//   String captainCode;
//   String captainName;
//   String floorName;
//   String tableName;
//   String chairs;
//   String ledgerCode;
//   String ledgerName;
//   String mobile;
//   String email;
//   String address;
//   String gstNumber;
//   String tokenNumber;
//   String totalQuantity;
//   String totalItems;
//   String productSubtotal;
//   String productDiscount;
//   String orderDiscount;
//   String totalDiscount;
//   String productTaxable;
//   String productTax;
//   String productCess;
//   String productWithTaxCess;
//   String productChargeTaxable;
//   String productChargeTax;
//   String productChargeCess;
//   String productChargeWithTaxCess;
//   String orderChargeTaxable;
//   String orderChargeTax;
//   String orderChargeCess;
//   String orderChargeWithTaxCess;
//   String roundingOff;
//   String tipsAmount;
//   String adjustmentAmount;
//   String grandTotal;
//   String invoiceStatus;
//   String paymentStatus;
//   String reprintCount;
//   String reprintDateTime;
//   List<SaleInvoiceHistory> saleInvoiceHistories;
//   List<dynamic> saleInvoiceDiscounts;
//   List<dynamic> saleInvoiceCharges;
//   List<dynamic> saleInvoiceChargeTaxes;
//   List<SaleInvoicePayment> saleInvoicePayments;
//   List<SaleInvoiceProduct> saleInvoiceProducts;
//   List<SaleInvoiceProductTaxElement> saleInvoiceProductTaxes;
//   List<dynamic> saleInvoiceProductDiscounts;
//   List<dynamic> saleInvoiceProductCharges;
//   List<dynamic> saleInvoiceProductChargeTaxes;
//   List<dynamic> saleInvoiceProductAddons;
//   List<SaleInvoiceProductTaxElement> saleInvoiceTaxSummary;
//
//   SaleInvoice({
//     required this.branchCode,
//     required this.branchName,
//     required this.tillCode,
//     required this.tillName,
//     required this.shiftRegisterNumber,
//     required this.cashRegisterNumber,
//     required this.orderReferenceNumber,
//     required this.fiscalYearCode,
//     required this.fiscalYearInvNo,
//     required this.saleInvoiceNumber,
//     required this.saleInvoiceDate,
//     required this.saleInvoiceTime,
//     required this.saleOrderType,
//     required this.saleTaxType,
//     required this.cashierCode,
//     required this.cashierName,
//     required this.captainCode,
//     required this.captainName,
//     required this.floorName,
//     required this.tableName,
//     required this.chairs,
//     required this.ledgerCode,
//     required this.ledgerName,
//     required this.mobile,
//     required this.email,
//     required this.address,
//     required this.gstNumber,
//     required this.tokenNumber,
//     required this.totalQuantity,
//     required this.totalItems,
//     required this.productSubtotal,
//     required this.productDiscount,
//     required this.orderDiscount,
//     required this.totalDiscount,
//     required this.productTaxable,
//     required this.productTax,
//     required this.productCess,
//     required this.productWithTaxCess,
//     required this.productChargeTaxable,
//     required this.productChargeTax,
//     required this.productChargeCess,
//     required this.productChargeWithTaxCess,
//     required this.orderChargeTaxable,
//     required this.orderChargeTax,
//     required this.orderChargeCess,
//     required this.orderChargeWithTaxCess,
//     required this.roundingOff,
//     required this.tipsAmount,
//     required this.adjustmentAmount,
//     required this.grandTotal,
//     required this.invoiceStatus,
//     required this.paymentStatus,
//     required this.reprintCount,
//     required this.reprintDateTime,
//     required this.saleInvoiceHistories,
//     required this.saleInvoiceDiscounts,
//     required this.saleInvoiceCharges,
//     required this.saleInvoiceChargeTaxes,
//     required this.saleInvoicePayments,
//     required this.saleInvoiceProducts,
//     required this.saleInvoiceProductTaxes,
//     required this.saleInvoiceProductDiscounts,
//     required this.saleInvoiceProductCharges,
//     required this.saleInvoiceProductChargeTaxes,
//     required this.saleInvoiceProductAddons,
//     required this.saleInvoiceTaxSummary,
//   });
//
// }
//
// class SaleInvoiceHistory {
//   String invoiceStatus;
//   String createdOn;
//   String createdBy;
//
//   SaleInvoiceHistory({
//     required this.invoiceStatus,
//     required this.createdOn,
//     required this.createdBy,
//   });
//
// }
//
// class SaleInvoicePayment {
//   String branchCode;
//   String tillCode;
//   String cashRegisterNumber;
//   String paymentMode;
//   String paymentDate;
//   String paymentTime;
//   String amount;
//   String paymentStatus;
//   String referenceNumber;
//   String tenderedAmount;
//   String loyaltyPoints;
//   String createdOn;
//   String createdBy;
//   String updatedOn;
//   String updatedBy;
//
//   SaleInvoicePayment({
//     required this.branchCode,
//     required this.tillCode,
//     required this.cashRegisterNumber,
//     required this.paymentMode,
//     required this.paymentDate,
//     required this.paymentTime,
//     required this.amount,
//     required this.paymentStatus,
//     required this.referenceNumber,
//     required this.tenderedAmount,
//     required this.loyaltyPoints,
//     required this.createdOn,
//     required this.createdBy,
//     required this.updatedOn,
//     required this.updatedBy,
//   });
//
// }
//
// class SaleInvoiceProductTaxElement {
//   String? productLineItemNo;
//   TaxName taxName;
//   String taxPercentage;
//   String taxAmount;
//   String? taxableAmount;
//
//   SaleInvoiceProductTaxElement({
//     this.productLineItemNo,
//     required this.taxName,
//     required this.taxPercentage,
//     required this.taxAmount,
//     this.taxableAmount,
//   });
//
// }
//
// enum TaxName {
//   CGST,
//   SGST_UTGST
// }
//
// class SaleInvoiceProduct {
//   String saleOrderNumber;
//   String kotNumber;
//   String kitchenName;
//   String productLineItemNo;
//   String productCode;
//   String skuCode;
//   String hsnSacCode;
//   String productName;
//   String nativeName;
//   String productCategory;
//   String productType;
//   String productUom;
//   String costPrice;
//   String productPrice;
//   String addonPrice;
//   String basePrice;
//   String quantity;
//   String subTotal;
//   String productDiscountPercentage;
//   String productDiscountAmount;
//   String orderDiscountPercentage;
//   String orderDiscountAmount;
//   String totalDiscountPercentage;
//   String totalDiscountAmount;
//   String taxableAmount;
//   String taxGroup;
//   String taxPercentage;
//   String taxAmount;
//   String cessPercentage;
//   String cessAmount;
//   String salePrice;
//   String isCancelled;
//   String createdOn;
//   String updatedOn;
//   String updatedBy;
//
//   SaleInvoiceProduct({
//     required this.saleOrderNumber,
//     required this.kotNumber,
//     required this.kitchenName,
//     required this.productLineItemNo,
//     required this.productCode,
//     required this.skuCode,
//     required this.hsnSacCode,
//     required this.productName,
//     required this.nativeName,
//     required this.productCategory,
//     required this.productType,
//     required this.productUom,
//     required this.costPrice,
//     required this.productPrice,
//     required this.addonPrice,
//     required this.basePrice,
//     required this.quantity,
//     required this.subTotal,
//     required this.productDiscountPercentage,
//     required this.productDiscountAmount,
//     required this.orderDiscountPercentage,
//     required this.orderDiscountAmount,
//     required this.totalDiscountPercentage,
//     required this.totalDiscountAmount,
//     required this.taxableAmount,
//     required this.taxGroup,
//     required this.taxPercentage,
//     required this.taxAmount,
//     required this.cessPercentage,
//     required this.cessAmount,
//     required this.salePrice,
//     required this.isCancelled,
//     required this.createdOn,
//     required this.updatedOn,
//     required this.updatedBy,
//   });
//
// }
//
// class SaleOrder {
//   String branchCode;
//   String branchName;
//   String tillCode;
//   String tillName;
//   String shiftRegisterNumber;
//   String cashRegisterNumber;
//   String orderReferenceNumber;
//   String saleOrderNumber;
//   String saleOrderDate;
//   String saleOrderTime;
//   String saleOrderType;
//   String captainCode;
//   String captainName;
//   String floorName;
//   String tableName;
//   String chairs;
//   String ledgerCode;
//   String ledgerName;
//   String mobile;
//   String email;
//   String address;
//   String gstNumber;
//   String saleOrderNotes;
//   String saleOrderStatus;
//   String tokenNumber;
//   String tokenStatus;
//   List<SaleOrderProduct> saleOrderProducts;
//   List<SaleOrderComplete> saleOrderComplete;
//
//   SaleOrder({
//     required this.branchCode,
//     required this.branchName,
//     required this.tillCode,
//     required this.tillName,
//     required this.shiftRegisterNumber,
//     required this.cashRegisterNumber,
//     required this.orderReferenceNumber,
//     required this.saleOrderNumber,
//     required this.saleOrderDate,
//     required this.saleOrderTime,
//     required this.saleOrderType,
//     required this.captainCode,
//     required this.captainName,
//     required this.floorName,
//     required this.tableName,
//     required this.chairs,
//     required this.ledgerCode,
//     required this.ledgerName,
//     required this.mobile,
//     required this.email,
//     required this.address,
//     required this.gstNumber,
//     required this.saleOrderNotes,
//     required this.saleOrderStatus,
//     required this.tokenNumber,
//     required this.tokenStatus,
//     required this.saleOrderProducts,
//     required this.saleOrderComplete,
//   });
//
// }
//
// class SaleOrderComplete {
//   String status;
//   String message;
//
//   SaleOrderComplete({
//     required this.status,
//     required this.message,
//   });
//
// }
//
// class SaleOrderProduct {
//   String saleOrderProductId;
//   String saleOrderNumber;
//   String kotNumber;
//   String kitchenName;
//   String cookingNotes;
//   String orderStatus;
//   String orderTime;
//   String productCode;
//   String skuCode;
//   String hsnSacCode;
//   String productName;
//   String nativeName;
//   String productCategory;
//   String productType;
//   String productUom;
//   String productPrice;
//   String addonPrice;
//   String basePrice;
//   String quantity;
//   String subTotal;
//   String discountPercentage;
//   String discountAmount;
//   String taxableAmount;
//   String taxGroup;
//   String taxPercentage;
//   String taxAmount;
//   String cessPercentage;
//   String cessAmount;
//   String salePrice;
//   String productAddons;
//   String isCancelled;
//   String isInvoiced;
//
//   SaleOrderProduct({
//     required this.saleOrderProductId,
//     required this.saleOrderNumber,
//     required this.kotNumber,
//     required this.kitchenName,
//     required this.cookingNotes,
//     required this.orderStatus,
//     required this.orderTime,
//     required this.productCode,
//     required this.skuCode,
//     required this.hsnSacCode,
//     required this.productName,
//     required this.nativeName,
//     required this.productCategory,
//     required this.productType,
//     required this.productUom,
//     required this.productPrice,
//     required this.addonPrice,
//     required this.basePrice,
//     required this.quantity,
//     required this.subTotal,
//     required this.discountPercentage,
//     required this.discountAmount,
//     required this.taxableAmount,
//     required this.taxGroup,
//     required this.taxPercentage,
//     required this.taxAmount,
//     required this.cessPercentage,
//     required this.cessAmount,
//     required this.salePrice,
//     required this.productAddons,
//     required this.isCancelled,
//     required this.isInvoiced,
//   });
//
// }
//
// class Error {
//   dynamic code;
//   dynamic message;
//
//   Error({
//     required this.code,
//     required this.message,
//   });
//
// }
