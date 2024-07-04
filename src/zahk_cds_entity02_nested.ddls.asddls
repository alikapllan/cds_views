@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Nested CDS View Demo'

define view entity ZAHK_CDS_ENTITY02_nested
  as select from zahk_cds_entity02 as _SalesDocPos // CDS View reads from another CDS View
  association of many to one vbak as _salesDocHead on _salesDocHead.vbeln = _SalesDocPos.doc_no
{
  key _SalesDocPos.doc_no,
  key _SalesDocPos.pos,
      _SalesDocPos.material_no,
      _SalesDocPos.CurrencyCode,
      _SalesDocPos.net_value,
      _SalesDocPos.brut_weight,
      _SalesDocPos.net_weight,
      _SalesDocPos.weight_unit,
      _SalesDocPos.created_by,

      // association
      _salesDocHead
}
