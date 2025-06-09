# Insurance Risk Summary - Prototype

## System Instructions

```bash
You are an expert AI assistant for an insurance underwriting department.
Your primary goal is to help underwriters by accurately and concisely summarizing client information and highlighting potential risk factors.
Maintain a professional and objective tone.
Focus only on the information provided in the prompt. Do not invent details.
```

## Prompt

```bash
Customer Notes for 'SafeHarbor Warehousing':
"The applicant is seeking coverage for their 50,000 sq ft warehouse. The business is 5 years old. The building is a concrete tilt-up structure, originally built in 2010. They store a variety of non-hazardous dry goods.
Fire safety measures include a full sprinkler system, a centrally monitored fire alarm, and documented annual inspections by a certified third party.
Security measures include a 24/7 centrally monitored burglar alarm, comprehensive security camera coverage of the interior and exterior, a fully fenced perimeter, and nightly patrols by a contracted security guard service.
The company reports no major property or liability losses in their 5-year history. They have specifically asked to ensure their new automated shelving and retrieval system, installed last month, is adequately covered under the policy."

Your Task:
1. Briefly summarize the key details of the 'SafeHarbor Warehousing' business and its existing safety measures.
2. Based *only* on the notes provided, identify any immediate questions an underwriter should ask or potential risk factors they should consider further.
Present the summary first, then the questions/risk factors as bullet points.
```

# Insurance Claim Data Extraction

## System Instructions

```bash
You are an AI assistant specializing in parsing and extracting specific data points from unstructured insurance claim notifications.
Your goal is to identify and list key information accurately.
If a piece of information is not found, clearly state "Not found".
Output the extracted information in a key: value format, with each key on a new line.
```

## Prompt

```bash
Claim Notification Received:
"Hi team, just got a call from Mrs. Eleanor Vance, policy #POL458892. She reported a kitchen fire that occurred on May 12th, 2025, around 3 PM. The main damage seems to be to the oven and surrounding cabinets. She mentioned smoke damage in the kitchen and dining area too. She thinks the total damage might be around $7,500. Her contact is 555-0123. No injuries reported, thankfully."

Extract the following:
- Policy Number
- Claimant Name
- Date of Loss
- Time of Loss
- Type of Loss
- Brief Description of Damage
- Estimated Loss Amount
- Injuries Reported
```

Example Input

```bash
Claim Notification Received:
"Email from John Sterling (policy POL77521) re: water damage at his shop. Happened sometime last night, May 10th, 2025. A pipe burst in the ceiling. Stockroom is flooded, some damage to inventory. He's not sure on the cost yet, maybe $5k-$10k? No one was there, so no injuries."

Extract the following:
- Policy Number
- Claimant Name
- Date of Loss
- Time of Loss
- Type of Loss
- Brief Description of Damage
- Estimated Loss Amount
- Injuries Reported
```

Example Output

```bash
Policy Number: POL77521
Claimant Name: John Sterling
Date of Loss: May 10th, 2025
Time of Loss: Night
Type of Loss: Water damage
Brief Description of Damage: Pipe burst in ceiling, stockroom flooded, some damage to inventory.
Estimated Loss Amount: $5,000 - $10,000
Injuries Reported: No
```

# Comparison Base - Restaurant Risks

## System Instructions

```bash
You are an insurance risk analyst assistant. Your task is to identify potential risk factors from a given scenario. Be concise.
```

## Prompt 1

```bash
Scenario:
"The applicant, 'The Fiery Grill,' is a new upscale restaurant specializing in wood-fired oven pizzas and open-flame grilling. They have installed a brand new, custom-built fire suppression system for their cooking area, but it has not yet been certified by a third party. The restaurant plans to feature live acoustic music on weekend evenings and has a small, raised stage area. They also want to offer valet parking."

Based on this scenario, list three primary risk factors an underwriter should consider.
```

## Prompt 2

```bash
You are an expert insurance risk analyst assistant. Your task is to identify potential risk factors from a given scenario. For each risk factor, also briefly suggest a potential mitigation strategy or question for the underwriter. Be clear and structured.

Scenario:
"The applicant, 'The Fiery Grill,' is a new upscale restaurant specializing in wood-fired oven pizzas and open-flame grilling. They have installed a brand new, custom-built fire suppression system for their cooking area, but it has not yet been certified by a third party. The restaurant plans to feature live acoustic music on weekend evenings and has a small, raised stage area. They also want to offer valet parking."

Based on this scenario, list three primary risk factors an underwriter should consider.
```