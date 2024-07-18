### FHIR Clinical Document Operations
[FHIR Operations](https://hl7.org/fhir/R4/operations.html) are a supplement to standard queries, and are used to fulfill a number of purposes, such as where the server needs to play an active role in formulating the content of the response, where the intended purpose is to cause side effects such as the creation of new resources, or where there are server-side expectations in response to a client request. 

**FHIR Clinical Document Operations**:
* [convert-to-transaction-bundle](OperationDefinition-convert-to-transaction-bundle.html): Convert a FHIR Clinical Document into a FHIR transaction bundle.

**FHIR Operations from CORE**:
* [StructureMap based Transform Operation](https://hl7.org/fhir/R4/structuremap-operation-transform.html)
	<p>Many clinical documents are represented as CDA and many legacy systems will likely continue to produce CDA. It will be useful for FHIR servers to offer a means of transforming CDA to FHIR Clinical Documents in order for the server to consume them. The StructureMap Transform Operation offers a standard endpoint for this operation. As part of the input FHIR StructureMaps can be provided.</p>

	<blockquote class="stu-note">The following is a list of resources, including FHIR StructureMaps:  </blockquote>
	
	<ul>
		<li><a href="https://hl7.org/fhir/R5/structuremap.html">R5 StructureMap resource</a></li>
		<li><a href="https://hl7.org/fhir/R5/mapping-language.html">The FHIR Mapping Language (FML) page</a> (this is R5 which does have some advances on the R4 version)</li>
		<li><a href="https://hl7.org/fhir/R5/mapping-tutorial.html">The FHIR spec FML tutorial, written by Oliver Egger</a></li>
		<li><a href="https://github.com/ahdis/fhir-mapping-tutorial">Corresponding GitHub repo to use as a basis for experimentation</a></li>
		<li><a href="https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Mapping+Language">HL7 International confluence page on FML</a></li>
		<li>The Swiss matchbox server (c/o Oliver Egger et al)
			<ul>
				<li><a href="https://www.matchbox.health/">Home page</a></li>
				<li><a href="https://test.ahdis.ch/matchbox/fhir">Public test server endpoint</a></li>
			</ul>
		</li>
		<li>HL7 Switzerland IG cda-fhir-maps:
			<ul>
				<li><a href="https://github.com/hl7ch/cda-fhir-maps">GitHub repository</a></li>
				<li><a href="https://github.com/hl7ch/cda-fhir-maps/blob/master/input/maps/BundleToCda.map">Example FHIR-to-CDA FML file</a></li>
				<li><a href="https://github.com/hl7ch/cda-fhir-maps/blob/master/input/maps/FHIRtoCDATypes.map">FHIR to CDA datatype mapping FML file</a></li>
				<li><a href="https://github.com/hl7ch/cda-fhir-maps/blob/master/fhirtocda.http">Example REST requests to matchbox server using the above FML file</a></li>
			</ul>
		</li>
	</ul>
<p></p>
* [$document Core Operation](https://hl7.org/fhir/R4/composition-operation-document.html)
	<p>The $document Core Operation provides a means for a client to request a FHIR Document based on a Composition. It is suggested that a server may wish to emulate this behavior but using an operation that delivers a FHIR Clinical Document conformant to the profile in this guide (and possibly guidance from a use case specific IG). The specific Operation should be named appropriately.</p>

**FHIR Operation experimental examples**:
* [$summary from the International Patient Summary (IPS) IG](https://build.fhir.org/ig/HL7/fhir-ips/OperationDefinition-summary.html)
<p>The Operation provides a means to invoke the creation of a specific FHIR Clinical Document conformant to the IPS IG. Note: the current link is from build - this will be updated post-ballot.</p>