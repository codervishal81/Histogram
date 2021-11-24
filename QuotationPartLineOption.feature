Feature: QuotationPartLineOption

Background: 
Given I am logged in as "Admin"
And following options are added in Admin
    | OptionName        | EntityName      | Count |
    | Prefix And Number | PrefixAndNumber | 0     |

And following options are added in Sales
	| OptionName                          | EntityName          | Count |
	| Quotation Type                      | QuotationType       | 0     |
	| Sales Analysis Codes                | SalesAnalysisCode   | 0     |
	| Sales Account Manager               | SalesAccountManager | 0     |
	| Sales Options Questions and Answers | SalesOptionQuestion | 0     |
	| Sales Options                       | SalesOption         | 0     |
	| Sales Nominal Codes                 | SalesNominalCode    | 0     |

And following options are added in Commercial
    | OptionName            | EntityName          | Count |
    | Countries             | Country             | 0     |
    | Contact Titles        | ContactTitle        | 0     |
    | Company Sales Type    | CompanySalesType    | 0     |
    | Company Purchase Type | CompanyPurchaseType | 0     |
    | Company Categories    | CompanyCategory     | 0     |
    | TaxCodes              | TaxCode             | 0     |

And the following series already exists
    | Name             | Prefix | NextNumber |
    | General          | G/     | 01         |

And I have company with following details
    | CompanyCode | CompanyName | 
    | C001        | 123insight  | 
    | C002        | Cybage      |

And company address with the following details
    | CompanyCode | AddressLine1 | AddressLine2 | AddressLine3 | AddressLine4 | AddressLine5   | AddressLine6 | AddressLine7 |
    | C001        | Cybage       | Software     | Pvt.         | Ltd          | Wadagaon sheri | Pune         | 411041       |
    | C001        | 123insight   | Software     | Pvt.         | Ltd          | Southampton    | UK           | 211056       |
    | C002        | Cyb          | Software     | Pvt.         | Ltd          | Southampton    | UK           | 211056       |

And  following employee are added in admin
    | ClockNumber | FirstName | SurName | IsActive |
    | 1001        | John      | Cina    | true     |
    | 1003        | Ajinkya   | Rahane  | true     |
    | 1002        | Jane      | Miller  | true     |
    | 1004        | Jeson     | Holder  | true     |

And company contact with the following details
    | Title | FirstName | SurName | CompanyCode | IsActive |
    | Mr    | Bruce     | Wills   | C001        | true     |
    | Mr    | James     | Geller  | C001        | true     |
    | Mr    | Peter     | Vaughen | C001        | true     |
    | Mr    | Stuart    | Belly   | C001        | true     |
    | Mr    | Alen      | Wills   | C002        | true     |
    | Mr    | Prince    | Geller  | C002        | true     |

And tax code with following deatils
    | Code | Active |
    | VAT  | true   |
    | T2   | true   |

And currency with following details
    | Code   | Active | ExchangeRate | BaseCurrency |
    | RUPE   | true   | 1            | false        |
    | DOLLAR | true   | 2            | true         |

And I create quotation type with following details
    | QuotationType | PrefixAndSeries | DefaultHeaderText        | DefaultFooterText |
    | Service Parts | General         | Service Parts Management | Condition apply   |

And sales nominal code with following details
    | Sales Service Code | Sales Service Description |
    | OFFICE EQUIPMENT   | UK Sales                  |
    | HOME EQUIPMENT     | UK Sales                  |

And I create the sales account manager with the clocknumber "1001"

And I add sales analysis code with the following details
    | AnalysisCodeNumber | AnalysisCodeName | MandatoryOnCustomer | MandatoryOnQuotation | MandatoryOnSalesOrder |
    | 1                  | Region           | false               | false                | false                 |
    | 2                  | Rating           | false               | false                | false                 |

And I have code value "UK" for AnalysisCode "1"

And following unit of measure 
    | UnitOfMeasure | UnitPrecision | IsDefault | IsActive |
    | Each          | 0             | true      | true     |
And I add product group with the following information
	| ProductGroupCode | ProductGroupDescription |
	| RYNO CHAIR       | RYNO CHAIRS             |
	| XYZ GROUP        | Another Group           |

And Default adopt sales parts to Yes
And Default approval status of sales part to Yes

And I released engineering part number "1RYL-02" with description "Lounge Chair" and unit of measure "Each" and product group "RYNO CHAIR"
And engineering part number "1RYL-02-CORE" with description "1RYL-02-CORE" and unit of measure "Each" is released
And engineering part number "1RYL-02-NON-CORE" with description "1RYL-02-NON-CORE" and unit of measure "Each" is released
And engineering part number "WEIGHT-STD" with description "WEIGHT-STD" and unit of measure "Each" is released
And engineering part number "WEIGHT-NON-STD" with description "WEIGHT-NON-STD" and unit of measure "Each" is released
And engineering part number "FLOOR FIXING KIT" with description "FLOOR FIXING KIT" and unit of measure "Each" is released
And engineering part number "CHAIR LINKING KIT" with description "CHAIR LINKING KIT" and unit of measure "Each" is released
And engineering part number "OUTDOOR-USE" with description "OUTDOOR-USE" and unit of measure "Each" is released
And engineering part number "1RYL-02-SEAT-A" with description "1RYL-02-SEAT-A" and unit of measure "Each" is released
And engineering part number "1RYL-02-SEAT-B" with description "1RYL-02-SEAT-B" and unit of measure "Each" is released
And engineering part number "1RYL-02-SEAT-C" with description "1RYL-02-SEAT-C" and unit of measure "Each" is released
And engineering part number "1RYL-02-BACK-A" with description "1RYL-02-BACK-A" and unit of measure "Each" is released
And engineering part number "1RYL-02-BACK-B" with description "1RYL-02-BACK-B" and unit of measure "Each" is released
And engineering part number "1RYL-02-BACK-C" with description "1RYL-02-BACK-C" and unit of measure "Each" is released
And engineering part number "PART-WITHOUT-OPTION" with description "PART-WITHOUT-OPTION" and unit of measure "Each" is released
And engineering part number "XYZ-02" with description "Another part with options" and unit of measure "Each" is released

And I adopt released part with following details
    | PartNumber | Description  | NominalCode      | LeadTime | Approve |
    | 1RYL-02    | Lounge Chair | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber   | Description  | NominalCode      | LeadTime | Approve |
    | 1RYL-02-CORE | 1RYL-02-CORE | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber       | Description      | NominalCode      | LeadTime | Approve |
    | 1RYL-02-NON-CORE | 1RYL-02-NON-CORE | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber | Description | NominalCode      | LeadTime | Approve |
    | WEIGHT-STD | WEIGHT-STD  | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber     | Description    | NominalCode      | LeadTime | Approve |
    | WEIGHT-NON-STD | WEIGHT-NON-STD | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber       | Description      | NominalCode      | LeadTime | Approve |
    | FLOOR FIXING KIT | FLOOR FIXING KIT | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber        | Description       | NominalCode      | LeadTime | Approve |
    | CHAIR LINKING KIT | CHAIR LINKING KIT | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber  | Description | NominalCode      | LeadTime | Approve |
    | OUTDOOR-USE | OUTDOOR-USE | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber     | Description    | NominalCode      | LeadTime | Approve |
    | 1RYL-02-SEAT-A | 1RYL-02-SEAT-A | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber     | Description    | NominalCode      | LeadTime | Approve |
    | 1RYL-02-SEAT-B | 1RYL-02-SEAT-B | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber     | Description    | NominalCode      | LeadTime | Approve |
    | 1RYL-02-SEAT-C | 1RYL-02-SEAT-C | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber     | Description    | NominalCode      | LeadTime | Approve |
    | 1RYL-02-BACK-A | 1RYL-02-BACK-A | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber     | Description    | NominalCode      | LeadTime | Approve |
    | 1RYL-02-BACK-B | 1RYL-02-BACK-B | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber     | Description    | NominalCode      | LeadTime | Approve |
    | 1RYL-02-BACK-C | 1RYL-02-BACK-C | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber          | Description         | NominalCode      | LeadTime | Approve |
    | PART-WITHOUT-OPTION | PART-WITHOUT-OPTION | OFFICE EQUIPMENT | 21       | true    |
And I adopt released part with following details
    | PartNumber | Description               | NominalCode      | LeadTime | Approve |
    | XYZ-02     | Another part with options | OFFICE EQUIPMENT | 21       | true    |

And Part cost with following details
	| PartNumber | StandardComponentCost | StandardSubcontractCost | StandardSetCost | StandardRunCost |
	| 1RYL-02    | 50                    | 25                      | 15              | 10              |

And I create sales service with following details
    | Sales Service Code | Sales Service Description   | UnitOfMeasure | SalesNominalCode | Lead Time |
    | CTD                | Contribution to Development | Each          | OFFICE EQUIPMENT | 0         |

And following component exist
	| Part Number           | Unit Of Measure | Active |
	| 1RYL-02-GRANITE       | Each            | True   |
	| 1RYL-02-ICON PURPLE   | Each            | True   |
	| 1RYL-02-COOL GREEN    | Each            | True   |
	| 1RYL-02-EPIC BLUE     | Each            | True   |
	| 1RYL-02-MOONWALK GREY | Each            | True   |
	| 1RYL-02-VEGAS YELLOW  | Each            | True   |
	| 1RYL-02-BLAZE BLUE    | Each            | True   |
	| 1RYL-02-LIME          | Each            | True   |
	| 1RYL-02-THUNDER GREY  | Each            | True   |
	| 1RYL-02-BLACK         | Each            | True   |
	| SAND BAG (22KG)       | Each            | True   |
	| FLOOR FIXING KIT      | Each            | True   |
	| CHAIR LINKING KIT     | Each            | True   |
	| 10-11-45-000          | Each            | True   |
	| 10-11-98-000          | Each            | True   |


And following sales option question exist
	| Question                |
	| CORE OR NON CORE        |
	| CORE                    |
	| NON CORE                |
	| GRANITE                 |
	| ICON PURPLE             |
	| COOL GREEN              |
	| EPIC BLUE               |
	| MOONWALK GREY           |
	| VEGAS YELLOW            |
	| BLAZE BLUE              |
	| LIME                    |
	| THUNDER GREY            |
	| BLACK                   |
	| WEIGHT                  |
	| STANDARD WEIGHT (+22KG) |
	| EXTRA WEIGHT (+44KG)    |
	| NOT APPLICABLE          |
	| FLOOR FIXABLE           |
	| LINKED                  |
	| REQUIRED                |
	| PRICE GROUP A           |
	| PRICE GROUP B           |
	| PRICE GROUP C           |
	| PRICE GROUP D           |
	| MARNA                   |
	| DARCY                   |
	| HIGHLAND                |
	| EVE                     |
	| KILDA                   |
	| HAVEN                   |
	| PANVELLE STRETCH PLAIN  |
	| GUARD RANGE             |
	| WEDGE WOOD BLUE         |
	| INK                     |
	| SEAT UPHOLSTERY         |
	| BACK UPHOLSTERY         |
	| FIXINGS                 |
	| OUTDOOR USE             |
	| PINKISH PURPLE          |

And following sales part sales option exist
	| AggregateId                          | Part Number | Question         | Answer         | Part Number To Use For Price | Component To Add To Bom | Component Set Quantity | Component Quantity | Component Scrap Percentage | Phantom Component | Routing Instructions            |
	| e3a74c28-8ad5-45fb-a93b-ff3c6c9475f6 | 1RYL-02     | CORE OR NON CORE | CORE           | 1RYL-02-CORE                 |                         |                        |                    |                            |                   |                                 |
	| 5a58f159-a657-4c91-be0a-30d6d3ca51c8 | 1RYL-02     | CORE OR NON CORE | NON CORE       | 1RYL-02-NON-CORE             |                         |                        |                    |                            |                   |                                 |
	| 2f1a0494-7031-41a3-829a-2d24a426f3ee | 1RYL-02     | CORE             | GRANITE        |                              | 1RYL-02-GRANITE         | 0                      | 1                  | 0                          | FALSE             |                                 |
	| 2e7b09c8-4b15-4816-8223-59b99989058f | 1RYL-02     | CORE             | ICON PURPLE    |                              | 1RYL-02-ICON PURPLE     | 0                      | 1                  | 0                          | FALSE             |                                 |
	| 4e2f2a0b-fd80-4978-9f7d-acd1626d7a0a | 1RYL-02     | CORE             | COOL GREEN     |                              | 1RYL-02-COOL GREEN      | 0                      | 1                  | 0                          | FALSE             |                                 |
	| 28d0b34a-18af-4c86-9aa7-380423d83e4f | 1RYL-02     | CORE             | EPIC BLUE      |                              | 1RYL-02-EPIC BLUE       | 0                      | 1                  | 0                          | FALSE             |                                 |
	| e6dcf38c-6f83-4839-8fa4-7b439a53c1ce | 1RYL-02     | CORE             | MOONWALK GREY  |                              | 1RYL-02-MOONWALK GREY   | 0                      | 1                  | 0                          | FALSE             |                                 |
	| bd3dc3a2-a5ef-4b23-9b6d-51cd57cb9b5d | 1RYL-02     | NON CORE         | VEGAS YELLOW   |                              | 1RYL-02-VEGAS YELLOW    | 0                      | 1                  | 0                          | FALSE             |                                 |
	| 70749e5d-b3b0-4c43-8dbd-5f6257f063c6 | 1RYL-02     | NON CORE         | BLAZE BLUE     |                              | 1RYL-02-BLAZE BLUE      | 0                      | 1                  | 0                          | FALSE             |                                 |
	| 774cd79c-d4ec-4221-8e66-4c8b37a1d488 | 1RYL-02     | NON CORE         | LIME           |                              | 1RYL-02-LIME            | 0                      | 1                  | 0                          | FALSE             |                                 |
	| 00ca75ab-887c-4892-bd52-38e317568474 | 1RYL-02     | NON CORE         | THUNDER GREY   |                              | 1RYL-02-THUNDER GREY    | 0                      | 1                  | 0                          | FALSE             |                                 |
	| 75c6be5f-5cac-4985-920b-76131edcd6d9 | 1RYL-02     | NON CORE         | BLACK          |                              | 1RYL-02-BLACK           | 0                      | 1                  | 0                          | FALSE             |                                 |
	| 220a3751-6b2c-4f82-b199-6fb147a7b4aa | 1RYL-02     | FIXINGS          | FLOOR FIXABLE  | FLOOR FIXING KIT             | FLOOR FIXING KIT        | 0                      | 1                  | 0                          | True              |                                 |
	| b0fb8702-0afb-498a-be57-25f0b29b9aab | 1RYL-02     | FIXINGS          | LINKED         | CHAIR LINKING KIT            | CHAIR LINKING KIT       | 0                      | 1                  | 0                          | True              |                                 |
	| 81c66796-c500-44a1-9746-bc15e6ce8bac | 1RYL-02     | FIXINGS          | NOT APPLICABLE |                              |                         |                        |                    |                            |                   |                                 |
	| 3d9149e2-e465-48d8-ab22-fc448335138a | 1RYL-02     | SEAT UPHOLSTERY  | PRICE GROUP A  | 1RYL-02-SEAT-A               |                         | 0                      | 2.5                | 5                          |                   |                                 |
	| 54243e6f-dced-414f-b6b0-df0291826367 | 1RYL-02     | SEAT UPHOLSTERY  | PRICE GROUP B  | 1RYL-02-SEAT-B               |                         | 0                      | 2.5                | 5                          |                   |                                 |
	| 2fd5b6ae-8c82-4c84-8e54-e06126d6dc34 | 1RYL-02     | SEAT UPHOLSTERY  | PRICE GROUP C  | 1RYL-02-SEAT-C               |                         | 0                      | 2.5                | 5                          |                   |                                 |
	| 53c59764-c468-48f2-b6c3-6d2e1ceaf517 | 1RYL-02     | SEAT UPHOLSTERY  | NOT APPLICABLE |                              |                         |                        |                    |                            |                   | Remove UPHOLSTER SEAT operation |
	| 0e940fef-6fdf-4d9f-8799-d527077b9ff8 | 1RYL-02     | BACK UPHOLSTERY  | PRICE GROUP A  | 1RYL-02-BACK-A               |                         | 0                      | 2.2                | 5                          |                   |                                 |
	| 9bad5a44-1583-4615-88c3-d8fdd11b7bf8 | 1RYL-02     | BACK UPHOLSTERY  | PRICE GROUP B  | 1RYL-02-BACK-B               |                         | 0                      | 2.2                | 5                          |                   |                                 |
	| c3a0db28-298f-4ed8-a3e2-1c2221735e79 | 1RYL-02     | BACK UPHOLSTERY  | PRICE GROUP C  | 1RYL-02-BACK-C               |                         | 0                      | 2.2                | 5                          |                   |                                 |
	| 53c020f9-d0ef-493e-a56a-97b93a944b58 | 1RYL-02     | BACK UPHOLSTERY  | NOT APPLICABLE |                              |                         |                        |                    |                            |                   | Remove UPHOLSTER BACK operation |
	| 8aad6193-78d2-4a75-b9d1-b45f9b697e17 | XYZ-02      | CORE OR NON CORE | CORE           | 1RYL-02-CORE                 |                         |                        |                    |                            |                   |                                 |

And following product group sales option exist
	| AggregateId                          | Product Group | Question    | Answer                  | Part Number To Use For Price | Component To Add To Bom | Component Set Quantity | Component Quantity | Component Scrap Percentage | Phantom Component | Routing Instructions                |
	| ed00f954-60a5-4a89-b534-905bb15c5316 | RYNO CHAIR    | WEIGHT      | STANDARD WEIGHT (+22KG) | WEIGHT-STD                   | SAND BAG (22KG)         | 0                      | 1                  | 0                          | False             |                                     |
	| 45d3f8da-f4ad-4d01-a99a-a20a2e1bf6f4 | RYNO CHAIR    | WEIGHT      | EXTRA WEIGHT (+44KG)    | WEIGHT-NON-STD               | SAND BAG (22KG)         | 0                      | 2                  | 0                          | False             | Increase FILLING time by 10 minutes |
	| edced049-eaa1-48dd-9bc5-b02c9259e965 | RYNO CHAIR    | WEIGHT      | NOT APPLICABLE          |                              |                         |                        |                    |                            |                   | Remove FILLING operation            |
	| 849c28d3-af6f-4b81-b7bc-792abde80a26 | RYNO CHAIR    | OUTDOOR USE | REQUIRED                | OUTDOOR-USE                  |                         |                        |                    |                            |                   | Add DRILLING operation              |
	| f94377f7-0a25-4e22-b6f1-b622cd94f707 | RYNO CHAIR    | OUTDOOR USE | NOT APPLICABLE          |                              |                         |                        |                    |                            |                   | Remove DRILLING operation           |
	| 0442be9f-642c-478f-8d02-e39b46282329 | XYZ GROUP     | CORE        | PINKISH PURPLE          |                              |                         |                        |                    |                            |                   |                                     |

And following generic sales option exist
	| AggregateId                          | Question      | Answer                 | Part Number To Use For Price | Component To Add To Bom | Component Set Quantity | Component Quantity | Component Scrap Percentage | Phantom Component | Routing Instructions |
	| 37e06e79-5182-48b2-9493-e39d7fb04bcb | PRICE GROUP A | MARNA                  |                              |                         |                        |                    |                            |                   |                      |
	| e91bc761-4d38-4508-9223-97766bbfa2d2 | PRICE GROUP A | DARCY                  |                              |                         |                        |                    |                            |                   |                      |
	| 52ddd07c-49a8-413d-8a2e-fd25a9849634 | PRICE GROUP A | HIGHLAND               |                              |                         |                        |                    |                            |                   |                      |
	| 8b354049-6974-4b7e-aae5-86568d8bcd68 | PRICE GROUP A | EVE                    |                              |                         |                        |                    |                            |                   |                      |
	| 339ae0c9-72d2-42a5-aa58-ca360141afdf | PRICE GROUP B | KILDA                  |                              |                         |                        |                    |                            |                   |                      |
	| 5af1144c-c9fd-404b-9ee7-514188bf3921 | PRICE GROUP B | HAVEN                  |                              |                         |                        |                    |                            |                   |                      |
	| 2420595a-4ebf-45b0-a5a8-a27f6a300b8e | PRICE GROUP C | PANVELLE STRETCH PLAIN |                              |                         |                        |                    |                            |                   |                      |
	| 3eadbae0-42c5-44a8-b016-27663c47f74f | PRICE GROUP D | GUARD RANGE            |                              |                         |                        |                    |                            |                   |                      |
	| 83217c46-cfdd-482d-9304-6223b12f18cf | EVE           | WEDGE WOOD BLUE        |                              | 10-11-45-000            |                        |                    |                            |                   |                      |
	| 33bb32de-58c5-4715-a9e4-261e7d3c7440 | EVE           | INK                    |                              | 10-11-98-000            |                        |                    |                            |                   |                      |

And following options are added in Sales
	| OptionName      | EntityName    | Count |
	| Sales Divisions | SalesDivision | 0     |
And I Have Sales Division With The Following Details
	| DivisionId                           | Name      | Email                    | Phone       | Fax          | Website | AddressLine1 | AddressLine2 | AddressLine3 | AddressLine4 | AddressLine5 | AddressLine6 | AddressLine7 | LogoId | QualityLogoId |
	| D8BD6ED4-6D03-45F3-934D-04DAD979C809 | Division1 | division1@123insight.com | 07877213511 | 078772135111 |         |              |              |              |              |              |              |              |        |               |

And I add sales company with following details
    | Company | TaxCode | Currency | NominalCode      | LedgerCode | RaiseQuotation | RaiseOrder | ProcessOrderInMRP | Despatch | Term | AgeingTerm      | PreferredDeliveryAddress | PreferredContact | PreferredInvoiceAddress | AccountManager | SalesAnalysisCode1 | SalesAnalysisValue1 |
    | C001    | VAT     | RUPE     | OFFICE EQUIPMENT | L/10       | true           | true       | true              | true     | 1    | FromInvoiceDate | Cybage                   | Bruce            | 123insight              | 1001           | Region             | UK                  |

And I create quotation with following details
    | QuotationNumber | QuotationType | RaisedOn | Title                      | OurContact | SalesCompany | SalesCompanyContact1 | SalesCompanyContact2 | QuotationAddress | SalesAnalysisCode1 | SalesAnalysisValue1 | ShowTotalOnQuotation | ShowTaxOnQuotation | SalesDivision |
    | G/02            | Service Parts | Today+10 | Quotation for part service | John       | C001         | Bruce                | James                | 123insight       | Region             | UK                  | true                 | true               | Division1     |

And I add quotation section to quotation "G/02" with following details
    | SectionName    | SectionDescription            | ShowSubTotalOnQuotation |
    | Current Year    | To be closed in this year    | true                    |

@QuotationPartLineOptionCreation
Scenario: Add quotation part line with part having sales options configured
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

@QuotationPartLineOptionCreation
Scenario: Add quotation part line with part which does not have options configured
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber          | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | PART-WITHOUT-OPTION | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then count of sales options should be "0" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "NULL"
And quotation "G/02" should have sales option status as "NULL"

@QuotationPartLineOptionCreation
Scenario: Add quotation service line
When I add quotation service line to quotation with following details
    | QuotationNumber | QuotationSection | ServiceCode | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote |
    | G/02            | Current Year     | CTD         | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       |
Then count of sales options should be "0" for line number "1" of quotation "G/02"
And quotation "G/02" should have sales option status as "NULL"

@QuotationPartLineOptionCreation
Scenario: Add quotation part and service lines when part does not have options configured
When I add quotation service line to quotation with following details
    | QuotationNumber | QuotationSection | ServiceCode | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote |
    | G/02            | Current Year     | CTD         | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       |
And I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber          | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | PART-WITHOUT-OPTION | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then count of sales options should be "0" for line number "1" of quotation "G/02"
And count of sales options should be "0" for line number "2" of quotation "G/02"
And quotation part line number "2" of quotation "G/02" should have sales option status as "NULL"
And quotation "G/02" should have sales option status as "NULL"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Perform question answer flow for quotation part line options
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP C        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion  | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                              |
	| CORE OR NON CORE | CORE          |                      | Partial           | 1RYL-02-CORE           |                     |                      |                   |                          |                  |                                     | {CORE OR NON CORE : CORE}=>{CORE : UNANSWERED}                  |
	| FIXINGS          | FIXINGS       | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT   | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                              |
	| SEAT UPHOLSTERY  | PRICE GROUP A |                      | Partial           | 1RYL-02-SEAT-A         |                     | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : UNANSWERED} |
	| BACK UPHOLSTERY  | PRICE GROUP C |                      | Partial           | 1RYL-02-BACK-C         |                     | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : UNANSWERED} |
	| WEIGHT           | WEIGHT        | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)     | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                 |
	| OUTDOOR USE      | OUTDOOR USE   | REQUIRED             | Full              | OUTDOOR-USE            |                     |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                        |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Partial"
And quotation "G/02" should have sales option status as "Partial"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer                 |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE                    |
	| BACK UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion  | Answer                 | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                           |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                           |
	| FIXINGS          | FIXINGS       | LINKED                 | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                           |
	| SEAT UPHOLSTERY  | EVE           |                        | Partial           | 1RYL-02-SEAT-A         |                       | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : UNANSWERED} |
	| BACK UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN | Full              | 1RYL-02-BACK-C         |                       | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : PANVELLE STRETCH PLAIN}  |
	| WEIGHT           | WEIGHT        | EXTRA WEIGHT (+44KG)   | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                              |
	| OUTDOOR USE      | OUTDOOR USE   | REQUIRED               | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                                     |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Partial"
And quotation "G/02" should have sales option status as "Partial"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion  | Answer                 | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                          |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                          |
	| FIXINGS          | FIXINGS       | LINKED                 | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                          |
	| SEAT UPHOLSTERY  | EVE           | INK                    | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK}       |
	| BACK UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN | Full              | 1RYL-02-BACK-C         |                       | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : PANVELLE STRETCH PLAIN} |
	| WEIGHT           | WEIGHT        | EXTRA WEIGHT (+44KG)   | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                             |
	| OUTDOOR USE      | OUTDOOR USE   | REQUIRED               | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                                    |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Answer sales option question when quotation is not awaiting approval
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Partial"
And quotation "G/02" should have sales option status as "Partial"

When I close quotation number "G/02"
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
Then I should be notified with an error message "Quotation is readonly"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Answer sales option question with invalid line id
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answer for option questions with invalid line id for quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
Then I should be notified with an error message "Specified quotation line does not exist"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Answer sales option question with invalid line option id
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answer for option questions present on line number "1" of quotation "G/02" with invalid line option id
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
Then I should be notified with an error message "Line option is not valid"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Answer sales option question with invalid answer option
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

# Here answer aggregate id a56194bd-7e2a-4659-a948-40656f3a54f1 is invalid. No aggregate is present with this id.
When I give answer "a56194bd-7e2a-4659-a948-40656f3a54f1" with type "SalesPart" for option "CORE OR NON CORE" on line number "1" of quotation "G/02"
Then I should be notified with an error message "Specified answer does not exist"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Answer sales option question again which is already answered
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
# Again answering same question which is already answered but with different answer
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer   |
	| CORE OR NON CORE | CORE OR NON CORE | NON CORE |
Then I should be notified with an error message "Answer is not valid for the question"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Answer sales option question but answer is defined for different sales part
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

# Here answer aggregate id 8aad6193-78d2-4a75-b9d1-b45f9b697e17 is defined for another part called XYZ-02
When I give answer "8aad6193-78d2-4a75-b9d1-b45f9b697e17" with type "SalesPart" for option "CORE OR NON CORE" on line number "1" of quotation "G/02"
Then I should be notified with an error message "Answer is not valid for the sales part"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Answer sales option question but answer is defined for different product group
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion  | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                              |
	| CORE OR NON CORE | CORE          |                      | Partial           | 1RYL-02-CORE           |                     |                      |                   |                          |                  |                                     | {CORE OR NON CORE : CORE}=>{CORE : UNANSWERED}                  |
	
# Here answer aggregate id 0442be9f-642c-478f-8d02-e39b46282329 is defined for another product group XYZ PRODUCT GROUP
When I give answer "0442be9f-642c-478f-8d02-e39b46282329" with type "ProductGroup" for option "CORE OR NON CORE" on line number "1" of quotation "G/02"
Then I should be notified with an error message "Answer is not valid for the product group"

@QuotationPartLineOptionQuestionAnswerFlow
Scenario: Answer sales option question after line options are approved
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 2        | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2222.333" and discount "5.333"
	| RootQuestion | UnitPrice | Discount % |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Approved"
And quotation "G/02" should have sales option status as "Approved"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
Then I should be notified with an error message "Line options are approved"

@QuotationPartLineOptionRevert
Scenario: Revert quotation line option to first question when line option status is partial
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"
When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP C        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion  | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                              |
	| CORE OR NON CORE | CORE          |                      | Partial           | 1RYL-02-CORE           |                     |                      |                   |                          |                  |                                     | {CORE OR NON CORE : CORE}=>{CORE : UNANSWERED}                  |
	| FIXINGS          | FIXINGS       | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT   | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                              |
	| SEAT UPHOLSTERY  | PRICE GROUP A |                      | Partial           | 1RYL-02-SEAT-A         |                     | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : UNANSWERED} |
	| BACK UPHOLSTERY  | PRICE GROUP C |                      | Partial           | 1RYL-02-BACK-C         |                     | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : UNANSWERED} |
	| WEIGHT           | WEIGHT        | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)     | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                 |
	| OUTDOOR USE      | OUTDOOR USE   | REQUIRED             | Full              | OUTDOOR-USE            |                     |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                        |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Partial"
And quotation "G/02" should have sales option status as "Partial"

When I revert line option with root question "CORE OR NON CORE" on line number "1" of quotation "G/02"
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                              |
	| CORE OR NON CORE | CORE OR NON CORE |                      | Pending           |                        |                     |                      |                   |                          |                  |                                     | {CORE OR NON CORE : UNANSWERED}                                 |
	| FIXINGS          | FIXINGS          | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT   | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                              |
	| SEAT UPHOLSTERY  | PRICE GROUP A    |                      | Partial           | 1RYL-02-SEAT-A         |                     | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : UNANSWERED} |
	| BACK UPHOLSTERY  | PRICE GROUP C    |                      | Partial           | 1RYL-02-BACK-C         |                     | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : UNANSWERED} |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)     | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                 |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             | Full              | OUTDOOR-USE            |                     |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                        |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Partial"
And quotation "G/02" should have sales option status as "Partial"

@QuotationPartLineOptionRevert
Scenario: Revert quotation line option to first question when line option status is full
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"
When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP C        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer                 |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE                    |
	| BACK UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion  | Answer                 | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                          |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                          |
	| FIXINGS          | FIXINGS       | LINKED                 | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                          |
	| SEAT UPHOLSTERY  | EVE           | INK                    | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK}       |
	| BACK UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN | Full              | 1RYL-02-BACK-C         |                       | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : PANVELLE STRETCH PLAIN} |
	| WEIGHT           | WEIGHT        | EXTRA WEIGHT (+44KG)   | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                             |
	| OUTDOOR USE      | OUTDOOR USE   | REQUIRED               | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                                    |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I revert line option with root question "SEAT UPHOLSTERY" on line number "1" of quotation "G/02"
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion    | Answer                 | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                          |
	| CORE OR NON CORE | CORE            | MOONWALK GREY          | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                          |
	| FIXINGS          | FIXINGS         | LINKED                 | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY |                        | Pending           |                        |                       |                      |                   |                          |                  |                                     | {SEAT UPHOLSTERY : UNANSWERED}                                              |
	| BACK UPHOLSTERY  | PRICE GROUP C   | PANVELLE STRETCH PLAIN | Full              | 1RYL-02-BACK-C         |                       | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : PANVELLE STRETCH PLAIN} |
	| WEIGHT           | WEIGHT          | EXTRA WEIGHT (+44KG)   | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                             |
	| OUTDOOR USE      | OUTDOOR USE     | REQUIRED               | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                                    |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Partial"
And quotation "G/02" should have sales option status as "Partial"

@QuotationPartLineOptionRevert
Scenario: Revert all quotation line options to first question when line option status is full
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"
When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP C        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer                 |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE                    |
	| BACK UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion  | Answer                 | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                          |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                          |
	| FIXINGS          | FIXINGS       | LINKED                 | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                          |
	| SEAT UPHOLSTERY  | EVE           | INK                    | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK}       |
	| BACK UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN | Full              | 1RYL-02-BACK-C         |                       | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : PANVELLE STRETCH PLAIN} |
	| WEIGHT           | WEIGHT        | EXTRA WEIGHT (+44KG)   | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                             |
	| OUTDOOR USE      | OUTDOOR USE   | REQUIRED               | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                                    |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"


When I revert line option with root question "CORE OR NON CORE" on line number "1" of quotation "G/02"
And I revert line option with root question "FIXINGS" on line number "1" of quotation "G/02"
And I revert line option with root question "SEAT UPHOLSTERY" on line number "1" of quotation "G/02"
And I revert line option with root question "BACK UPHOLSTERY" on line number "1" of quotation "G/02"
And I revert line option with root question "WEIGHT" on line number "1" of quotation "G/02"
And I revert line option with root question "OUTDOOR USE" on line number "1" of quotation "G/02"
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

@QuotationPartLineOptionRevert
Scenario: Revert quotation line option to first question when quotation is not awaiting approval
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"
When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2222.333" and discount "5.333"
	| RootQuestion     | UnitPrice | Discount % |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Approved"
And quotation "G/02" should have sales option status as "Approved"

When I approve quotation number "G/02"
And I revert line option with root question "CORE OR NON CORE" on line number "1" of quotation "G/02"
Then I should be notified with an error message "Quotation is readonly"

@QuotationPartLineOptionRevert
Scenario: Revert quotation line option to first question with invalid line id
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"
When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I revert line option with root question "CORE OR NON CORE" with invalid line id for quotation "G/02"
Then I should be notified with an error message "Specified quotation line does not exist"

@QuotationPartLineOptionRevert
Scenario: Revert quotation line option to first question with invalid line option id
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"
When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I revert line option with root question "CORE OR NON CORE" with invalid line option id for line "1" of quotation "G/02"
Then I should be notified with an error message "Line option is not valid"

@QuotationPartLineOptionRevert
Scenario: Revert quotation line option to first question after line options are approved
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"
When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2222.333" and discount "5.333"
	| RootQuestion | UnitPrice | Discount % |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Approved"
And quotation "G/02" should have sales option status as "Approved"

When I revert line option with root question "CORE OR NON CORE" on line number "1" of quotation "G/02"
Then I should be notified with an error message "Line options are approved"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2222.333" and discount "5.333"
	| RootQuestion     | UnitPrice | Discount % |
	| CORE OR NON CORE | 1200      | 5          |
	| FIXINGS          | 10        | 6          |
	| SEAT UPHOLSTERY  | 20        | 5          |
	| BACK UPHOLSTERY  | 30        | 4          |
	| WEIGHT           | 40        | 3          |
	| OUTDOOR USE      | 50        | 2          |
Then following sales options with option pricing should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | OptionUnitPrice | OptionDiscount % | OptionTotal | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1200            | 5                | 1140        | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | 10              | 6                | 9.4         | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 20              | 5                | 19          | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 30              | 4                | 28.8        | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | 40              | 3                | 38.8        | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            | 50              | 2                | 49          |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have following price
	| UnitPrice | Discount % | LineTotal | Margin % |
	| 2222.333  | 5.333      | 42076.32  | 95.25    |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Approved"
And quotation "G/02" should have sales option status as "Approved"
# Check following after quotation line option approval audit is implemented
#And following quotation line approval audit should be present for line number "1" of quotation "G/02"
#	| QuotationNumber | QuotationLineNumber | QuotationAndLineNumbers | SalesPart | CalculatedUnitPrice | AmendedUnitPrice | CalculatedDiscountPercentage | AmendedDiscountPercentage | CalculatedTotal | AmendedTotal | AmendedMinusCalculated |
#	| G/02            | 1                   | G/02/00001              | 1RYL-02   | 3350                | 2222.333         | 7.910448                     | 5.333                     | 3085            | 2103.815981  | -981.184019            |

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when quotation is not awaiting approval
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I close quotation number "G/02"
And I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2222.333" and discount "5.333"
	| RootQuestion     | UnitPrice | Discount % |
	| CORE OR NON CORE | 1200      | 5          |
	| FIXINGS          | 10        | 6          |
	| SEAT UPHOLSTERY  | 20        | 5          |
	| BACK UPHOLSTERY  | 30        | 4          |
	| WEIGHT           | 40        | 3          |
	| OUTDOOR USE      | 50        | 2          |
Then I should be notified with an error message "Quotation is readonly"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options with invalid line id
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for invalid line id of quotation "G/02" with final unit price "2222.333" and discount "5.333"
Then I should be notified with an error message "Specified quotation line does not exist"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when all options are not full
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE OR NON CORE |                      | Pending           |                        |                     |                      |                   |                          |                  |                                     | {CORE OR NON CORE : UNANSWERED}                                       |
	| FIXINGS          | FIXINGS          | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT   | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE              | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000        | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE              | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000        | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)     | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             | Full              | OUTDOOR-USE            |                     |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Partial"
And quotation "G/02" should have sales option status as "Partial"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2222.333" and discount "5.333"
	| RootQuestion     | UnitPrice | Discount % |
	| CORE OR NON CORE | 1200      | 5          |
	| FIXINGS          | 10        | 6          |
	| SEAT UPHOLSTERY  | 20        | 5          |
	| BACK UPHOLSTERY  | 30        | 4          |
	| WEIGHT           | 40        | 3          |
	| OUTDOOR USE      | 50        | 2          |
Then I should be notified with an error message "Sales option line status must be full"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when there is no option present
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber          | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | PART-WITHOUT-OPTION | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then count of sales options should be "0" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "NULL"
And quotation "G/02" should have sales option status as "NULL"


When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2222.333" and discount "5.333"
	| RootQuestion     | UnitPrice | Discount % |
Then I should be notified with an error message "Sales option line status must be full"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when they are already approved
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2222.333" and discount "5.333"
	| RootQuestion     | UnitPrice | Discount % |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Approved"
And quotation "G/02" should have sales option status as "Approved"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "3000" and discount "3"
	| RootQuestion | UnitPrice | Discount % |
Then I should be notified with an error message "Sales option line status must be full"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when unit price is having more than 6 decimal places
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "1111.1234567" and discount "3"
	| RootQuestion | UnitPrice | Discount % |
Then I should be notified with an error message "UnitPrice cannot have more than 6 decimal places"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when unit price is more than maximum allowed value
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "100000000000" and discount "3"
	| RootQuestion | UnitPrice | Discount % |
Then I should be notified with an error message "UnitPrice cannot be more than 99999999999.999999"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when unit price is less than zero
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "-0.1" and discount "3"
	| RootQuestion | UnitPrice | Discount % |
Then I should be notified with an error message "UnitPrice can't be less than 0.000000"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when discount has more than 6 decimal places
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2323" and discount "3.1234567"
	| RootQuestion | UnitPrice | Discount % |
Then I should be notified with an error message "Discount cannot have more than 6 decimal places"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when discount is more than 100
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion | Answer               | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                    |
	| CORE OR NON CORE | CORE         | MOONWALK GREY        | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                    |
	| FIXINGS          | FIXINGS      | LINKED               | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                    |
	| SEAT UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-SEAT-A         | 10-11-98-000          | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| BACK UPHOLSTERY  | EVE          | INK                  | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK} |
	| WEIGHT           | WEIGHT       | EXTRA WEIGHT (+44KG) | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                       |
	| OUTDOOR USE      | OUTDOOR USE  | REQUIRED             | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                              |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2323" and discount "100.000001"
	| RootQuestion | UnitPrice | Discount % |
Then I should be notified with an error message "Discount cannot be more than 100"

@QuotationPartLineOptionApproval
Scenario: Approve quotation part line options when option has component quantity present but component is not present
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"

When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP C        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer                 |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          |
	| SEAT UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE                    |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| BACK UPHOLSTERY | EVE      | INK    |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion  | Answer                 | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom   | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions                 | QuestionAnswerFlow                                                          |
	| CORE OR NON CORE | CORE          | MOONWALK GREY          | Full              | 1RYL-02-CORE           | 1RYL-02-MOONWALK GREY | 0                    | 1                 | 0                        | FALSE            |                                     | {CORE OR NON CORE : CORE}=>{CORE : MOONWALK GREY }                          |
	| FIXINGS          | FIXINGS       | LINKED                 | Full              | CHAIR LINKING KIT      | CHAIR LINKING KIT     | 0                    | 1                 | 0                        | TRUE             |                                     | {FIXINGS : LINKED}                                                          |
	| SEAT UPHOLSTERY  | PRICE GROUP C | PANVELLE STRETCH PLAIN | Full              | 1RYL-02-SEAT-C         |                       | 0                    | 2.5               | 5                        |                  |                                     | {SEAT UPHOLSTERY : PRICE GROUP C}=>{PRICE GROUP C : PANVELLE STRETCH PLAIN} |
	| BACK UPHOLSTERY  | EVE           | INK                    | Full              | 1RYL-02-BACK-A         | 10-11-98-000          | 0                    | 2.2               | 5                        |                  |                                     | {BACK UPHOLSTERY : PRICE GROUP A}=>{PRICE GROUP A : EVE}=>{EVE : INK}       |
	| WEIGHT           | WEIGHT        | EXTRA WEIGHT (+44KG)   | Full              | WEIGHT-NON-STD         | SAND BAG (22KG)       | 0                    | 2                 | 0                        | FALSE            | Increase FILLING time by 10 minutes | {WEIGHT : EXTRA WEIGHT (+44KG)}                                             |
	| OUTDOOR USE      | OUTDOOR USE   | REQUIRED               | Full              | OUTDOOR-USE            |                       |                      |                   |                          |                  | Add DRILLING operation              | {OUTDOOR USE : REQUIRED}                                                    |
And quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

When I approve sales options for line "1" of quotation "G/02" with following price additions and final unit price "2323" and discount "10"
	| RootQuestion | UnitPrice | Discount % |
Then I should be notified with an error message "Component To Add To BOM and Component Quantity are incorrectly defined - this line cannot be approved"

@QuotationApprovalWhenLineOptionsArePresent
Scenario: Approve quotation without approving line options present on quotation
When I add quotation part line to quotation with following details
    | QuotationNumber | QuotationSection | PartNumber | TaxCode | DeliveryDate | Discount | Probability | Quantity | UnitPrice | SalesNominalCode | CommercialNote | AdvisoryNoteText | ProductionNote |
    | G/02            | Current Year     | 1RYL-02    | VAT     | Today        | 10       | 2           | 20       | 20000     | OFFICE EQUIPMENT | Any Text       | advisory note 1  |                |
Then following sales options should be present on line number "1" of quotation "G/02"
	| RootQuestion     | NextQuestion     | Answer | SalesOptionStatus | SalesPartToUseForPrice | ComponentToAddToBom | ComponentSetQuantity | ComponentQuantity | ComponentScrapPercentage | PhantomComponent | RoutingInstructions | QuestionAnswerFlow              |
	| CORE OR NON CORE | CORE OR NON CORE |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {CORE OR NON CORE : UNANSWERED} |
	| FIXINGS          | FIXINGS          |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {FIXINGS : UNANSWERED}          |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {SEAT UPHOLSTERY : UNANSWERED}  |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {BACK UPHOLSTERY : UNANSWERED}  |
	| WEIGHT           | WEIGHT           |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {WEIGHT : UNANSWERED}           |
	| OUTDOOR USE      | OUTDOOR USE      |        | Pending           |                        |                     |                      |                   |                          |                  |                     | {OUTDOOR USE : UNANSWERED}      |
And count of sales options should be "6" for line number "1" of quotation "G/02"
And quotation part line number "1" of quotation "G/02" should have sales option status as "Pending"
And quotation "G/02" should have sales option status as "Pending"
When I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question         | Answer               |
	| CORE OR NON CORE | CORE OR NON CORE | CORE                 |
	| FIXINGS          | FIXINGS          | LINKED               |
	| SEAT UPHOLSTERY  | SEAT UPHOLSTERY  | PRICE GROUP A        |
	| BACK UPHOLSTERY  | BACK UPHOLSTERY  | PRICE GROUP A        |
	| WEIGHT           | WEIGHT           | EXTRA WEIGHT (+44KG) |
	| OUTDOOR USE      | OUTDOOR USE      | REQUIRED             |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion     | Question      | Answer        |
	| CORE OR NON CORE | CORE          | MOONWALK GREY |
	| SEAT UPHOLSTERY  | PRICE GROUP A | EVE           |
	| BACK UPHOLSTERY  | PRICE GROUP A | EVE           |
And I give following answers for option questions present on line number "1" of quotation "G/02"
	| RootQuestion    | Question | Answer |
	| SEAT UPHOLSTERY | EVE      | INK    |
	| BACK UPHOLSTERY | EVE      | INK    |
Then quotation part line number "1" of quotation "G/02" should have sales option status as "Full"
And quotation "G/02" should have sales option status as "Full"

# Approve Quotation without approving line options
When I approve quotation number "G/02"
Then I should be notified with an error message "All Sales Options on the Quotation must be approved"