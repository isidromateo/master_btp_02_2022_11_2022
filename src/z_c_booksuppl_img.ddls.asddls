@EndUserText.label: 'Consumption - Booking Supplement'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_BOOKSUPPL_IMG
  as projection on Z_I_BOOKSUPPL_IMG
{

  key travel_id                   as travel_id,
  key booking_id                  as booking_id,
  key booking_supplement_id       as booking_supplement_id,
      supplement_id               as supplement_id,
      _SupplementTexT.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as price,
      @Semantics.currencyCode: true
      currency                    as currencycode,
      last_changed_at             as LastChangedAt,
      /* Associations */
      _travel  : redirected to Z_C_TRAVEL_IMG,
      _Booking : redirected to parent Z_C_BOOKING_IMG,
      _product,
      _SupplementTexT

}
