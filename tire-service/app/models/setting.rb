# frozen_string_literal: true

# RailsSettings Model
class Setting < RailsSettings::Base
  store File.join(Rails.root, "config", "app.yml")
  cache_prefix { "v1" }

  field :title, type: :string, default: "Tire Service"
  field :vat, type: :string, default: 20
  field :currency, type: :string, default: "$"
  field :company_name, type: :string, default: "LTD Tire Service"
  field :iban, type: :string, default: "ААВВ ССС DDDD ЕЕЕЕ ЕЕЕЕ ЕЕЕЕ ЕЕЕЕ"
  field :payer_account_number, type: :string, default: 156_212_314
  field :admin_emails, default: "admin@rubyonrails.org", type: :array

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end
