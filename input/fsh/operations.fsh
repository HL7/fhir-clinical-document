Instance: convert-to-transaction-bundle
InstanceOf: OperationDefinition
Title: "Convert to transaction bundle"
Usage: #definition
Description: "Convert a FHIR Clinical Document into a FHIR transaction bundle."
* name = "ConvertToTransactionBundle"
* title = "Convert to Transaction Bundle"
* status = #active
* kind = #operation
* publisher = "HL7 International Structure Documents Work Group"
* system = false
* type = true
* instance = false
* code = #match
* parameter[+]
  * name = #FHIRClinicalDocument
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Post a FHIR Clinical Document"
  * type = #Bundle
* parameter[+]
  * name = #FHIRTransactionBundle
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Operation returns a FHIR Transaction Bundle"
  * type = #Bundle
