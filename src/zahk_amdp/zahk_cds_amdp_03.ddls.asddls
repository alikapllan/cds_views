@EndUserText.label: 'CDS for AMDP Usage'
define table function zahk_cds_amdp_03
with parameters 
    @Environment.systemField: #CLIENT 
    p_client : abap.clnt,
    p_so_header_no: vbeln
returns {
    client : abap.clnt;
    so_header_no : vbeln;
    so_posnr     : posnr;
}
implemented by method ZCL_DEMO_AMDP_03_CDS=>get_so_pos;
