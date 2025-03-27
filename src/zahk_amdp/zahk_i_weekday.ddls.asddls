@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Weekday CDS to test Scalar Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zahk_i_weekday
  as select from zahk_weekday
{
  key weekday                                                         as Weekday,
      // add Scalar Function CDS View Entity
      zahk_i_get_weekday_scalarf( input_date => $projection.Weekday ) as WeekdayText
}
