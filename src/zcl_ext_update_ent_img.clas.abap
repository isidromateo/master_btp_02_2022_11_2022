CLASS zcl_ext_update_ent_img DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXT_UPDATE_ENT_IMG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    MODIFY ENTITIES OF z_i_travel_img
       ENTITY Travel
         UPDATE FIELDS (  agency_id description )
           WITH VALUE #( ( travel_id   = '00000006'
                           agency_id   = '919191'
                           description = 'New external Update' ) )
           FAILED DATA(failed)
           REPORTED DATA(reported).

    READ ENTITIES OF z_i_travel_img
        ENTITY Travel
          FIELDS ( agency_id description )
            WITH VALUE #( ( travel_id   = '00000006' ) )
            RESULT DATA(lt_travel_data)
            FAILED failed
            REPORTED reported.

    COMMIT ENTITIES.

    IF failed IS INITIAL.
      out->write( 'Commit Successful' ).
    ELSE.
      out->write( 'Commit Failed' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
