@EndUserText.label: 'Consumption - Travel'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity Z_C_TRAVEL_IMG
  as projection on Z_I_TRAVEL_IMG
{

  key     travel_id       as travelid,
          agency_id       as agencyid,
          customer_id     as customerid,
          begin_date      as begindate,
          end_date        as enddate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          booking_fee     as bookingfee,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          total_price     as totalprice,
          @Semantics.currencyCode: true
          currency_code   as currencycode,
          description     as description,
          overall_status  as overallstatus,
          created_by      as createdby,
          created_at      as createdat,
          last_changed_by as lastchangedby,
          last_changed_at as lastchangedat,
          @Semantics.amount.currencyCode:
          'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy:
          'ABAP:ZCL_VIRT_ELEMEN_IMG'
  virtual DiscountPrice : /dmo/total_price,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRT_ELEMEN_IMG'
  virtual ImageURL      : abap.string( 256 ),
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRT_ELEMEN_IMG'
  virtual AgencyInits   : abap.char( 2 ),
          /* Associations */
          _agency,
          _Booking : redirected to composition child Z_C_BOOKING_IMG,
          _Currency,
          _Customer

}
