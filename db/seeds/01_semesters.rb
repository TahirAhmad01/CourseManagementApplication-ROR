semesters_data = YAML.load_file("./test/fixtures/semesters.yml")



semesters_data.each do |key, attributes|
  Semester.create!(
    id: attributes['id'],
    semester_name: attributes['semester_name']
  )
end

puts "======== semester data inserted ==========="