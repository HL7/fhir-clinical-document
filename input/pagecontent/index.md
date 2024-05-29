# Background
Today there are more than 257 existing profiles on Bundle, and more than more than 180 existing profiles on Composition, many of which represent clinical documents, which take different approaches to representing the information and structures needed in a clinical document. The [HL7 Clinical Document Architecture (CDA) standard](https://hl7.org/cda/stds/online-navigation/2024May/index.html) has been widely implemented. CDA was created in 2005 with industry stakeholders to represent interoperable Clinical Documents. Universally, consistently represented, interoperable FHIR Clinical Documents are needed as the industry moves towards FHIR. FHIR stakeholders interested in exchanging Clinical Documents in FHIR intend to leverage the learnings and principles of CDA. 

This implementation guide defines a canonical representation of a clinical document in FHIR. It serves as a common universal starting point for those creating their own FHIR clinical document specifications, and supports CDA users who wish to migrate to a FHIR-based representation of clinical documents. This is a universal realm guide for use worldwide to facilitate consistency. 
  
# What is a FHIR Clinical Document?
A FHIR Clinical Document is a clinical document that conforms to this implementation guide. A clinical document is a documentation of clinical observations and services, with the following characteristics:
* **Persistence**– A clinical document continues to exist in an unaltered state, for a time period defined by local and regulatory requirements. Note: documents outlive the servers (and often the syntax) on which they are created.
* **Stewardship** – A clinical document is maintained by an organization entrusted with its care.
* **Potential for authentication** – A clinical document is an assemblage of information that is intended to be legally authenticated.
* **Context** – A clinical document establishes the default context for its contents.
* **Wholeness** – Authentication of a clinical document applies to the whole and does not apply to portions of the document without the full context of the document.
* **Human readability** – A clinical document is human readable.

From a technical perspective, a FHIR Clinical Document is a document Bundle containing a Composition and artifacts referred to by the Composition sections. The Composition is similar to an index, but also contains key header information. The FHIR Clinical Document IG derives from [core FHIR Documents guidance](https://hl7.org/fhir/R4/documents.html), adding further guidance and constraints. It is important to remember that the entire document Bundle is the FHIR Clinical Document, not just the Composition. 
  
# Human readability and rendering FHIR Clinical Documents
The requirement for human readability guarantees that a receiver of a FHIR Clinical Document can algorithmically display the clinical content of the note on a standard Web browser. Specific requirements include: 

1. There must be a deterministic way for a recipient of an arbitrary FHIR Clinical Document to render the attested content. 
2. Human readability shall not require a sender to transmit a special style sheet along with a FHIR Clinical Document. It must be possible to render all FHIR Clinical Documents with a single style sheet and general-market display tools.
3. Human readability applies to the authenticated content. There may be additional information conveyed in the document that is there primarily for machine processing that is not authenticated and need not be rendered.

These principles and requirements have led to the required approach described in this IG, where the material to be rendered is placed into the composition's text and section.text field.
 <blockquote class="stu-note">
    <p>Needs review</p>
  </blockquote>
  
# Note
We have borrowed from FHIR Core, the [International Patient Summary IG](http://hl7.org/fhir/uv/ips/) and the [C-CDA on FHIR IG]( http://hl7.org/fhir/us/ccda/). This includes several extensions from the C-CDA on FHIR IG.
The CDA requirement for human readability guarantees that a receiver of a CDA document can algorithmically display the clinical content of the note on a standard Web browser. CDA, Release Two, with its blend of narrative and CDA entries, presents new challenges to this requirement.