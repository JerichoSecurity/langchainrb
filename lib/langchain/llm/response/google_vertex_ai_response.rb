# frozen_string_literal: true

module Langchain::LLM
  class GoogleVertexAiResponse < BaseResponse
    attr_reader :prompt_tokens

    def initialize(raw_response, model: nil)
      @prompt_tokens = prompt_tokens
      super(raw_response, model: model)
    end

    def embedding
      embeddings.first
    end

    def total_tokens
      raw_response.dig(:predictions, 0, :embeddings, :statistics, :token_count)
    end

    def embeddings
      [raw_response.dig(:predictions, 0, :embeddings, :values)]
    end
  end
end
