class PastCase {
  final String caseTitle;
  final String summary;
  final String decision;

  PastCase({
    required this.caseTitle,
    required this.summary,
    required this.decision,
  });
}

class CaseModel {
  final String caseNumber;
  final String caseTitle;
  final String status;
  final String summary;
  final String evidenceWeightage;
  final String severityLevel;
  final String decisionStatus;
  final String hearingDate;
  final int witnessCount;
  final bool isBailEligible;
  final List<PastCase>? pastCases;

  CaseModel({
    required this.caseNumber,
    required this.caseTitle,
    required this.status,
    required this.summary,
    required this.evidenceWeightage,
    required this.severityLevel,
    required this.decisionStatus,
    required this.hearingDate,
    required this.witnessCount,
    required this.isBailEligible,
    this.pastCases,
  });
}

// Dummy database for active cases

final List<CaseModel> dummyCases = [
  // Case 1: Robbery at Central Bank
  CaseModel(
    caseNumber: 'CR-1001',
    caseTitle: 'Robbery at Central Bank',
    status: 'Hearing Scheduled',
    summary:
        'A group robbed the Central Bank and stole ₹10,00,000. The police caught 2 suspects.',
    evidenceWeightage: 'Strong',
    severityLevel: 'Severe',
    decisionStatus: 'Pending',
    hearingDate: '2024-07-10',
    witnessCount: 3,
    isBailEligible: false,
    pastCases: [
      PastCase(
        caseTitle: 'State vs John Doe, 2015',
        summary:
            'In 2015, John Doe and his accomplice robbed ₹5,00,000 from a national bank. CCTV footage captured their entry and exit, showing them brandishing firearms. Several employees provided eyewitness accounts identifying the suspects.',
        decision:
            'The court convicted John Doe under IPC sections 392 and 397, sentencing him to 7 years of rigorous imprisonment.',
      ),
      PastCase(
        caseTitle: 'People vs Unknown, 2017',
        summary:
            'A local cooperative bank was robbed of ₹2,00,000. Despite detailed investigations, no evidence like CCTV footage, fingerprints, or credible witnesses could be found. Authorities suspected an insider job, but no leads emerged.',
        decision:
            'The case was dismissed due to lack of substantial evidence and no identified suspects.',
      ),
    ],
  ),

  // Case 2: Assault at Metro Station
  CaseModel(
    caseNumber: 'CR-2002',
    caseTitle: 'Assault at Metro Station',
    status: 'Evidence Collection',
    summary:
        'An altercation at Metro Station resulted in a physical assault, causing severe injuries to the victim.',
    evidenceWeightage: 'Moderate',
    severityLevel: 'Moderate',
    decisionStatus: 'Pending',
    hearingDate: '2024-08-15',
    witnessCount: 5,
    isBailEligible: true,
    pastCases: [
      PastCase(
        caseTitle: 'State vs Ravi Kumar, 2016',
        summary:
            'In 2016, Ravi Kumar attacked a colleague during a workplace altercation. CCTV cameras recorded the entire incident. Medical reports confirmed severe bruises and fractures sustained by the victim.',
        decision:
            'Ravi Kumar was convicted under IPC section 323 and fined ₹50,000 as a penalty.',
      ),
    ],
  ),

  // Case 3: Cyber Fraud in Online Banking
  CaseModel(
    caseNumber: 'CR-3003',
    caseTitle: 'Cyber Fraud in Online Banking',
    status: 'Investigation Ongoing',
    summary:
        'A series of fraudulent transactions resulted in a loss of ₹1,50,000 to multiple customers of XYZ Bank.',
    evidenceWeightage: 'Strong',
    severityLevel: 'Severe',
    decisionStatus: 'Under Investigation',
    hearingDate: '2024-09-05',
    witnessCount: 2,
    isBailEligible: false,
    pastCases: [
      PastCase(
        caseTitle: 'State vs Unknown Hacker, 2018',
        summary:
            'In 2018, phishing emails targeting bank customers caused losses of ₹75,000. Despite technical analysis, authorities could not trace the hacker’s IP address or origin.',
        decision:
            'The case was closed without resolution as no suspects were identified.',
      ),
      PastCase(
        caseTitle: 'State vs Pankaj Sharma, 2019',
        summary:
            'Pankaj Sharma orchestrated a cyber fraud scheme by obtaining bank credentials from phishing websites. Multiple customers suffered financial losses amounting to ₹2,00,000.',
        decision:
            'Pankaj Sharma was convicted under IPC sections 420 and 66D of the IT Act, receiving 3 years imprisonment.',
      ),
    ],
  ),

  // Case 4: Land Dispute in Village Sector 12
  CaseModel(
    caseNumber: 'CR-4004',
    caseTitle: 'Land Dispute in Village Sector 12',
    status: 'Hearing Scheduled',
    summary:
        'A land ownership dispute arose between two families in Village Sector 12, leading to civil unrest.',
    evidenceWeightage: 'Moderate',
    severityLevel: 'Low',
    decisionStatus: 'Pending',
    hearingDate: '2024-07-20',
    witnessCount: 4,
    isBailEligible: true,
    pastCases: [
      PastCase(
        caseTitle: 'Ram Singh vs Shyam Singh, 2012',
        summary:
            'In 2012, Ram Singh and Shyam Singh disputed the ownership of 5 acres of farmland. Survey records and old land deeds were presented as evidence. Both parties claimed ancestral rights.',
        decision:
            'The court ruled in favor of Ram Singh after validating the original land survey documents.',
      ),
    ],
  ),

  // Case 5: Hit-and-Run Accident
  CaseModel(
    caseNumber: 'CR-5005',
    caseTitle: 'Hit-and-Run Accident',
    status: 'Charges Filed',
    summary:
        'A speeding vehicle hit a pedestrian and fled the scene, leaving the victim critically injured.',
    evidenceWeightage: 'Weak',
    severityLevel: 'Moderate',
    decisionStatus: 'Charges Filed',
    hearingDate: '2024-08-01',
    witnessCount: 2,
    isBailEligible: false,
    pastCases: [
      PastCase(
        caseTitle: 'State vs Unknown Driver, 2014',
        summary:
            'In 2014, a hit-and-run case occurred late at night. Despite eyewitnesses claiming to have seen a white sedan, the lack of license plate details hindered identification. No CCTV footage was available.',
        decision:
            'The case was closed under Section 279 of IPC due to insufficient evidence.',
      ),
    ],
  ),

  // Case 6: Smuggling of Illegal Goods
  CaseModel(
    caseNumber: 'CR-6006',
    caseTitle: 'Smuggling of Illegal Goods',
    status: 'Investigation Ongoing',
    summary:
        'Authorities intercepted a truck containing smuggled goods worth ₹25,00,000 at the state border.',
    evidenceWeightage: 'Strong',
    severityLevel: 'Severe',
    decisionStatus: 'Under Investigation',
    hearingDate: '2024-09-10',
    witnessCount: 6,
    isBailEligible: false,
    pastCases: [
      PastCase(
        caseTitle: 'State vs Surendra Patel, 2020',
        summary:
            'In 2020, Surendra Patel was caught smuggling banned goods valued at ₹10,00,000 across the state border. A police raid uncovered the illicit cargo hidden beneath agricultural produce.',
        decision:
            'Surendra Patel was convicted under the Customs Act and sentenced to 5 years imprisonment.',
      ),
      PastCase(
        caseTitle: 'State vs Unknown, 2021',
        summary:
            'Authorities discovered smuggled electronics worth ₹8,00,000 abandoned in a truck at the state border. Investigations revealed the vehicle was stolen but failed to identify the smugglers.',
        decision:
            'The case was closed after failing to locate the individuals involved in the operation.',
      ),
    ],
  ),
];
