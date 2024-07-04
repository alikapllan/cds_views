@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: ' CDS for AMDP Usage'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAHK_CDS_AMDP_03_READ 
    with parameters lp_mandt : abap.clnt,
                    lp_header_no : char10
    as select from zahk_cds_amdp_03( p_client: $parameters.lp_mandt, 
                                    p_so_header_no: $parameters.lp_header_no )
{
    so_header_no,
    so_posnr
}
