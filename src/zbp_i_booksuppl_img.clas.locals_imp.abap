CLASS lhc_Supplement DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS CalculateTotaSupplPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Supplement~CalculateTotaSupplPrice.

ENDCLASS.

CLASS lhc_Supplement IMPLEMENTATION.

  METHOD CalculateTotaSupplPrice.
    IF NOT keys IS INITIAL.
      zcl_aux_travel_det_img=>calculate_price( it_travel_id =
         VALUE #( FOR GROUPS  <booking_suppl> OF booking_key IN keys
                      GROUP BY booking_key-travel_id  WITHOUT MEMBERS ( <booking_suppl> ) ) ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
CLASS lsc_supplement DEFINITION INHERITING FROM cl_abap_behavior_saver final.

  PUBLIC SECTION.
    CONSTANTS: co_create TYPE string VALUE 'C',
               co_update TYPE string VALUE 'U',
               co_delete TYPE string VALUE 'D'.

  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_supplement IMPLEMENTATION.

  METHOD save_modified.
    DATA: lt_supplements TYPE ztt_suppl_img,
          lv_op_type     TYPE zde_flag,
          lv_updated     TYPE zde_flag.


    IF NOT create-supplement IS INITIAL.
      lt_supplements = CORRESPONDING #( create-supplement ).
      lv_op_type = lsc_supplement=>co_create.
    ENDIF.

    IF NOT update-supplement IS INITIAL.
      lt_supplements = CORRESPONDING #( update-supplement ).
      lv_op_type = lsc_supplement=>co_update.
    ENDIF.

    IF NOT delete-supplement IS INITIAL.
      lt_supplements = CORRESPONDING #( delete-supplement ).
      lv_op_type = lsc_supplement=>co_delete.
    ENDIF.

    IF NOT lt_supplements IS INITIAL.

      CALL FUNCTION 'Z_SUPP_IMG'
        EXPORTING
          it_supplements = lt_supplements
          iv_op_type     = lv_op_type
        IMPORTING
          ev_updated     = lv_updated.

      IF lv_updated EQ abap_true.
* reported-supplement
      ENDIF.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
