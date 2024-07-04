@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Joining VBAK, VBAP & KNA1'
define view entity ZAHK_CDS03 as select from vbak
association [1..*] to vbap as _Vbap
    on vbak.vbeln = _Vbap.vbeln
association [1] to kna1 as _Customer
    on $projection.kunnr = _Customer.kunnr
{
    // Fields from VBAK
    key vbak.vbeln,        // Sales Document
    key _Vbap.posnr,       // Sales Document Item
    vbak.erdat,            // Date on Which Record Was Created
    vbak.netwr,            // Net Value of the Order
    vbak.waerk,            

    // Fields from VBAP
    _Vbap.matnr,           // Material Number
    _Vbap.kwmeng,          // Cumulative Order Quantity
    _Vbap.vrkme,           // Sales Unit

    // Fields from KNA1 (Customer)
    _Customer.kunnr       // Customer Number
}
where vbak.vbeln <> '10000000' 
  and ( vbak.ernam < $session.user
  or vbak.erdat < $session.system_date );
