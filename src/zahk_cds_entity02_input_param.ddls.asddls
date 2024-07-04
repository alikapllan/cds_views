@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View with Input Parameters Demo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAHK_CDS_ENTITY02_INPUT_PARAM
  with parameters
    p_doc_no : vbeln,
    p_posnr  : posnr 
  as select from zahk_cds_entity02
{
  key doc_no,
  key pos,
      material_no,

      /* Associations */
      _SalesDocHead
}
where
      doc_no = $parameters.p_doc_no
  and pos    = $parameters.p_posnr;
