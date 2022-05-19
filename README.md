# MedGen
Organizes information related to human medical genetics, such as attributes of conditions with a genetic contribution.

# README.txt
==========
README file for MedGen ftp://ftp.ncbi.nlm.nih.gov/pub/medgen/

Last updated: November 15, 2019

  There are multiple files maintained by NCBI that are related to medical genetics.
This README summarizes files available by ftp not only in the medgen path, but also
on other paths.

  Note that MedGen anchors information to the value known as CUI, so most of these 
reports include the defining CUI. When the value of CUI is the letter C followed by integers,
the value corresponds to a record from Unified Medical Language System (UMLS). When the value
of CUI are the letters CN followed by integers, the value was created by NCBI,
because a corresponding concept from UMLs was not identified.

  The web site also reports a UID. The file that maps CUI to the UID reported on the web page
is MedGen_UID_CUI_history.txt.


  This file has two major sections.
    First is a description, by path, of the files and their contents/
	 Second are some suggestions about how the files can be used to extract data for
selected uses.


*************************Summary of files***************************************

MedGen
======
  Files in the medgen directory are updated weekly, on Wednesdays.
  Each .RFF file is structured according to the following conventions:

 * A vertical bar (|) is used as delimiter
 * The first line in each file begins with a hash (#) and provides the column names.

  When appropriate, names of the columns are consistent with those used by UMLS. Many of
the values come from UMLS as well (fields with names in lower case have no counterpart in UMLS).
  These documents also provide more information about the terms used by UMLS in its data files
  (https://www.nlm.nih.gov/research/umls/knowledge_sources/metathesaurus/release/abbreviations.html,
  https://www.ncbi.nlm.nih.gov/books/NBK9676/,
  https://www.ncbi.nlm.nih.gov/books/NBK9685/) 
  Note that UMLS names its files starting with MR; MedGen names the corresponding files starting with MG.

  Files with a .gz suffix have been compressed using 'gzip'. To read these files, save
the .gz file locally and then extract the file using the software of your choice.


File: HPO_CUI_history.txt
-------------------------
 History of mappings between Human Phenotype Ontology (HPO) and concept identifiers (CUI) used
in MedGen. 

 * HPO_Id:     HPO identifier
 * CUI:        the concept unique identifier 
 * Date:       Date change was made
 * IsCurrent:  Indicates the status of the HPO-CUI mapping; 1 means HPO-CUI mapping is current, 0 means mapping is obsolete


File: MERGED.RRF.gz
-------------------
Pairs of concept identifiers (CUI) that have been merged.

 * CUI: 		concept unique identifier that has been replaced
 * to CUI:	current concept identifier


File: MGCONSO.RRF.gz
--------------------
Summary data for each concept identifier.
See related: https://www.ncbi.nlm.nih.gov/books/NBK9685/table/ch03.T.concept_names_and_sources_file_mr/?report=objectonly

 * CUI: 	    concept unique identifier
 * TS: 	    term status:
             P:   preferred LUI (unique identifier for term i.e. lexically similar strings)
             S:   non-preferred LUI
 * STT: 	    string type:
             PF:  preferred form of term
             VCW: variant of the preferred form differing in case and word order
             VC:  variant of the preferred form differing in case
             VO:  variant of the preferred form
             VW:  variant of the preferred form different in word order
 * ISPREF: 	 Is this term preferred in the set of terms from the source? (Y/N)
 * AUI: 	    unique identifier for an atom, where an atom is one term from a source
 * SAUI: 	 source-asserted atom unique identifier, i.e. the source's identifier for
             one term. Often null.
 * SCUI: 	 source-asserted concept unique identifier, i.e. the source's identifier
             for a concept that may include multiple terms from the source
 * SDUI: 	 source-asserted descriptor unique identifier
 * SAB: 	    abbreviation for the source of the term (Defined in MedGen_Sources.txt)
 * TTY: 	    type of term as defined by the source
             the abbreviations are equivalent to those used by UMLS, namely
             https://www.nlm.nih.gov/research/umls/knowledge_sources/metathesaurus/release/abbreviations.html
				 The most common are:
				 ACR:  Acronym
				 CE:   Entry term for a supplemental concept (MeSH)
				 ET:   Entry term (MeSH)
				 NM:   Name of supplementary concept (MeSH)
				 PCE:  Preferred entry term for Supplementary Concept (MeSH)
		       PM:   Machine permutation
             PT:   Designated preferred term
				 PTCS: Preferred Clinical Synopsis (OMIM)
				 SY:   Designated synonym
				 SYN:  Designated alias
 * CODE:   	 unique identifier or code for the term provided by the source
 * STR: 	    string, i.e. the term value
 * SUPPRESS: suppressed by UMLS curators (no reason is reported)


File: MGDEF.RFF.gz
------------------
Summary data for definitions and sources of concepts.

 * CUI: 	    concept unique identifier
 * DEF: 	    concept definition. Please see NOTE below
 * source: 	 source of the definition
 * SUPPRESS: suppressed by UMLS curators  (no reason is reported)

*NOTE* : Please note that some values in the DEF column contain internal line feeds. The line separator for RRF files is '|\n'. The line separator within the DEF column of MGDEF.RRF is '\r', CR (Carriage return, '\r', 0x0D, 13 in decimal). Unix/Linux and windows tool sometimes behave differently on these formats. If this format is problematic for you, consider use of the comma-separated value (csv) files in the csv subdirectory.


File: MGREL.RRF.gz
------------------
Summary data for pairwise relationship between concepts.
 
 * CUI1:   	 first concept unique identifier
 * AUI1:   	 first atom unique identifier, where an atom is one term from a source
 * STYPE1: 	 the name of the column in MRCONSO.RRF that contains the first identifier to which the relationship is attached
 * REL: 	    relationship label
             values are defined by UMLS
				 https://www.nlm.nih.gov/research/umls/knowledge_sources/metathesaurus/release/abbreviations.html#REL
				 CHD:  has a child relationship
				 PAR:  has a parent relationship
 * CUI2: 	 second concept unique identifier
 * AUI2:	    second atom unique identifier, where an atom is one term from a source
 * RELA:   	 additional relationship label
             use with REL
				 RO/has_manifestation:  used to match disorders and clinical features
				 RO/manifestation_of;   used to match clinical features and disorders
 * RUI: 	    relationship unique identifier  (identifier for this row in the MGREL table)
 * SAB: 	    abbreviation for the source of the term (defined in MedGen_Sources.txt)
 * SL: 	    source of relationship label
 * SUPPRESS: suppressed by UMLS curators   (no reason is reported)


File: MGSAT.RRF.gz
-------------------
Summary data for concepts' attributes.
See also: https://www.ncbi.nlm.nih.gov/books/NBK9685/table/ch03.T.simple_concept_and_atom_attribute/?report=objectonly

 * CUI: 	    concept unique identifier
 * METAUI: 	 UMLS Metathesaurus asserted unique identifier
 * STYPE: 	 the name of the column in MGCONSO.RRF that contains the identifier to which the attribute is attached
 * CODE: 	 unique identifier or code for the term provided by the source
 * ATUI:   	 attribute unique identifier
 * ATN:    	 attribute name
 * SAB:    	 abbreviation for the source of the term (defined in MedGen_Sources.txt)
 * ATV:    	 attribute value
 * SUPPRESS: suppressed by UMLS curators   (no reason is reported)


File: MGSTY.RRF.gz
------------------
Summary data for semantic types.


 * CUI:    	 concept unique identifier
 * TUI:      semantic type unique identifier
 * STN:    	 semantic type tree number
 * STY:    	 semantic type, the full name that defines the TUI
 * ATUI:   	 attribute unique identifier


File: MedGen_CUI_history.txt
-----------------------------
Tab-delimited report of changes in CUI in MeGen and the dates the changes were made.

 * Previous_CUI:   The CUI that was deprecated
 * Current_CUI:    The CUI that is now current
 * Date_Of_Action: The month and year this happened


File: MedGen_HPO_Mapping.txt.gz
--------------------------------
Report of MedGen's processing of terms from Human Phenotype Ontology (HPO)

 * CUI:        	concept unique identifier
 * SDUI:       	Identifier from HPO
 * HpoStr:     	term from HPO
 * MedGenStr:  	preferred term in MedGen
 * MedGenStr_SAB: Source of the term in MedGen
 * STY: 	         semantic type


File: MedGen_HPO_OMIM_Mapping.txt.gz
-----------------------------------
Report of MedGen's processing of terms from Human Phenotype Ontology (HPO) and their relationships diagnostic terms from OMIM.  The mapping are as reported by HPO.

 * OMIM_CUI: 	   concept unique identifier assigned to a record from OMIM
 * MIM_number: 	MIM number defining the record from OMIM
 * OMIM_name: 	   preferred term from OMIM 
 * relationship: 	relationship of the term from HPO to the record from OMIM.
                  Constructions like 'not_manifestation_of' are used to represent the 'not'
						qualifier for a relationship.
 * HPO_CUI: 	   Concept UID (CUI) assiged to the term from HPO
 * HPO_Id: 	      preferred term from HPO
 * HPO_CUI: 	   Concept UID (CUI) assiged to the term from HPO
 * MedGen_name: 	preferred term used in MedGen
 * MedGen_source: source of the term used preferentially by MedGen
 * STY: 	         semantic type


File: MedGen_Sources.txt
-------------------------
List of Sources used in MedGen

 * Source:        The name of the source
 * Abbreviation:  How the source is represented in MedGen
 * Description:   A description of the source
 * URL:           Web address for the source


File: NAMES.RRF.gz
------------------
Summary data for concept names and sources.

 * CUI: 	        Concept unique identifier
 * name:      	  Concept name  (preferred)
 * source: 	     Sources that contribute strings or relationships to the UMLS Metathesaurus
 * SUPPRESS: 	  Suppressed by UMLS curators

File: ORDO_CUI_history.txt
---------------------------
History of mappings between Orphanet identifiers and concept unique identifiers (CUI)

 * ORDO_Id:       Orphanet Identifier
 * CUI:           Concept unique identifier
 * Date:          Date of latest change in Orphanet-CUI mapping
 * IsCurrent:     Indicates the status of the Orphanet-CUI mapping;
                   1 means mapping is current, 0 means mapping is obsolete


File: cui_bookshelf.txt
-----------------------
Report of concept unique identifiers (CUIs) and NCBI's Bookshelf identifiers

 * CUI:			  Concept unique identifier
 * MedGenName:	  Preferred condition name in MedGen
 * BookshelfID:  Identifer for the Bookshelf book or chapter;
                 you can view this record by prepending the identifier with https://www.ncbi.nlm.nih.gov/books/
 * Source:		  Identifies source as being either GeneReviews or Medical Genetics Summaries


File: medgen_pubmed_lnk.txt.gz
------------------------------
Summary data for MedGen and PubMed identifiers. Delimiter is '|'

 * UID:           MedGen unique identifier
 * CUI:        	Concept unique identifier
 * NAME:       	Concept name
 * PMID :      	PubMed unique identifier


****************************************************************

SUBDIRECTORIES
==============


Sub-directory: csv/
-------------------
Location: ftp://ftp.ncbi.nlm.nih.gov/pub/medgen/csv/

Description: The csv subdirectory contains a set of comma-separated files (csv) corresponding to the RRF files in the main path. Some of the files are split to allow loading into spreadsheet software (maximum 1,000,000 lines per file). The csv files also facilitate processing of the MGDEF.RRF file because the DEF column may contain internal line feeds.

Sub-directory: presentations/
------------------------------
Location: ftp://ftp.ncbi.nlm.nih.gov/pub/medgen/presentations

Description: The presentations subdirectory contains presentations related to MedGen.

There is one file at present, Conditions_Phenotypes.pptx, which describes how data in MedGen and other resources can be used to identify terms and identifiers to include in submissions to ClinVar and GTR.


****************************************************************

OTHER SITES
===========

Other Site: ClinVar
--------------------
Location: ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/

Description: The files discussed in the NAMES OF PHENOTYPES section of the README contain information about condition names used by ClinVar and GTR.

These files are:

 * disease_names
 * gene_condition_source_id
 * ConceptID_history.txt


Other Site: Gene's ftp site
---------------------------
Location: ftp://ftp.ncbi.nih.gov/gene/DATA/mim2gene_medgen

Description: A report of identifiers from OMIM, whether they are genes or conditions, and corresponding data in Gene and MedGen. Described in ftp://ftp.ncbi.nih.gov/gene/README. 


***************************Selected applications*********************************
1. Determine how the CUI assigned by MedGen to an identifier from another database may
have changed over time.

a. Use HPO_CUI_history.txt to look for the CUI assigned to IDs from HPO. Each assignment is
   reported on a distinct line.
	Note that not all HPO ids will have a value of 1 in the IsCurrent column. Some
	HPO ids will have been retired.  You can find the current mapping by searching the
	file for the last CUI that had been assigned.

      grep HP:0100805 HPO_CUI_history.txt
        HP:0100805      C0025322        12 Jun 2019     0
        HP:0100805      C4021965        25 Jan 2017     0
        HP:0100805      CN117695        08 Feb 2016     0
      grep C0025322 HPO_CUI_history.txt  (search for C0025322 which was last used June 2019)
        HP:0100805      C0025322        12 Jun 2019     0
        HP:0008209      C0025322        30 Oct 2019     1

b. use ORDO_CUI_history.txt to look for the CUI assigned to IDs from Orphanet and the ORDO ontology.
   Each assignment is reported on a distinct line.
	Note that not all Orphanet identifiers will have a value of 1 in the IsCurrent column. Some
	will have been retired.  You can find the current mapping by searching the file for the last CUI
	that had been assigned.


      grep Orphanet_99791 ORDO_CUI_history.txt 
        Orphanet_99791  C0399380        30 Oct 2019     1
        Orphanet_99791  CN207372        31 Jan 2018     0
