Instance: clinical-doc-bundle-document-type
InstanceOf: Bundle
Usage: #example
Description: "Clinical Document Bundle Document Type"
* meta.lastUpdated = "2013-05-28T22:12:21Z"
* meta.profile = "http://hl7.org/fhir/uv/clinical-document-ig/StructureDefinition/clinical-document-bundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c3151bd-1cbf-4d64-b04d-cd9187a4c6e0"
* type = #document
* timestamp = "2013-05-28T22:12:21Z"
* entry[0].fullUrl = "http://fhir.healthintersections.com.au/open/Composition/180f219f-97a8-486d-99d9-ed631fe4fc57"
* entry[=].resource = 180f219f-97a8-486d-99d9-ed631fe4fc57
* entry[+].fullUrl = "http://fhir.healthintersections.com.au/open/Practitioner/examplet"
* entry[=].resource = examplet
* entry[+].fullUrl = "http://fhir.healthintersections.com.au/open/Patient/d1"
* entry[=].resource = d1
* entry[+].fullUrl = "http://fhir.healthintersections.com.au/open/Encounter/doc-example"
* entry[=].resource = doc-example
* entry[+].fullUrl = "urn:uuid:541a72a8-df75-4484-ac89-ac4923f03b81"
* entry[=].resource = Inline-Instance-for-father-doc-1
* entry[+].fullUrl = "urn:uuid:124a6916-5d84-4b8c-b250-10cefb8e6e86"
* entry[=].resource = Inline-Instance-for-father-doc-2
* entry[+].fullUrl = "urn:uuid:673f8db5-0ffd-4395-9657-6da00420bbc1"
* entry[=].resource = Inline-Instance-for-father-doc-3
* entry[+].fullUrl = "urn:uuid:47600e0f-b6b5-4308-84b5-5dec157f7637"
* entry[=].resource = Inline-Instance-for-father-doc-4