extend view entity zahk_cds_entity02 with
    association [1..1] to vbak as _SalesDocHead 
    on $projection.doc_no = _SalesDocHead.vbeln
{
  _SalesDocHead
}
