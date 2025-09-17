class AiMenuGenerator
  def self.generate(prompt)
    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [
          { role: "system", content: "You are a menu generator that outputs only valid JSON." },
          { role: "user", content: "Return a JSON object with a 'foods' key containing an array of food names. Example: { \"foods\": [\"Taco Night\", \"Pizza\"] }. Do not include any text outside the JSON. Prompt: #{prompt}" }
        ],
        response_format: { type: "json_object" }
      }
    )

    raw = response.dig("choices", 0, "message", "content")
    Rails.logger.debug("AI raw response: #{raw.inspect}")

    parsed = JSON.parse(raw)
    Rails.logger.debug("AI parsed response: #{parsed.inspect}")

    parsed
  rescue JSON::ParserError => e
    Rails.logger.error("AI response parse error: #{e.message}")
    {}
  rescue => e
    Rails.logger.error("AI menu generator error: #{e.class} - #{e.message}")
    {}
  end
end
