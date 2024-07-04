CLASS zcl_demo_amdp_03_cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF t_vbak,
             so_no    TYPE vbeln_va,
             so_posnr TYPE posnr_va,
           END OF t_vbak.
    TYPES tt_so_vbak TYPE STANDARD TABLE OF t_vbak WITH DEFAULT KEY.

    INTERFACES if_amdp_marker_hdb.

    CLASS-METHODS get_so_pos
      FOR TABLE FUNCTION zahk_cds_amdp_03.
ENDCLASS.



CLASS ZCL_DEMO_AMDP_03_CDS IMPLEMENTATION.


  METHOD get_so_pos
    BY DATABASE FUNCTION FOR HDB
    LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY
    USING vbak vbap.

    RETURN SELECT  vbak.mandt AS client,
                   vbak.vbeln AS so_header_no,
                   vbap.posnr AS so_posnr
                    FROM vbak AS vbak
                    INNER JOIN vbap
                        ON vbap.vbeln = vbak.vbeln
                    WHERE vbak.mandt = :p_client AND
                          vbak.vbeln = :p_so_header_no
                    ORDER BY so_posnr;
  ENDMETHOD.
ENDCLASS.
