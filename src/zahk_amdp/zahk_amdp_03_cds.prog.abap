*&---------------------------------------------------------------------*
*& Report zahk_amdp_03_cds
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zahk_amdp_03_cds.

PARAMETERS: p_client TYPE mandt DEFAULT '100',
            p_so_no  TYPE vbeln DEFAULT '0040000967'.

DATA lr_salv TYPE REF TO cl_salv_table.

START-OF-SELECTION.
  " Calling CDS created for AMDP
  SELECT *
    FROM zahk_cds_amdp_03( p_so_header_no = @p_so_no ) " no need to pass client as compiler handles
    INTO TABLE @DATA(lt_result).

  TRY.
      cl_salv_table=>factory( IMPORTING r_salv_table = lr_salv
                              CHANGING  t_table      = lt_result ).

      lr_salv->display( ).
    CATCH cx_salv_msg.
  ENDTRY.
