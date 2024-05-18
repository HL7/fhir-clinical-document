Instance: Inline-Instance-for-father-doc-2
InstanceOf: MedicationRequest
Usage: #inline
* meta.lastUpdated = "2013-05-05T16:13:03Z"
* status = #unknown
* intent = #order
* medicationCodeableConcept = $sct#66493003
* medicationCodeableConcept.text = "Theophylline 200mg"
* subject = Reference(http://fhir.healthintersections.com.au/open/Patient/d1) "Peter Patient"
* requester = Reference(http://fhir.healthintersections.com.au/open/Practitioner/examplet) "Peter Practitioner"
* reasonCode.text = "Management of Asthma"
* dosageInstruction.additionalInstruction.text = "Take with Food"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = $sct#394899003 "oral administration of treatment"
* dosageInstruction.doseAndRate.type = $dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate.doseQuantity = 1 #'TAB' "TAB"