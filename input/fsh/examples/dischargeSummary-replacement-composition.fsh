Instance: r900
InstanceOf: Composition
Usage: #example
Description: "Replacement discharge summary"
* meta.versionId = "1"
* meta.lastUpdated = "2024-05-12T16:39:20.028+00:00"
* meta.profile = "http://hl7.org/fhir/uv/clinical-document-ig/StructureDefinition/clinical-document-composition"
* language = urn:ietf:bcp:47#en "English"

* extension[$composition-clinicaldocument-versionNumber].valueString = "replacement1"
//* extension[document-id].valueIdentifier.system = "https://example.com/SenderSystem/docIdentifier"
//* extension[document-id].valueIdentifier.value = "r123aw"

* identifier.system = "https://example.com/SenderSystem/setIdentifier"
* identifier.value = "bcdef"
* status = #final
* type = $loinc#28655-9
* type.text = "Discharge Summary from Responsible Clinician"
* subject.display = "Patient/smart-1627321"
* date = "2024-05-12"
* author.display = "Practitioner/smart-Practitioner-71614502"
* relatesTo.code = #replaces
* relatesTo.targetReference = Reference(Composition/22487)
* title = "Discharge Summarization"
* confidentiality = #N
* section.title = "Reason for admission"
* section.code = $loinc#29299-5 "Reason for visit Narrative"
* section.text.status = #additional
* section.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\n              <table>\n\n                <thead>\n\n                  <tr>\n\n                    <td>Details</td>\n\n                    <td/>\n\n                  </tr>\n\n                </thead>\n\n                <tbody>\n\n                  <tr>\n\n                    <td>Acute Asthmatic attack. Was wheezing for days prior to admission.</td>\n\n                    <td/>\n\n                  </tr>\n\n                </tbody>\n\n              </table>\n\n            </div>"
* section.entry.display = "Observation/BILIBABY-OBS1"