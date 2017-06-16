# School Model
class School < ApplicationRecord
  has_and_belongs_to_many :users
  has_many                :subjects, dependent: :destroy
  has_many                :grades
  
  # No es necesario ingresar código para creación de colegio
  validates :code, presence: false
end
