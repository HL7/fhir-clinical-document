
### STU 1.1 - STU update to support US Patient Clinical Summary

This STU update is focused on increasing the flexibility of the [FHIR Clinical Document Composition Profile](StructureDefinition-clinical-document-composition.html), specifically to support the [United States Patient Clinical Summary](http://hl7.org/fhir/us/pcs/ImplementationGuide/hl7.fhir.us.pcs), which requires additional flexibility to better align with the [FHIR International Patient Summary](http://hl7.org/fhir/uv/ips/ImplementationGuide/hl7.fhir.uv.ips).
Specific changes to the profile are listed below:


<style>
table {
  border: 1;
}
tr {
  background-color: #DCDCDC;
}
</style>

| Element | Change |
| --- | --- |
| Composition.language | Removed MS Flag |
| Composition.extension:R5-Composition-version | Removed MS Flag |
| Composition.extension:data-enterer | Removed MS Flag |
| Composition.extension:informant | Removed MS Flag |
| Composition.extension:information-recipient | Removed MS Flag |
| Composition.extension:consent | Removed MS Flag |
| Composition.extension:basedOn | Removed MS Flag |
| Composition.extension:change-made | Removed MS Flag |
| Composition.modifierExtension:R5-Composition-status | Removed MS Flag, corrected location to Composition.status, and corrected inclusion from modifierExtension to extension |
| Composition.identifier | Removed MS Flag |
| Composition.status | Upgraded to MS since cardinality in base Composition resource is 1..1 |
| Composition.category | Removed MS Flag and adjusted cardinality to 0..* |
| Composition.category:clinicalnotecategory | Removed MS Flag and adjusted cardinality to 0..1 |
| Composition.attester | Removed MS Flag |
| Composition.attester.mode | Removed MS Flag |
| Composition.attester.time | Removed MS Flag |
| Composition.attester.party | Removed MS Flag |
| Composition.attester:legal_attester | Removed MS Flag |
| Composition.attester:professional_attester | Removed MS Flag |
| Composition.relatesTo | Removed MS Flag |
| Composition.relatesTo:replaced_document | Removed MS Flag |
| Composition.relatesTo:appended_document | Removed MS Flag |
| Composition.section.extension:change-made | Removed MS Flag |

### STU 1.0.1 - Technical Correction

#### Jira Tickets

<table border="1">
  <thead>
    <tr style="background-color:#DCDCDC">
      <th style="text-align: center; vertical-align: middle;">Jira Ticket</th>
      <th style="text-align: center; vertical-align: middle;">Change Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href="https://jira.hl7.org/browse/FHIR-53879">FHIR-53879</a>
      </td>
      <td>FHIR Clinical Document Composition Profile: Composition.category slicing fix</td>
    </tr>
    <tr>
      <td>
        <a href="https://jira.hl7.org/browse/FHIR-47246">FHIR-47246</a>
      </td>
      <td>Remove Addendum from opening sentence</td>
    </tr>
  </tbody>
</table>
