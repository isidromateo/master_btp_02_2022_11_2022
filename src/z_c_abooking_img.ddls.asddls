@EndUserText.label: 'Consumption - Booking - Approval'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_ABOOKING_IMG
  as projection on Z_I_BOOKING_IMG
{
  key travel_id      as travel_id,
  key booking_id     as booking_id,
      booking_date   as booking_date,
      customer_id    as customer_id,
      carrier_id     as carrier_id,
      connection_id  as connection_id,
      flight_date    as flight_date,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price   as flightprice,
      @Semantics.currencyCode: true
      currency_code  as currencycode,
      booking_status as bookingstatus,
      last_changed_at as lastchange_at,
      /* Associations */
      _travel            : redirected to parent Z_C_ATRAVEL_IMG,
      _customer,
      _Carrier

}
