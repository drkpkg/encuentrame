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

end
