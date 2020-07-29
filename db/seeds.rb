# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Song.destroy_all
Student.destroy_all
Video.destroy_all
Lyric.destroy_all
Audio.destroy_all
StudentSong.destroy_all
LyricChord.destroy_all
Chord.destroy_all
User.destroy_all
Lesson.destroy_all


# USERS
teacher = User.create(first_name: "Dave", last_name: "Benjoya", email: "dave@benjoya.com", password: "123456", password_confirmation: "123456")


# Rental.create! start_date: Faker::Date.between(from: '2020-07-13', to: '2020-07-20'), end_date: Faker::Date.between(from: '2020-07-22', to: '2020-07-30'), user_id: u1.id, instrument_id: instrument2.id


# STUDENTS

# student1 = Student.create(first_name: "Maria", last_name: "Müller", skill_level: "beginner", user_id: teacher.id)
20.times do
  student = Student.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    skill_level: ["beginner", "intermediate", "advanced"].sample,
    teacher_id: teacher.id
    )
end




c_major = Chord.create(name: "C")
d_major = Chord.create(name: "D")
f_major = Chord.create(name: "F")
g_major = Chord.create(name: "G")
g_major_seven = Chord.create(name: "G7")
a_minor = Chord.create(name: "Am")

oregon_trail = Song.create(name: "Oregon Trail", user_id: teacher.id, skill_level: "beginner")

lyrics1 = Lyric.create(text: "I've been grubbing on a little farm on the flat and windy plain", song_id: oregon_trail.id)
lyrics2 = Lyric.create(text: "I've been listening to the lonesome cattle bawl", song_id: oregon_trail.id)
lyrics3 = Lyric.create(text: "I'm gonna grab my wife and kids, I'm gonna hit that western road", song_id: oregon_trail.id)
lyrics4 = Lyric.create(text: "I'm gonna hit that Oregon Trail this coming fall", song_id: oregon_trail.id)

lyric_chord1 = LyricChord.create(lyric_id: lyrics1.id, chord_id: d_major.id, position: 1)
lyric_chord2 = LyricChord.create(lyric_id: lyrics1.id, chord_id: g_major.id, position: 4)
lyric_chord1 = LyricChord.create(lyric_id: lyrics1.id, chord_id: d_major.id, position: 5)

student_song1 = StudentSong.create(song_id: oregon_trail.id, student_id: student1.id)


