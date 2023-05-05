module VisaHelper
  def visa_options
    visas = Applicants::Visa::VISA_OPTIONS.dup
    options_for_select(visas.unshift(nil))
  end
end