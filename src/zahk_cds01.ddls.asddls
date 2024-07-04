@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Test'
define view entity zahk_cds01
  as select from vbak
  association [1..*] to vbap as _Vbap     on vbak.vbeln = _Vbap.vbeln
  association [1]    to kna1 as _Customer on $projection.kunnr = _Customer.kunnr
{
      // Fields from VBAK
  key vbak.vbeln,  // Sales Document
  key _Vbap.posnr, // Sales Document Item
      vbak.erdat,  // Date on Which Record Was Created
      @Semantics.amount.currencyCode: 'WAERK'
      vbak.netwr, // Net Value of the Order
      vbak.waerk,

      // Fields from VBAP
      _Vbap.matnr, // Material Number
      @Semantics.quantity.unitOfMeasure: 'VRKME'
      _Vbap.kwmeng, // Cumulative Order Quantity
      _Vbap.vrkme, // Sales Unit

      // Fields from KNA1 (Customer)
      _Customer.kunnr // Customer Number
}
