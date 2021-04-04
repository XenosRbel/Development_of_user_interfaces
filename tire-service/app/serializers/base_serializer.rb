# frozen_string_literal: true

class BaseSerializer
  include FastJsonapi::ObjectSerializer

  def serializable_hash
    hash = super
    hash.deep_transform_keys! { |key| key.to_s.camelize(:lower).to_sym } if camelize_keys?
    hash
  end
  alias to_hash serializable_hash

  def as_json
    is_collection?(@resource, @is_collection) ? as_collection_json : as_one_record_json
  end

  private

  attr_reader :params

  def camelize_keys?
    params[:camelize_keys].present?
  end

  def as_collection_json
    to_hash[:data].map { |hash| hash[:attributes] }
  end

  def as_one_record_json
    (to_hash[:data] || {})[:attributes]
  end
end
