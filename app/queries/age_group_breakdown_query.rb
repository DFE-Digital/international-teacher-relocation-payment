class AgeGroupBreakdownQuery
  def initialize(relation = Applicant.all)
    @relation = relation
  end

  def call
    ages = @relation.select("*, FLOOR(EXTRACT(YEAR FROM AGE(NOW(), date_of_birth))) as age").filter_map(&:age)

    age_groups = Hash.new(0)

    ages.each do |age|
      case age
      when 18..25
        age_groups["18-25"] += 1
      when 26..35
        age_groups["26-35"] += 1
      when 36..45
        age_groups["36-45"] += 1
      when 46..55
        age_groups["46-55"] += 1
      when 56..65
        age_groups["56-65"] += 1
      when 66..75
        age_groups["66-75"] += 1
      when 76..85
        age_groups["76-85"] += 1
      when 86..95
        age_groups["86-95"] += 1
      else
        age_groups["Other"] += 1
      end
    end

    age_groups.sort_by { |k, _v| k }.to_h
  end
end
