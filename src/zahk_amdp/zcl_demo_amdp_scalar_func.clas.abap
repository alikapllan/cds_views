CLASS zcl_demo_amdp_scalar_func DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .

    class-methods get_weekday_text
        for SCALAR FUNCTIOn zahk_i_get_weekday_scalarf.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_amdp_scalar_func IMPLEMENTATION.

  METHOD get_weekday_text BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT.
    DECLARE weekday_integer INT = weekday( input_date );

    IF weekday_integer = 0 THEN result = 'Monday';
    END IF;

    IF weekday_integer = 1 THEN result = 'Tuesday';
    END IF;

    IF weekday_integer = 2 THEN result = 'Wednesday';
    END IF;

    IF weekday_integer = 3 THEN result = 'Thursday';
    END IF;

    IF weekday_integer = 4 THEN result = 'Friday';
    END IF;

    IF weekday_integer = 5 THEN result = 'Saturday';
    END IF;

    IF weekday_integer = 6 THEN result = 'Sunday';
    END IF;
  ENDMETHOD.

ENDCLASS.
