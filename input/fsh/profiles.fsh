//all first degree composition.references shall be included in the bundle.
Invariant: clindoc-first-degree
Description: "All first degree targets of entry[0].Composition.references shall be included in the bundle"
Expression: "TBD"
//entry.first()
Severity: #error

//bundle.timestamp >= composition.date
Invariant: clindoc-timestamp-ge-compoDate
Description: "For a FHIR Clinical Document the Bundle timestamp must be the same or after the Composition date" 
Expression: "timestamp >= entry.first().resource.date"
Severity: #error


Profile: ClinicalDocumentBundle
Parent: Bundle
Id: clinical-document-bundle
Title: "FHIR Clinical Document Bundle Profile"
Description: "Universal starting point for specifying a FHIR Clinical Document."

//* obeys clindoc-first-degree
* obeys clindoc-timestamp-ge-compoDate

* type = #document
* identifier 1..1
* identifier.system 1..1
* identifier.value 1..1
* identifier.value ^short = "Identifier system+value must be globally unique"
* identifier ^mapping[0].identity = "cda"
//* identifier ^mapping[=].map = "This is the Document identifier"
* identifier ^mapping[0].comment =  "This is the Document identifier"
* total 0..0

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
//	and subject 1..* MS
//	and participant 1..* MS

* entry[clinical-document-composition] ^short = "First entry is a composition"
* entry[clinical-document-composition].resource only ClinicalDocumentComposition
* entry[clinical-document-composition].search 0..0
* entry[clinical-document-composition].request 0..0
* entry[clinical-document-composition].response 0..0
//* entry[subject].resource only Patient
//* entry[participant].resource only Device or Organization or Patient or Person or Practitioner or PractitionerRole or RelatedPerson
// constraint: all first degree composition.references shall be included in the bundle.


//can have only one extension with a url of http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension and type of ENT
Invariant: clindoc-one-data-enterer
Description: "There can only be one date enterer. That means only one participant extension with type of data enterer." 
Expression: "extension.where(url='http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension').extension.where(url='type').value.coding.where(code='ENT').isDistinct()"
Severity: #error

//participantType cannot be AUT, AUTHEN, CST, LA, RCT, SBJ
Invariant: clindoc-limit-participantType
Description: "The R4 FHIR Clinical Document Composition Profile contains specific extensions for data entry person, informant, information recipient, primary information recipient and tracker. So, they are not allowed in the participant extension in the R4 profile. In R6, the intention is to have dedicated-named slices of a backbone element." 
Expression: "extension.where(url='http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension').extension.where(url='type').value.coding.exists(system='http://terminology.hl7.org/CodeSystem/v3-ParticipationType' and code='ENT').not() and extension.where(url='http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension').extension.where(url='type').value.coding.exists(system='http://terminology.hl7.org/CodeSystem/v3-ParticipationType' and code='INF').not() and
extension.where(url='http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension').extension.where(url='type').value.coding.exists(system='http://terminology.hl7.org/CodeSystem/v3-ParticipationType' and code='IRCP').not() and
extension.where(url='http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension').extension.where(url='type').value.coding.exists(system='http://terminology.hl7.org/CodeSystem/v3-ParticipationType' and code='PRCP').not() and
extension.where(url='http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension').extension.where(url='type').value.coding.exists(system='http://terminology.hl7.org/CodeSystem/v3-ParticipationType' and code='TRC').not()"
Severity: #error

Profile: ClinicalDocumentComposition
Parent: Composition
Id: clinical-document-composition
Title: "FHIR Clinical Document Composition Profile"
Description: "Starting point for a specification for a composition of a FHIR Clinical Document."
//* obeys clindoc-one-data-enterer
* obeys clindoc-limit-participantType

* modifierExtension contains	
	http://hl7.org/fhir/5.0/StructureDefinition/extension-Composition.status named R5-Composition-status 0..1 MS


* extension contains 
	//$composition-clinicaldocument-versionNumber named composition-clinicaldocument-versionNumber 0..1 MS 
	
	http://hl7.org/fhir/5.0/StructureDefinition/extension-Composition.version named R5-Composition-version 0..1 MS and
	
	// DocumentID named document-id 0..1 MS and
	
    DataEntererExtension named data-enterer 0..1 MS and
    informant-extension named informant 0..* MS and
    information-recipient-extension named information-recipient 0..* MS and
    ParticipantExtension named participant 0..* MS and
    //ParticipantExtension named performer 0..* MS and
	
    ConsentExtension named consent 0..* MS and
	http://hl7.org/fhir/StructureDefinition/event-basedOn|5.2.0 named basedOn 0..* MS and
	//OrderExtension named order 0..* MS 
	//CancelledExtension named cancelled-status-indicator 0..1
	
	ChangeMade named change-made 0..1 MS

* extension[R5-Composition-version] ^label = "clinical document version number"
//* extension[R5-Composition-version] ^short = "Consider if this should be must support, or if should explicitly backport R5 Composition.version" 
* extension[R5-Composition-version] ^mapping[0].identity = "cda"
* extension[R5-Composition-version] ^mapping[=].map = "versionNumber"

* extension[data-enterer] ^label = "date enterer"
* extension[data-enterer] ^short = "A Data Enterer represents the person who transferred the content, written or dictated, into the clinical document. To clarify, an author provides the content, subject to their own interpretation; a dataEnterer adds an author's information to the electronic system."
* extension[data-enterer] ^mapping[0].identity = "cda"
* extension[data-enterer] ^mapping[=].map = "assignedEntity.dataEnterer"
//* extension[data-enterer].extension[type].valueCodeableConcept = $participantTypes#ENT "data entry person"

* extension[informant] ^label = "informant"
* extension[informant] ^short = "An Informant is an information source for any content within the clinical document. This informant is constrained for use when the source of information is an assigned health care provider for the patient."
* extension[informant] ^mapping[0].identity = "cda"
* extension[informant] ^mapping[=].map = "informantChoice.informant"
//* extension[informant].extension[type].valueCodeableConcept = $participantTypes#INF "informant"

* extension[information-recipient] ^label = "information recipient of type primary, secondary information recipient or a generic information recipient"
* extension[information-recipient] ^short = "An Information Recipient is the intended recipient of the information at the time the document was created."
* extension[information-recipient] ^mapping[0].identity = "cda"
* extension[information-recipient] ^mapping[=].map = "intendedRecipient.informationRecipient"
//* extension[information-recipient].extension[type].valueCodeableConcept from ClinicalDocInformationRecipientVs (required)
//* extension[information-recipient].extension[type].valueCodeableConcept ^binding.description = "primary information recipient (PRCP), secondary information recipient (TRC) or generic information recipient (IRCP)"

* extension[participant] ^label = "A Participant that is not a data-enter, information-recipient nor an informant"
* extension[participant] ^short = "A Participant that is not a data-enter, information-recipient nor an informant"
* extension[participant] ^mapping[0].identity = "cda"
* extension[participant] ^mapping[=].map = "intendedRecipient.informationRecipient"
//* extension[participant].extension[type].valueCodeableConcept from ClinicalDocParticipantVs (required)
//* extension[participant].extension[type].valueCodeableConcept ^binding.description = "particpants that are not a data-enter, information-recipient nor an informant"
* extension[participant] ^mapping[0].identity = "cda"
* extension[participant] ^mapping[=].map = "associatedEntity.participant"

* extension[consent] ^label = "consent"
* extension[consent] ^short = "consent"
* extension[consent] ^mapping[0].identity = "cda"
* extension[consent] ^mapping[=].map = "authorization.Consent"

//* extension[order] ^label = "order"
//* extension[order] ^short = "order" 
//* extension[order] ^mapping[0].identity = "cda"
//* extension[order] ^mapping[=].map = "inFulfillmentOf.Order"

* extension[basedOn] ^label = "basedOn, e.g. order fullfilled"
* extension[basedOn] ^short = "The clinical action, such as a plan, proposal or order that is fulfilled by or precipitated this FHIR Clinical Document, such as a radiologists report of an x-ray." 
* extension[basedOn] ^mapping[0].identity = "cda"
* extension[basedOn] ^mapping[=].map = "inFulfillmentOf.basedOn"

* extension[change-made] ^label = "Note of changes made, calculating changes maybe required for safety as this extension may not contain all changes. Experimental, may overlap with other elements such as FHIR R6 note."
* extension[change-made] ^short = "Note of changes made, calculating changes maybe required for safety as this extension may not contain all changes. Experimental, may overlap with other elements such as FHIR R6 note."

* modifierExtension[R5-Composition-status] ^short = "This allows for additional status values found in R5. However, exercise caution as the R4 Composition.status is required."
* modifierExtension[R5-Composition-status] ^isModifierReason = "This element is labelled as a modifier because it is a status element that contains status values such as cancelled (which means that the resource should not be treated as valid)."

* language 0..1 MS 
* language ^mapping[0].identity = "cda"
* language ^mapping[=].map = "languageCode"
* text MS
* identifier 0..1 MS
* type MS

* category 1.. MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "text"
* category ^slicing.rules = #open
* category contains clinicalnotecategory 1..1 MS
* category[clinicalnotecategory] ^short = "Category for Clinical Note"
* category[clinicalnotecategory] =  $LNC#107903-7 "Clinical note"

* subject 1..1 MS
* subject only Reference(Patient or Group)
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
* attester ^slicing.discriminator.type = #value
* attester ^slicing.discriminator.path = mode
* attester ^slicing.rules = #open
* attester ^slicing.description = "Slicing based on the resource type"
* attester contains 
    legal_attester 0..1 MS
	and professional_attester 0..* MS
* attester[legal_attester] ^short = "aka legal authenticator"
* attester[legal_attester].mode = http://hl7.org/fhir/composition-attestation-mode#legal
* attester[legal_attester] ^mapping[0].identity = "cda"
* attester[legal_attester] ^mapping[=].map = "assignedEntity.legalAuthenticator"
* attester[professional_attester] ^short = "aka authenticator"
* attester[professional_attester].mode = http://hl7.org/fhir/composition-attestation-mode#professional
* attester[professional_attester] ^mapping[0].identity = "cda"
* attester[professional_attester] ^mapping[=].map = "assignedEntity.authenticator"


* custodian 0..1 MS
* custodian ^mapping[0].identity = "cda"
* custodian ^mapping[=].map = "assignedCustodian.custodian"
// can we remove the default mapping? 

* relatesTo MS
//* relatesTo.targetIdentifier.system 1..1
//* relatesTo.targetIdentifier.value 1..1
* relatesTo.targetIdentifier ^short = "Reference to the Bundle.identifier of the FHIR Clinical Document being appended, or to some other identifier of a non FHIR document"

* relatesTo ^slicing.discriminator[0].type = #value
* relatesTo ^slicing.discriminator[=].path = "code"
* relatesTo ^slicing.discriminator[+].type = #type
* relatesTo ^slicing.discriminator[=].path = "target"
* relatesTo ^slicing.ordered = false
* relatesTo ^slicing.rules = #open
* relatesTo ^slicing.description = "Slicing based on code"

* relatesTo contains 
    replaced_document 0..* MS
	and appended_document 0..* MS
	
* relatesTo[replaced_document] ^short = "The document(s) being superceded"
* relatesTo[replaced_document].code = #replaces
* relatesTo[replaced_document].target[x] only Identifier
* relatesTo[replaced_document].targetIdentifier 1..1
* relatesTo[replaced_document].targetIdentifier.system 1..1
* relatesTo[replaced_document].targetIdentifier.value 1..1
* relatesTo[replaced_document].targetIdentifier ^short = "Reference to the Bundle.identifier of the FHIR Clinical Document being replaced, or to some other identifier of a non FHIR document"
* relatesTo[replaced_document] ^mapping[0].identity = "cda"
* relatesTo[replaced_document] ^mapping[=].map = "parentDocument.relatedDocument"

* relatesTo[appended_document] ^short = "The document(s) being appended too"
* relatesTo[appended_document].code = #appends
* relatesTo[appended_document].target[x] only Identifier
* relatesTo[appended_document].targetIdentifier 1..1
* relatesTo[appended_document].targetIdentifier.use 1..1
//* relatesTo[appended_document].targetIdentifier.use = #official
* relatesTo[appended_document] ^mapping[0].identity = "cda"
* relatesTo[appended_document] ^mapping[=].map = "parentDocument.relatedDocument"


* section 1..* MS
* section ^mapping[+].identity = "cda"
* section ^mapping[+].map = "bodyChoice.component.NonXMLBody"
* section.code MS
* section.text MS
* section.title 1..1 MS
//seems consistent that where there is a slice in a profile that the Title is required and MS

* section.extension contains
	ChangeMade named change-made 0..1 MS

//* section ^slicing.discriminator.type = #type
//* section ^slicing.discriminator.path = section.entry
//* section ^slicing.rules = #open
//* section ^slicing.description = "Slicing based on the resource type"
//* section contains 
//	nonFHIR_body 0..*
//* section[nonFHIR_body].entry 1..1
//* section[nonFHIR_body] ^short = "A non-FHIR clinical document being wrapped by the FHIR Clinical Document Composition. This can be used where it is necessary to wrap a non-FHIR document in a standard header so as to enable consistent document management."
//* section[nonFHIR_body].entry only Reference(DocumentReference)
//* section[nonFHIR_body] ^mapping[0].identity = "cda"
//* section[nonFHIR_body] ^mapping[+].map = "bodyChoice.component.NonXMLBody"
//might want a specific code for this slice in the future
