Profile: ClinicalDocumentBundle
Parent: Bundle
Id: clinical-document-bundle
Title: "FHIR Clinical Document Bundle Profile"
Description: "Universal starting point for specifying a FHIR Clinical Document."
* type = #document

* identifier ^mapping[0].identity = "cda"
//* identifier ^mapping[=].map = "This is the Document identifier"
* identifier ^mapping[=].comment =  "This is the Document identifier"
* total 0..0

* entry 1..* MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry.resource 1..1 MS // each entry must have a resource
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the resource type"
* entry contains 
    clinical-document-composition 1..1 MS
* entry[clinical-document-composition] ^short = "First entry is a composition"
* entry[clinical-document-composition].resource only ClinicalDocumentComposition

//Extension: ClinicalDocumentRelatesTo
//Id: ClinicalDocumentRelatesTo
//Title: "Clinical Document Identifier"
//Description: "Identifiers that "
//* ^context.type = #element
//* ^context.expression = "Bundle"
//* value[x] only Annotation

Profile: ClinicalDocumentComposition
Parent: Composition
Id: clinical-document-composition
Title: "Clinical Document Composition Profile"
Description: "Starting point for a specification for a composition of a Structured Document."

* extension contains 
	$composition-clinicaldocument-versionNumber named composition-clinicaldocument-versionNumber 0..1 MS and

	DocumentID named document-id 0..1 MS and

    DataEntererExtension named data-enterer 0..1 MS and
    InformantExtension named informant 0..* MS and
    InformationRecipientExtension named information-recipient 0..* MS and
    ParticipantExtension named participant 0..* MS and
    PerformerExtension named performer 0..* MS and
    AuthorizationExtension named authorization 0..* MS and
    OrderExtension named order 0..* MS

* extension[$composition-clinicaldocument-versionNumber] ^label = "clinical document version number"
* extension[$composition-clinicaldocument-versionNumber] ^short = "Consider if this should be must support, or if should explicitly backport R5 Composition.version" 
* extension[$composition-clinicaldocument-versionNumber] ^mapping[0].identity = "cda"
* extension[$composition-clinicaldocument-versionNumber] ^mapping[=].map = "versionNumber"

* extension[document-id] ^label = "Specific document instance id"
* extension[document-id] ^short = "Specific document instance id. The use of two identifiers might become deprecated"
* extension[document-id] ^mapping[0].identity = "cda"
* extension[document-id] ^mapping[=].map = "id - document id is experimental"

* extension[data-enterer] ^label = "date enterer"
* extension[data-enterer] ^short = "data enterer"
* extension[data-enterer] ^mapping[0].identity = "cda"
* extension[data-enterer] ^mapping[=].map = "dataEnterer"

* extension[informant] ^label = "informant"
* extension[informant] ^short = "informant"
* extension[informant] ^mapping[0].identity = "cda"
* extension[informant] ^mapping[=].map = "informant"

* extension[information-recipient] ^label = "information recipient"
* extension[information-recipient] ^short = "information recipient"
* extension[information-recipient] ^mapping[0].identity = "cda"
* extension[information-recipient] ^mapping[=].map = "informationRecipient"

* extension[participant] ^label = "participant"
* extension[participant] ^short = "participant"
* extension[participant] ^mapping[0].identity = "cda"
* extension[participant] ^mapping[=].map = "participant"

* extension[performer] ^label = "performer"
* extension[performer] ^short = "performer"
* extension[performer] ^mapping[0].identity = "cda"
* extension[performer] ^mapping[=].map = "performer"

* extension[authorization] ^label = "authorization"
* extension[authorization] ^short = "authorization"
* extension[authorization] ^mapping[0].identity = "cda"
* extension[authorization] ^mapping[=].map = "authorization"

* extension[order] ^label = "order"
* extension[order] ^short = "order" 
* extension[order] ^mapping[0].identity = "cda"
* extension[order] ^mapping[=].map = "inFulfillmentOf"

//* modifierExtension[Status] ^short = "in-progress | completed | entered-in-error | unknown"
//* modifierExtension[Status] ^definition = "The current state of the adverse event or potential adverse event."
//* modifierExtension[Status] ^comment = "This is not the reporting of the event to any regulatory or quality 

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
//* author ^mapping[0].identity = "cda"
//* author ^mapping[=].map = "trying something new"

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




