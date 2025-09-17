class AiMenuGenerator
  def self.generate(prompt)
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [
        {
          role: "user",
          content: "Generate a menu as a JSON array of food names. Do not include any explanation or extra text. Only return valid JSON. Example: [\"Taco Night\", \"Homemade Pizza\", \"Pasta Bar\", \"Dessert\"]"
        }
      ]
    })

    content = response.dig("choices", 0, "message", "content")

    # Try parsing JSON; fallback to text if parsing fails
    JSON.parse(content) rescue { "title" => "Generated Menu", "foods" => content }
  end
end
