begin
  semesters_data = YAML.load_file("./test/fixtures/semesters.yml")

  semesters_data.each do |key, attributes|
    begin
      Semester.create!(
        id: attributes['id'],
        semester_name: attributes['semester_name']
      )
    rescue => e
      puts "Error creating semester: #{e.message}"
    end
  end

  puts "======== Semester data inserted successfully =========="
rescue => e
  puts "Error loading YAML file: #{e.message}"
end