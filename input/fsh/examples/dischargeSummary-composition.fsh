Instance: 22487
InstanceOf: Composition
Usage: #example
Description: "Original discharge summary"
* meta.versionId = "1"
* meta.lastUpdated = "2024-05-07T16:39:20.028+00:00"
* meta.profile = "http://hl7.org/fhir/uv/clinical-document-ig/StructureDefinition/clinical-document-composition"
* language = urn:ietf:bcp:47#en "English"

* extension[$composition-clinicaldocument-versionNumber].valueString = "original1"
* extension[document-id].valueIdentifier.system = "https://example.com/SenderSystem/docIdentifier"
* extension[document-id].valueIdentifier.value = "w0101" 

* identifier.system = "https://example.com/SenderSystem/setIdentifier"
* identifier.value = "bcdef"

* status = #final
* type = $loinc#28655-9
* type.text = "Discharge Summary from Responsible Clinician"
* subject.display = "Patient/smart-1627321"
* date = "2024-05-07"
* author.display = "Practitioner/smart-Practitioner-71614502"

* title = "Discharge Summarization"
* confidentiality = #N
* section[0].title = "Reason for admission"
* section[=].code = $loinc#29299-5 "Reason for visit Narrative"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Details</td>\n\n                    <td/>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Acute Asthmatic attack. Was wheezing for days prior to admission.</td>\n\n                    <td/>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry.display = "Observation/BILIBABY-OBS1"
* section[+].title = "Medications on Discharge"
* section[=].code = $loinc#10183-2 "Hospital discharge medications Narrative"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Medication</td>\n\n                    <td>Last Change</td>\n\n                    <td>Last ChangeReason</td>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Theophylline 200mg BD after meals</td>\n\n                    <td>continued</td>\n\n                  </tr>\n\n                  <tr>\n\n                    <td>Ventolin Inhaler</td>\n\n                    <td>stopped</td>\n\n                    <td>Getting side effect of tremor</td>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].mode = #working
* section[=].entry[0].display = "MedicationRequest/smart-MedicationRequest-101"
* section[=].entry[+].display = "MedicationRequest/smart-MedicationRequest-102"
* section[+].title = "Known allergies"
* section[=].code = $loinc#48765-2 "Allergies and adverse reactions Document"
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Allergen</td>\n\n                    <td>Reaction</td>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Doxycycline</td>\n\n                    <td>Hives</td>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section[=].entry.display = "AllergyIntolerance/smart-AllergyIntolerance-19"