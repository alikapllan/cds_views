CLASS zcl_cds_type_test DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_cds_type_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Simple CDS type usage at data declaration
    DATA lv_cds_type_simple TYPE zahk_simple_type_doc_category. " ADT is not recommending completion (yet), so full writing needed.
    lv_cds_type_simple = 'A'.
    out->write( lv_cds_type_simple ).

    " CDS type Enum usage at data declaration
    DATA lv_cds_type_enum_doc_cat TYPE zahk_type_doc_category_enum.

*    lv_cds_type_enum_doc_cat = 'Z'. " this results in error, as enum doesnt contain any Z value.
*    lv_cds_type_enum_doc_cat = 'B'. " gives compiler error even if exits in ENUM Type
    lv_cds_type_enum_doc_cat = CONV #( 'B' ). " it works this way, but when passing a value which is not in ENUM -> CX_SY_CONVERSION_NO_ENUM_VALUE
    lv_cds_type_enum_doc_cat = zahk_type_doc_category_enum-quotation. " 'B'
    out->write( lv_cds_type_enum_doc_cat ). " writes QUOTATION
  ENDMETHOD.
ENDCLASS.
