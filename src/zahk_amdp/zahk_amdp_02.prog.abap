*&---------------------------------------------------------------------*
*& Report zahk_amdp_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zahk_amdp_02.

PARAMETERS p_so_no TYPE vbeln DEFAULT '0040000967'.

DATA: lr_salv      TYPE REF TO cl_salv_table,
      lo_amdp      TYPE REF TO zcl_demo_amdp_02. " AMDP Class

START-OF-SELECTION.
  lo_amdp = NEW #( ).

  lo_amdp->get_so_header( EXPORTING iv_header_no = p_so_no
                          IMPORTING  ct_so_header = DATA(lt_so_header) ).

  TRY.
      cl_salv_table=>factory( IMPORTING r_salv_table = lr_salv
                              CHANGING  t_table      = lt_so_header ).

      lr_salv->display( ).
    CATCH cx_salv_msg.
  ENDTRY.
