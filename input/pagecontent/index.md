### Background
Today there are more than 257 existing profiles on Bundle, and more than more than 180 existing profiles on Composition, many of which represent clinical documents, which take different approaches to representing the information and structures needed in a clinical document. The [HL7 Clinical Document Architecture (CDA) standard](https://hl7.org/cda/stds/online-navigation/2024May/index.html) has been widely implemented. CDA was created in 2005 with industry stakeholders to represent interoperable Clinical Documents. Universally, consistently represented, interoperable FHIR Clinical Documents are needed as the industry moves towards FHIR. FHIR stakeholders interested in exchanging Clinical Documents in FHIR intend to leverage the learnings and principles of CDA. 

This implementation guide defines a canonical representation of a clinical document in FHIR. It serves as a common universal starting point for those creating their own FHIR clinical document specifications, and supports CDA users who wish to migrate to a FHIR-based representation of clinical documents. This is a universal realm guide for use worldwide to facilitate consistency. 
  
### What is a FHIR Clinical Document?
A FHIR Clinical Document is a clinical document that conforms to this implementation guide. A clinical document is a documentation of clinical observations and services, with the following characteristics:
* **Persistence**– A clinical document continues to exist in an unaltered state, for a time period defined by local and regulatory requirements. Note: documents outlive the servers (and often the syntax) on which they are created.
* **Stewardship** – A clinical document is maintained by an organization entrusted with its care.
* **Potential for authentication** – A clinical document is an assemblage of information that is intended to be legally authenticated.
* **Context** – A clinical document establishes the default context for its contents.
* **Wholeness** – Authentication of a clinical document applies to the whole and does not apply to portions of the document without the full context of the document.
* **Human readability** – A clinical document is human readable.

From a technical perspective, a FHIR Clinical Document is a document Bundle containing a Composition and artifacts referred to by the Composition sections. The Composition is similar to an index, but also contains key header information. The FHIR Clinical Document IG derives from [core FHIR Documents guidance](https://hl7.org/fhir/R4/documents.html), adding further guidance and constraints. It is important to remember that the entire document Bundle is the FHIR Clinical Document, not just the Composition. 
  
### Human readability and rendering FHIR Clinical Documents
The requirement for human readability guarantees that a receiver of an arbitrary FHIR Clinical Document can algorithmically display the attested narrative content of the note on a standard Web browser. Specific requirements include: 

1. There must be a deterministic way for a recipient of an arbitrary FHIR Clinical Document to render the attested content. 
2. Human readability shall not require a sender to transmit a special style sheet along with a FHIR Clinical Document. It must be possible to render all FHIR Clinical Documents with a single style sheet and general-market display tools.
3. Human readability applies to the authenticated content. There may be additional information conveyed in the document that is there primarily for machine processing that is not authenticated and need not be rendered.

The approach taken in this IG derives from [FHIR core narrative guidance](https://hl7.org/fhir/R4/narrative.html) and stipulates:
* The FHIR Clinical Document creator
  * **SHALL** place attested narrative into Composition.title, Composition.text, Section.title, or Section.text. 
  * **SHOULD NOT** redundantly place attested narrative in both Composition.text and Section.text. 
  * **MAY** include narrative that is not derived from any structured data.
  * **MAY** include document metadata (e.g. patient) in Composition.text or Section.text.
* The FHIR Clinical Document recipient
  * **SHALL** include, at a minimum, Composition.title, Composition.text, Section.title, and Section.text in any rendition of the document. 
  * **MAY** render additional information, such as document metadata (e.g. patient).

In many cases, a recipient will render a document within the context of their EHR, where the EHR's banner bar will display information such as patient name and date of birth. Therefore this IG makes no recommendations for rendering outside of attested narrative. It is up to the document creator to determine which additional pieces of information to include in Composition.text or Section.text. For instance, this IG **DOES NOT** require that there be a patient name displayed with each contained observation, although a document creator may opt to include the patient name in Composition.text. Likewise, this IG **DOES** require the document recipient to render Composition.text and Section.text, but **DOES NOT** preclude the recipient from also rendering additional pieces of information. 

Possible security concerns and mitigations related to malicious narrative, particularly narrative that contains active content, are discussed [here](https://hl7.org/fhir/R4/security.html#narrative).

  
### Relationship to other FHIR document specifications
As noted above, a primary motivation for this IG is to present a canonical starting point for those creating their own FHIR clinical document specifications or for those CDA users who wish to migrate to a FHIR-based representation of clinical documents. That said, for the existing Bundle- and Composition-derive artifacts designed to support clinical documents, it is important to have a long-range reconciliation plan. 

The reconciliation plan suggested by this IG is:
* Detailed analysis of existing artifacts. For instance, we derive from FHIR Core and have borrowed from the [International Patient Summary IG](http://hl7.org/fhir/uv/ips/) and the [C-CDA on FHIR IG]( http://hl7.org/fhir/us/ccda/). This includes several extensions from the C-CDA on FHIR IG.
* Let this IG mature and gain implementation experience.
* Plan for artifacts to derive from this IG by FHIR R6. Preparation includes: (1) backport key FHIR R6 capabilities now so as to minimize impact on implementers; (2) propose deprecating the FHIR core [ClinicalDocument](https://hl7.org/fhir/R4/clinicaldocument.html) profile in FHIR R6; (3) work with artifact developers that derive from FHIR core [ClinicalDocument](https://hl7.org/fhir/R4/clinicaldocument.html) to ensure their requirements have been met.
