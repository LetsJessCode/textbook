

User.destroy_all
Course.destroy_all
Assignment.destroy_all
courses = Course.create([{ name: 'English'}, { name: 'Science' },{ name: 'Math' }, { name: 'History' }, { name: 'Language Arts' }, { name: 'Foreign Languages' }, { name: 'Electives' }, { name: 'Other' }])
    

user1 = User.create({first: 'Listen', last: 'Linda', email: 'test@test.com', password: 'abcds', password_confirmation: 'abcds'} )

user2 = User.create({first: 'Justin', last: 'Time', email: 'tes2t@test.com', password: 'password', password_confirmation: 'password' } )

5.times do
    # binding.pry
    Assignment.create({
        user_id: user1.id, 
        course_id: courses[rand(courses.length)].id,
        due: (Date.today + 1),
        name: 'Homework 1',
        completed: true
    })
end

5.times do
    # binding.pry
    Assignment.create({
        user_id: user2.id, 
        course_id: courses[rand(courses.length)].id,
        due: (Date.today + 1),
        name: 'Homework',
        completed: true
    })
end
    puts "Seeded successfully"