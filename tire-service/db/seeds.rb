# frozen_string_literal: true

def self.create_admin_master
  Admin::Master.create(
    last_name: FFaker::NameRU.last_name,
    first_name: FFaker::NameRU.first_name,
    father_name: FFaker::NameRU.middle_name_male,
    phone_number: FFaker::PhoneNumber.phone_number,
    specialization: FFaker::Job.title,
    work_experience: FFaker::Random.rand(0.0..9)
  )
end

def self.create_admin_customer
  Admin::Customer.create(
    last_name: FFaker::NameRU.last_name,
    first_name: FFaker::NameRU.first_name,
    father_name: FFaker::NameRU.middle_name_male,
    phone_number: FFaker::PhoneNumber.phone_number
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

10.times do |_n|
  master = create_admin_master
  customer = create_admin_customer
  discount = create_admin_discount
  service = create_admin_service
  create_admin_order(service, master, discount, customer)
end
