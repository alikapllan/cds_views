# CDS Views

## [Defining](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity01.ddls.asddls#L1-L16)


## [Session Information](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds03.ddls.asddls#L25-L26)


## [ABAP Annotations](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02.ddls.asddls#L1-L26)
-> [All CDS Annotations](https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abencds_annotations_sap.htm)
## Access Control 
![image](https://github.com/alikapllan/cds_views/assets/46874082/f63769c5-a07e-4ed9-aca3-450bd67583cf)
-> [Access Control Simple Condition Example](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02.dcls.asdcls#L1-L11)  
-> For PFCG Aspect you need to create Authorization Field & Authorization Object/s  
-> Access Control could also be inherited from another CDS View Role  
-> More info can be found in the [video from SAP Developers](https://www.youtube.com/watch?v=uxgs4FigmuQ&ab_channel=SAPDevelopers)

## [SQL Expressions / Functions / Aggregations](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity03.ddls.asddls#L13-L61)

## [Extending CDS Views](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02_extend.ddls.asddls#L1-L6)  
-> [Extending with Association](https://github.com/alikapllan/cds_views/blob/main/src/zahk_cds_entity02_extend_assoc.ddls.asddls#L1-L6)
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

## SAP Developers - Video Series about Core Data Services
1. [ABAP Core Data Services Overview](https://www.youtube.com/watch?v=lvorIY4Xyio)
2. [Virtual Elements](https://www.youtube.com/watch?v=TqD-H03znVo)
3. [CDS View Extensions](https://www.youtube.com/watch?v=IPEotH-6ekI)
4. [CDS Access Control](https://www.youtube.com/watch?v=uxgs4FigmuQ&t=1s)
5. [CDS Unit Test](https://www.youtube.com/watch?v=ezQ0vbhV8QY&t=3s)
6. [CDS Troubleshooting](https://www.youtube.com/watch?v=q7Yhj6BnWJo)
7. [CDS Annotations](https://www.youtube.com/watch?v=GXFHjq5L8M8)
8. [CDS Associations](https://www.youtube.com/watch?v=fhmx51FIysE)

## View Types 
![image](https://github.com/alikapllan/cds_views/assets/46874082/3b37b4a2-a1ec-45ea-a084-8ae4c7483931) 
#### Basic/Interface Views
Purpose: 
* Used for Data Read from Tables
  
#### Composition Views
Purpose: 
* Composition Views are used to build more complex views by combining multiple basic views. They serve as intermediate views that aggregate, transform, and join data from underlying basic views (Private Views or other Composition Views).

Usage:
* They help structure and organize data models by encapsulating complex logic and calculations.
* Composition Views can be reused across different parts of the application or different applications, providing a standardized data foundation.  
  
#### Consumption Views / Projection
Purpose:
* Consumption Views are designed for direct use by applications, reports, or analytical tools. They represent the final layer in the view hierarchy, optimized for specific reporting and analytical needs.

Usage:
* These views present data in a format suitable for end-user consumption, often including annotations for UI purposes, authorization checks, and other metadata to facilitate use by Fiori apps, OData services, etc.
  
#### Additional Information:
In certain scenarios, Composition Views can be used as Consumption Views, particularly when the data model is straightforward and the Composition View meets the requirements for direct consumption. However, for more complex scenarios and to adhere to best practices in maintainability, reusability, and optimization, it is generally advisable to maintain a clear distinction between Composition Views and Consumption Views.

### [A Basic Project Example with Types](https://github.com/alikapllan/abap_rap/tree/main/src/zahk_rap_managed_01) 
![image](https://github.com/user-attachments/assets/8261c47c-77f8-40ac-ac02-a082954ef47c)
![image](https://github.com/user-attachments/assets/486ace4e-a63b-4267-b8d9-a2f379573319)


#### How it looks in Fiori 
![image](https://github.com/user-attachments/assets/5bd34623-efa3-4a7e-a142-abde89b3cfa5)
![image](https://github.com/user-attachments/assets/7c95b622-ca8f-45f6-8541-73f8d70cc4ad)

