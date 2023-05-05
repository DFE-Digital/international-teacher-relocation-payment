module PersonalDetailHelper
  def nationality_options
    nationalities = NATIONALITIES.dup
    options_for_select(nationalities.unshift(nil))
  end
end