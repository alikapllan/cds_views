*&---------------------------------------------------------------------*
*& Report zahk_amdp_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zahk_amdp_04.

zcl_demo_amdp_04=>get_so_max( IMPORTING ev_max_count        = DATA(lv_max_count)
                                        ev_max_amount_price = DATA(lv_max_amount_price) ).

WRITE: 'Max Count: ', lv_max_count.
WRITE: 'Max Amount Price: ', lv_max_amount_price.
