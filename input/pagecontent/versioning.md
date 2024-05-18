## Clinical document succession management
FHIR Clinical Document succession management enables unambiguous document management as clinical documents are revised and/or appended over time.  

While within a FHIR server, the resource.id and resource.meta fields enable resource succession management, it can also be necessary to communicate revisions to external recipients. Resource.id and resource.meta are generally not useful for such communication because they are server-specific. Instead, **Bundle.identifier**, **Bundle.timestamp**, **Composition.identifier**, **Composition.version**, **Composition.date**, and **Composition.relatesTo** are used.

The single globally unique shareable identifier for a FHIR Clinical Document is Bundle.identifer, where Bundle.timestamp indicates the bundle assembly time. Composition.identifier can optionally be used to identify a family of FHIR compositions (e.g. an original clinical document and a replacement of that clinical document share the same Composition.identifier), using the Composition.version to chronologically order the compositions. 

Where a FHIR Clinical Document is replaced by a new FHIR Clinical Document, the replacement document receives a new Bundle.identifier and Bundle.timestamp, optionally the new bundle's composition retains the same Composition.identifier and increments Composition.version. Composition.relatesTo points to a specific prior version of the document. This is illustrated in the following figure. It should be noted that Composition.identifier and Composition.version are optional, and that Composition.relatesTo provides sufficient semantics to link a replacement document to an original document. 

As an example outside of the purely document context, with Observation Resource the identifier, status and timestamp are useful for tracking changes to the Observation. The Observation.identifier field holds a business identifier, and this can be repeated in multiple instances. Thus, the history of the Observation can be determined. 

Additionally, in retrieving the history of a Clinical Document the current paradigm requires a search for Bundles that contain a Composition with a specific identifier. Such a search returns all the versions resident on a server. The version history can then be reconstructed using the mentioned fields of Composition.reltateTo and the composition creation time. Typically, however, one will expect to have the latest (or most current) version returned.

It is important to remember that the Composition.identifier and Bundle.identifier are not equivalent to the Resource.id. The identifiers are business identifiers and include the system where the business identifier was created. The Resource.id is not guaranteed to stay the same between servers.

<img src="documentReplacement.png"/>


