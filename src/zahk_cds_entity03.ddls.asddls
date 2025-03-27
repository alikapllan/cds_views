@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS SQL Expressions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
// Enable Buffering 
// @AbapCatalog.entityBuffer.propagationAllowed: true // currently my system release is not allowing it
// This CDS view is only for showcase / training purpose

define view entity ZAHK_CDS_ENTITY03
  as select from sflight
{
  key carrid                                                            as Carrid,
  key connid                                                            as Connid,
  key fldate                                                            as Fldate,
      @Semantics.amount.currencyCode: 'Currency'
      price                                                             as Price,
      currency                                                          as Currency,
      // CASE - ENDCASE
      case when price > 100 then 'Expensive'
           else 'Cheap'
      end                                                               as price_desc,

      // Aggregations
      max( cast( price as int4 ) )                                      as max_price,
      min( cast( price as int4 ) )                                      as min_price,
      sum( cast( price as int4 ) )                                      as earned_price,
      avg( seatsmax as abap.fltp )                                      as avg_seat,
      count( * )                                                        as count_entries,
      count( distinct seatsmax )                                        as currency_counter,

      // CAST
      cast ( $session.system_date as abap.dats )                        as date_today, // casting to same type, only for showcase

      seatsmax                                                          as max_seat,
      // Some Numeric Functions
      div( seatsmax, 2 )                                                as seatmax_divided,
      division( seatsmax, 3, 2 )                                        as seatmax_division,
      mod( seatsmax, 5 )                                                as seatmax_mod_5,
      round( seatsmax, 2 )                                              as rounded_price,

      // Some String Expressions
      concat_with_space( cast (price as abap.char( 20 )), currency, 1 ) as price_with_currency,
      upper( currency )                                                 as currency_upper,
      lower( currency )                                                 as currency_lower,

      // Some Built in Functions
      dats_is_valid( fldate )                                           as is_date_valid,
      dats_add_days( fldate, 7, 'FAIL' )                                as add_7_days,
      dats_days_between( fldate, $session.system_date )                 as duration
}
group by
  carrid,
  connid,
  fldate,
  price,
  currency,
  seatsmax;
