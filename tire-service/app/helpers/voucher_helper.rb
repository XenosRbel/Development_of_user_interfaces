# frozen_string_literal: true

module VoucherHelper
  VOUCHER_LENGTH = 12

  def create_voucher
    return if self.voucher.present?

    self.voucher = genarate_voucher(VOUCHER_LENGTH)
  end

  private

  def genarate_voucher(number)
    charset = Array("A".."Z") + Array("a".."z") + Array(0..9)
    Array.new(number) { charset.sample }.join
  end
end
