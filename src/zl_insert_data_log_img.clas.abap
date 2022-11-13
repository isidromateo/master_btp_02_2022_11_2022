CLASS zl_insert_data_log_img DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZL_INSERT_DATA_LOG_IMG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_travel   TYPE TABLE OF ztb_travel_img,
          lt_booking  TYPE TABLE OF ztb_booking_img,
          lt_book_sup TYPE TABLE OF ztb_booksupl_img.


    clear lt_travel[].
    SELECT travel_id,
           agency_id,
           customer_id,
           begin_date,
           end_date,
           booking_fee,
           total_price,
           currency_code,
           description,
           status        AS overall_status,
           createdby     AS created_by,
           createdat     AS created_at,
           lastchangedby AS last_changed_by,
           lastchangedat AS last_changed_at
    FROM /dmo/travel INTO CORRESPONDING FIELDS OF TABLE @lt_travel
    UP TO 50 ROWS.

    CHECK lt_travel[] IS NOT INITIAL.

    clear lt_booking[].
    SELECT * FROM /dmo/booking
    FOR ALL ENTRIES IN @lt_travel
    WHERE travel_id EQ @lt_travel-travel_id
    INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    CHECK lt_booking[] IS NOT INITIAL.

    clear lt_book_sup[].
    SELECT * FROM /dmo/book_suppl
    FOR ALL ENTRIES IN @lt_booking
    WHERE travel_id EQ @lt_booking-travel_id
      AND booking_id EQ @lt_booking-booking_id
    INTO CORRESPONDING FIELDS OF TABLE @lt_book_sup.

    CHECK lt_book_sup[] IS NOT INITIAL.

    DELETE FROM: ztb_travel_img,
                 ztb_booking_img,
                 ztb_booksupl_img.

    INSERT: ztb_travel_img   FROM TABLE @lt_travel,
            ztb_booking_img   FROM TABLE @lt_booking,
            ztb_booksupl_img FROM TABLE @lt_book_sup.

    out->write( 'DONE!' ).

  ENDMETHOD.
ENDCLASS.
