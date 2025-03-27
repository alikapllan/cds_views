*&---------------------------------------------------------------------*
*& Report zahk_amdp_scalar_func_sample
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zahk_amdp_scalar_func_sample.

START-OF-SELECTION.
  DELETE FROM zahk_weekday.

  INSERT zahk_weekday FROM TABLE @( VALUE #( dummy_field = 'X'
                                             ( weekday     = '20250327' )
                                             ( weekday     = '20250328' )
                                             ( weekday     = '20250329' ) ) ).

  IF sy-subrc = 0.
    WRITE 'data has been added'.
  ENDIF.
