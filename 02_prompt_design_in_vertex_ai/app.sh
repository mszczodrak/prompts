# gcloud auth login

cat << EOF > request.json
{
    "contents": [
        {
            "role": "user",
            "parts": [
                {
                    "text": "Customer Notes for 'SafeHarbor Warehousing':\n\"The applicant is seeking coverage for their 50,000 sq ft warehouse. The business is 5 years old. The building is a concrete tilt-up structure, originally built in 2010. They store a variety of non-hazardous dry goods.\nFire safety measures include a full sprinkler system, a centrally monitored fire alarm, and documented annual inspections by a certified third party.\nSecurity measures include a 24/7 centrally monitored burglar alarm, comprehensive security camera coverage of the interior and exterior, a fully fenced perimeter, and nightly patrols by a contracted security guard service.\nThe company reports no major property or liability losses in their 5-year history. They have specifically asked to ensure their new automated shelving and retrieval system, installed last month, is adequately covered under the policy.\"\n\nYour Task:\n1. Briefly summarize the key details of the 'SafeHarbor Warehousing' business and its existing safety measures.\n2. Based *only* on the notes provided, identify any immediate questions an underwriter should ask or potential risk factors they should consider further.\nPresent the summary first, then the questions/risk factors as bullet points."
                }
            ]
        }
    ]
    , "systemInstruction": {
        "parts": [
        {
            "text": "You are an expert AI assistant for an insurance underwriting department.\nYour primary goal is to help underwriters by accurately and concisely summarizing client information and highlighting potential risk factors.\nMaintain a professional and objective tone.\nFocus only on the information provided in the prompt. Do not invent details."
        }
      ]
    }
    , "generationConfig": {
        "temperature": 1
        ,"maxOutputTokens": 65535
        ,"topP": 1
    },
    "safetySettings": [
        {
            "category": "HARM_CATEGORY_HATE_SPEECH",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_HARASSMENT",
            "threshold": "OFF"
        }
    ]
}
EOF

PROJECT_ID="qwiklabs-gcp-01-117bc71516c1"
LOCATION_ID="global"
API_ENDPOINT="aiplatform.googleapis.com"
MODEL_ID="gemini-2.5-pro-preview-06-05"
GENERATE_CONTENT_API="streamGenerateContent"

curl \
-X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
"https://${API_ENDPOINT}/v1/projects/${PROJECT_ID}/locations/${LOCATION_ID}/publishers/google/models/${MODEL_ID}:${GENERATE_CONTENT_API}" -d '@request.json'