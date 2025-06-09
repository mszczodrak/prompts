package <your package>

import com.google.firebase.Firebase
import com.google.firebase.ai.ai
import com.google.firebase.ai.Chat
import com.google.firebase.ai.type.Content
import com.google.firebase.ai.type.content
import com.google.firebase.ai.type.FileDataPart
import com.google.firebase.ai.type.GenerativeBackend
import com.google.firebase.ai.type.generationConfig
import com.google.firebase.ai.type.HarmBlockThreshold
import com.google.firebase.ai.type.HarmCategory
import com.google.firebase.ai.type.InlineDataPart
import com.google.firebase.ai.type.SafetySetting
import com.google.firebase.ai.type.TextPart

public suspend fun generateContent() {
  TODO("""
    Your prompt includes the seed parameter, which is not currently supported by the Firebase AI SDK.
    If it's OK to not have the seed as part of your request, you can remove this exception.
  """.trimIndent())

  val generationConfig = generationConfig {
    maxOutputTokens = 65535
    temperature = 1f
    topP = 1f
  }
  val safetySettings = listOf(
    SafetySetting(
      harmCategory = HarmCategory.HATE_SPEECH,
      threshold = HarmBlockThreshold.OFF
    ),
    SafetySetting(
      harmCategory = HarmCategory.DANGEROUS_CONTENT,
      threshold = HarmBlockThreshold.OFF
    ),
    SafetySetting(
      harmCategory = HarmCategory.SEXUALLY_EXPLICIT,
      threshold = HarmBlockThreshold.OFF
    ),
    SafetySetting(
      harmCategory = HarmCategory.HARASSMENT,
      threshold = HarmBlockThreshold.OFF
    )
  )
  val siText1 = TextPart("You are an expert AI assistant for an insurance underwriting department.\nYour primary goal is to help underwriters by accurately and concisely summarizing client information and highlighting potential risk factors.\nMaintain a professional and objective tone.\nFocus only on the information provided in the prompt. Do not invent details.")
  val systemInstruction = content {
    part(siText1)
  }
  val model = Firebase.ai(
    backend = GenerativeBackend.vertexAI("global")
  ).generativeModel(
    modelName = "gemini-2.5-pro-preview-06-05",
    generationConfig = generationConfig,
    safetySettings = safetySettings,
    systemInstruction = systemInstruction
  )

  val msg1Text1 = TextPart("Customer Notes for 'SafeHarbor Warehousing':\n\"The applicant is seeking coverage for their 50,000 sq ft warehouse. The business is 5 years old. The building is a concrete tilt-up structure, originally built in 2010. They store a variety of non-hazardous dry goods.\nFire safety measures include a full sprinkler system, a centrally monitored fire alarm, and documented annual inspections by a certified third party.\nSecurity measures include a 24/7 centrally monitored burglar alarm, comprehensive security camera coverage of the interior and exterior, a fully fenced perimeter, and nightly patrols by a contracted security guard service.\nThe company reports no major property or liability losses in their 5-year history. They have specifically asked to ensure their new automated shelving and retrieval system, installed last month, is adequately covered under the policy.\"\n\nYour Task:\n1. Briefly summarize the key details of the 'SafeHarbor Warehousing' business and its existing safety measures.\n2. Based *only* on the notes provided, identify any immediate questions an underwriter should ask or potential risk factors they should consider further.\nPresent the summary first, then the questions/risk factors as bullet points.")

  // For multi-turn responses, start a chat session.
  val chat = model.startChat()

  sendMessage(chat, content("user") {
    part(msg1Text1)
  })
}

private suspend fun sendMessage(chat: Chat, content: Content) {
  val response = chat.sendMessage(content)
  println(response.text)
}