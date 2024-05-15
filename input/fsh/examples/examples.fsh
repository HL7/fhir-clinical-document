Alias: $loinc = http://loinc.org
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $sct = http://snomed.info/sct
Alias: $dose-rate-type = http://terminology.hl7.org/CodeSystem/dose-rate-type
Alias: $allergyintolerance-clinical = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical
Alias: $allergyintolerance-verification = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification
Alias: $system = http://example.org/system

Instance: transactionBundleExample
InstanceOf: Bundle
Usage: #example
* id = "transactionBundleExample"
* meta.lastUpdated = "2013-05-28T22:12:21Z"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c3151bd-1cbf-4d64-b04d-cd9187a4c6e0"
* type = #transaction
* timestamp = "2013-05-28T22:12:21Z"
* entry[0].fullUrl = "http://fhir.healthintersections.com.au/open/Composition/180f219f-97a8-486d-99d9-ed631fe4fc57"
* entry[=].resource = 180f219f-97a8-486d-99d9-ed631fe4fc57
* entry[=].request.method = #POST
* entry[=].request.url = "Composition"
* entry[+].fullUrl = "http://fhir.healthintersections.com.au/open/Practitioner/example"
* entry[=].resource = example
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"
* entry[+].fullUrl = "http://fhir.healthintersections.com.au/open/Patient/d1"
* entry[=].resource = d1
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"
* entry[+].fullUrl = "http://fhir.healthintersections.com.au/open/Encounter/doc-example"
* entry[=].resource = doc-example
* entry[=].request.method = #POST
* entry[=].request.url = "Encounter"
* entry[+].fullUrl = "urn:uuid:541a72a8-df75-4484-ac89-ac4923f03b81"
* entry[=].resource = Inline-Instance-for-transactionBundleExample-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "urn:uuid:124a6916-5d84-4b8c-b250-10cefb8e6e86"
* entry[=].resource = Inline-Instance-for-transactionBundleExample-2
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationRequest"
* entry[+].fullUrl = "urn:uuid:673f8db5-0ffd-4395-9657-6da00420bbc1"
* entry[=].resource = Inline-Instance-for-transactionBundleExample-3
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationStatement"
* entry[+].fullUrl = "urn:uuid:47600e0f-b6b5-4308-84b5-5dec157f7637"
* entry[=].resource = Inline-Instance-for-transactionBundleExample-4
* entry[=].request.method = #POST
* entry[=].request.url = "AllergyIntolerance"

Instance: 180f219f-97a8-486d-99d9-ed631fe4fc57
InstanceOf: Composition
Usage: #inline
* meta.lastUpdated = "2013-05-28T22:12:21Z"
* status = #final
* type = $loinc#28655-9
* type.text = "Discharge Summary from Responsible Clinician"
* subject = Reference(http://fhir.healthintersections.com.au/open/Patient/d1) "Eve Everywoman"
* encounter = Reference(http://fhir.healthintersections.com.au/open/Encounter/doc-example)
* date = "2013-02-01T12:30:02Z"
* author = Reference(example) "Doctor Dave"
* title = "Discharge Summary"
* confidentiality = #N
* section[0].title = "Reason for admission"
* section[=].code = $loinc#29299-5 "Reason for visit Narrative"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Details</td>\n\n                    <td/>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Acute Asthmatic attack. Was wheezing for days prior to admission.</td>\n\n                    <td/>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry = Reference(urn:uuid:541a72a8-df75-4484-ac89-ac4923f03b81)
* section[+].title = "Medications on Discharge"
* section[=].code = $loinc#10183-2 "Hospital discharge medications Narrative"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Medication</td>\n\n                    <td>Last Change</td>\n\n                    <td>Last ChangeReason</td>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Theophylline 200mg BD after meals</td>\n\n                    <td>continued</td>\n\n                  </tr>\n\n                  <tr>\n\n                    <td>Ventolin Inhaler</td>\n\n                    <td>stopped</td>\n\n                    <td>Getting side effect of tremor</td>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].mode = #working
* section[=].entry[0] = Reference(urn:uuid:124a6916-5d84-4b8c-b250-10cefb8e6e86)
* section[=].entry[+] = Reference(urn:uuid:673f8db5-0ffd-4395-9657-6da00420bbc1)
* section[+].title = "Known allergies"
* section[=].code = $loinc#48765-2 "Allergies and adverse reactions Document"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Allergen</td>\n\n                    <td>Reaction</td>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Doxycycline</td>\n\n                    <td>Hives</td>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry = Reference(urn:uuid:47600e0f-b6b5-4308-84b5-5dec157f7637)

Instance: example
InstanceOf: Practitioner
Usage: #inline
* meta.lastUpdated = "2013-05-05T16:13:03Z"
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "23"
* name.family = "Careful"
* name.given = "Adam"
* name.prefix = "Dr"

Instance: d1
InstanceOf: Patient
Usage: #inline
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

Instance: doc-example
InstanceOf: Encounter
Usage: #inline
* meta.lastUpdated = "2013-05-05T16:13:03Z"
* identifier.value = "S100"
* status = #finished
* class = $v3-ActCode#IMP "inpatient encounter"
* type.text = "Orthopedic Admission"
* subject = Reference(d1)
* period.start = "2013-01-20T12:30:02Z"
* period.end = "2013-02-01T12:30:02Z"
* hospitalization.dischargeDisposition.text = "Discharged to care of GP"

Instance: Inline-Instance-for-transactionBundleExample-1
InstanceOf: Observation
Usage: #inline
* meta.lastUpdated = "2013-05-05T16:13:03Z"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> Acute Asthmatic attack. Was wheezing\n                        for days prior to admission. </div>"
* status = #final
* code = $loinc#46241-6
* code.text = "Reason for admission"
* subject = Reference(http://fhir.healthintersections.com.au/open/Patient/d1) "Eve Everywoman"
* encounter = Reference(http://fhir.healthintersections.com.au/open/Encounter/doc-example)
* valueString = "Acute Asthmatic attack. Was wheezing for days prior to admission."

Instance: Inline-Instance-for-transactionBundleExample-2
InstanceOf: MedicationRequest
Usage: #inline
* meta.lastUpdated = "2013-05-05T16:13:03Z"
* status = #unknown
* intent = #order
* medicationCodeableConcept = $sct#66493003
* medicationCodeableConcept.text = "Theophylline 200mg"
* subject = Reference(http://fhir.healthintersections.com.au/open/Patient/d1) "Peter Patient"
* requester = Reference(example) "Peter Practitioner"
* reasonCode.text = "Management of Asthma"
* dosageInstruction.additionalInstruction.text = "Take with Food"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = $sct#394899003 "oral administration of treatment"
* dosageInstruction.doseAndRate.type = $dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate.doseQuantity = 1 'tbl' "tablet"

Instance: Inline-Instance-for-transactionBundleExample-3
InstanceOf: MedicationStatement
Usage: #inline
* status = #active
* statusReason.text = "Management of Asthma"
* medicationCodeableConcept.text = "Ventolin Inhaler"
* subject = Reference(http://fhir.healthintersections.com.au/open/Patient/d1) "Peter Patient"
* dateAsserted = "2013-05-05T16:13:03Z"

Instance: Inline-Instance-for-transactionBundleExample-4
InstanceOf: AllergyIntolerance
Usage: #inline
* meta.lastUpdated = "2013-05-05T16:13:03Z"
* clinicalStatus = $allergyintolerance-clinical#active "Active"
* verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
* type = #allergy
* criticality = #high
* code.text = "Doxycycline"
* patient = Reference(http://fhir.healthintersections.com.au/open/Patient/d1) "Eve Everywoman"
* recordedDate = "2012-09-17"
* reaction.manifestation = $system#xxx "Hives"
* reaction.manifestation.text = "Hives"