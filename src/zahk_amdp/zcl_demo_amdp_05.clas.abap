CLASS zcl_demo_amdp_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES tt_vbak TYPE STANDARD TABLE OF vbak WITH DEFAULT KEY.

    INTERFACES if_amdp_marker_hdb.

    CLASS-METHODS get_so_max
      EXPORTING VALUE(ev_max_amount_price) TYPE netwr
                VALUE(ev_max_count)        TYPE i.

    CLASS-METHODS get_max_details
      EXPORTING VALUE(et_max_details) TYPE tt_vbak.
ENDCLASS.



CLASS ZCL_DEMO_AMDP_05 IMPLEMENTATION.


  METHOD get_max_details
    BY DATABASE PROCEDURE FOR HDB
    LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY
    USING vbak
          zcl_demo_amdp_05=>get_so_max.

    DECLARE lv_max_price float := 0;
    DECLARE lv_max_count INTEGER := 0;

    CALL "ZCL_DEMO_AMDP_05=>GET_SO_MAX"(:lv_max_price, :lv_max_count);

    et_max_details = SELECT TOP :lv_max_count *
                        FROM vbak
                        WHERE netwr >= lv_max_price;
  ENDMETHOD.


  METHOD get_so_max
    BY DATABASE PROCEDURE FOR HDB
    LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY
    USING vbak.

    DECLARE lv_max_floor INTEGER := 0;

    SELECT MAX( netwr ) INTO ev_max_amount_price
        FROM vbak ;

    lv_max_floor = floor( ev_max_amount_price );

    SELECT COUNT( * ) INTO ev_max_count
        FROM vbak
        WHERE netwr >= lv_max_floor ;
  ENDMETHOD.
ENDCLASS.
