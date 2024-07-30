<blockquote class="note-to-balloters">
Structured Documents committee will more fully consider FHIR R6 Composition revisions based on the result of balloting this IG. 
Accordingly, it is the intent of the HL7 Structured Documents WG that this IG replace the current FHIR R4 and R5 Core Clinical Document guidance.
</blockquote>

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
[FHIR core narrative guidance](https://hl7.org/fhir/R4/narrative.html) stipulates that a resource's narrative "SHALL reflect all content needed for a human to understand the essential clinical and business information for the resource". In addition, to ensure the unambiguous communication of a clinical document's attested narrative, this IG requires that:

1. There must be a deterministic method by which a recipient of an arbitrary FHIR Clinical Document can display the narrative content of the note on a standard Web browser. 
2. Human readability shall not require a sender to transmit a special style sheet along with a FHIR Clinical Document. It must be possible to render all FHIR Clinical Documents with a single style sheet and general-market display tools.
3. Human readability applies to the authenticated content. There may be additional information conveyed in the document that is there primarily for machine processing that is not authenticated and need not be rendered.

Clinical document metadata (e.g. patient name and date of birth, participating providers) may also need to be rendered, with the caveat as stated in the [Consolidated CDA Templates for Clinical Notes](https://www.hl7.org/ccdasearch/pdfs/CCDA_Volume_One.pdf) standard, "Metadata carried in the header may already be available for rendering from EHRs or other sources external to the document. An example of this would be a doctor using an EHR that already contains the patient’s name, date of birth, current address, and phone number. When a CDA document is rendered within that EHR, those pieces of information may not need to be displayed since they are already known and displayed within the EHR’s user interface".

The Composition resource is special in that it can convey narrative in both Composition.text and Composition.section.text. This IG recommends that document metadata be conveyed in Composition.text whereas attested narrative be conveyed in Composition.section.text. Furthermore, while the document recipient must be able to render the contents of Composition.section.text, they can optionally render Composition.text or choose to ignore Composition.text particularly where they are capable of parsing the structured Composition fields. To summarize: 

* The FHIR Clinical Document creator
  * **SHALL** place attested narrative into Composition.section.text.
  * **SHOULD NOT** redundantly place attested narrative in both Composition.text and Composition.section.text. 
  * **MAY** include narrative that is not derived from any structured data.
  * **SHOULD** include document metadata (e.g. patient) in Composition.text.
  * **MAY** include a list of document sections in Composition.text
* The FHIR Clinical Document recipient
  * **SHALL** include, at a minimum, Composition.title, Composition.section.title and Composition.section.text in any rendition of the document. 
  * **MAY** include Composition.text in a rendition of the document.
  * **MAY** render additional document information (such as patient name and date of birth) derived from structured Composition fields.

These rules apply even for other narrative type fields (e.g. FHIR R5 Composition.note, FHIR 'note' extension). 

Good practice recommends that the following be present whenever the document is viewed: Document title and document dates; Service and encounter types, and date ranges as appropriate; Names of all persons along with their roles, participations, participation date ranges, identifiers, address, and telecommunications information; Names of selected organizations along with their roles, participations, participation date ranges, identifiers, address, and telecommunications information; Date of birth for subject(s); Patient identifying information.

Possible security concerns and mitigations related to malicious narrative, particularly narrative that contains active content, are discussed [here](https://hl7.org/fhir/R4/security.html#narrative).

  
### Relationship to other FHIR document specifications
As noted above, a primary motivation for this IG is to present a canonical starting point for those creating their own FHIR clinical document specifications or for those CDA users who wish to migrate to a FHIR-based representation of clinical documents. That said, for the existing Bundle- and Composition-derived artifacts designed to support clinical documents, it is important to have a long-range reconciliation plan. 

The reconciliation plan suggested by this IG is:
* Detailed analysis of existing artifacts. For instance, we derive from FHIR Core and have borrowed from the [International Patient Summary IG](http://hl7.org/fhir/uv/ips/) and the [C-CDA on FHIR IG]( http://hl7.org/fhir/us/ccda/). This includes several extensions from the C-CDA on FHIR IG.
* Let this IG mature and gain implementation experience.
* Plan for artifacts to derive from this IG by FHIR R6. Preparation includes: (1) backport key FHIR R6 capabilities now so as to minimize impact on implementers; (2) propose deprecating the FHIR core [ClinicalDocument](https://hl7.org/fhir/R4/clinicaldocument.html) profile in FHIR R6; (3) work with artifact developers that derive from FHIR core [ClinicalDocument](https://hl7.org/fhir/R4/clinicaldocument.html) to ensure their requirements have been met; (4) Propose revisions to FHIR R6 Composition that subsume Composition extensions in this IG (such as adding Composition.participant, adding Composition.basedOn, adding Composition.partOf). 

### Contact information
Please contact the HL7 Structured Documents WG with any questions, or the following IG developers about the content in this IG:
Bob Dolin - bdolin@elimu.org
Bret Heale - bheale@humanizedhealthconsulting.com
