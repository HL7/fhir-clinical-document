## Clinical document succession management
When versioning a clinical document in FHIR there are several key features to keep in mind.
FHIR metadata is related to the FHIR artifact itself and not necessarily the document id.
An exchangeable id is found using identifier. The FHIR id can be the local copy id of the document, related to local storage and not the immutable, sometimes legal, identifier of the clinical document itself. The legal identifier is found in Composition.identifier. 

Unlike the CDA paradigm the setID has been dispensed with. 
