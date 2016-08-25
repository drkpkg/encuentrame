class Person
  include Mongoid::Document
  include Mongoid::Timestamps
  include CarrierWave::Mongoid

  field :name, type: String
  field :lastname, type: String
  field :age, type: Integer
  field :sex, type: String
  field :complextion, type: String
  field :stature, type: String
  field :country, type: String
  field :state, type: String
  field :city, type: String
  field :last_location, type: Array
  field :description, type: String
  field :contact_info, type: Hash
  field :records, type: Array

  mount_uploader :photo, PersonUploader

  validates_presence_of :name, :lastname, :age, :sex, :complextion, :stature, :country, :state, :city, :description, :contact_info, message: "#{I18n.t('blank_fields').capitalize}"

  def complete_name
    "#{self.name} #{self.lastname}"
  end

  def genre
    case self.sex
      when 'm'
        return "#{I18n.t('male')}"
      when 'f'
        return "#{I18n.t('female')}"
    end
  end

  def country_name
    CS.countries.each do |key,value|
      return value if key.to_s == self.country
    end
  end

  def state_name
    CS.states(self.country).each do |key,value|
      return value if key.to_s == self.state
    end
  end

  def city_name
    CS.cities(self.state).each do |key, value|
      return value if key.to_s == self.city
    end
  end

  def stature_in_cm
    return "#{self.stature * 100} cm" if !self.stature.nil?
    return "#{I18n.t('not_defined')}" if self.stature.nil?
  end

  def complextion_description
    case self.complextion
      when 0
        return "#{I18n.t('thin')}"
      when 1
        return "#{I18n.t('normal')}"
      when 2
        return "#{I18n.t('obese')}"
      else
        return "#{I18n.t('not_defined')}"
    end
  end

  def contact_info_hash=(array_of_data)
    self.contact_info[:email] = array_of_data[0]
    self.contact_info[:phone] = array_of_data[1]
  end

  def contact_info_email
    begin
      return self.contact_info['email']
    rescue
      return "#{I18n.t('not_defined')}"
    end
  end

  def contact_info_phone_numbers
    begin
      return self.contact_info['phone'].join(' - ')
    rescue
      return "#{I18n.t('not_defined')}"
    end
  end

end
