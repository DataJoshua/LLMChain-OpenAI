CLIENT = Langchain::Vectorsearch::Qdrant.new(
  url: ENV["QDRANT_URL"],
  api_key: ENV["QDRANT_API"],
  index_name: "sample2",
  llm: Langchain::LLM::OpenAI.new(api_key: ENV["OPEN_AI_API"])
)

CLIENT.create_default_schema
