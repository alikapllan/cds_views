@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sflight demo CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zahk_cds02
  as select from sflight
    inner join            scarr on sflight.carrid = scarr.carrid
    left outer join       spfli on sflight.connid = spfli.connid
{
  key sflight.carrid  as Carrid,
  key scarr.carrname  as Carrname,
  key spfli.connid    as Connid,
  key sflight.fldate  as Fldate,
      spfli.cityfrom  as Cityfrom,
      spfli.countryto as COUNTRYTO,
      scarr.currcode  as Currcode,
      scarr.url       as Url
      //    price as Price,
      //    currency as Currency,
      //    planetype as Planetype,
      //    seatsmax as Seatsmax,
      //    seatsocc as Seatsocc,
      //    paymentsum as Paymentsum,
      //    seatsmax_b as SeatsmaxB,
      //    seatsocc_b as SeatsoccB,
      //    seatsmax_f as SeatsmaxF,
      //    seatsocc_f as SeatsoccF
}
