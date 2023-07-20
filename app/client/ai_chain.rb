class AiChain
  attr_reader :client

  def initialize(index_name:)
    @client = Langchain::Vectorsearch::Qdrant.new(
      url: ENV["QDRANT_URL"],
      api_key: ENV["QDRANT_API"],
      index_name: index_name,
      llm: Langchain::LLM::OpenAI.new(api_key: ENV["OPEN_AI_API"])
    )
    
    @client.create_default_schema    
  end
end
