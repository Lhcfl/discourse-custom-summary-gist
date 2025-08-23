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
end

require_relative "lib/discourse_custom_summary_gist/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end
