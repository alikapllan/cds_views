CLASS zcl_cds_privileged_access DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_cds_privileged_access IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM zahk_cds_entity02
      FIELDS *
      INTO TABLE @DATA(lt_bypassed_cds_authorization)
      PRIVILEGED ACCESS.
    " PRIVILEGED ACCESS -> This allows unrestricted access to all data in CDS Entities by
    " bypassing any authorization rules.

    out->write( data = lt_bypassed_cds_authorization ).
  ENDMETHOD.
ENDCLASS.
