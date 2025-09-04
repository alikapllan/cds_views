@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Document Positions'
@Metadata.allowExtensions: true
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]

define view entity zahk_cds_entity02
  as select from vbap
{
  key vbeln                     as doc_no,
  key posnr                     as pos,
      matnr                     as material_no,

      cast ('EUR' as abap.cuky) as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode' // relating currency to field net_value
      netwr                     as net_value,


      @Semantics.quantity.unitOfMeasure: 'weight_unit' // relating unit to brut_weight
      brgew                     as brut_weight,
      @Semantics.quantity.unitOfMeasure: 'weight_unit' // relating unit to net_weight
      ntgew                     as net_weight,
      @EndUserText.quickInfo: 'KG'
      gewei                     as weight_unit,
      ernam                     as created_by
}
where
  ernam <> $session.user;
