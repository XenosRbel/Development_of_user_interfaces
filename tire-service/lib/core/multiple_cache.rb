# frozen_string_literal: true

class MultipleCache < ActiveSupport::Cache::Store
  attr_reader :main, :reserve
  delegate :fetch, :read, :read_multi, :fetch_multi, :write, :delete, :exist?, :increment, :decrement, to: :main

  def initialize(*_args)
    @config = ConfigReader.config_for(:redis)
    @main = build_storage(@config[:main])
  end

  def delete_matched(key, options = nil)
    @main.delete_matched(key, options)
    return unless @config[:reserve]

    @config[:reserve].each do |_key, value|
      build_storage(value).delete_matched(key, options)
    end
  end

  private

  def build_storage(storage_config = {})
    ActiveSupport::Cache::RedisCacheStore.new(storage_config.merge(namespace: "cache"))
  end
end
