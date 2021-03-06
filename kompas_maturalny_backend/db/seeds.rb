NUMBER_OF_FIELDS = 70
NUMBER_OF_ACADEMIES = 40
MIN_NUMBER_OF_FIELDS_ON_ACADEMY = 20
MAX_NUMBER_OF_FIELDS_ON_ACADEMY = 65
NUMBER_OF_MATURA_RESULTS = 7
NUMBER_OF_REVIEWS = 4

puts "Seeding database"
puts "Seeding test users"
User.create(username: 'schoolboy', email: "schoolboy@example.com", role: "schoolboy", password: "test1234")
User.create(username: 'student', email: "student@example.com", role: "student", password: "test1234")
User.create(username: 'partner', email: "partner@example.com", role: "partner", password: "test1234")
User.create(username: 'admin', email: "admin@example.com", role: "admin", password: "test1234")

puts "Seeding matura subjects"
MaturaSubject.create(name: 'Chemia', level: 'advanced', subject_type: 'sciences')
MaturaSubject.create(name: 'Biologia', level: 'advanced', subject_type: 'sciences')
MaturaSubject.create(name: 'Fizyka', level: 'advanced', subject_type: 'sciences')
MaturaSubject.create(name: 'Informatyka', level: 'advanced', subject_type: 'sciences')
MaturaSubject.create(name: 'Geografia', level: 'advanced', subject_type: 'sciences')
MaturaSubject.create(name: 'Historia', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Wiedza o społeczeństwie', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Matematyka', level: 'advanced', subject_type: 'sciences')
MaturaSubject.create(name: 'Matematyka', level: 'basic', subject_type: 'sciences')
MaturaSubject.create(name: 'Polski', level: 'basic', subject_type: 'humanities')
MaturaSubject.create(name: 'Polski', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Angielski', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Angielski', level: 'basic',  subject_type: 'humanities')
MaturaSubject.create(name: 'Niemiecki', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Niemiecki', level: 'basic',  subject_type: 'humanities')
MaturaSubject.create(name: 'Francuski', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Francuski', level: 'basic', subject_type: 'humanities')
MaturaSubject.create(name: 'Hiszpański', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Hiszpański', level: 'basic', subject_type: 'humanities')
MaturaSubject.create(name: 'Rosyjski', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Rosyjski', level: 'basic', subject_type: 'humanities')
MaturaSubject.create(name: 'Włoski', level: 'advanced', subject_type: 'humanities')
MaturaSubject.create(name: 'Włoski', level: 'basic', subject_type: 'humanities')
MaturaSubject.create(name: 'Łaciński i kultura antyczna', level: 'advanced', subject_type: 'humanities')

User.all.each do |user|
  NUMBER_OF_MATURA_RESULTS.times do |i|
    puts "Seeding matura results #{i}/#{NUMBER_OF_MATURA_RESULTS}"
    user.matura_results << MaturaResult.create(matura_subject: MaturaSubject.all.sample, result: Faker::Base.rand_in_range(0, 100))
  end
end

NUMBER_OF_FIELDS.times do |i|
  puts "Seeding fields of study #{i}/#{NUMBER_OF_FIELDS}"
  FieldOfStudy.create!(
      name: "#{Faker::Educator.course_name} #{i}",
      description: Faker::Lorem.paragraph(sentence_count: 10)
  )
end

def generate_formula
  exp_number = rand(2..4)
  factor_number = rand(1..5)
  formula = ""

  exp_number.times do |i|
    formula += "["
    factor_number.times do |i|
      formula += "(#{MaturaSubject.all.sample.name.downcase}_pr*#{rand})|" if i < factor_number-1
      formula += "(#{MaturaSubject.all.sample.name.downcase}_pr*#{rand})" if i == factor_number-1
    end
    formula += "]+" if i < exp_number-1
    formula += "]" if i == exp_number-1
  end

  formula
end

NUMBER_OF_ACADEMIES.times do |i|
  puts "Seeding academies #{i}/#{NUMBER_OF_ACADEMIES}"
  academy = Academy.create!(
      name: "#{Faker::Educator.university}#{i}",
      description: Faker::Lorem.paragraph(sentence_count: 10),
      city: Faker::Address.city
  )

  rand(MIN_NUMBER_OF_FIELDS_ON_ACADEMY...MAX_NUMBER_OF_FIELDS_ON_ACADEMY).times do |i|
    puts "Seeding academy fields #{i}"
    af = AcademyField.create!(
        field_of_study: FieldOfStudy.all[i],
        academy: academy,
        recruitment_formula: generate_formula
    )

    NUMBER_OF_REVIEWS.times do |i|
      puts "Seeding review #{i}"
      Review.create!(
          user: User.all[i],
          reviewable: af,
          title: Faker::Quote.singular_siegler,
          body: Faker::Lorem.paragraph(sentence_count: 5),
          rate: Faker::Base.rand_in_range(0, 5)
      )
    end
  end
end