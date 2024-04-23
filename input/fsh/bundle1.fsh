Profile: ClinicalDocumentBundle
Parent: Bundle
Id: clinical-document-bundle
Title: "Clinical Document Bundle Profile"
Description: "Starting point for a specification for a composition of a Structured Document."
* type = #document
* entry 1..* MS
* entry.resource 1..1 MS // each entry must have a resource
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the resource type"
* entry contains 
    clinical-document-composition 1..1 MS
* entry[clinical-document-composition] ^short = "First entry is a composition"
* entry[clinical-document-composition].resource only ClinicalDocumentComposition

Profile: ClinicalDocumentComposition
Parent: Composition
Id: clinical-document-composition
Title: "Clinical Document Composition Profile"
Description: "Starting point for a specification for a composition of a Structured Document."