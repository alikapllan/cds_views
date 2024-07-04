CLASS zcl_demo_amdp_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: tt_type_so_header TYPE STANDARD TABLE OF vbak.

    INTERFACES: if_amdp_marker_hdb.

    METHODS: get_so_header
      IMPORTING VALUE(iv_header_no) TYPE vbeln
      CHANGING  VALUE(ct_so_header) TYPE tt_type_so_header.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DEMO_AMDP_01 IMPLEMENTATION.


  METHOD get_so_header
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY USING vbak.

    ct_so_header = SELECT * FROM vbak AS vbak
                    WHERE vbak.vbeln = :iv_header_no;
  ENDMETHOD.
ENDCLASS.
