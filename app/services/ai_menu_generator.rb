class AiMenuGenerator
  def self.generate(prompt)
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [
        {
          role: "user",
          content: "Generate a menu in JSON format. Example: {\"title\":\"Sunday Supper\", \"foods\":\"chicken, rice, and soup\"}. Now do this: #{prompt}"
        }
      ]
    })

    content = response.dig("choices", 0, "message", "content")

    # Try parsing JSON; fallback to text if parsing fails
    JSON.parse(content) rescue { "title" => "Generated Menu", "foods" => content }
  end
end
