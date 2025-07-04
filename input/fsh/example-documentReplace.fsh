
Instance: clinical-document-bundle-revision
InstanceOf: Bundle
Description: "Document Bundle revision example for FHIR Clinical Document"Usage: #example
* meta.lastUpdated = "2024-05-08T12:28:34.000+00:00"
* meta.profile = "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/clinical-document-bundle"
* identifier.system = "https://example.com/bundleId"
* identifier.value = "90380bb8-e545-4100-a929-de70b086d023"
* type = #document
* timestamp = "2024-05-08T12:28:34.000+00:00"
* entry[0].fullUrl = "https://example.com/Composition/clinical-document-composition-revision"
* entry[=].resource = clinical-document-composition-revision

* entry[+].fullUrl = "https://example.com/Organization/revised-custodianOrganization"
* entry[=].resource = revised-custodianOrganization
* entry[+].fullUrl = "https://example.com/Practitioner/Doctor1"
* entry[=].resource = Doctor1
* entry[+].fullUrl = "https://example.com/Practitioner/Doctor2"
* entry[=].resource = Doctor2
* entry[+].fullUrl = "https://example.com/Patient/revised-Patient"
* entry[=].resource = revised-Patient
* entry[+].fullUrl = "https://example.com/Encounter/revised-encounter-example"
* entry[=].resource = revised-encounter-example
* entry[+].fullUrl = "https://example.com/Observation/revised-Observation-541a72a8-df75-4484-ac89-ac4923f03b81"
* entry[=].resource = revised-Observation-541a72a8-df75-4484-ac89-ac4923f03b81
* entry[+].fullUrl = "https://example.com/MedicationRequest/revised-MedRequest-124a6916-5d84-4b8c-b250-10cefb8e6e86"
* entry[=].resource = revised-MedRequest-124a6916-5d84-4b8c-b250-10cefb8e6e86
* entry[+].fullUrl = "https://example.com/MedicationStatement/revised-MedStatement-673f8db5-0ffd-4395-9657-6da00420bbc1"
* entry[=].resource = revised-MedStatement-673f8db5-0ffd-4395-9657-6da00420bbc1
* entry[+].fullUrl = "https://example.com/AllergyIntolerance/revised-AllergyIntolerance-47600e0f-b6b5-4308-84b5-5dec157f7637"
* entry[=].resource = revised-AllergyIntolerance-47600e0f-b6b5-4308-84b5-5dec157f7637

* entry[+].fullUrl = "https://example.com/ServiceRequest/revised-service1"
* entry[=].resource = revised-service1
* entry[+].fullUrl = "https://example.com/Consent/revised-consent1"
* entry[=].resource = revised-consent1

Instance: clinical-document-composition-revision
InstanceOf: Composition
Description: "Composition revision example for FHIR Clinical Document"Usage: #example
* meta.lastUpdated = "2024-05-07T13:28:17.000+00:00"
* meta.profile = "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/clinical-document-composition"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">          <p><b>Discharge Summary</b></p>          <p><b>CC</b>: Dr. BettaB Careful</p>                   <p><b>status</b>: final</p>          <p><b>patient</b>: Eve Everywoman</p>          <p><b>author</b>: Doctor Dave / Good Health Clinic</p>          <p><b>encounter</b>: Inpatient encounter, 2024-05-03 - 2024-05-07</p>          <p><b>confidentiality</b>: N</p>          <p><b>Contained sections</b>: </p>          <ul>          <li>Reason for admission</li>          <li>Medications on Discharge</li>          <li>Known allergies</li>          </ul>          </div>"
* extension[0].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Composition.version"
* extension[=].valueString = "1715171314"

//* extension[+].url = "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension"
//* extension[=].extension[0].url = "type"
//* extension[data-enterer].extension[type].valueCodeableConcept = $participantTypes#PRCP "primary information recipient"


//* extension[InformationRecipientExtension].extension[type].valueCodeableConcept = $participantTypes#ENT "data entry person"
* extension[InformationRecipientExtension].extension[type].valueCodeableConcept = $participantTypes#PRCP "primary information recipient"
* extension[InformationRecipientExtension].extension[party].valueReference = Reference(Practitioner/Doctor2)


* extension[+].url = "http://hl7.org/fhir/StructureDefinition/event-basedOn"
//"http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/OrderExtension"
* extension[=].valueReference = Reference(revised-service1)

* extension[+].url = "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/consent-extension"
* extension[=].valueReference = Reference(revised-consent1)

* extension[ChangeMade].extension[change].valueAnnotation.authorReference = Reference(Doctor1) "Doctor Dave"
* extension[ChangeMade].extension[change].valueAnnotation.time = "2024-05-07T13:28:17.000+00:00"
* extension[ChangeMade].extension[change].valueAnnotation.text = "Subject's name was corrected becuase of a misspelling."

* extension[ChangeMade].extension[version-changed].valueReference.identifier.system = "https://example.com/bundleId"
* extension[ChangeMade].extension[version-changed].valueReference.identifier.value = "26d52355-b71b-4992-a34b-a2476983c166"

* identifier.system = "https://example.com/compId"
* identifier.value = "1d6d6eb8-7d08-4ce1-94d4-19cdaa76ad6f"
* status = #final
* type = $LNC#28655-9
* type.text = "Attending Discharge summary"

* category[0].text = "Temp Code: Clinical Note. Requested from LOINC"

* subject = Reference(revised-Patient) "Eve Everywoman"
* encounter = Reference(revised-encounter-example)
* date = "2024-05-08T11:28:17.000+00:00"
* author = Reference(Doctor1) "Doctor Dave"
* title = "Discharge Summary Revision"
* attester.mode = http://hl7.org/fhir/composition-attestation-mode#legal
* attester.time = "2024-05-07"
* attester.party = Reference(Doctor1) "Doctor Dave"
* custodian = Reference(revised-custodianOrganization) "Good Health Clinic"
* confidentiality = #N

* relatesTo[0].code = #replaces
* relatesTo[=].targetIdentifier.system = "https://example.com/bundleId"
* relatesTo[=].targetIdentifier.value = "26d52355-b71b-4992-a34b-a2476983c166"

* section[0].title = "Reason for admission"
* section[=].code = $LNC#29299-5 "Reason for visit Narrative"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Details</td>\n\n                    <td/>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Acute Asthmatic attack. Was wheezing for days prior to admission.</td>\n\n                    <td/>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry = Reference(revised-Observation-541a72a8-df75-4484-ac89-ac4923f03b81)
* section[+].title = "Medications on Discharge"
* section[=].code = $LNC#10183-2 "Hospital discharge medications Narrative"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Medication</td>\n\n                    <td>Last Change</td>\n\n                    <td>Last ChangeReason</td>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Theophylline 200mg BD after meals</td>\n\n                    <td>continued</td>\n\n                  </tr>\n\n                  <tr>\n\n                    <td>Ventolin Inhaler</td>\n\n                    <td>stopped</td>\n\n                    <td>Getting side effect of tremor</td>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry[0] = Reference(revised-MedRequest-124a6916-5d84-4b8c-b250-10cefb8e6e86)
* section[=].entry[+] = Reference(revised-MedStatement-673f8db5-0ffd-4395-9657-6da00420bbc1)
* section[+].title = "Known allergies"
* section[=].code = $LNC#48765-2 "Allergies and adverse reactions Document"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Allergen</td>\n\n                    <td>Reaction</td>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Doxycycline</td>\n\n                    <td>Hives</td>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry = Reference(revised-AllergyIntolerance-47600e0f-b6b5-4308-84b5-5dec157f7637)

Instance: revised-custodianOrganization
InstanceOf: Organization
Description: "Example composition content"Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2.16.840.1.113883.19.5"
* name = "Good Health Clinic"

//Instance: revised-example
//InstanceOf: Practitioner
//Description: "Example composition content"//Usage: #example
//* meta.lastUpdated = "2013-05-05T16:13:03Z"
//* identifier.system = "http://www.acme.org/practitioners"
//* identifier.value = "23"
//* name.family = "Careful"
//* name.given = "Adam"
//* name.prefix = "Dr"

//Instance: revised-example2
//InstanceOf: Practitioner
//Description: "Example composition content"//Usage: #example
//* meta.lastUpdated = "2013-05-05T16:13:03Z"
//* identifier.system = "http://www.acme.org/practitioners"
//* identifier.value = "27"
//* name.family = "Careful"
//* name.given = "BettaB"
//* name.prefix = "Dr"

Instance: revised-Patient
InstanceOf: Patient
Description: "Example composition content"
Usage: #example
* active = true
* name.text = "Eve Everywoman"
* name.family = "Everywoman1"
* name.given = "Eve"
* telecom.system = #phone
* telecom.value = "555-555-2003"
* telecom.use = #work
* gender = #female
* birthDate = "1955-01-06"
* address.use = #home
* address.line = "2222 Home Street"

Instance: revised-encounter-example
InstanceOf: Encounter
Description: "Example composition content"Usage: #example
* meta.lastUpdated = "2024-05-07T11:28:17.000+00:00"
* identifier.value = "S100"
* status = #finished
* class = $v3-ActCode#IMP "inpatient encounter"
* type.text = "Orthopedic Admission"
* subject = Reference(revised-Patient) "Eve Everywoman"
* period.start = "2024-05-03T13:28:17.000+00:00"
* period.end = "2024-05-07T11:28:17.000+00:00"
* hospitalization.dischargeDisposition.text = "Discharged to care of GP"

Instance: revised-Observation-541a72a8-df75-4484-ac89-ac4923f03b81
InstanceOf: Observation
Description: "Example composition content"Usage: #example
* meta.lastUpdated = "2024-05-03T14:28:17.000+00:00"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> Acute Asthmatic attack. Was wheezing\n                        for days prior to admission. </div>"
* status = #final
* code = $LNC#46241-6
* code.text = "Reason for admission"
* effectiveDateTime = "2023-08-03"
* performer = Reference(Doctor2) "Dr Careful"
* subject = Reference(revised-Patient) "Eve Everywoman"
* encounter.display = "http://fhir.healthintersections.com.au/open/Encounter/revised-encounter-example"
* valueString = "Acute Asthmatic attack. Was wheezing for days prior to admission."

Instance: revised-MedRequest-124a6916-5d84-4b8c-b250-10cefb8e6e86
InstanceOf: MedicationRequest
Description: "Example composition content"
Usage: #example
* meta.lastUpdated = "2024-05-07T11:28:17.000+00:00"
* status = #unknown
* intent = #order
* medicationCodeableConcept = $SCT#66493003
* medicationCodeableConcept.text = "Theophylline 200mg"
* subject = Reference(revised-Patient) "Eve Everywoman"
* requester = Reference(Doctor1) "Peter Practitioner"
* reasonCode.text = "Management of Asthma"
* dosageInstruction.additionalInstruction.text = "Take with Food"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = $SCT#394899003 "oral administration of treatment"
* dosageInstruction.doseAndRate.type = $dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate.doseQuantity = 1 '{tablet}' "tablet"

Instance: revised-MedStatement-673f8db5-0ffd-4395-9657-6da00420bbc1
InstanceOf: MedicationStatement
Description: "Example composition content"
Usage: #example
* status = #active
* statusReason.text = "Management of Asthma"
* medicationCodeableConcept.text = "Ventolin Inhaler"
* subject = Reference(revised-Patient) "Eve Everywoman"
* dateAsserted = "2024-05-07T11:28:17.000+00:00"

Instance: revised-AllergyIntolerance-47600e0f-b6b5-4308-84b5-5dec157f7637
InstanceOf: AllergyIntolerance
Description: "Example composition content"
Usage: #example
* meta.lastUpdated = "2024-05-07T11:28:17.000+00:00"
* clinicalStatus = $allergyintolerance-clinical#active "Active"
* verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
* type = #allergy
* criticality = #high
* code.text = "Doxycycline"
* patient = Reference(revised-Patient) "Eve Everywoman"
* recordedDate = "2012-09-17"
//* reaction.manifestation = $system#xxx "Hives"
* reaction.manifestation.text = "Hives"

Instance: revised-service1
InstanceOf: ServiceRequest
Description: "Example composition content"
Usage: #example
* meta.lastUpdated = "2024-05-07T11:28:17.000+00:00"
* status = #active "Active"
* intent = #order
* subject = Reference(revised-Patient) "Eve Everywoman"
* code.text = "Discharge to home"

Instance: revised-consent1
InstanceOf: Consent
Description: "Example composition content"
Usage: #example
* meta.lastUpdated = "2024-05-07T11:28:17.000+00:00"
* status = #active "Active"
* patient = Reference(revised-Patient) "Eve Everywoman"
* scope = $consentscope#patient-privacy
* category = $LNC#59284-0
//* sourceAttachment.title = "The terms of the consent in lawyer speak."
* policyRule = $v3-ActCode#OPTIN