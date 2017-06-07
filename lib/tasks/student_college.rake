namespace :students do
  desc "Add extended_sid to all exisitng entries of Student table"
  task generate_extended_sid: :environment do
    Student.all.each do |student|
      student.extended_sid = student.student_id.to_s + student.college.name[0,2]
      student.save
    end
    puts "Extended sid generated for existing Student entries!"
  end

end
