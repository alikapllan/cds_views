@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'school members CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zahk_i_schoolmembers
  as select from zahk_t_school
  association of many to one zahk_i_schoolmembers as _Teacher on _Teacher.PersonId = $projection.TeacherId
{
  key person_id  as PersonId,
      fullname   as Fullname,
      title      as Title,
      teacher_id as TeacherId,
      // Association
      _Teacher
}
