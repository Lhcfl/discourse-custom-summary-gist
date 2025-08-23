# frozen_string_literal: true

# name: discourse-custom-summary-gist
# about: TODO
# meta_topic_id: TODO
# version: 0.0.1
# authors: Discourse
# url: TODO
# required_version: 2.7.0

enabled_site_setting :discourse_custom_summary_gist_enabled

module ::DiscourseCustomSummaryGist
  PLUGIN_NAME = "discourse-custom-summary-gist"

  module AiFoldMixin
    extend ActiveSupport::Concern

    prepended do
      alias_method :fold_old, :fold

      def fold(items, user, &on_partial_blk)
        begin
          if strategy.target.is_a?(Topic)
            text = strategy.target.first_post.raw
            return $1 if text =~ %r{\[summary\](.*?)\[/summary\]}m
          end
        rescue e
          Rails.logger.warn(e)
        end
        fold_old(items, user, &on_partial_blk)
      end
    end
  end
end

require_relative "lib/discourse_custom_summary_gist/engine"

after_initialize do
  ::DiscourseAi::Summarization::FoldContent.prepend ::DiscourseCustomSummaryGist::AiFoldMixin
end
