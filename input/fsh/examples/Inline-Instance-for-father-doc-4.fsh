Instance: Inline-Instance-for-father-doc-4
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
* reaction.manifestation = $SCT#247472004 "Wheal (finding)"
* reaction.manifestation.text = "Hives"