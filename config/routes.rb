# frozen_string_literal: true

DiscourseCustomSummaryGist::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::DiscourseCustomSummaryGist::Engine, at: "discourse-custom-summary-gist" }
