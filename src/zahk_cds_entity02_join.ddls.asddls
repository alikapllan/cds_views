@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join CDS View Demo'

define view entity ZAHK_CDS_ENTITY02_JOIN
  as select from    zahk_cds_entity02 as _SalesDocPos
      left outer join vbak              as _salesDocHead on _SalesDocPos.doc_no = _salesDocHead.vbeln
//    right outer join vbak             as _salesDocHead on _SalesDocPos.doc_no = _salesDocHead.vbeln
//    inner join vbak                   as _salesDocHead on _SalesDocPos.doc_no = _salesDocHead.vbeln
{
  key _SalesDocPos.doc_no,
  key _SalesDocPos.pos,
      _SalesDocPos.material_no,
      _SalesDocPos.CurrencyCode,
      _SalesDocPos.net_value,
      _SalesDocPos.brut_weight,
      _SalesDocPos.net_weight,
      _SalesDocPos.weight_unit,
      _SalesDocPos.created_by
}
