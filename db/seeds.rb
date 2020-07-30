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

teacher = User.create(first_name: "Dave", last_name: "Benjoya", email: "dave@benjoya.com", password: "123456", password_confirmation: "123456")

student1 = Student.create(first_name: "Maria", last_name: "Müller", skill_level: "Advanced", user_id: teacher.id)
student2 = Student.create(first_name: "Bob", last_name: "Builder", skill_level: "Beginner", user_id: teacher.id)
student3 = Student.create(first_name: "Jimmy", last_name: "Hill", skill_level: "Beginner", user_id: teacher.id)
student4 = Student.create(first_name: "Claire", last_name: "Tucker", skill_level: "Advanced", user_id: teacher.id)
student5 = Student.create(first_name: "Linda", last_name: "Riff", skill_level: "Beginner", user_id: teacher.id)


c_major = Chord.create(name: "C")
d_major = Chord.create(name: "D")
e_major = Chord.create(name: "E")
f_major = Chord.create(name: "F")
g_major = Chord.create(name: "G")
g_major_seven = Chord.create(name: "G7")
a_major = Chord.create(name: "A")
a_major_seven = Chord.create(name: "A7")
a_minor = Chord.create(name: "Am")

oregon_trail = Song.create(name: "Oregon Trail", user_id: teacher.id, skill_level: "beginner")
old_town_road = Song.create(name: "Old Town Road", user_id: teacher.id, skill_level: "beginner")

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


lesson1 = Lesson.create(date: Date.today, start_time: Time.now, duration: 45, note: "Minor issues with the chord progressions in Oregon Trail. Should add more strumming patterns.", student_id: student1.id)
lesson2 = Lesson.create(date: Date.tomorrow, start_time: Time.now+10000, duration: 30, note: nil, student_id: student1.id)
lesson3 = Lesson.create(date: Date.tomorrow, start_time: Time.now+50000, duration: 60, note: nil, student_id: student2.id)
lesson4 = Lesson.create(date: Date.today, start_time: Time.now+10000, duration: 30, note: "Did an exercise on stretching fingers across all six strings. Should repeat the one for the pinky.", student_id: student3.id)

