class CrimeData {
  final String crimeName;
  final bool isBailableUnderLaw;
  final bool isBailableWithConditions;
  final List<CrimeParameter> parameters;
  final String eligibleReason;
  final String ineligibleReason;
  final String furtherInstructionsEligible;
  final String furtherInstructionsWithConditions;
  final List<String> eligibleParameters;
  final List<String> ineligibleParameters;
  final List<String> conditionsParameters;
  final List<SectionPenalty> sectionsAndPenalties; // New property

  CrimeData({
    required this.crimeName,
    required this.isBailableUnderLaw,
    required this.isBailableWithConditions,
    required this.parameters,
    required this.eligibleReason,
    required this.ineligibleReason,
    required this.furtherInstructionsEligible,
    required this.furtherInstructionsWithConditions,
    required this.eligibleParameters,
    required this.ineligibleParameters,
    required this.conditionsParameters,
    required this.sectionsAndPenalties,
  });

  factory CrimeData.fromJson(Map<String, dynamic> json) {
    return CrimeData(
      crimeName: json['crimeName'],
      isBailableUnderLaw: json['isBailableUnderLaw'],
      isBailableWithConditions: json['isBailableWithConditions'],
      parameters: (json['parameters'] as List)
          .map((param) => CrimeParameter.fromJson(param))
          .toList(),
      eligibleReason: json['eligibleReason'],
      ineligibleReason: json['ineligibleReason'],
      furtherInstructionsEligible: json['furtherInstructionsEligible'],
      furtherInstructionsWithConditions:
          json['furtherInstructionsWithConditions'],
      eligibleParameters: List<String>.from(json['eligibleParameters']),
      ineligibleParameters: List<String>.from(json['ineligibleParameters']),
      conditionsParameters: List<String>.from(json['conditionsParameters']),
      sectionsAndPenalties: (json['sectionsAndPenalties'] as List)
          .map((sp) => SectionPenalty.fromJson(sp))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'crimeName': crimeName,
      'isBailableUnderLaw': isBailableUnderLaw,
      'isBailableWithConditions': isBailableWithConditions,
      'parameters': parameters.map((param) => param.toJson()).toList(),
      'eligibleReason': eligibleReason,
      'ineligibleReason': ineligibleReason,
      'furtherInstructionsEligible': furtherInstructionsEligible,
      'furtherInstructionsWithConditions': furtherInstructionsWithConditions,
      'eligibleParameters': eligibleParameters,
      'ineligibleParameters': ineligibleParameters,
      'conditionsParameters': conditionsParameters,
      'sectionsAndPenalties':
          sectionsAndPenalties.map((sp) => sp.toJson()).toList(),
    };
  }
}

class SectionPenalty {
  final String section;
  final String penalty;

  SectionPenalty({
    required this.section,
    required this.penalty,
  });

  factory SectionPenalty.fromJson(Map<String, dynamic> json) {
    return SectionPenalty(
      section: json['section'],
      penalty: json['penalty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section': section,
      'penalty': penalty,
    };
  }
}

class CrimeParameter {
  final String question;
  final String description;
  final bool isMandatory;

  CrimeParameter({
    required this.question,
    required this.description,
    required this.isMandatory,
  });

  factory CrimeParameter.fromJson(Map<String, dynamic> json) {
    return CrimeParameter(
      question: json['question'],
      description: json['description'],
      isMandatory: json['isMandatory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'description': description,
      'isMandatory': isMandatory,
    };
  }
}

final List<CrimeData> crimeDataList = [
  CrimeData(
    crimeName: "Cybercrime",
    isBailableUnderLaw: true,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Does the crime involve financial fraud?",
        description: "Financial fraud often leads to stricter bail conditions.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Was sensitive personal data breached?",
        description: "Data breaches can result in additional legal conditions.",
        isMandatory: true,
      ),
      CrimeParameter(
        question:
            "Is there evidence of unauthorized access to government systems?",
        description: "Government system breaches are treated as severe crimes.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is the accused cooperating in locating affected systems?",
        description: "Cooperation can impact bail eligibility.",
        isMandatory: false,
      ),
      CrimeParameter(
        question: "Does the accused have a history of cyber-related offenses?",
        description: "Prior offenses can heavily influence bail conditions.",
        isMandatory: true,
      ),
    ],
    eligibleReason:
        "Eligible under conditions if no financial fraud or sensitive data breach occurred.",
    ineligibleReason:
        "Severe breaches, government system intrusions, or prior cyber offenses disqualify bail.",
    furtherInstructionsEligible:
        "Proceed with bail by adhering to strict cyber monitoring protocols.",
    furtherInstructionsWithConditions:
        "Strict cyber surveillance and limited access to critical systems or networks.",
    eligibleParameters: [
      "Minimal impact caused.",
      "No financial fraud.",
      "No sensitive data breached."
    ],
    ineligibleParameters: [
      "Unauthorized access to government systems.",
      "Prior cybercrime convictions.",
      "Sensitive data breaches or significant financial fraud."
    ],
    conditionsParameters: [
      "Regular monitoring of cyber activity.",
      "Limited access to electronic devices.",
      "Cooperation with investigations and audits.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 66 IT Act",
        penalty:
            "Imprisonment up to 3 years and/or fine for hacking or unauthorized access.",
      ),
      SectionPenalty(
        section: "Section 66C IT Act",
        penalty:
            "Imprisonment up to 3 years and fine up to ₹1 lakh for identity theft.",
      ),
      SectionPenalty(
        section: "Section 66D IT Act",
        penalty:
            "Imprisonment up to 3 years and fine up to ₹1 lakh for cheating by impersonation using computer resources.",
      ),
      SectionPenalty(
        section: "Section 67 IT Act",
        penalty:
            "Imprisonment up to 3 years and fine for transmitting obscene electronic content.",
      ),
      SectionPenalty(
        section: "Section 67A IT Act",
        penalty:
            "Imprisonment up to 5 years and fine up to ₹10 lakh for transmitting sexually explicit content.",
      ),
      SectionPenalty(
        section: "Section 72 IT Act",
        penalty:
            "Imprisonment up to 2 years and/or fine for breach of confidentiality or privacy.",
      ),
      SectionPenalty(
        section: "Section 74 IT Act",
        penalty:
            "Imprisonment up to 2 years and/or fine for publication of forged digital signatures.",
      ),
      SectionPenalty(
        section: "Section 43 IT Act",
        penalty:
            "Liability to pay compensation for damage to computer systems or unauthorized access.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Theft",
    isBailableUnderLaw: true,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Was the stolen property of high monetary value?",
        description: "High-value theft can influence stricter bail conditions.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is the stolen property recovered?",
        description: "Recovery of property can improve bail eligibility.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Does the accused have a prior history of theft?",
        description: "Prior offenses can impact bail eligibility.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is the accused cooperating with recovery efforts?",
        description: "Cooperation with police aids in bail consideration.",
        isMandatory: false,
      ),
    ],
    eligibleReason:
        "Eligible if the stolen property is recovered promptly and no prior history exists.",
    ineligibleReason:
        "High-value theft, unrecovered property, or prior offenses disqualify bail.",
    furtherInstructionsEligible:
        "Bail granted with instructions to remain available for further investigation.",
    furtherInstructionsWithConditions:
        "Accused must ensure recovery efforts and report to the police periodically.",
    eligibleParameters: [
      "Stolen property recovered.",
      "No prior theft offenses.",
      "Low monetary value."
    ],
    ineligibleParameters: [
      "High-value theft.",
      "Repeat offenses.",
      "Stolen property not recovered.",
    ],
    conditionsParameters: [
      "Regular police reporting.",
      "Assisting in recovery efforts.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 378 IPC",
        penalty: "Imprisonment up to 3 years or fine or both for theft.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Assault",
    isBailableUnderLaw: true,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Was the assault premeditated or intentional?",
        description: "Premeditated assault leads to stricter bail conditions.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Did the victim suffer serious injuries?",
        description: "Serious injuries can impact bail eligibility.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is the accused cooperating in the investigation?",
        description: "Cooperation may positively influence bail conditions.",
        isMandatory: false,
      ),
      CrimeParameter(
        question: "Has the accused committed similar offenses before?",
        description: "Prior offenses can disqualify bail.",
        isMandatory: true,
      ),
    ],
    eligibleReason:
        "Eligible if the injuries are minor, and the accused has no prior record.",
    ineligibleReason:
        "Serious injuries, premeditated assault, or prior offenses disqualify bail.",
    furtherInstructionsEligible:
        "Bail granted under the condition to refrain from further violence.",
    furtherInstructionsWithConditions:
        "Restrict contact with the victim and impose movement monitoring.",
    eligibleParameters: [
      "Minor injuries caused.",
      "No prior history of assault.",
      "Accused is cooperating.",
    ],
    ineligibleParameters: [
      "Serious injuries caused.",
      "Premeditated assault.",
      "Repeat offenses.",
    ],
    conditionsParameters: [
      "Restrict contact with the victim.",
      "Regular police reporting.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 352 IPC",
        penalty: "Imprisonment up to 3 months or fine for simple assault.",
      ),
      SectionPenalty(
        section: "Section 323 IPC",
        penalty:
            "Imprisonment up to 1 year or fine up to ₹1,000 for causing hurt.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Cheating and Fraud",
    isBailableUnderLaw: true,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Was the fraud committed for monetary gain?",
        description: "Monetary fraud can impose stricter bail conditions.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is there evidence of forged documents?",
        description: "Forgery can complicate bail eligibility.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is the accused cooperating with recovery efforts?",
        description: "Cooperation aids in improving bail chances.",
        isMandatory: false,
      ),
      CrimeParameter(
        question: "Has the accused committed similar fraud before?",
        description: "Repeat fraud cases disqualify bail eligibility.",
        isMandatory: true,
      ),
    ],
    eligibleReason:
        "Eligible if cooperation is proven and financial loss is minor.",
    ineligibleReason:
        "Major monetary loss, forgery, or prior fraud disqualify bail.",
    furtherInstructionsEligible:
        "Bail granted under financial recovery efforts.",
    furtherInstructionsWithConditions:
        "Restrict access to financial activities and require regular reporting.",
    eligibleParameters: [
      "Minor financial loss.",
      "No prior fraud history.",
      "Accused is cooperative.",
    ],
    ineligibleParameters: [
      "Major financial fraud.",
      "Document forgery.",
      "Repeat fraud offenses.",
    ],
    conditionsParameters: [
      "Financial activity monitoring.",
      "Mandatory recovery efforts.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 420 IPC",
        penalty: "Imprisonment up to 7 years and fine for cheating.",
      ),
      SectionPenalty(
        section: "Section 468 IPC",
        penalty: "Imprisonment up to 7 years for forgery.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Domestic Violence",
    isBailableUnderLaw: false,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Is there evidence of physical abuse?",
        description: "Evidence of abuse can result in bail denial.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is there a restraining order in place?",
        description: "Restraining orders may influence bail conditions.",
        isMandatory: false,
      ),
      CrimeParameter(
        question: "Has the accused been reported for prior abuse?",
        description: "Repeat offenses can disqualify bail.",
        isMandatory: true,
      ),
    ],
    eligibleReason:
        "Eligible under strict conditions for first-time offenders.",
    ineligibleReason: "Repeat offenses or severe harm disqualify bail.",
    furtherInstructionsEligible:
        "Restrict contact and enforce counseling sessions.",
    furtherInstructionsWithConditions:
        "Regular police reporting and victim protection orders.",
    eligibleParameters: ["Minor harm caused.", "First-time offense."],
    ineligibleParameters: [
      "Repeat offenses.",
      "Severe physical harm.",
    ],
    conditionsParameters: [
      "Restrict victim contact.",
      "Mandatory counseling.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 498A IPC",
        penalty: "Imprisonment up to 3 years and fine for cruelty.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Drunken Driving",
    isBailableUnderLaw: true,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Did the incident cause harm or property damage?",
        description: "Harm or damage influences bail eligibility.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Does the accused have prior offenses?",
        description: "Repeat offenders face stricter conditions.",
        isMandatory: true,
      ),
    ],
    eligibleReason: "Eligible if no harm occurred and no prior record exists.",
    ineligibleReason:
        "Harm, property damage, or repeat offenses disqualify bail.",
    furtherInstructionsEligible: "Suspend license temporarily.",
    furtherInstructionsWithConditions:
        "Mandatory rehabilitation and driving restrictions.",
    eligibleParameters: [
      "No harm or property damage.",
      "First-time offender.",
    ],
    ineligibleParameters: [
      "Harm caused.",
      "Repeat offenses.",
    ],
    conditionsParameters: [
      "License suspension.",
      "Mandatory counseling.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 185 MV Act",
        penalty: "Fine up to ₹10,000 and imprisonment up to 6 months.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Robbery",
    isBailableUnderLaw: false,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Was a weapon used during the robbery?",
        description: "Use of weapons increases the severity of the crime.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Was the victim physically harmed?",
        description: "Physical harm influences bail denial.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Was stolen property recovered?",
        description: "Recovery of stolen property may impact bail eligibility.",
        isMandatory: false,
      ),
    ],
    eligibleReason:
        "Eligible if no harm occurred and stolen property is recovered.",
    ineligibleReason: "Use of weapons or physical harm disqualifies bail.",
    furtherInstructionsEligible: "Proceed with bail and ensure victim safety.",
    furtherInstructionsWithConditions:
        "Restrict movement and ensure no contact with victims.",
    eligibleParameters: [
      "No physical harm caused.",
      "Property recovered.",
    ],
    ineligibleParameters: [
      "Weapon involved.",
      "Victim harmed.",
    ],
    conditionsParameters: [
      "Victim protection order.",
      "Monitoring accused movements.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 392 IPC",
        penalty: "Imprisonment up to 10 years and fine for robbery.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Kidnapping",
    isBailableUnderLaw: false,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Was the victim a minor?",
        description: "Kidnapping minors leads to stricter bail conditions.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is there evidence of physical harm?",
        description: "Physical harm influences bail eligibility.",
        isMandatory: true,
      ),
    ],
    eligibleReason: "Eligible only if victim was released unharmed.",
    ineligibleReason: "Physical harm or kidnapping minors disqualifies bail.",
    furtherInstructionsEligible: "Release under strict monitoring.",
    furtherInstructionsWithConditions:
        "Restrict travel and ensure no victim contact.",
    eligibleParameters: [
      "Victim unharmed.",
      "Accused cooperated in release.",
    ],
    ineligibleParameters: [
      "Victim is a minor.",
      "Physical harm caused.",
    ],
    conditionsParameters: [
      "Travel restrictions.",
      "Police monitoring.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 363 IPC",
        penalty: "Imprisonment up to 7 years and fine for kidnapping.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Murder",
    isBailableUnderLaw: false,
    isBailableWithConditions: false,
    parameters: [
      CrimeParameter(
        question: "Was the murder premeditated?",
        description: "Premeditation makes bail ineligible.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is there evidence of self-defense?",
        description: "Self-defense may influence bail consideration.",
        isMandatory: false,
      ),
    ],
    eligibleReason: "null",
    ineligibleReason: "Premeditated murder disqualifies bail.",
    furtherInstructionsEligible: "null",
    furtherInstructionsWithConditions: "null",
    eligibleParameters: [],
    ineligibleParameters: [
      "Premeditated murder.",
      "Lack of evidence of self-defense.",
    ],
    conditionsParameters: [],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 302 IPC",
        penalty: "Death penalty or life imprisonment for murder.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Burglary",
    isBailableUnderLaw: true,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Was the burglary committed at night?",
        description: "Night burglary is treated more severely.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Was property damaged during the burglary?",
        description: "Property damage increases the severity of the offense.",
        isMandatory: false,
      ),
    ],
    eligibleReason: "Eligible if no property damage occurred.",
    ineligibleReason:
        "Night burglary or significant property damage disqualifies bail.",
    furtherInstructionsEligible:
        "Proceed with bail under assurance of court attendance.",
    furtherInstructionsWithConditions: "Monitor movements and restrict travel.",
    eligibleParameters: [
      "No property damage.",
      "First-time offender.",
    ],
    ineligibleParameters: [
      "Burglary occurred at night.",
      "Property damage occurred.",
    ],
    conditionsParameters: [
      "Regular reporting to authorities.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 457 IPC",
        penalty: "Imprisonment up to 5 years and fine for burglary at night.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Arson",
    isBailableUnderLaw: false,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Was there loss of life due to arson?",
        description: "Loss of life disqualifies bail.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Was the fire accidental or intentional?",
        description: "Intentional fires are treated more severely.",
        isMandatory: true,
      ),
    ],
    eligibleReason:
        "Eligible under strict conditions if the fire was accidental.",
    ineligibleReason: "Loss of life or intentional fires disqualify bail.",
    furtherInstructionsEligible: "Proceed with bail under strict supervision.",
    furtherInstructionsWithConditions: "Mandatory fire safety workshops.",
    eligibleParameters: [
      "Accidental fire.",
      "No life loss.",
    ],
    ineligibleParameters: [
      "Intentional fire.",
      "Loss of life.",
    ],
    conditionsParameters: [
      "Fire safety workshops.",
      "Property restitution.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 435 IPC",
        penalty: "Imprisonment up to 7 years and fine for mischief by fire.",
      ),
    ],
  ),
  CrimeData(
    crimeName: "Drug Trafficking",
    isBailableUnderLaw: false,
    isBailableWithConditions: true,
    parameters: [
      CrimeParameter(
        question: "Were commercial quantities of drugs involved?",
        description: "Larger quantities influence stricter bail denial.",
        isMandatory: true,
      ),
      CrimeParameter(
        question: "Is the accused cooperating with investigations?",
        description: "Cooperation may positively influence bail.",
        isMandatory: false,
      ),
    ],
    eligibleReason: "Eligible under strict conditions for small quantities.",
    ineligibleReason:
        "Large quantities or lack of cooperation disqualify bail.",
    furtherInstructionsEligible:
        "Strict drug rehabilitation and periodic police monitoring.",
    furtherInstructionsWithConditions:
        "Regular reporting and restricted travel.",
    eligibleParameters: [
      "Small drug quantities.",
      "Accused is cooperating.",
    ],
    ineligibleParameters: [
      "Commercial quantities.",
      "No cooperation.",
    ],
    conditionsParameters: [
      "Mandatory rehab.",
      "Restricted travel.",
    ],
    sectionsAndPenalties: [
      SectionPenalty(
        section: "Section 21 NDPS Act",
        penalty: "Imprisonment up to 20 years and fine for drug trafficking.",
      ),
    ],
  ),
];
