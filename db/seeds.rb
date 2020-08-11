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

oregon_html = "<div class='col' style='height:380px;'> <div><h3><div class='title-line'>Oregon Trail</div></h3></div> <div style='display=flex; flex-direction:row'><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div id='target-area1' class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;'> <div id='clone0' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 89px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone3' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 544px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone4' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 392px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> G</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 0.7625px; word-spacing: 2.44px;'>I've been grubbing on a little farm on the flat and windy plain. </div><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;' id='target-area2'> <div id='clone5' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 98px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone6' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 411px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> A</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 0.45px; word-spacing: 1.44px;'> I've been listening to the lonesome cattle bawl. </div><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;' id='target-area3'> <div id='clone7' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 80px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone8' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 375px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> G</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone9' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 528px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 0.3px; word-spacing: 0.96px;'> I'm gonna grab my wife and kids, I'm gonna hit that western road. </div><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;' id='target-area4'> <div id='clone10' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 84px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone11' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 238px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> A 7</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone12' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 394px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 0.45px; word-spacing: 1.44px;'> I'm gonna hit that Oregon Trail this coming fall. </div></div> </div>"

oregon_trail = Song.create(name: "Oregon Trail", user_id: user.id, skill_level: "beginner", html: oregon_html)

old_html =
"<div class='col' style='height:380px;'> <div><h3><div class='title-line'>Old Town Road</div></h3></div> <div style='display=flex; flex-direction:row'><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div id='target-area1' class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;'> <div id='clone1' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 256px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> G</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone2' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 441px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone3' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 591px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> C</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone0' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 59px; opacity: 1; transition: none 0s ease 0s;'> <div class='row d-flex justify-content-between' style='position: relative; left: 9.01562px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> E</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 0.5625px; word-spacing: 1.8px;'>Gonna take my horse to the old town road, gonna ride till i can't no more. </div><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;' id='target-area2'> <div id='clone4' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 52px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> E</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone5' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 236px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> G</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone6' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 420px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone7' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 584px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> E</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 0.475px; word-spacing: 1.52px;'>Gonna take my horse to the old town road, gonna ride till i can't no more. </div></div> </div>"


old_town_road = Song.create(name: "Old Town Road", user_id: user.id, skill_level: "beginner", html: old_html)

jingle_html =
"<div class='col' style='height:380px;'> <div><h3><div class='title-line'>Jingle Bells</div></h3></div> <div style='display=flex; flex-direction:row'><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div id='target-area1' class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;'> <div id='clone4' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 5px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> C</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 3.875px; word-spacing: 12.4px;'>Jingle bells, Batman smells, Robin laid an egg.</div><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;' id='target-area2'> <div id='clone5' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 64px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> F</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone6' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 188px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> C</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone7' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 493px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> G 7</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div><div id='clone9' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 663px;'> <div class='row d-flex justify-content-between' style='position: relative; left: 16px; justify-content: space-between;'> <div style='display: inline-flex; flex-direction: column; justify-content: space-between; '> <div class='chordname' style='letter-spacing: -2px;'> C</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><img class='dot' ondragstart='return false' src='/assets/dot.svg'> <img class='diagram' src='/assets/fingerboard.svg'> </div> </div> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 3.3375px; word-spacing: 10.68px;'>The batmobile lost its wheel and The Joker got away.</div></div> </div>"


Song.create(name: "Jingle Bells", user_id: user.id, skill_level: "beginner", html: jingle_html)


happy_html = "<div class='col' style='height:380px;'> <div><h3><div class='title-line'>Happy Birthday</div></h3></div> <div style='display=flex; flex-direction:row'><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div id='target-area1' class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;'> <div id='clone3' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 81px; opacity: 1; transition: none 0s ease 0s;'> <!-- <div class='row chord-content'> --> <div class='name-trash'> <div class='chordname' style='letter-spacing: -2px;'> G</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><div id='Gdot0' style='position: absolute; left: 2px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Gdot1' style='position: absolute; left: 12.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='G02' style='position: absolute; left: 23px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='G03' style='position: absolute; left: 33.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='Gdot4' style='position: absolute; left: 44px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Gdot5' style='position: absolute; left: 54.5px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div> <img class='diagram' src='/assets/fingerboard.svg'> </div> <!-- </div> --> </div><div id='clone6' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 624px; opacity: 1; transition: none 0s ease 0s;'> <!-- <div class='row chord-content'> --> <div class='name-trash'> <div class='chordname' style='letter-spacing: -2px;'> G</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><div id='Gdot0' style='position: absolute; left: 2px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Gdot1' style='position: absolute; left: 12.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='G02' style='position: absolute; left: 23px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='G03' style='position: absolute; left: 33.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='Gdot4' style='position: absolute; left: 44px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Gdot5' style='position: absolute; left: 54.5px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div> <img class='diagram' src='/assets/fingerboard.svg'> </div> <!-- </div> --> </div><div id='clone7' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 262px; opacity: 1; transition: none 0s ease 0s;'> <!-- <div class='row chord-content'> --> <div class='name-trash'> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><div id='DX0' style='position: absolute; left: 2px; top:0px'><img class='dot' ondragstart='return false' src='/assets/x.svg'></div><div id='DX1' style='position: absolute; left: 12.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/x.svg'></div><div id='D02' style='position: absolute; left: 23px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='Ddot3' style='position: absolute; left: 33.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Ddot4' style='position: absolute; left: 44px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Ddot5' style='position: absolute; left: 54.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div> <img class='diagram' src='/assets/fingerboard.svg'> </div> <!-- </div> --> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 4.3125px; word-spacing: 13.8px;'>Happy Birthday to you, you belong in a zoo.</div><div class='target-area' style='position:relative; background: none; border: none; box-shadow:0;' ><div class='target-area' ondrop='drop_handler(event)' ondragover='dragover_handler(event)' style='position:relative; margin-top: 4px;' id='target-area2'> <div id='clone8' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 75px;'> <!-- <div class='row chord-content'> --> <div class='name-trash'> <div class='chordname' style='letter-spacing: -2px;'> G 7</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><div id='G7dot0' style='position: absolute; left: 2px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='G7dot1' style='position: absolute; left: 12.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='G702' style='position: absolute; left: 23px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='G703' style='position: absolute; left: 33.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='G704' style='position: absolute; left: 44px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='G7dot5' style='position: absolute; left: 54.5px; top:27px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div> <img class='diagram' src='/assets/fingerboard.svg'> </div> <!-- </div> --> </div><div id='clone9' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 247px;'> <!-- <div class='row chord-content'> --> <div class='name-trash'> <div class='chordname' style='letter-spacing: -2px;'> C</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><div id='CX0' style='position: absolute; left: 2px; top:0px'><img class='dot' ondragstart='return false' src='/assets/x.svg'></div><div id='Cdot1' style='position: absolute; left: 12.5px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Cdot2' style='position: absolute; left: 23px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='C03' style='position: absolute; left: 33.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='Cdot4' style='position: absolute; left: 44px; top:27px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='C05' style='position: absolute; left: 54.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div> <img class='diagram' src='/assets/fingerboard.svg'> </div> <!-- </div> --> </div><div id='clone10' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 461px; opacity: 1; transition: none 0s ease 0s;'> <!-- <div class='row chord-content'> --> <div class='name-trash'> <div class='chordname' style='letter-spacing: -2px;'> G</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><div id='Gdot0' style='position: absolute; left: 2px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Gdot1' style='position: absolute; left: 12.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='G02' style='position: absolute; left: 23px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='G03' style='position: absolute; left: 33.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='Gdot4' style='position: absolute; left: 44px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Gdot5' style='position: absolute; left: 54.5px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div> <img class='diagram' src='/assets/fingerboard.svg'> </div> <!-- </div> --> </div><div id='clone11' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 591px; opacity: 1; transition: none 0s ease 0s;'> <!-- <div class='row chord-content'> --> <div class='name-trash'> <div class='chordname' style='letter-spacing: -2px;'> D</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><div id='DX0' style='position: absolute; left: 2px; top:0px'><img class='dot' ondragstart='return false' src='/assets/x.svg'></div><div id='DX1' style='position: absolute; left: 12.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/x.svg'></div><div id='D02' style='position: absolute; left: 23px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='Ddot3' style='position: absolute; left: 33.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Ddot4' style='position: absolute; left: 44px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Ddot5' style='position: absolute; left: 54.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div> <img class='diagram' src='/assets/fingerboard.svg'> </div> <!-- </div> --> </div><div id='clone12' draggable='true' class='draggable rng' ondragstart='dragstart_handler(event)' style='position: absolute; left: 697px; opacity: 1; transition: none 0s ease 0s;'> <!-- <div class='row chord-content'> --> <div class='name-trash'> <div class='chordname' style='letter-spacing: -2px;'> G</div> <div class='trash' style='display: none;'><div class='delete-chord' onclick='deleteChord(this)'><i class='fas fa-trash'></i></div> </div> </div> <div class='chord-diagram'><div id='Gdot0' style='position: absolute; left: 2px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Gdot1' style='position: absolute; left: 12.5px; top:54px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='G02' style='position: absolute; left: 23px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='G03' style='position: absolute; left: 33.5px; top:0px'><img class='dot' ondragstart='return false' src='/assets/o.svg'></div><div id='Gdot4' style='position: absolute; left: 44px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div><div id='Gdot5' style='position: absolute; left: 54.5px; top:81px'><img class='dot' ondragstart='return false' src='/assets/dot.svg'></div> <img class='diagram' src='/assets/fingerboard.svg'> </div> <!-- </div> --> </div></div></div><div class='lyrics' style='position:relative; letter-spacing: 3.4375px; word-spacing: 11px;'>You look like a monkey, and you smell like one too.</div></div> </div>"



Song.create(name: "Happy Birthday", user_id: user.id, skill_level: "beginner", html: happy_html)



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
  date: Faker::Time.backward(days: 10, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student8.id)

past_lesson12 = Lesson.create(
  date: Faker::Time.backward(days: 11, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student1.id)

past_lesson13 = Lesson.create(
  date: Faker::Time.backward(days: 11, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student5.id)

past_lesson14 = Lesson.create(
  date: Faker::Time.backward(days: 12, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student8.id)

past_lesson15 = Lesson.create(
  date: Faker::Time.backward(days: 13, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student4.id)

past_lesson16 = Lesson.create(
  date: Faker::Time.backward(days: 8, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student2.id)

past_lesson17 = Lesson.create(
  date: Faker::Time.backward(days: 8, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student7.id)

past_lesson18 = Lesson.create(
  date: Faker::Time.backward(days: 9, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student5.id)

past_lesson19 = Lesson.create(
  date: Faker::Time.backward(days: 12, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student4.id)

past_lesson20 = Lesson.create(
  date: Faker::Time.backward(days: 11, period: :evening),
  start_time: ["10:00", "12:30", "13:30", "18:00", "16:30", "15:00"].sample,
  duration: [45, 30, 60, 90].sample,
  student_id: student6.id)

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


