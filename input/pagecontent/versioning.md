
### Clinical document succession management
A FHIR Clinical Document can be replaced by a new document. (Clinical documents that provide a summary snapshop of a patient's record generally do not version. Rather, each document is a valid document with the specific date/time it was generated. For example, if one were to generate a summary document for a patient every day for 5 days in a row, that patient would have 5 active FHIR Clinical Documents. However even in the summary document scenario, it is possible to use document succession management where needed to fix an error in a generated snapshot). 

#### Using the resource identifier to enable revision semantics
Revision semantics are those structured fields that enable a recipient to determine if a received resource has or has not been previously received so that they can take appropriate steps to add or update the resource in their server. While this IG is focused on clinical documents, as described in [Immutable and parseable clinical documents](immutableParseable.html), the need for revision semantics can also apply to those resources contained in a clinical document, such as where a revised document is received, and the recipient wishes to update individual component resources on their server. 

This IG recommends (and in some cases requires) the use of persistent resource identifiers (.identifier) as a means of enabling revision semantics. Resource IDs (.id) and resource meta (.meta) information is generally local to a specific server, whereas resource identifiers can serve as stable business identifiers that persist across servers. Recipient systems can only be confident about matching records and preventing downstream duplication if record identifiers are persistent across different documents for the same records.

While out of scope for this IG, good practice suggests that where revision scenarios are possible, those resources subject to revision SHOULD carry a persistent resource identifier (.identifier). 


#### Clinical document replacement
A replacement document is a new version of a document. The replaced document is considered superseded, but a system may retain it for historical or auditing purposes. The replacement document references the replaced document via the replacement document's Composition.relatesTo, where relatesTo.code is 'replaces' and the target of relatesTo.targetIdentifier is the replaced document's Bundle.identifier. Both The replacement and original document statuses are 'final'. 

Additional notes:
* Bundle.identifier is a required element, representing the globally unique FHIR Clinical Document identifier. Composition.identifier and Composition.version are optional fields than can redundantly be used to track document succession. Composition.identifier can be used to identify a family of FHIR compositions (e.g. an original clinical document and a replacement of that clinical document share the same Composition.identifier), using the Composition.date to chronologically order the compositions. 
* In retrieving replaced versions of a FHIR Clinical Document, one can search for Bundles that contain a Composition with a specific identifier. While Composition.identifier is optional, if populated, such a search returns all the versions resident on a server. The version history can then be reconstructed using the mentioned fields of Composition.relatesTo and the composition creation time and/or version number. Typically, however, one will expect to have the latest (or most current) version returned.
* Resource.id and resource.meta fields enable resource succession management within a single server. Values may be auto-assigned by a server, and values for a given instance are not guaranteed to be the same across servers, making these fields not suitable for succession exchange semantics. It is important to remember that the Composition.identifier and Bundle.identifier are not equivalent to the Resource.id. The identifiers are business identifiers and include the system where the business identifier was created. 

<p>The FHIR Clinical Document <b>replaces</b> scenario is illustrated in the following figure.</p>
##### Replacement Diagram
<table><tr><td><img width="75%" height="75%" src="HL7 CDA-FHIR Alignment - ImagesReplace.svg" /></td></tr></table>  


#### Other succession management scenarios
An addendum is a separate document that references another document, and may extend or alter the observations in the referenced document. The referenced document remains active, and the addendum and its related document are both read by report recipients. The addendum document references the document being appended via the addendum document's Composition.relatesTo, where relatesTo.code is 'appends' and the target of relatesTo.targetIdentifier is the appended document's Bundle.identifier. Both The addendum and original document statuses are 'final'. 

<blockquote class="stu-note">
We are seeking input on the need to persist the 'addendum' use case. Our understanding is that while the 'replacement' use case has seen some industry traction, the 'addendum' use case has not. Rather than issuing addenda, implementations are issuing full replacements. This is in part because a document sender may not know whether or not the recipient has access to the document being appended.
</blockquote>

Where a document has been issued in error (e.g. wrong patient), the original document can be replaced with an empty document that has a status of 'entered-in-error'.    

<blockquote class="stu-note">
We are seeking input on the 'issued-in-error' use case. Our understanding is that this use case is relatively new, and has not (yet?) gained industry traction. We are interested in hearing about FHIR-based solutions others have used to meet this requirement.
</blockquote>

<p>The FHIR Clinical Document <b>appends</b> and <b>entered-in-error</b> scenarios are illustrated in the following figure.</p>
##### Appends or Entered-in-error Diagram
<p><img width="75%" height="75%" src="HL7 CDA-FHIR Alignment - ImagesAppend.svg" /></p>

