@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association CDS View Demo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAHK_CDS_ENTITY02_ASSOCIATION as select from zahk_cds_entity02 as _SalesDocPos
    association of many to one vbak as _SalesDocHead on _SalesDocHead.vbeln = _SalesDocPos.doc_no
    /* Other varieties of Cardinalities
      -> Below ones are normally used in DDIC Based CDS Views.
         But can also be used with Entities.
            ◾[0..1] 
            ◾[0..n] or [0..*]
            ◾[1..0]
            ◾[1..n] or [1..*]
    
      -> But prefer to use these below with Entities when possible
            ◾EXACT ONE TO EXACT ONE 
            ◾EXACT ONE TO MANY 
            ◾EXACT ONE TO ONE 
            ◾MANY TO EXACT ONE 
            ◾MANY TO MANY 
            ◾MANY TO ONE 
            ◾ONE TO EXACT ONE 
            ◾ONE TO MANY 
            ◾ONE TO ONE 
            ◾TO ONE 
            ◾TO EXACT ONE 
            ◾TO MANY 
            
      -> In confusion use [1] or TO ONE. This triggers an OUTER JOIN, which could potentially cover
         all of your cases.
    */
{
    key _SalesDocPos.doc_no,
    key _SalesDocPos.pos,
    _SalesDocPos.material_no,
    
    /* Associations */
    _SalesDocHead
}
