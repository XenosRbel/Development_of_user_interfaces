# frozen_string_literal: true

OPERATOR_CODES = %w[17 29 33 44].freeze

def self.create_belarus_phone_number
  operator_code = OPERATOR_CODES[FFaker::Random.rand(0..OPERATOR_CODES.count - 1)]
  number = "+375#{operator_code}#{rand(10**7)}"

  p("#{__method__}\t#{number}")

  number
end

def self.create_admin_master
  Admin::Master.create(
    last_name: FFaker::NameRU.last_name,
    first_name: FFaker::NameRU.first_name,
    father_name: FFaker::NameRU.middle_name_male,
    phone_number: create_belarus_phone_number,
    specialization: FFaker::Education.degree,
    work_experience: FFaker::Random.rand(0.0..9)
  )
end

def self.create_admin_customer
  Admin::Customer.create(
    last_name: FFaker::NameRU.last_name,
    first_name: FFaker::NameRU.first_name,
    father_name: FFaker::NameRU.middle_name_male,
    phone_number: create_belarus_phone_number
  )
end

def self.create_admin_discount
  Admin::Discount.create(
    percent: FFaker::Random.rand(0..100),
    description: FFaker::Lorem.characters,
    title: FFaker::Lorem.words,
    start_date_at: FFaker::Random.rand(0..10).days.ago,
    end_date_at: FFaker::Random.rand(0..10).days.from_now
  )
end

def self.create_admin_service
  Admin::Service.create(
    price: FFaker::Random.rand(0..1000),
    description: FFaker::Lorem.characters,
    title: FFaker::Lorem.words
  )
end

def self.create_admin_order(service, master, discount, customer)
  Admin::Order.create(
    service_ids: [service.id],
    start_execution_at: FFaker::Random.rand(0..10).days.ago,
    end_execution_at: FFaker::Random.rand(0..10).days.from_now,
    master: master,
    discount: discount,
    customer: customer
  )
end

def self.create_admin_news
  Admin::News.create(
    created_at: FFaker::Random.rand(1..24).months.ago,
    title: FFaker::Book.title,
    content: FFaker::Lorem.sentences(10).join(" ").html_safe
  )
end

10.times do |_n|
  master = create_admin_master
  customer = create_admin_customer
  discount = create_admin_discount
  service = create_admin_service
  create_admin_order(service, master, discount, customer)

  print "Generate fake data successfully\n"
end

100.times do |_n|
  Admin::Customer.create(
    created_at: FFaker::Random.rand(1..24).months.from_now,
    last_name: FFaker::NameRU.last_name,
    first_name: FFaker::NameRU.first_name,
    father_name: FFaker::NameRU.middle_name_male,
    phone_number: create_belarus_phone_number
  )
  create_admin_news
  print "Generate fake data successfully\n"
end
