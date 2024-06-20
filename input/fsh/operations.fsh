Instance: parse-clinical-document
InstanceOf: OperationDefinition
Title: "Parse Clinical Document"
Usage: #definition
Description: "Parse and store a received FHIR Clinical Document."
* name = "ParseClinicalDocument"
* title = "Parse Clinical Document"
* status = #active
* kind = #operation
* publisher = "HL7 International Clinical Genomics Work Group"
* system = false
* type = true
* instance = false
* code = #match
* parameter[+]
  * name = #FHIRClinicalDocumentReference
  * use = #in
  * min = 1
  * max = "*"
  * documentation = "Resource.id(s) for the FHIR Clinical Document(s) to be parsed."
  * type = #string
  * searchType = #reference
