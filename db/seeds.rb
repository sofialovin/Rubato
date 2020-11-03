# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"


# Student.destroy_all
# Video.destroy_all
# Lyric.destroy_all
# Audio.destroy_all
# StudentSong.destroy_all
# LyricChord.destroy_all
# User.destroy_all
# Note.destroy_all
# Lesson.destroy_all

Chord.destroy_all



# STUDENTS
##################################################################



# avatar_1 = URI.open('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
# avatar_2 = URI.open('https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80')
# avatar_3 = URI.open('https://images.unsplash.com/photo-1562860104-ef7aa1399f4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1054&q=80')
# avatar_4 = URI.open('https://images.unsplash.com/photo-1551872748-ea006d2c8cd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80')
# avatar_5 = URI.open('https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
# avatar_6 = URI.open('https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1047&q=80')
# avatar_7 = URI.open('https://images.unsplash.com/photo-1588453383063-37ea0b78f30f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')
# avatar_8 = URI.open('https://images.unsplash.com/photo-1580810840991-82be8fc466f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')
# avatar_9 = URI.open('https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
# avatar_10 = URI.open('https://images.unsplash.com/photo-1588517191021-1ddf106fd23b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80')
# avatar_11 = URI.open('https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
# avatar_12 = URI.open('https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=800')
# avatar_13 = URI.open('https://images.unsplash.com/photo-1588517191021-1ddf106fd23b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80')
# avatar_14 = URI.open('https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80')
# avatar_15 = URI.open('https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
# avatar_16 = URI.open('https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')

# student1 = Student.create(first_name: "Maria", last_name: "Müller", skill_level: "Advanced", user_id: user.id)
# student1.avatar.attach(io: avatar_1, filename: 'avatar_1.jpg', content_type: 'image/jpg')

# student2 = Student.create(first_name: "Bob", last_name: "Builder", skill_level: "Beginner", user_id: user.id)
# student2.avatar.attach(io: avatar_2, filename: 'avatar_2.jpg', content_type: 'image/jpg')

# student3 = Student.create(first_name: "Mark", last_name: "Riley", skill_level: "Advanced", user_id: user.id)
# student3.avatar.attach(io: avatar_3, filename: 'avatar_3.jpg', content_type: 'image/jpg')

# student4 = Student.create(first_name: "Claire", last_name: "Tucker", skill_level: "Advanced", user_id: user.id)
# student4.avatar.attach(io: avatar_4, filename: 'avatar_4.jpg', content_type: 'image/jpg')


# student5 = Student.create(first_name: "Linda", last_name: "Riff", skill_level: "Beginner", user_id: user.id)
# student5.avatar.attach(io: avatar_5, filename: 'avatar_5.jpg', content_type: 'image/jpg')

# student6 = Student.create(first_name: "Nina", last_name: "Smith", skill_level: "Intermediate", user_id: user.id)
# student6.avatar.attach(io: avatar_6, filename: 'avatar_6.jpg', content_type: 'image/jpg')

# student7 = Student.create(first_name: "Anna", last_name: "O'Brian", skill_level: "Advanced", user_id: user.id)
# student7.avatar.attach(io: avatar_7, filename: 'avatar_7.jpg', content_type: 'image/jpg')

# student8 = Student.create(first_name: "Fred", last_name: "Miller", skill_level: "Beginner", user_id: user.id)
# student8.avatar.attach(io: avatar_8, filename: 'avatar_8.jpg', content_type: 'image/jpg')

# student9 = Student.create(first_name: "Jimmy", last_name: "Hill", skill_level: "Intermediate", user_id: user.id)
# student9.avatar.attach(io: avatar_9, filename: 'avatar_9.jpg', content_type: 'image/jpg')

# student10 = Student.create(first_name: "Jan", last_name: "Conner", skill_level: "Advanced", user_id: user.id)
# student10.avatar.attach(io: avatar_10, filename: 'avatar_10.jpg', content_type: 'image/jpg')

# student11 = Student.create(first_name: "Tyler", last_name: "Schmidt", skill_level: "Intermediate", user_id: user.id)
# student11.avatar.attach(io: avatar_11, filename: 'avatar_11.jpg', content_type: 'image/jpg')

# student12 = Student.create(first_name: "Sam", last_name: "Finnigan", skill_level: "Beginner", user_id: user.id)
# student12.avatar.attach(io: avatar_12, filename: 'avatar_12.jpg', content_type: 'image/jpg')

# student13 = Student.create(first_name: "Kim", last_name: "Williams", skill_level: "Advanced", user_id: user.id)
# student13.avatar.attach(io: avatar_13, filename: 'avatar_13.jpg', content_type: 'image/jpg')

# student14 = Student.create(first_name: "Sandy", last_name: "Nix", skill_level: "Beginner", user_id: user.id)
# student14.avatar.attach(io: avatar_14, filename: 'avatar_14.jpg', content_type: 'image/jpg')

# student15 = Student.create(first_name: "Mathilda", last_name: "Becker", skill_level: "Advanced", user_id: user.id)
# student15.avatar.attach(io: avatar_15, filename: 'avatar_15.jpg', content_type: 'image/jpg')

# student16 = Student.create(first_name: "Antonio", last_name: "Pérez", skill_level: "Advanced", user_id: user.id)
# student16.avatar.attach(io: avatar_16, filename: 'avatar_16.jpg', content_type: 'image/jpg')

# CHORDS # commented out so selected voicing stays in DB
#########################################################},
Chord.create!([{name: "C", highest_fret: "3"}, {name: "C7", highest_fret: "3"}, {name: "Cmaj7", highest_fret: "3"},
  {name: "Cm", highest_fret: "5"}, {name: "D", highest_fret: "3"}, {name: "D7", highest_fret: "2"},
  {name: "Dm7", highest_fret: "6"}, {name: "D/F#", highest_fret: "3"},{name: "E", highest_fret: "2"}, {name: "Em", highest_fret: "2"},
  {name: "E7", highest_fret: "2"}, {name: "Em7", highest_fret: "2"}, {name: "F", highest_fret: "3"}, {name: "Fmaj7", highest_fret: "3"},
  {name: "Fm", highest_fret: "3"}, {name: "Fm7b5", highest_fret: "1"}, {name: "G", highest_fret: "3A"}, {name: "G7", highest_fret: "3"},
  {name: "Gm7", highest_fret: "3"}, {name: "Am", highest_fret: "2"}, {name: "A", highest_fret: "2"}, {name: "Am7/G", highest_fret: "3"},
  {name: "A7", highest_fret: "2"}, {name: "Bb", highest_fret: "3"}, {name: "Bbmaj7", highest_fret: "3"}, {name: "Bbm7", highest_fret: "3"}])



# LESSONS
################################################################



# lesson1 = Lesson.create(
#   date: Date.tomorrow,
#   start_time: "8:30",
#   duration: 45,
#   student_id: student4.id)

# lesson2 = Lesson.create(
#   date: Date.today.advance(days: 2),
#   start_time: "12:00",
#   duration: 30,
#   student_id: student10.id)

# lesson3 = Lesson.create(
#   date: Date.today.advance(days: 2),
#   start_time: "18:00",
#   duration: 60,
#   student_id: student9.id)

# lesson4 = Lesson.create(
#   date: Date.today.advance(days: 3),
#   start_time: ["8:30", "10:00", "12:00", "13:30", "18:00", "16:30", "15:00"].sample,
#   duration: 30,
#   student_id: student12.id)

# lesson5 = Lesson.create(
#   date: Date.today.advance(days: 4),
#   start_time: "10:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student5.id)

# lesson6 = Lesson.create(
#   date: Date.today.advance(days: 5),
#   start_time: "12:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student6.id)

# lesson7 = Lesson.create(
#   date: Date.today.advance(days: 5),
#   start_time: "16:30",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student4.id)

# lesson8 = Lesson.create(
#   date: Date.today.advance(days: 4),
#   start_time: "12:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student8.id)

# lesson9 = Lesson.create(
#   date: Date.today.advance(days: 6),
#   start_time: "10:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student9.id)

# lesson10 = Lesson.create(
#   date: Date.today.advance(days: 6),
#   start_time: "13:30",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student10.id)


# past_lesson1 = Lesson.create(
#   date: Date.today.days_ago(1),
#   start_time: "10:00",
#   duration: 45,
#   student_id: student11.id)

# past_lesson2 = Lesson.create(
#   date: Date.today.days_ago(1),
#   start_time: "12:30",
#   duration: 60,
#   student_id: student12.id)

# past_lesson3 = Lesson.create(
#   date: Date.today.days_ago(2),
#   start_time: "16:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student13.id)

# past_lesson4 = Lesson.create(
#   date: Date.today.days_ago(2),
#   start_time: "13:30",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student14.id)

# past_lesson5 = Lesson.create(
#   date: Date.today.days_ago(4),
#   start_time: "15:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student15.id)

# pastlesson_Claire1 = Lesson.create(
#   date: Date.today.days_ago(4),
#   start_time: "10:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student4.id)

# pastlesson_Nina = Lesson.create(
#   date: Date.today.days_ago(2),
#   start_time: "18:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student6.id)

# pastlesson = Lesson.create(
#   date: Date.today.days_ago(1),
#   start_time: "18:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student13.id)

# pastlesson_Claire4 = Lesson.create(
#   date: Date.today.days_ago(2),
#   start_time: "8:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student4.id)

# pastlesson_Claire3 = Lesson.create(
#   date: Date.today.days_ago(6),
#   start_time: "13:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student4.id)


# past_lesson6 = Lesson.create(
#   date: Date.today.days_ago(3),
#   start_time: "15:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student16.id)

# past_lesson7 = Lesson.create(
#   date: Date.today.days_ago(3),
#   start_time: "10:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student7.id)

# past_lesson8 = Lesson.create(
#   date: Date.today.days_ago(6),
#   start_time: "9:00",
#   duration: [45, 30, 60, 90].sample,
#   student_id: student8.id)

# # NOTES
# ###################################################################

# Note.create!([
#   {content:"Minor issues with the chord progressions in Oregon Trail. Should add more strumming patterns.",
#   lesson_id: past_lesson1.id},
#   {content: "Did an exercise on stretching fingers across all six strings. Should repeat the one for the pinky.",
#   lesson_id: past_lesson2.id},
#   {content: "Kim has mastered the G7 barre chord.",
#   lesson_id: past_lesson3.id},
#   {content: "Sandy has good left-hand technique and is comfortable with chord inversions.",
#   lesson_id: past_lesson4.id},
#   {content: "Mathilda worked on improvising on 'Georgia on My Mind' and 'After You've Gone'.",
#   lesson_id: past_lesson5.id},
#   {content: "Antonio has written three songs. They're pretty good!",
#   lesson_id: past_lesson6.id},
#   {content: "Anna understands the difference between a diminished and a half-diminished chord.",
#   lesson_id: past_lesson7.id},
#   {content: "Fred refuses to practice anything other than Alle Meine Entchen. He can, however, play it in three keys.",
#   lesson_id: past_lesson8.id},
#   {content: "Claire practiced 4-string inversions for minor, major, diminished, and half-diminshed chords.",
#   lesson_id: pastlesson_Claire1.id},
#   {content: "Kim transcribed and stared practicing the solo from 'Whole Lotta Love'.",
#   lesson_id: pastlesson.id},
#   {content: "Claire mentioned she wants to play a Bowie song next time.",
#   lesson_id: pastlesson_Claire4.id},
#   {content: "Claire is experimenting with alternate tunings.",
#   lesson_id: pastlesson_Claire3.id}
#   ])

