Profile: ClinicalDocumentBundle
Parent: Bundle
Id: clinical-document-bundle
Title: "Clinical Document Bundle Profile"
Description: "Starting point for a specification for a composition of a Structured Document."
* type = #document

* identifier ^mapping[0].identity = "cda"
* identifier ^mapping[=].map = "AN EXAMPLE MAPPING"

* entry 1..* MS
* entry.resource 1..1 MS // each entry must have a resource
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the resource type"
* entry contains 
    clinical-document-composition 1..1 MS
* entry[clinical-document-composition] ^short = "First entry is a composition"
* entry[clinical-document-composition].resource only ClinicalDocumentComposition


Profile: ClinicalDocumentComposition
Parent: Composition
Id: clinical-document-composition
Title: "Clinical Document Composition Profile"
Description: "Starting point for a specification for a composition of a Structured Document."

* extension contains $composition-clinicaldocument-versionNumber named composition-clinicaldocument-versionNumber 0..1 MS
* extension[$composition-clinicaldocument-versionNumber] ^short = "Consider if this should be must support, or if should explicitly backport R5 Composition.verion" 

* language 1..1 MS
* text MS
* identifier 1..1 MS
* type MS
* subject 0..1 MS
* subject only Reference(Patient or Practitioner or PractitionerRole or RelatedPerson or Group or Device or Location)
//* subject ^short = "Support Planner"
//* subject ^definition = "The  person (e.g., Case Manager, Care Coordinator, Plan Coordinator) who helped develop the plan."
//* subject ^comment = "Support Planner Name + Phone."
* subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = true
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false

* date MS

* author MS
* author only Reference(Patient or Practitioner or PractitionerRole or RelatedPerson or Device or Organization)

* title MS

* attester MS
* attester.mode MS
* attester.time MS
* attester.party MS

* custodian MS
//* custodian 1..1

* relatesTo MS

* section.code MS
* section.text MS
* section.title 1..1 MS
//seems consistent that where there is a slice in a profile that the Title is required and MS



