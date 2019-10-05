# frozen_string_literal: true

class FieldOfStudy < ApplicationRecord
  enum field_type: %i[humanities administrative artistic medical social_sciences natural_sciences
                      formal_sciences technical sports linguistic economical pedagogical law
                      psychological military agricultural others] # Should refactor to new model :/
  validates :name, :field_type, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  has_many :study_interests
  has_many :users, through: :study_interests
  has_many :field_details
  has_many :academies, through: :field_details
  has_many :interesteds, through: :field_details

  has_many :field_opinions
  paginates_per 5
end
