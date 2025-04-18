### CDA mapping background
The FHIR Clinical Document IG was originally derived from the HL7 Clinical Document Architecture, and was developed in part to resolve CDA to FHIR mapping discrepancies found across a number of FHIR-based artifacts. Landscape analysis leading up to the development of this IG revealed HUNDREDS of existing Bundle and Composition profiles, many of which are designed for clinical documents, with no clear canonical pattern upon which future FHIR-based clinical documents work should be based. Existing profiles and IGs take many different approaches to representing various CDA constructs. 
  
### CDA mapping scope
The FHIR Clinical Document IG is aligned with CDA, but not a mirror image of CDA. While this IG is based on CDA and will enable a straightforward mapping from CDA to FHIR, it will not necessarily provide a reverse mapping. Future IG updates will assess the need for additional profiles, and may add features that go beyond what is capable with today's CDA. 

Scope for this version of the IG is limited to FHIR artifacts reflecting the CDA Header. More precisely, and as shown in the following figure within the red boxes, scope includes FHIR artifacts corresponding to:
1. CDA header attributes;
2. CDA header participants, excluding profiles corresponding to CDA header entities; 
3. CDA header relationships, excluding profiles corresponding to CDA header related Acts; 
4. CDA body choice; 
5. CDA section attributes; 
6. CDA section participants, excluding profiles corresponding to RIM entities; 
7. CDA section relationships, excluding profiles corresponding to RIM Acts.
#### CDA RIM Diagram (click to goto full size image)
<table><tr><td><a href="https://build.fhir.org/ig/HL7/CDA-core-sd/cda-rmim.html#graphical-map-of-cda"><img src="CDA_RMIM.png" height="471" width="715" border=1/></a></td></tr></table>

### CDA mapping
Detailed mappings of this IG can be found on the Profile Structure Definitions. See [Composition](StructureDefinition-clinical-document-composition-mappings.html) and [Bundle](StructureDefinition-clinical-document-bundle-mappings.html) mappings.

<p>A high level mapping from CDA to FHIR Clinical Document is shown here. Composition attributes in <b>bold</b> have a minimal cardinality of 1 in the core resource. Composition attributes in green represent extensions. <a href="https://confluence.hl7.org/display/SD/CDA+Extensions">CDA extensions</a> that map into the FHIR bundle and composition (prefixed with "sdtc:") are also shown.</p>
#### CDA to FHIR Clinical Document Mapping Diagram
<table><tr><td><img width="80%" height="80%" src="HL7 CDA-FHIR Alignment - Image-Mapping.svg" /></td></tr></table>


### CDA mapping caveats
 - **Limitations on certain CDA document types**: The [FHIR DiagnosticReport Resource](https://hl7.org/fhir/R4/diagnosticreport.html) provides guidance around use of DiagnosticReport vs. Composition, stating that "if you have a highly structured report, then use DiagnosticReport" and "for more narrative driven reports ... the Composition resource would be more appropriate". As a result, highly structured CDA documents (e.g. a detailed operative report or a detailed imaging report) may be more appropriately mapped to the FHIR DiagnosticReport. Where one needs to treat a diagnostic report as a FHIR Clinical Document, one can add the Composition and conform with this IG, such that the DiagnosticReport becomes an entry from the first Composition in the FHIR Clinical Document bundle. "
 - **CDA recordTarget**: CDA recordTarget has cardinality 1..* whereas FHIR composition.subject has cardinality 0..1. To accommodate those cases where CDA has more than one recordTarget, this IG allows composition.subject to be a Group (which can then contain more than one patient).
 - **Composition required attributes not present in CDA**: Whereas CDA opted to not include a document status, Composition.status is a required field. In general, Composition.status will be "final", but see Special Topic [Clinical Document Succession Management](versioning.html) for a more detailed discussion.
 - **CDA NonXMLBody**: A CDA document with a nonXMLBody MAY be represented in FHIR using a DocumentReference that points to the information contained in the CDA's nonXMLBody. If the unstructured CDA document needs to be persisted as a “whole, authenticated document” (for example a previously digitally signed unstructured CDA document), it MAY be represented in FHIR using a DocumentReference that points to the complete CDA document.
 


