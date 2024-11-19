@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Group by , Having'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zahk_cds04 as select from zahk_po_head_1
{
    key purchdoc as Purchdoc,
    description as Description,
    status as Status,
    purch_org as PurchOrg,
//    @Semantics.amount.currencyCode: 'Zahk_cds04.Currency'
//    sum(netprice) as Sum_Netprice,
    currency as Currency,
    last_changed_timestamp as LastChangedTimestamp
}
// all fields not an with aggregation has to be added to group by
group by zahk_po_head_1.purchdoc, // here either table name or its alias must be provided
         zahk_po_head_1.description,
         zahk_po_head_1.status,
         zahk_po_head_1.purch_org,
         zahk_po_head_1.currency,
         zahk_po_head_1.last_changed_timestamp
// display entries with sum less and equal than 70        
having sum(netprice) <= 70;
