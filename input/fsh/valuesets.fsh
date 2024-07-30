ValueSet: ClinicalDocParticipantTypesVs
Id: clinical-doc-participant-types-vs 
Title: "Clinical Document Participant Types Value set"
Description: "Subset of codes from v3-ParticipationType for use as Clinical Document Participant Type codes"
* ^status = #draft
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ENT "data entry person"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#INF "informant"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRCP "primary information recipient"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#TRC "tracker"

ValueSet: ClinicalDocInformationRecipientVs
Id: clinical-doc-information-recipient-vs 
Title: "Clinical Document Participant Types that are information recipients"
Description: "Subset of codes from v3-ParticipationType for use as Clinical Document Participant Type codes, which are specifically CDA information recipients"
* ^status = #draft
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRCP "primary information recipient"
* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#TRC "tracker"

ValueSet: ClinicalDocParticipantVs
Id: clinical-doc-participant-vs 
Title: "Clinical Document Participant Value set"
Description: "Value set is a subset that limits to values not used in other slices"
* ^status = #draft
* ^experimental = false
//* codes from system seriousness-criteria-cs

//* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ENT "data entry person"
//* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#INF "informant"
//* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
//* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRCP "primary information recipient"
//* http://terminology.hl7.org/CodeSystem/v3-ParticipationType#TRC "tracker"
