CLASS zcl_demo_amdp_02 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF t_vbak,
             so_no    TYPE vbeln_va,
             so_posnr TYPE posnr_va,
           END OF t_vbak.
    TYPES tt_so_vbak TYPE STANDARD TABLE OF t_vbak WITH DEFAULT KEY.

    INTERFACES if_amdp_marker_hdb.

    METHODS get_so_header
      IMPORTING VALUE(iv_header_no) TYPE vbeln
      EXPORTING VALUE(ct_so_header) TYPE tt_so_vbak.
ENDCLASS.



CLASS ZCL_DEMO_AMDP_02 IMPLEMENTATION.


  METHOD get_so_header
    BY DATABASE PROCEDURE FOR HDB
    LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY
    USING vbak vbap.

    ct_so_header = SELECT vbak.vbeln AS so_no,
                          vbap.posnr AS so_posnr
                    FROM vbak AS vbak
                    INNER JOIN vbap
                        ON vbap.vbeln = vbak.vbeln
                    WHERE vbak.vbeln = :iv_header_no
                    ORDER BY so_posnr;
  ENDMETHOD.
ENDCLASS.
