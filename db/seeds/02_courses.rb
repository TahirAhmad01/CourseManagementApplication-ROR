begin
  courses_data = YAML.load_file('./test/fixtures/courses.yml')


  # Iterate over courses data to create seed data
  courses_data.each do |_, course_data|
    begin
      Course.create!(
        course_name: course_data['course_name'],
        semester_id: course_data['semester_id'],
        credit: course_data['credit']
      )
    rescue => e
      puts "Error creating course: #{e.message}"
    end
    end
  puts "======== course data inserted ==========="
rescue => e
  puts "Error loading YAML file: #{e.message}"
end

