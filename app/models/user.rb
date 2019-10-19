# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :results

  enum gender: %i[female male not_specified]
  enum account_type: %i[schoolboy student partner admin]
  validates :username, :email, :encrypted_password, :account_type, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  has_many :matura_results
  has_many :study_interests
  has_many :matura_subjects, -> { distinct }, through: :matura_results
  has_many :field_of_studies, through: :study_interests
  has_many :field_details, through: :field_of_studies
  has_many :academy_opinions
  has_many :field_opinions
  has_many :interesteds
  belongs_to :high_school, optional: true
  belongs_to :field_of_study, optional: true
  belongs_to :academy, optional: true
  accepts_nested_attributes_for :matura_results
  accepts_nested_attributes_for :study_interests

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :encryptable

  def formulas
    field_details.collect(&:recrutation_formula)
  end

  def admin?
    account_type == 'admin'
  end

  def schoolboy?
    account_type == 'schoolboy'
  end

  def basic_results
    self.matura_results.select(&:basic?)
  end

  def advanced_results
    self.matura_results.select(&:advanced?)
  end

  def find_basic_result_for_subject_name(subject_name)
    subject = self.basic_results.find { |result| result.matura_subject.name == subject_name }

    if subject.nil?
      0
    else
      subject.result
    end
  end

  def find_advanced_result_for_subject_name(subject_name)
    subject = self.advanced_results.find { |result| result.matura_subject.name == subject_name }

    if subject.nil?
      0
    else
      subject.result
    end
  end

  def student_of_academy?(academy)
    account_type == 'student' && self.academy == academy
  end

  def student_of_field?(field_of_study)
    account_type == 'student' && self.field_of_study == field_of_study
  end

  def interested_in_field?(field)
    if field.instance_of?(FieldDetail)
      interesteds.one? { |f| f.field_detail_id == field.id }
    elsif field.instance_of?(String)
      interesteds.one? { |f| f.field_detail.field_of_study.name == field }
    else
      # raise error
    end
  end
end
