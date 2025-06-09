import FirebaseAI
import Foundation

public func generateContent() async throws {
  #error("""
  Your prompt includes the seed parameter, which is not currently supported by the Firebase AI SDK.
  If it's OK to not have the seed as part of your request, you can remove this exception.
  """)

  let generationConfig = GenerationConfig(
    temperature: 1
    ,topP: 1
    ,maxOutputTokens: 65535
  )
  let safetySettings = [
    SafetySetting(
      harmCategory: .hateSpeech,
      threshold: .off
    ),
    SafetySetting(
      harmCategory: .dangerousContent,
      threshold: .off
    ),
    SafetySetting(
      harmCategory: .sexuallyExplicit,
      threshold: .off
    ),
    SafetySetting(
      harmCategory: .harassment,
      threshold: .off
    )
  ]
  let siText1 = "You are an expert AI assistant for an insurance underwriting department.\nYour primary goal is to help underwriters by accurately and concisely summarizing client information and highlighting potential risk factors.\nMaintain a professional and objective tone.\nFocus only on the information provided in the prompt. Do not invent details."
  let systemInstruction = ModelContent(
    role: "system",
    parts: siText1
  )
  let model = FirebaseAI.firebaseAI(backend: .vertexAI(location: "global")).generativeModel(
    modelName: "gemini-2.5-pro-preview-06-05",
    generationConfig: generationConfig,
    safetySettings: safetySettings,
    systemInstruction: systemInstruction
  )

  let msg1Text1 = "Customer Notes for 'SafeHarbor Warehousing':\n\"The applicant is seeking coverage for their 50,000 sq ft warehouse. The business is 5 years old. The building is a concrete tilt-up structure, originally built in 2010. They store a variety of non-hazardous dry goods.\nFire safety measures include a full sprinkler system, a centrally monitored fire alarm, and documented annual inspections by a certified third party.\nSecurity measures include a 24/7 centrally monitored burglar alarm, comprehensive security camera coverage of the interior and exterior, a fully fenced perimeter, and nightly patrols by a contracted security guard service.\nThe company reports no major property or liability losses in their 5-year history. They have specifically asked to ensure their new automated shelving and retrieval system, installed last month, is adequately covered under the policy.\"\n\nYour Task:\n1. Briefly summarize the key details of the 'SafeHarbor Warehousing' business and its existing safety measures.\n2. Based *only* on the notes provided, identify any immediate questions an underwriter should ask or potential risk factors they should consider further.\nPresent the summary first, then the questions/risk factors as bullet points."
  // For multi-turn responses, start a chat session.
  let chat = model.startChat()

  try await sendMessage(chat: chat, content: msg1Text1)
}

private func sendMessage(chat: Chat, content: any PartsRepresentable...) async throws {
  let response = try await chat.sendMessage(content)
  print(response.text ?? "No text in response")
}