CLASS zcl_cds_entity_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES t_cds_ent_param TYPE zahk_cds_entity02_input_param.

    INTERFACES if_oo_adt_classrun.

    METHODS use_cds_param_with_abap
      RETURNING VALUE(rs_cds_ent_param) TYPE t_cds_ent_param.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CDS_ENTITY_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( use_cds_param_with_abap( ) ).
  ENDMETHOD.


  METHOD use_cds_param_with_abap.
    SELECT SINGLE
      FROM zahk_cds_entity02_input_param( p_doc_no = '0010000002',
                                          p_posnr  = '0010' )
      FIELDS *
      INTO @DATA(ls_cds_ent_param).

    IF sy-subrc = 0.
      rs_cds_ent_param = ls_cds_ent_param.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
