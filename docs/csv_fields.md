# Migration to CSV Fields

## URL Rewriting Considerations
`http://lehman.cul.columbia.edu/ldpd_leh_0009_0043` was the citation URL
`http://lehman.cul.columbia.edu/lehman/document_id=ldpd_leh_0009_0043?...` is the result from browsing


## Sample Legacy Solr Doc

```xml
   <doc>
      <field name="subseries">Correspondence</field>
      <field name="document_id">ldpd_leh_0001_0001</field>
      <field name="folder_num">1</field>
      <field name="file_unittitle">Abrams, Charles</field>
      <field name="genreform1">letter</field>
      <field name="unitdate_iso">1951-04-24T23:59:59Z</field>
      <field name="file_unitdate">1951-04-24</field>
      <field name="file_unitdate_display">1951 April 24</field>
      <field name="pages">1</field>
      <field name="pdf">ldpd_leh_0001_0001.pdf</field>
      <field name="ocr">April 34, 1951Mr. Hhnrlea
Liberal Party
JJ35 Broadway
Key York, Hew tork
Ac you knoy the  l i n i n g aM Cinarr^mqy Costs! tteea of
the Hcmea sad ftCMwiW h&amp;ve be^im to five MttffiteftoHMi to &amp;©nr
rent control lagtg&amp;fttto fta part of the &quot;hole body of net*
legislation to W esoneidered in connection 'fith onr raatsili-
&quot;an and defonae effort.
One of the &lt;|i»Rtion« that is certain to ^rioe in
eonnneti'm vith this l#gtcS.atl0t in the q*»ttt«H of tb®
applicability of the n®w Federr-l rent control le^ielption to
York Miitoi  I t  i s «jj&gt;©et0fl th^t this new rent contro''
tlS &quot;b® a part of th# T)efbns«? Production Act
willi like the  r e s t of the &amp;·£·*·* prortURtlon legislation
Ije ge^rud to the ©3dBt@ned of the present Bmrgeney. Thb
general thinking  i s thai the eontrols will &quot;be ©xnyei
in r®m wtmm there «M  s h o r t i e s of hmmin&amp; directly or
indirectly eoimeeted wiUl the defense and ssa'bilit-tion effort.
The quof tlon is &lt;*tottlwr th© authority proposed to he
invented in tha -
:
&quot;3to&lt;5utiv© Branch of th© Federal government
shcnald Include Het^ ^ork ne far as rent control if concerned
fork already ha® it® ·*· rent eontml
consideration*
on the  f i t t e r ,
decision  i s
in thio
are &quot;aany ^%nglee an^ aspeetc to b© taloen into
I should certainly life® to have your judgnsent
hich Mould aesiat M in ©v^lufitin^;
&quot;by the Senate Banking and Cijrrancy
Tours very
</field>
   </doc>
```

## Constant Values

```xml
      <field name="subseries">Correspondence</field>
```

`http://vocab.getty.edu/aat/300026877`

## Redundant Fields for CSV
`file_unitdate`
`file_unitdate_display`

Verified no unitdate_iso value that does not begin with file_unitdate value (except undated)
Verified that these are all the fields
Verified that no legacy fields have multiple values

## Fields to be relocated
`ocr`
`pdf`

## Basic mapping

<table>
  <tr><th>Legacy Solr</th><th>Pseudo-Hyacinth</th></tr>
  <tr><td>subseries</td><td>genre</td></tr>
  <tr><td>document_id</td><td>identifier</td></tr>
  <tr><td>folder_num</td><td>folder_num</td></tr>
  <tr><td>file_unittitle</td><td>name/name_term</td></tr>
  <tr><td>genreform1</td><td>physicalDescription/form</td></tr>
  <tr><td>unitdate_iso</td><td>creation date</td></tr>
  <tr><td>pages</td><td>extent</td></tr>
</table>

## Controlled Values

### Form
<table>
  <tr><th>Legacy Solr</th><th>Getty?</th><th>Uri Service?</th></tr>
  <tr><td>administrative record</td><td>http://vocab.getty.edu/aat/300027425</td><td>Y</td></tr>
  <tr><td>certificate</td><td>http://vocab.getty.edu/aat/300026841</td><td>N</td></tr>
  <tr><td>chart</td><td>http://vocab.getty.edu/aat/300026848</td><td>?</td></tr>
  <tr><td>clipping</td><td>http://id.loc.gov/vocabulary/graphicMaterials/tgm003279</td><td>Y*</td></tr>
  <tr><td>envelope</td><td>http://vocab.getty.edu/aat/300197601</td><td>N</td></tr>
  <tr><td>ephemera</td><td>http://vocab.getty.edu/aat/300028881</td><td>Y</td></tr>
  <tr><td>invitation</td><td>http://vocab.getty.edu/aat/300027083</td><td>N</td></tr>
  <tr><td>letter</td><td>http://vocab.getty.edu/aat/300026879</td><td>N</td></tr>
  <tr><td>manuscript</td><td>http://vocab.getty.edu/aat/300028569</td><td>N*</td></tr>
  <tr><td>memorandum</td><td>http://vocab.getty.edu/aat/300026906</td><td>N</td></tr>
  <tr><td>note</td><td>http://vocab.getty.edu/aat/300027200</td><td>N</td></tr>
  <tr><td>pamphlet</td><td>http://vocab.getty.edu/aat/300220572</td><td>Y</td></tr>
  <tr><td>photograph</td><td>http://vocab.getty.edu/aat/300046300</td><td>Y</td></tr>
  <tr><td>press release</td><td>http://vocab.getty.edu/aat/300026437</td><td>N</td></tr>
  <tr><td>speech</td><td>http://vocab.getty.edu/aat/300026671</td><td>N</td></tr>
  <tr><td>telegram</td><td>http://vocab.getty.edu/aat/300026909</td><td>N</td></tr>
</table>

### Name (988 Correspondents)
see `data/names.xml`,`data/individuals.csv`,`data/houesholds.csv`
1892-1982


