@AbapCatalog.sqlViewName: 'ZV_BOOKSUP_IMG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS - Interface - Booking Supplement'
define view Z_I_BOOKSUPPL_IMG
  as select from ztb_booksupl_img as bookingsupplement
  association        to parent Z_I_BOOKING_IMG as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                  and $projection.booking_id = _Booking.booking_id
  association [1..1] to Z_I_TRAVEL_IMG         as _travel         on  $projection.travel_id = _travel.travel_id
  association [1..1] to /DMO/I_Supplement      as _product        on  $projection.supplement_id = _product.SupplementID
  association [1..*] to /DMO/I_SupplementText  as _SupplementTexT on  $projection.supplement_id = _SupplementTexT.SupplementID
{

  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode: 'currency'
      price,
      @Semantics.currencyCode: true
      currency,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,
      _Booking,
      _travel,
      _product,
      _SupplementTexT

}
