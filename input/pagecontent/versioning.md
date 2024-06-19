## Clinical document succession management
A FHIR Clinical Document can be replaced by a new document and/or appended with an addendum document. (Clinical documents that provide a summary snapshop of a patient's record generally do not version. Rather, each document is a valid document with the specific date/time it was generated. For example, if one were to generate a summary document for a patient every day for 5 days in a row, that patient would have 5 active FHIR Clinical Documents. However even in the summary document scenario, it is possible to use document succession management where needed to fix an error in a generated snapshot). 

A replacement document is a new version of a document. The replaced document is considered superseded, but a system may retain it for historical or auditing purposes. The replacement document references the replaced document via the replacement document's Composition.relatesTo, where relatesTo.code is 'replaces' and the target of relatesTo.targetIdentifier is the replaced document's Bundle.identifier. The replacement document's status is set to 'amended' while the original document's status remains 'final'. 

An addendum is a separate document that references another document, and may extend or alter the observations in the referenced document. The referenced document remains active, and the addendum and its related document are both read by report recipients. The addendum document references the document being appended via the addendum document's Composition.relatesTo, where relatesTo.code is 'appends' and the target of relatesTo.targetIdentifier is the appended document's Bundle.identifier. Both The addendum and original document statuses are 'final'. 

<blockquote class="stu-note">
We are seeking input on the need to persist the 'addendum' use case. Our understanding is that while the 'replacement' use case has seen some industry traction, the 'addendum' use case has not. Rather than issuing addenda, implementations are issuing full replacements. 
</blockquote>

Where a document has been issued in error (e.g. wrong patient), the original document can be replaced with an empty document that has a status of 'entered-in-error'.    

<blockquote class="stu-note">
We are seeking input on the 'issued-in-error' use case. Our understanding is that this use case is relatively new, and has not (yet?) gained industry traction. We are interested in hearing about FHIR-based solutions others have used to meet this requirement.
</blockquote>

Additional notes:
* Bundle.identifier is a required element, representing the globally unique FHIR Clinical Document identifier. Composition.identifier and Composition.version are optional fields than can redundantly be used to track document succession. Composition.identifier can be used to identify a family of FHIR compositions (e.g. an original clinical document and a replacement of that clinical document share the same Composition.identifier), using the Composition.date to chronologically order the compositions. 
* In retrieving replaced versions of a FHIR Clinical Document, one can search for Bundles that contain a Composition with a specific identifier. While Composition.identifier is optional, if populated, such a search returns all the versions resident on a server. The version history can then be reconstructed using the mentioned fields of Composition.relatesTo and the composition creation time and/or version number. Typically, however, one will expect to have the latest (or most current) version returned.
* Resource.id and resource.meta fields enable resource succession management within a single server. Values may be auto-assigned by a server, and values for a given instance are not guaranteed to be the same across servers, making these fields not suitable for succession exchange semantics. It is important to remember that the Composition.identifier and Bundle.identifier are not equivalent to the Resource.id. The identifiers are business identifiers and include the system where the business identifier was created. 

<p>FHIR Clinical Document <b>replaces</b> and <b>appends</b> scenarios are illustrated in the following figures.</p>


<img width="95%" height="95%" src="succession_management.png" />