#random data to work with for associations

rodrigo = User.create(name: "Rodrigo", email:"rodrigo@smbjj.com", password: "rodrigo")
katherine = User.create(name: "Katherine", email:"katherine@smbjj.com", password: "katherine")



SmbbjProgressTracker.create(content: "We worked on guard passing to side control.", user_id: rodrigo.id)

rodrigo.smbbj_progress_trackers.create(content: "We worked on guard passing to side control.")

katherines_entry = katherine.smbbj_progress_tracking.build(content: "Triangle submmisions are awesome!") #does not commit to db
katherines_entry.save