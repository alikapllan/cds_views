# CDS Views

## [Defining](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity01.ddls.asddls#L1-L16)


## [Session Information](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds03.ddls.asddls#L25-L26)


## [ABAP Annotations](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02.ddls.asddls#L1-L26)
-> [All CDS Annotations](https://help.sap.com/docs/ABAP_PLATFORM_NEW/cc0c305d2fab47bd808adcad3ca7ee9d/630ce9b386b84e80bfade96779fbaeec.html)

## Access Control 
![image](https://github.com/alikapllan/cds_views/assets/46874082/f63769c5-a07e-4ed9-aca3-450bd67583cf)
-> [Access Control Simple Condition Example](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02.dcls.asdcls#L1-L11)  
-> For PFCG Aspect you need to create Authorization Field & Authorization Object/s  
-> Access Control could also be inherited from another CDS View Role  

## [SQL Expressions / Functions / Aggregations](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity03.ddls.asddls#L13-L61)

## [Extending CDS Views](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02_extend.ddls.asddls#L1-L6)  
![image](https://github.com/alikapllan/cds_views/assets/46874082/2059ffec-b0dd-4fb0-9f27-34f06c4691c4)

## [Nested Views](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02_nested.ddls.asddls#L4-L20)

## [Joins](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02_join.ddls.asddls#L4-L19)

## [UNION(ALL)](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02_union.ddls.asddls#L10-L37)

## [Using Input Parameters](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02_input_param.ddls.asddls#L10-L25)
-> [Passing Parameters in ABAP](https://github.com/alikapllan/cds_views/blob/main/src/zcl_cds_entity_test.clas.abap#L29-L33)

## [Associations](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02_association.ddls.asddls#L10-L44)
-> Tables joined via association are only selected in case that the caller (e.g. the SELECT-statement in ABAP) wants to have at least one field of the related table. But tables with joins are selected anyways no matter what is accessed.
Therefore using associations comparing to joins could be considerable as this could increase runtime access in such cases.

## [AMDP](https://github.com/alikapllan/cds_views/blob/main/src/zahk_amdp/zahk_cds_amdp_03.ddls.asddls#L1-L12)
-> [Implementation Example AMDP](https://github.com/alikapllan/cds_views/blob/main/src/zahk_amdp/zcl_demo_amdp_03_cds.clas.abap#L1-L40)  
-> Why we have the need to consume AMDP in CDS?  
When database requires specific functions which open SQL does not have, then we need to consume AMDP in CDS.For example, when we need to perform complex calculations in CDS, sorting or deleting multiplied data. This can be achieved through AMDP.  
-> More Info could be found in this [blogpost in SAP Community](https://community.sap.com/t5/application-development-blog-posts/using-amdp-in-cds-and-some-useful-functions/ba-p/13575039).

## Tools for Analyzing Exisiting CDS Views
-> a very [nice blog](https://software-heroes.com/en/blog/abap-tools-work-with-eclipse-cds-analysis) from Software Heroes on this topic.  
### Additional - HANA PlanVisualizer(PlanViz)
-> The Plan Visualizer, or PlanViz tool, in SAP HANA is essential for understanding query runtime performance. By analyzing queries with PlanViz, you can identify where the query spends the most time, making it easier to troubleshoot performance issues effectively.  
#### How to use? 
* Go to ST05 and start tracing  
* Run your CDS you want to analyze  
* After result go back to ST05 and stop tracing  
* Download the trace in .plv format and in ADT switch to SAP Hana PlanViz Perspective and open the file you downloaded

  
![image](https://github.com/alikapllan/cds_views/assets/46874082/99b74e6b-e6e1-4f7d-8b35-0a111bf6cc28)
