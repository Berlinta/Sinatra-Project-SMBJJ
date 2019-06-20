#random data to work with for associations

rodrigo = User.create(name: "Rodrigo", email:"rodrigo@smbjj.com", password: "rodrigo")
katherine = User.create(name: "Katherine", email:"katherine@smbjj.com", password: "katherine")



Techniques.create(content: "We worked on guard passing to side control.", user_id: rodrigo.id)

rodrigo.techniques.create(content: "We worked on guard passing to side control.")

katherines_entry = katherine.techniques.build(content: "Triangle submmisions are awesome!") #does not commit to db
katherines_entry.save