# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"


Song.destroy_all
Student.destroy_all
Video.destroy_all
Lyric.destroy_all
Audio.destroy_all
StudentSong.destroy_all
LyricChord.destroy_all
Chord.destroy_all
User.destroy_all
Note.destroy_all
Lesson.destroy_all


avatar_user = URI.open('https://images.unsplash.com/photo-1545538331-78f76ca06830?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
user = User.create(first_name: "Dave", last_name: "Benjoya", email: "dave@benjoya.com", password: "123456", password_confirmation: "123456")
user.avatar.attach(io: avatar_user, filename: 'avatar_user.jpg', content_type: 'image/jpg')




# STUDENTS

# student1 = Student.create(first_name: "Maria", last_name: "Müller", skill_level: "beginner", user_id: user.id)

# student1 = Student.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   skill_level: ["beginner", "intermediate", "advanced"].sample,
#   user_id: user.id
#   )

# student2 = Student.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   skill_level: ["beginner", "intermediate", "advanced"].sample,
#   user_id: user.id
#   )

# student3 = Student.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   skill_level: ["beginner", "intermediate", "advanced"].sample,
#   user_id: user.id
#   )

# student4 = Student.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   skill_level: ["beginner", "intermediate", "advanced"].sample,
#   user_id: user.id
#   )

# student5 = Student.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   skill_level: ["beginner", "intermediate", "advanced"].sample,
#   user_id: user.id
#   )

# student6 = Student.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   skill_level: ["beginner", "intermediate", "advanced"].sample,
#   user_id: user.id
#   )

# # LESSONS



#

avatar_1 = URI.open('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
avatar_2 = URI.open('https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80')
avatar_3 = URI.open('https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
avatar_4 = URI.open('https://images.unsplash.com/photo-1551872748-ea006d2c8cd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80')
avatar_5 = URI.open('https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
avatar_6 = URI.open('https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1047&q=80')
avatar_7 = URI.open('https://images.unsplash.com/photo-1588453383063-37ea0b78f30f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')
avatar_8 = URI.open('https://images.unsplash.com/photo-1580810840991-82be8fc466f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')
avatar_9 = URI.open('https://images.unsplash.com/photo-1562860104-ef7aa1399f4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1054&q=80')
avatar_10 = URI.open('https://images.unsplash.com/photo-1588517191021-1ddf106fd23b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80')

student1 = Student.create(first_name: "Maria", last_name: "Müller", skill_level: "Advanced", user_id: user.id)
student1.avatar.attach(io: avatar_1, filename: 'avatar_1.jpg', content_type: 'image/jpg')

student2 = Student.create(first_name: "Bob", last_name: "Builder", skill_level: "Beginner", user_id: user.id)
student2.avatar.attach(io: avatar_2, filename: 'avatar_2.jpg', content_type: 'image/jpg')

student3 = Student.create(first_name: "Jimmy", last_name: "Hill", skill_level: "Intermediate", user_id: user.id)
student3.avatar.attach(io: avatar_3, filename: 'avatar_3.jpg', content_type: 'image/jpg')

student4 = Student.create(first_name: "Claire", last_name: "Tucker", skill_level: "Advanced", user_id: user.id)
student4.avatar.attach(io: avatar_4, filename: 'avatar_4.jpg', content_type: 'image/jpg')


student5 = Student.create(first_name: "Linda", last_name: "Riff", skill_level: "Beginner", user_id: user.id)
student5.avatar.attach(io: avatar_5, filename: 'avatar_5.jpg', content_type: 'image/jpg')

student6 = Student.create(first_name: "Nina", last_name: "Smith", skill_level: "Intermediate", user_id: user.id)
student6.avatar.attach(io: avatar_6, filename: 'avatar_6.jpg', content_type: 'image/jpg')

student7 = Student.create(first_name: "Anna", last_name: "O'Brian", skill_level: "Advanced", user_id: user.id)
student7.avatar.attach(io: avatar_7, filename: 'avatar_7.jpg', content_type: 'image/jpg')

student8 = Student.create(first_name: "Fred", last_name: "Miller", skill_level: "Beginner", user_id: user.id)
student8.avatar.attach(io: avatar_8, filename: 'avatar_8.jpg', content_type: 'image/jpg')

student9 = Student.create(first_name: "Mark", last_name: "Riley", skill_level: "Advanced", user_id: user.id)
student9.avatar.attach(io: avatar_9, filename: 'avatar_9.jpg', content_type: 'image/jpg')

student10 = Student.create(first_name: "Jan", last_name: "Conner", skill_level: "Advanced", user_id: user.id)
student10.avatar.attach(io: avatar_10, filename: 'avatar_10.jpg', content_type: 'image/jpg')




c_major = Chord.create(name: "C")
d_major = Chord.create(name: "D")
e_major = Chord.create(name: "E")
f_major = Chord.create(name: "F")
g_major = Chord.create(name: "G")
g_major_seven = Chord.create(name: "G 7")
a_major = Chord.create(name: "A")
a_major_seven = Chord.create(name: "A 7")
a_minor = Chord.create(name: "A m")


oregon_trail = Song.create(name: "Oregon Trail", user_id: user.id, skill_level: "beginner")
old_town_road = Song.create(name: "Old Town Road", user_id: user.id, skill_level: "beginner")
i_wanna_be_there = Song.create(name: "I Wanna Be There", user_id: user.id, skill_level: "beginner")
whats_up = Song.create(name: "What's Up", user_id: user.id, skill_level: "beginner")
love_me_do = Song.create(name: "Love Me Do", user_id: user.id, skill_level: "beginner")
brown_eyed_girl = Song.create(name: "Brown Eyed Girl", user_id: user.id, skill_level: "beginner")
three_little_birds = Song.create(name: "Three Little Birds", user_id: user.id, skill_level: "beginner")
achy_breaking_heart = Song.create(name: "Achy Breaking Heart", user_id: user.id, skill_level: "beginner")



lyrics1 = Lyric.create(text: "I've been grubbing on a little farm on the flat and windy plain", song_id: oregon_trail.id)
lyrics2 = Lyric.create(text: "I've been listening to the lonesome cattle bawl", song_id: oregon_trail.id)
lyrics3 = Lyric.create(text: "I'm gonna grab my wife and kids, I'm gonna hit that western road", song_id: oregon_trail.id)
lyrics4 = Lyric.create(text: "I'm gonna hit that Oregon Trail this coming fall", song_id: oregon_trail.id)

lyrics5 = Lyric.create(text: "Gonna take my horse to the old town road, gonna ride till i can't no more", song_id: old_town_road.id)
lyrics6 = Lyric.create(text: "Gonna take my horse to the old town road, gonna ride till i can't no more", song_id: old_town_road.id)

lyric_chord1 = LyricChord.create(lyric_id: lyrics1.id, chord_id: d_major.id, position: 1)
lyric_chord2 = LyricChord.create(lyric_id: lyrics1.id, chord_id: g_major.id, position: 4)
lyric_chord3 = LyricChord.create(lyric_id: lyrics1.id, chord_id: d_major.id, position: 5)

lyric_chord4 = LyricChord.create(lyric_id: lyrics5.id, chord_id: e_major.id, position: 2)
lyric_chord5 = LyricChord.create(lyric_id: lyrics5.id, chord_id: g_major.id, position: 5)
lyric_chord6 = LyricChord.create(lyric_id: lyrics5.id, chord_id: d_major.id, position: 7)
lyric_chord7 = LyricChord.create(lyric_id: lyrics5.id, chord_id: c_major.id, position: 9)


student_song1 = StudentSong.create(song_id: oregon_trail.id, student_id: student1.id)
student_song2 = StudentSong.create(song_id: old_town_road.id, student_id: student5.id)


lesson1 = Lesson.create(
  date: Date.today,
  start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: 45,
  student_id: student1.id)

lesson2 = Lesson.create(
  date: Date.tomorrow,
  start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: 30,
  student_id: student1.id)

lesson3 = Lesson.create(
  date: Date.tomorrow,
  start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: 60,
  student_id: student2.id)

lesson4 = Lesson.create(
  date: Date.today,
  start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: 30,
  student_id: student3.id)

future_lesson1 = Lesson.create(
    date: Faker::Date.in_date_period(year: 2020, month: 8),
    start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
    duration: [45, 30, 60, 90].sample,
    student_id: student9.id)

future_lesson2 = Lesson.create(
    date: Faker::Date.in_date_period(year: 2020, month: 8),
    start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
    duration: [45, 30, 60, 90].sample,
    student_id: student8.id)

future_lesson3 = Lesson.create(
    date: Faker::Date.in_date_period(year: 2020, month: 9),
    start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
    duration: [45, 30, 60, 90].sample,
    student_id: student7.id)

future_lesson4 = Lesson.create(
    date: Faker::Date.in_date_period(year: 2020, month: 8),
    start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
    duration: [45, 30, 60, 90].sample,
    student_id: student7.id)

future_lesson5 = Lesson.create(
    date: Faker::Date.in_date_period(year: 2020, month: 9),
    start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
    duration: [45, 30, 60, 90].sample,
    student_id: student4.id)

future_lesson6 = Lesson.create(
    date: Faker::Date.in_date_period(year: 2020, month: 8),
    start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
    duration: [45, 30, 60, 90].sample,
    student_id: student10.id)



past_lesson1 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 60, 90].sample,
  student_id: student4.id)

past_lesson2 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 60, 90].sample,
  student_id: student5.id)

past_lesson3 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 6),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 60, 90, 120].sample,
  student_id: student4.id)

past_lesson4 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 60, 90, 120].sample,
  student_id: student6.id)

past_lesson5 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 60, 90, 120].sample,
  student_id: student5.id)

past_lesson6 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 60, 90, 120].sample,
  student_id: student6.id)

past_lesson7 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student10.id)

past_lesson8 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student8.id)

past_lesson9 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student9.id)

past_lesson10 = Lesson.create(
  date: Faker::Date.in_date_period(year: 2020, month: 7),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student7.id)

past_lesson11 = Lesson.create(
  date: Faker::Time.backward(days: 3, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student8.id)

past_lesson12 = Lesson.create(
  date: Faker::Time.backward(days: 4, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student4.id)


note1 = Note.create(
  content:"Minor issues with the chord progressions in Oregon Trail. Should add more strumming patterns.",
  lesson_id: past_lesson1.id)

note2 = Note.create(
  content: "Did an exercise on stretching fingers across all six strings. Should repeat the one for the pinky.",
  lesson_id: past_lesson2.id)

note3 = Note.create(
  content: "Jan has good left-hand technique and is comfortable with chord inversions",
  lesson_id: past_lesson7.id)

note4 = Note.create(
  content: "Fred refuses to practice anything other than Alle Meine Entchen. He can, however, play it in three keys.",
  lesson_id: past_lesson8.id)

note5 = Note.create(
  content: "Mark understands the difference between a diminished and a half-diminished chord.",
  lesson_id: past_lesson9.id)

note6 = Note.create(
  content: "Anna has written three songs. They're pretty good!",
  lesson_id: past_lesson10.id)

note7 = Note.create(
  content: "Nina has mastered the G7 barre chord",
  lesson_id: past_lesson6.id)


