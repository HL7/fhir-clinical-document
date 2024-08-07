

Extension: ConsentExtension
Id: consent-extension
Title: "Consent Extension"
Description: "Consent Extension refers to a FHIR Consent instance that indicates a patient's consent"
* ^context.type = #element
* ^context.expression = "Composition"
* url MS
* valueReference 1.. MS
* valueReference only Reference(Consent)
* valueReference ^sliceName = "valueReference"

Extension: DataEntererExtension
Id: data-enterer-extension
Title: "Data Enterer Extension"
Description: "The Data Enterer Extension represents the person who transferred the content, written or dictated, into the clinical document. To clarify, an author provides the content, subject to their own interpretation; a dataEnterer adds an author's information to the electronic system."
//* ^context.type = #element
//* ^context.expression = "Composition"
//* valueReference 1.. MS
//* valueReference only Reference(Practitioner or PractitionerRole)
//* valueReference ^sliceName = "valueReference"
* ^context.type = #element
* ^context.expression = "Composition"
* extension contains
	type 1..* and
	function 0..* and
	time 0..1 and
	party 1..1 MS
* extension[type]
//* extension[type] ^short = "A code specifying the type of participation, such as data entry person, informant, primary information recipient, or tracker"
* extension[type] ^short = "Meaning and purpose of participation, in creation of the clinical document. The list includes: data entry person, informant, primary information recipient, and tracker. Other types are allowed."
* extension[type].value[x] only CodeableConcept
* extension[type].valueCodeableConcept from ClinicalDocInformationRecipientVs (required)
* extension[type].valueCodeableConcept ^binding.description = "primary information recipient (PRCP), secondary information recipient (TRC) or generic information recipient (IRCP)"
* extension[type].valueCodeableConcept 1..1
* extension[type].valueCodeableConcept = $participantTypes#ENT "data entry person"
* extension[function]
//* extension[function] ^short = "A code specifying the granular, or exact, function in participation"
* extension[function] ^short = "Exact function of the participant in the creation of the clinical document. This is more granular than type."
* extension[function].value[x] only CodeableConcept
* extension[function].valueCodeableConcept from http://terminology.hl7.org/ValueSet/v3-ParticipationFunction (extensible)
* extension[function].valueCodeableConcept 1..1
* extension[time]
* extension[time] ^short = "Time period of participation"
//* extension[time] ^short = "Period of time during which the participant is involved in creation of the clinical document."
* extension[time].value[x] only Period
* extension[time].valuePeriod 1..1
* extension[party]
* extension[party] ^short = "participant"
//* extension[party] ^short = "A FHIR Reference to the person, PracitionerRole, device or organization participating in the clinical document."
* extension[party].value[x] only Reference
* extension[party].valueReference only Reference(Practitioner or PractitionerRole or Patient or RelatedPerson or Device or Organization)
* extension[party].valueReference 1..1



Extension: InformantExtension
Id: informant-extension
Title: "Informant Extension"
Description: "Informant Extension describes an information source for any content within the clinical document. This informant is constrained for use when the source of information is an assigned health care provider for the patient."
//* ^context.type = #element
//* ^context.expression = "Composition"
//* valueReference 1.. MS
//* valueReference only Reference(Practitioner or PractitionerRole or Patient or RelatedPerson)
//* valueReference ^sliceName = "valueReference"
* ^context.type = #element
* ^context.expression = "Composition"
* extension contains
	type 1..* and
	function 0..* and
	time 0..1 and
	party 1..1 MS
* extension[type]
//* extension[type] ^short = "A code specifying the type of participation, such as data entry person, informant, primary information recipient, or tracker"
* extension[type] ^short = "Meaning and purpose of participation, in creation of the clinical document. The list includes: data entry person, informant, primary information recipient, and tracker. Other types are allowed."
* extension[type].value[x] only CodeableConcept
* extension[type].valueCodeableConcept from ClinicalDocInformationRecipientVs (required)
* extension[type].valueCodeableConcept ^binding.description = "primary information recipient (PRCP), secondary information recipient (TRC) or generic information recipient (IRCP)"
* extension[type].valueCodeableConcept 1..1
* extension[type].valueCodeableConcept = $participantTypes#INF "informant"
* extension[function]
//* extension[function] ^short = "A code specifying the granular, or exact, function in participation"
* extension[function] ^short = "Exact function of the participant in the creation of the clinical document. This is more granular than type."
* extension[function].value[x] only CodeableConcept
* extension[function].valueCodeableConcept from http://terminology.hl7.org/ValueSet/v3-ParticipationFunction (extensible)
* extension[function].valueCodeableConcept 1..1
* extension[time]
* extension[time] ^short = "Time period of participation"
//* extension[time] ^short = "Period of time during which the participant is involved in creation of the clinical document."
* extension[time].value[x] only Period
* extension[time].valuePeriod 1..1
* extension[party]
* extension[party] ^short = "participant"
//* extension[party] ^short = "A FHIR Reference to the person, PracitionerRole, device or organization participating in the clinical document."
* extension[party].value[x] only Reference
* extension[party].valueReference only Reference(Practitioner or PractitionerRole or Patient or RelatedPerson or Device or Organization)
* extension[party].valueReference 1..1



Extension: InformationRecipientExtension
Id: information-recipient-extension
Title: "Information Recipient Extension"
Description: "The Information Recipient Extension records the intended recipient of the information at the time the document was created."
//* ^context.type = #element
//* ^context.expression = "Composition"
//* valueReference 1.. MS
//* valueReference only Reference(Practitioner or PractitionerRole or Patient)
//* valueReference ^sliceName = "valueReference"
* ^context.type = #element
* ^context.expression = "Composition"
* extension contains
	type 1..* and
	function 0..* and
	time 0..1 and
	party 1..1 MS
* extension[type]
//* extension[type] ^short = "A code specifying the type of participation, such as data entry person, informant, primary information recipient, or tracker"
* extension[type] ^short = "Meaning and purpose of participation, in creation of the clinical document. The list includes: data entry person, informant, primary information recipient, and tracker. Other types are allowed."
* extension[type].value[x] only CodeableConcept
* extension[type].valueCodeableConcept from clinical-doc-participant-types-vs (extensible)
* extension[type].valueCodeableConcept ^binding.description = "primary information recipient (PRCP), secondary information recipient (TRC) or generic information recipient (IRCP)"
* extension[type].valueCodeableConcept 1..1
* extension[function]
//* extension[function] ^short = "A code specifying the granular, or exact, function in participation"
* extension[function] ^short = "Exact function of the participant in the creation of the clinical document. This is more granular than type."
* extension[function].value[x] only CodeableConcept
* extension[function].valueCodeableConcept from http://terminology.hl7.org/ValueSet/v3-ParticipationFunction (extensible)
* extension[function].valueCodeableConcept 1..1
* extension[time]
* extension[time] ^short = "Time period of participation"
//* extension[time] ^short = "Period of time during which the participant is involved in creation of the clinical document."
* extension[time].value[x] only Period
* extension[time].valuePeriod 1..1
* extension[party]
* extension[party] ^short = "participant"
//* extension[party] ^short = "A FHIR Reference to the person, PracitionerRole, device or organization participating in the clinical document."
* extension[party].value[x] only Reference
* extension[party].valueReference only Reference(Practitioner or PractitionerRole or Patient or RelatedPerson or Device or Organization)
* extension[party].valueReference 1..1




//Extension: ParticipantExtension
//Id: ParticipantExtension
//Title: "Participant Extension"
//Description: "Participant Extension identifies supporting entities, including parents, relatives, caregivers, insurance policyholders, guarantors, and others related in some way to the patient. A supporting person or organization is an individual or an organization with a relationship to the patient. A supporting person who is playing multiple roles would be recorded in multiple participants (e.g., emergency contact and next-of-kin)."


Extension: ParticipantExtension
Id: ParticipantExtension
Title: "Participant Extension"
Description: "Participant Extension identifies supporting entities, including parents, relatives, caregivers, insurance policyholders, guarantors, and others related in some way to the patient. A supporting person or organization is an individual or an organization with a relationship to the patient. A supporting person who is playing multiple roles would be recorded in multiple participants (e.g., emergency contact and next-of-kin)."
//
//**Data Enterer**
//A Data Enterer represents the person who transferred the content, written or dictated, into the clinical document. To clarify, an author provides the content, subject to their own interpretation; a dataEnterer adds an author's information to the electronic system.
//
//**Informant**
//An Informant is an information source for any content within the clinical document. This informant is constrained for use when the source of information is an assigned health care provider for the patient.
//
//**Information Recipient**
//An Information Recipient is the intended recipient of the information at the time the document was created.
//
//**Participant**
//A Participant identifies supporting entities, including parents, relatives, caregivers, insurance policyholders, guarantors, and others related in some way to the patient. A supporting person or organization is an individual or an organization with a relationship to the patient. A supporting person who is playing multiple roles would be recorded in multiple participants (e.g., emergency contact and next-of-kin)."
* ^context.type = #element
* ^context.expression = "Composition"
* extension contains
	type 1..* and
	function 0..* and
	time 0..1 and
	party 1..1 MS

* extension[type]
//* extension[type] ^short = "A code specifying the type of participation, such as data entry person, informant, primary information recipient, or tracker"
* extension[type] ^short = "Meaning and purpose of participation, in creation of the clinical document. The list includes: data entry person, informant, primary information recipient, and tracker. Other types are allowed."
* extension[type].value[x] only CodeableConcept
* extension[type].valueCodeableConcept from clinical-doc-participant-types-vs (extensible)
* extension[type].valueCodeableConcept 1..1

* extension[function]
//* extension[function] ^short = "A code specifying the granular, or exact, function in participation"
* extension[function] ^short = "Exact function of the participant in the creation of the clinical document. This is more granular than type."
* extension[function].value[x] only CodeableConcept
* extension[function].valueCodeableConcept from http://terminology.hl7.org/ValueSet/v3-ParticipationFunction (extensible)
* extension[function].valueCodeableConcept 1..1

* extension[time]
* extension[time] ^short = "Time period of participation"
//* extension[time] ^short = "Period of time during which the participant is involved in creation of the clinical document."
* extension[time].value[x] only Period
* extension[time].valuePeriod 1..1

* extension[party]
* extension[party] ^short = "participant"
//* extension[party] ^short = "A FHIR Reference to the person, PracitionerRole, device or organization participating in the clinical document."
* extension[party].value[x] only Reference
* extension[party].valueReference only Reference(Practitioner or PractitionerRole or Patient or RelatedPerson or Device or Organization)
* extension[party].valueReference 1..1




Extension: OrderExtension
Id: OrderExtension
Title: "Order Extension"
Description: "The Order Extension represents orders that are fulfilled by this document such as a radiologists report of an x-ray."
* ^context.type = #element
* ^context.expression = "Composition"
* valueReference 1.. MS
* valueReference only Reference(ServiceRequest)
* valueReference ^sliceName = "valueReference"

// Extension: PerformerExtension
// Id: PerformerExtension
// Title: "Performer Extension"
// Description: "The Performer Extension represents clinicians who actually and principally carry out the clinical services being documented. In a transfer of care this represents the healthcare providers involved in the current or pertinent historical care of the patient. Preferably, the patients key healthcare care team members would be listed, particularly their primary physician and any active consulting physicians, therapists, and counselors."
// * ^context.type = #element
// * ^context.expression = "Composition"
// * valueReference 1.. MS
// * valueReference only Reference(Practitioner or PractitionerRole)
// * valueReference ^sliceName = "valueReference"
