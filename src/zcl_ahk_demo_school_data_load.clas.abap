CLASS zcl_ahk_demo_school_data_load DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS create_school_members.
    METHODS delete_school_members.
ENDCLASS.


CLASS zcl_ahk_demo_school_data_load IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    delete_school_members( ).
    create_school_members( ).

    IF sy-subrc = 0.
      out->write( 'Done' ).
    ENDIF.
  ENDMETHOD.

  METHOD create_school_members.
    DATA lt_school_members TYPE STANDARD TABLE OF zahk_t_school.

    lt_school_members = VALUE #( ( person_id  = '1'
                                   fullname   = 'Anderson Talisca'
                                   teacher_id = '' )

                                 ( person_id  = '2'
                                   fullname   = 'Dusan Tadic'
                                   title      = 'Teacher'
                                   teacher_id = '1' )

                                 ( person_id  = '3'
                                   fullname   = 'Edin Dzeko'
                                   title      = 'Teacher'
                                   teacher_id = '1' )

                                 ( person_id  = '4'
                                   fullname   = 'Oguz Aydin'
                                   title      = 'Student'
                                   teacher_id = '2' )

                                 ( person_id  = '5'
                                   fullname   = 'Sebastian Szymanski'
                                   title      = 'Student'
                                   teacher_id = '2' )

                                 ( person_id  = '6'
                                   fullname   = 'Youssef En-Nesyri'
                                   title      = 'Student'
                                   teacher_id = '3' )

                                 ( person_id  = '7'
                                   fullname   = 'Cenk Tosun'
                                   title      = 'Student'
                                   teacher_id = '3' ) ).

    INSERT zahk_t_school FROM TABLE @lt_school_members.
  ENDMETHOD.

  METHOD delete_school_members.
    DELETE FROM zahk_t_school.
  ENDMETHOD.
ENDCLASS.
