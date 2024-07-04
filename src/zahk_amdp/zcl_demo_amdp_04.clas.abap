
CLASS zcl_demo_amdp_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF t_vbak,
             so_no    TYPE vbeln_va,
             so_posnr TYPE posnr_va,
           END OF t_vbak.
    TYPES tt_so_vbak TYPE STANDARD TABLE OF t_vbak WITH DEFAULT KEY.
    TYPES tt_vbak    TYPE STANDARD TABLE OF vbak WITH DEFAULT KEY.

    INTERFACES if_amdp_marker_hdb.

    " here methods -> static class-methods
    CLASS-METHODS get_so_header
      IMPORTING VALUE(iv_header_no) TYPE vbeln
      EXPORTING VALUE(et_so_header) TYPE tt_so_vbak.

    CLASS-METHODS get_so_max
      EXPORTING VALUE(ev_max_count)        TYPE i
                VALUE(ev_max_amount_price) TYPE netwr.
ENDCLASS.



CLASS ZCL_DEMO_AMDP_04 IMPLEMENTATION.


  METHOD get_so_header
    BY DATABASE PROCEDURE FOR HDB
    LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY
    USING vbak vbap.

    et_so_header = SELECT vbak.vbeln AS so_no,
                          vbap.posnr AS so_posnr
                    FROM vbak AS vbak
                    INNER JOIN vbap
                        ON vbap.vbeln = vbak.vbeln
                    WHERE vbak.vbeln = :iv_header_no
                    ORDER BY so_posnr;
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
