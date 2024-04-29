# CDA mapping background
The FHIR Clinical Document IG was originally derived from the HL7 Clinical Document Architecture, and was developed in part to resolve CDA to FHIR mapping discrepancies found across a number of FHIR-based artifacts. Landscape analysis leading up to the development of this IG revealed HUNDREDS of existing Bundle and Composition profiles, many of which are designed for clinical documents, with no clear canonical pattern upon which future FHIR-based clinical documents work should be based. Existing profiles and IGs take many different approaches to representing various CDA constructs. 

# CDA mapping scope
The FHIR Clinical Document IG is aligned with CDA, but not a mirror image of CDA. While this IG is based on CDA and will enable a straightforward mapping from CDA to FHIR, it will not necessarily provide a reverse mapping. Future IG updates will assess the need for additional profiles, and may add features that go beyond what is capable with today's CDA. 

Scope for this version of the IG is limited to FHIR artifacts reflecting the CDA Header. More precisely, and as shown in the following figure within the red boxes, scope includes FHIR artifacts corresponding to:
1. CDA header attributes;
2. CDA header participants, excluding profiles corresponding to CDA header entities; 
3. CDA header relationships, excluding profiles corresponding to CDA header related Acts; 
4. CDA body choice; 
5. CDA section attributes; 
6. CDA section participants, excluding profiles corresponding to RIM entities; 
7. CDA section relationships, excluding profiles corresponding to RIM Acts. 
<img src="CDA_RMIM.png" height="290" width="715" border=1/>


# CDA mapping (detailed)
(see mapping spreadsheet)
