# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# :name, :lastname, :age, :sex, :country, :state, :city, :last_location, :description, :contact_info, :photo


Person.create(photo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/files/nino.jpg"),
                                                            :filename => "nino.jpg",
                                                            :content_type => 'image/jpg'),
              name: 'Juan Carlos',
              lastname: 'Gutierrez',
              age: 9,
              sex: 'm', country: 'BO',
              state: 'BO-S', city: '',
              last_location:[-17.7456355,-63.1207882],
              description:'Some description',
              contact_info: {email: 'email@server.com', phone:[1234567,8765443]})

Person.create(photo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/files/hombre.jpg"),
                                                            :filename => "hombre.jpg",
                                                            :content_type => 'image/jpg'),
              name: 'Augusto Daniel',
              lastname: 'Perez Cera',
              age: 18,
              sex: 'm', country: 'BO',
              state: 'BO-S', city: '',
              last_location:[-17.7456355,-63.1207882],
              description:'Some description',
              contact_info: {email: 'email@server.com', phone:[1234567,8765443]})

Person.create(photo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/files/mujer.jpg"),
                                                            :filename => "mujer.jpg",
                                                            :content_type => 'image/jpg'),
              name: 'Andrea Julia',
              lastname: 'Martinez Cordova',
              age: 22,
              sex: 'f', country: 'BO',
              state: 'BO-S', city: '',
              last_location:[-17.7456355,-63.1207882],
              description:'Some description',
              contact_info: {email: 'email@server.com', phone:[1234567,8765443]})
