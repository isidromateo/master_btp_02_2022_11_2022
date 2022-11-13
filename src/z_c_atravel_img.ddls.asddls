@EndUserText.label: 'Consumption - Travel Approval'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity Z_C_ATRAVEL_IMG
  as projection on Z_I_TRAVEL_IMG
{

  key travel_id       as travelid,
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
      last_changed_at as LastChangedAt,
      /* Associations */
      _Booking : redirected to composition child Z_C_ABOOKING_IMG,
      _Customer

}
