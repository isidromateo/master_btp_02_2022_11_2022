@AbapCatalog.sqlViewName: 'ZV_BOOK_IMG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface - Booking'
define view Z_I_BOOKING_IMG
  as select from ztb_booking_img as booking
  composition [0..*] of Z_I_BOOKSUPPL_IMG as _bookingSupplement
  association        to parent Z_I_TRAVEL_IMG    as _travel on $projection.travel_id = _travel.travel_id
  association [1..1] to /DMO/I_Customer   as _customer      on $projection.customer_id = _customer.CustomerID
  association [1..1] to /DMO/I_Carrier    as _Carrier       on $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection as _Connection    on $projection.connection_id = _Connection.ConnectionID
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      flight_price,
      currency_code,
      booking_status,
      _travel.last_changed_at,
      _travel,
      _bookingSupplement,
      _customer,
      _Carrier,
      _Connection
}
