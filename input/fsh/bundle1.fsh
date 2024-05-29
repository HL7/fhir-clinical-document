
//all first degree composition.references shall be included in the bundle.
Invariant: clindoc-first-degree
Description: "All first degree targets of entry[0].Composition.references shall be included in the bundle"
Expression: 
"TBD"
//entry.first()
Severity:       #error

//bundle.timestamp >= composition.date
Invariant: clindoc-timestamp-ge-compoDate
Description: "bundle.timestamp >= composition.date"
Expression: 
"TBD"
Severity:       #error


Profile: ClinicalDocumentBundle
Parent: Bundle
Id: clinical-document-bundle
Title: "FHIR Clinical Document Bundle Profile"
Description: "Universal starting point for specifying a FHIR Clinical Document."

* obeys clindoc-first-degree

* type = #document
* identifier 1..1
* identifier ^mapping[0].identity = "cda"
//* identifier ^mapping[=].map = "This is the Document identifier"
* identifier ^mapping[=].comment =  "This is the Document identifier"
* total 0..0

* timestamp obeys clindoc-timestamp-ge-compoDate

* timestamp 1..1
// Remove default mapping to ClinicalDocument.effectiveTime and state that this timestamp is >= ClinicalDocument.effectiveTime.
// constraint: bundle.timestamp >= composition.date

* entry 1..* MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry.resource 1..1 MS // each entry must have a resource
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "$this.resource"
//"$this.information.resolve()"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the resource type"
* entry contains 
    clinical-document-composition 1..1 MS
	and subject 1..* MS
	and participant 1..* MS

* entry[clinical-document-composition] ^short = "First entry is a composition"
* entry[clinical-document-composition].resource only ClinicalDocumentComposition
//* entry[subject].resource only Patient
//* entry[participant].resource only Device or Organization or Patient or Person or Practitioner or PractitionerRole or RelatedPerson
// constraint: all first degree composition.references shall be included in the bundle.


//Extension: ClinicalDocumentRelatesTo
//Id: ClinicalDocumentRelatesTo
//Title: "Clinical Document Identifier"
//Description: "Identifiers that "
//* ^context.type = #element
//* ^context.expression = "Bundle"
//* value[x] only Annotation



// constraint: cannot have composition.section and nonFHIR_body
Invariant: clincomp-1
Description: "Cannot have additional composition.section if have a nonFHIR_body"
Expression: 
"TBD"
Severity:       #error

// constraint: nonFHIR_body or at least one composition.section
Invariant: clincomp-2
Description: "Must have at least one composition.section"
Expression: 
"TBD"
Severity:       #error


Profile: ClinicalDocumentComposition
Parent: Composition
Id: clinical-document-composition
Title: "Clinical Document Composition Profile"
Description: "Starting point for a specification for a composition of a FHIR Clinical Document."

* obeys clincomp-1
* obeys clincomp-2

* extension contains 
	$composition-clinicaldocument-versionNumber named composition-clinicaldocument-versionNumber 0..1 MS and
	// DocumentID named document-id 0..1 MS and
    DataEntererExtension named data-enterer 0..1 MS and
    InformantExtension named informant 0..* MS and
    InformationRecipientExtension named information-recipient 0..* MS and
    ParticipantExtension named participant 0..* MS and
    // PerformerExtension named performer 0..* MS and
    ConsentExtension named consent 0..* MS and
    OrderExtension named order 0..* MS

* extension[$composition-clinicaldocument-versionNumber] ^label = "clinical document version number"
* extension[$composition-clinicaldocument-versionNumber] ^short = "Consider if this should be must support, or if should explicitly backport R5 Composition.version" 
* extension[$composition-clinicaldocument-versionNumber] ^mapping[0].identity = "cda"
* extension[$composition-clinicaldocument-versionNumber] ^mapping[=].map = "versionNumber"

// * extension[document-id] ^label = "Specific document instance id"
// * extension[document-id] ^short = "Specific document instance id. The use of two identifiers might become deprecated"
// * extension[document-id] ^mapping[0].identity = "cda"
// * extension[document-id] ^mapping[=].map = "id - document id is experimental"

* extension[data-enterer] ^label = "date enterer"
* extension[data-enterer] ^short = "data enterer"
* extension[data-enterer] ^mapping[0].identity = "cda"
* extension[data-enterer] ^mapping[=].map = "assignedEntity.dataEnterer "

* extension[informant] ^label = "informant"
* extension[informant] ^short = "informant"
* extension[informant] ^mapping[0].identity = "cda"
* extension[informant] ^mapping[=].map = "informantChoice.informant"

* extension[information-recipient] ^label = "information recipient"
* extension[information-recipient] ^short = "information recipient"
* extension[information-recipient] ^mapping[0].identity = "cda"
* extension[information-recipient] ^mapping[=].map = "intendedRecipient.informationRecipient"

* extension[participant] ^label = "participant"
* extension[participant] ^short = "participant"
* extension[participant] ^mapping[0].identity = "cda"
* extension[participant] ^mapping[=].map = "associatedEntity.participant"

// * extension[performer] ^label = "performer"
// * extension[performer] ^short = "performer"
// * extension[performer] ^mapping[0].identity = "cda"
// * extension[performer] ^mapping[=].map = "performer"

* extension[consent] ^label = "consent"
* extension[consent] ^short = "consent"
* extension[consent] ^mapping[0].identity = "cda"
* extension[consent] ^mapping[=].map = "authorization.Consent"

* extension[order] ^label = "order"
* extension[order] ^short = "order" 
* extension[order] ^mapping[0].identity = "cda"
* extension[order] ^mapping[=].map = "inFulfillmentOf.Order"

//* modifierExtension[Status] ^short = "in-progress | completed | entered-in-error | unknown"
//* modifierExtension[Status] ^definition = "The current state of the adverse event or potential adverse event."
//* modifierExtension[Status] ^comment = "This is not the reporting of the event to any regulatory or quality 

* language 0..1 MS 
* language ^mapping[0].identity = "cda"
* language ^mapping[=].map = "languageCode"
* text MS
* identifier 0..1 MS
* type MS
* subject 1..1 MS
* subject only Reference(Patient or Group)
//* subject ^short = "Support Planner"
//* subject ^definition = "The  person (e.g., Case Manager, Care Coordinator, Plan Coordinator) who helped develop the plan."
//* subject ^comment = "Support Planner Name + Phone."
//* subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = true
//* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = false
//* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = false
//* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = false
//* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = false
//* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = false
//* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* subject ^type.targetProfile[=].extension.valueBoolean = false

* date MS

* author MS
* author only Reference(Patient or Practitioner or PractitionerRole or RelatedPerson or Device or Organization)
* author ^mapping[0].identity = "cda"
* author ^mapping[=].map = "assignedAuthor.author"
// can we remove the default mapping? 

* title MS

* attester MS
* attester.mode MS
* attester.time MS
* attester.party MS
* attester ^slicing.discriminator.type = #type
* attester ^slicing.discriminator.path = attester.mode
* attester ^slicing.rules = #open
* attester ^slicing.description = "Slicing based on the resource type"
* attester contains 
    legal_attester 0..1 MS
	and professional_attester 0..* MS
* attester[legal_attester] ^short = "aka legal authenticator"
* attester[legal_attester].mode = #legal
* attester[legal_attester] ^mapping[0].identity = "cda"
* attester[legal_attester] ^mapping[=].map = "assignedEntity.legalAuthenticator"
* attester[professional_attester] ^short = "aka authenticator"
* attester[professional_attester].mode = #professional
* attester[professional_attester] ^mapping[0].identity = "cda"
* attester[professional_attester] ^mapping[=].map = "assignedEntity.authenticator"


* custodian 1..1 MS
* custodian ^mapping[0].identity = "cda"
* custodian ^mapping[=].map = "assignedCustodian.custodian"
// can we remove the default mapping? 

* relatesTo MS
* relatesTo ^slicing.discriminator.type = #type
* relatesTo ^slicing.discriminator.path = relatesTo.code
* relatesTo ^slicing.rules = #open
* relatesTo ^slicing.description = "Slicing based on the resource type"
* relatesTo contains 
    replaced_document 0..* MS
	and appended_document 0..* MS
* relatesTo[replaced_document] ^short = "The document(s) being superceded"
* relatesTo[replaced_document].code = #replaces
* relatesTo[replaced_document].targetIdentifier 1..1
* relatesTo[replaced_document].targetIdentifier ^short = "Reference to the Bundle.identifier of the FHIR Clinical Document being replaced, or to some other identifier of a non FHIR document"
* relatesTo[replaced_document] ^mapping[0].identity = "cda"
* relatesTo[replaced_document] ^mapping[=].map = "parentDocument.relatedDocument"

* relatesTo[appended_document] ^short = "The document(s) being appended too"
* relatesTo[appended_document].code = #appends
* relatesTo[appended_document].targetIdentifier 1..1
* relatesTo[appended_document].targetIdentifier ^short = "Reference to the Bundle.identifier of the FHIR Clinical Document being appended, or to some other identifier of a non FHIR document"
//* relatesTo[appended_document] ^mapping[0].identity = "cda"
//* relatesTo[appended_document] ^mapping[=].map = "parentDocument.relatedDocument"


// constraint: cannot have composition.section and nonFHIR_body
// constraint: nonFHIR_body or at least one composition.section

* section.code MS
* section.text MS
* section.title 1..1 MS
//seems consistent that where there is a slice in a profile that the Title is required and MS

* section ^slicing.discriminator.type = #type
* section ^slicing.discriminator.path = section.entry
* section ^slicing.rules = #open
* section ^slicing.description = "Slicing based on the resource type"
* section contains 
	nonFHIR_body 0..*
* section[nonFHIR_body].entry 1..1
* section[nonFHIR_body] ^short = "A non-FHIR clinical document being wrapped by the FHIR Clinical Document Composition. This can be used where it is necessary to wrap a non-FHIR document in a standard header so as to enable consistent document management."
* section[nonFHIR_body].entry only Reference(DocumentReference)
* section[nonFHIR_body] ^mapping[0].identity = "cda"
* section[nonFHIR_body] ^mapping[=].map = "bodyChoice.component.NonXMLBody"
//might want a specific code for this slice in the future



