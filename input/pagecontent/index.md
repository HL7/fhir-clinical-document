# FHIR Clinical Documents - Introduction/Scope
This implementation guide defines a canonical representation of a clinical document in FHIR. It serves as a common universal starting point for those creating their own FHIR clinical document specifications, and supports users of the HL7 Clinical Document Architecture who wish to migrate to a FHIR-based representation of clinical documents.

The FHIR Clinical Documents IG derives from <a href="https://hl7.org/fhir/R4/documents.html">core FHIR Documents guidance</a>, adding further guidance and constraints. 

# Background
Today there are more than 257 existing profiles on Bundle, and more than more than 180 existing profiles on Composition, many of which represent clinical documents, which take different approaches to representing the information and structures needed in a clinical document. Clinical Document Architecture (CDA), the underlying standard for Consolidated CDA (C-CDA) has been widely implemented (more than 600,000,000 per month in just one interoperability network in the US). CDA was created in 2005 with industry stakeholders to represent interoperable Clinical Documents. Universally, consistently represented, interoperable FHIR Clinical Documents are needed as the industry moves towards FHIR. FHIR stakeholders interested in exchanging Clinical Document in FHIR intend to leverage the learnings and principles of CDA. This track will test drafts of the profiles that have been developed in an Implementation Guide to be balloted in September of 2024. This will be a universal realm guide for use worldwide to facilitate consistency.

At a high level, a FHIR Clinical Document is a document Bundle containing a Composition and artifacts referred to by the Composition sections. The Composition is similar to an index, but also contains key header information. It is important to remember that the entire document Bundle is the FHIR Clinical Document, not just the Composition. 

# How to Read this guide
