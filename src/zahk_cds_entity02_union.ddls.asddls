@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union CDS View Demo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAHK_CDS_ENTITY02_UNION
  as select from zahk_cds_entity02
{
  key doc_no,
  key pos,
      material_no,
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode' // Annotations only in first query
      net_value,
      // association
      _SalesDocHead
}
where
      net_value >  100
  and net_value <= 1250

union all

select from zahk_cds_entity02
{
  key doc_no,
  key pos,
      material_no,
      CurrencyCode,
      net_value,
      // association
      _SalesDocHead
}
