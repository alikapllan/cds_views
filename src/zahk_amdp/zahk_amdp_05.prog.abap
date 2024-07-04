*&---------------------------------------------------------------------*
*& Report zahk_amdp_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zahk_amdp_05.

DATA: lr_salv TYPE REF TO cl_salv_table.

START-OF-SELECTION.
  zcl_demo_amdp_05=>get_max_details( IMPORTING et_max_details = DATA(lt_max_details) ).

  TRY.
      cl_salv_table=>factory( IMPORTING r_salv_table = lr_salv
                              CHANGING  t_table      = lt_max_details ).

      lr_salv->display( ).
    CATCH cx_salv_msg.
  ENDTRY.
