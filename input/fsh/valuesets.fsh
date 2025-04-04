
ValueSet: ClinicalDocInformationRecipientVs
Id: clinical-doc-information-recipient-vs 
Title: "FHIR Clinical Document Information Recipients Participant Types"
Description: "Subset of codes from v3-ParticipationType for use as Clinical Document Participant Type codes, which are specifically CDA information recipients"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRCP "primary information recipient"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#TRC "tracker"

ValueSet: ClinicalDocParticipantVs
Id: clinical-doc-participant-vs 
Title: "FHIR Clinical Document Participant Types Value set"
Description: "FHIR Clinical Document Participant Types. Author, Authenticator, Custodian, Legal Authenticator, Record Target and Subject are found in distinct, named fields in FHIR. Thus, these types are excluded."
* ^experimental = false
* include codes from system http://terminology.hl7.org/CodeSystem/v3-ParticipationType
* exclude http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
* exclude http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUTHEN "authenticator"
* exclude http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "custodian"
* exclude http://terminology.hl7.org/CodeSystem/v3-ParticipationType#LA "legal authenticator"
* exclude http://terminology.hl7.org/CodeSystem/v3-ParticipationType#RCT "record target"
* exclude http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SBJ "subject"