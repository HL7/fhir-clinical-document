Instance: 180f219f-97a8-486d-99d9-ed631fe4fc57
InstanceOf: Composition
Usage: #inline
* meta.lastUpdated = "2013-05-28T22:12:21Z"
* meta.profile = "http://hl7.org/fhir/uv/clinical-document-ig/StructureDefinition/clinical-document-composition"
* language = urn:ietf:bcp:47#en "English"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c3151bd-1cbf-4d64-b04d-cd9187a4c6e0"
* status = #final
* type = $loinc#28655-9
* type.text = "Discharge Summary from Responsible Clinician"
* subject = Reference(http://fhir.healthintersections.com.au/open/Patient/d1) "Eve Everywoman"
* encounter = Reference(http://fhir.healthintersections.com.au/open/Encounter/doc-example)
* date = "2013-02-01T12:30:02Z"
* author = Reference(examplet) "Doctor Dave"
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