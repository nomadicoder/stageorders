# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding start"


RunnerStatusCode.delete_all
runner_status_codes = RunnerStatusCode.create ([
  {
    sequence: 0.0,
    short_code: 'UNK',
    description: 'Runner status is unknown'
  },
  {
    sequence: 1.0,
    short_code: 'ENR',
    description: 'Runner is enroute to stage'
  },
  {
    sequence: 2.0,
    short_code: 'CHK',
    description: 'Runner has checked in at the stage'
  },
  {
    sequence: 3.0,
    short_code: 'RUN',
    description: 'Runner is on the course running the stage'
  },
  {
    sequence: 3.5,
    short_code: 'ONE',
    description: 'Runner is one mine out'
  },
  {
    sequence: 4.0,
    short_code: 'FIN',
    description: 'Runner has completed the stage'
  }
])

SupportStatusCode.delete_all
support_status_codes = SupportStatusCode.create ([
  {
    sequence: 0.0,
    short_code: 'UNK',
    description: 'Support status is unknown'
  },
  {
    sequence: 1.0,
    short_code: 'ENR',
    description: 'Shuttle is enroute to assignment'
  },
  {
    sequence: 2.0,
    short_code: 'ONS',
    description: 'Unit has arrived at assignment'
  },
  {
    sequence: 0.2,
    short_code: 'OUT',
    description: 'Shuttle is out of service (on break, refueling, disabled, etc)'
  },
  {
    sequence: 0.1,
    short_code: 'HLD',
    description: 'Unit is held at location (Waiting for next runner, traffic delay, etc)'
  },
  {
    sequence: 9.0,
    short_code: 'CLR',
    description: 'Shuttle has cleared stage'
  }
])

StageStatusCode.delete_all
stage_status_codes = StageStatusCode.create ([
  {
    short_code: 'NOGO',
    sequence: 1.0,
    description: 'Stage is not ready'
  },
  {
    short_code: 'GO',
    sequence: 2.0,
    description: 'Stage is ready',
    runner_status_code_id: RunnerStatusCode.where("short_code = 'CHK'").first.id,
    support_status_code_id: SupportStatusCode.where("short_code = 'ONS'").first.id,
  },
  {
    short_code: 'GO',
    sequence: 2.0,
    description: 'Stage is ready',
    runner_status_code_id: RunnerStatusCode.where("short_code = 'RUN'").first.id,
  },
  {
    short_code: 'CLR',
    sequence: 9.0,
    description: 'Stage completed/cleared',
    runner_status_code_id: RunnerStatusCode.where("short_code = 'FIN'").first.id,
  }
])

SupportType.delete_all
support_Types= SupportType.create ([
  {
    short_code: 'NONE',
    description: 'None'
  },
  {
    short_code: 'FOLLOW',
    description: 'Follow Van -- Follows runner on course'
  },
  {
    short_code: 'SHUTTLE',
    description: 'Shuttle Van -- Transports runners and personnel between stages'
  },
  {
    short_code: 'ROVER',
    description: 'Rover vehicle -- Performs utility functions'
  },
  {
    short_code: 'CP',
    description: 'Command Post -- Center of support operations'
  },
  {
    short_code: 'MOUNTAINTOP',
    description: 'Mountain top radio relay'
  },
  {
    short_code: 'RES',
    description: 'Rotating Crew'
  }
])

follow = SupportType.where("short_code = 'FOLLOW'").first.id
shuttle = SupportType.where("short_code = 'SHUTTLE'").first.id
rover = SupportType.where("short_code = 'ROVER'").first.id
cp = SupportType.where("short_code = 'CP'").first.id
mountaintop = SupportType.where("short_code = 'MOUNTAINTOP'").first.id
res = SupportType.where("short_code = 'RES'").first.id

Stage.delete_all
stages = Stage.create ([
  {
    number:  1,
    landmark: "Start",
    miles: 5.4,
    difficulty: 13
  },
  {
    number:  2,
    landmark: "Dumont",
    miles:  4.0,
    difficulty: 1
  },
  {
    number:  3,
    landmark: "Ibex Up",
    miles:  4.2,
    difficulty: 6
  },
  {
    number:  4,
    landmark: "Ibex Down",
    miles:  5.1,
    difficulty: 20
  },
  {
    number:  5,
    landmark: "Tecopa",
    miles:  6.1,
    difficulty: 12
  },
  {
    number:  6,
    landmark: "Shoshone",
    miles:  6.1,
    difficulty: 5
  },
  {
    number:  7,
    landmark: "Chicago Valley",
    miles:  6.2,
    difficulty: 2
  },
  {
    number:  8,
    landmark: "",
    miles:  6.6,
    difficulty: 9
  },
  {
    number:  9,
    landmark: "State Line",
    miles:  7.5,
    difficulty: 16
  },
  {
    number:  10,
    landmark: "Pahrump",
    miles:  5.8,
    difficulty: 14
  },
  {
    number:  11,
    landmark: "",
    miles:  5.3,
    difficulty: 19
  },
  {
    number:  12,
    landmark: "",
    miles:  4.8,
    difficulty: 3
  },
  {
    number:  13,
    landmark: "Old Spanish Trail",
    miles: 6.8,
    difficulty: 7
  },
  {
    number:  14,
    landmark: "",
    miles:  10.7,
    difficulty: 8
  },
  {
    number:  15,
    landmark: "",
    miles:  5.5,
    difficulty: 4
  },
  {
    number:  16,
    landmark: "Mountain Springs",
    miles:  6.7,
    difficulty: 11
  },
  {
    number:  17,
    landmark: "",
    miles:  7.3,
    difficulty: 10
  },
  {
    number:  18,
    landmark: "Ft Apache",
    miles:  5.7,
    difficulty: 15
  },
  {
    number:  19,
    landmark: "Desert Inn",
    miles:  5.6,
    difficulty: 17
  },
  {
    number:  20,
    landmark: "Finish",
    miles:  4.6,
    difficulty: 18
  }
])

s1 = Stage.where("number = 1").first.id
s2 = Stage.where("number = 2").first.id
s3 = Stage.where("number = 3").first.id
s4 = Stage.where("number = 4").first.id
s5 = Stage.where("number = 5").first.id
s6 = Stage.where("number = 6").first.id
s7 = Stage.where("number = 7").first.id
s8 = Stage.where("number = 8").first.id
s9 = Stage.where("number = 9").first.id
s10 = Stage.where("number = 10").first.id
s11 = Stage.where("number = 11").first.id
s12 = Stage.where("number = 12").first.id
s13 = Stage.where("number = 13").first.id
s14 = Stage.where("number = 14").first.id
s15 = Stage.where("number = 15").first.id
s16 = Stage.where("number = 16").first.id
s17 = Stage.where("number = 17").first.id
s18 = Stage.where("number = 18").first.id
s19 = Stage.where("number = 19").first.id
s20 = Stage.where("number = 20").first.id
initRunnerStatus = RunnerStatusCode.where("short_code = 'UNK'").first.id
initSupportStatus = SupportStatusCode.where("short_code = 'UNK'").first.id

Team.delete_all
Runner.delete_all
SupportUnit.delete_all
StageStatus.delete_all

teamid = Team.create(number: 1, short_name: 'ONE', name: "Team One", start_time: '2012-04-21 15:00:00 Pacific Time (US & Canada)').id

Runner.create([
  { stage_id: s1,  team_id: teamid, name: "One",       estimated_pace: "00:07:24", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s2,  team_id: teamid, name: "Two",       estimated_pace: "00:10:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s3,  team_id: teamid, name: "Three",     estimated_pace: "00:08:20", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s4,  team_id: teamid, name: "Four",      estimated_pace: "1:07:50", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s5,  team_id: teamid, name: "Five",      estimated_pace: "00:08:11", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s6,  team_id: teamid, name: "Six",       estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s7,  team_id: teamid, name: "Seven",     estimated_pace: "00:09:40", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s8,  team_id: teamid, name: "Eight",     estimated_pace: "00:09:05", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s9,  team_id: teamid, name: "Nine",      estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s10, team_id: teamid, name: "Ten",       estimated_pace: "00:08:37", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s11, team_id: teamid, name: "Eleven",    estimated_pace: "00:09:26", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s12, team_id: teamid, name: "Twelve",    estimated_pace: "00:08:19", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s13, team_id: teamid, name: "Thirteen",  estimated_pace: "00:08:49", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s14, team_id: teamid, name: "Fourteen",  estimated_pace: "00:07:28", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s15, team_id: teamid, name: "Fifteen",   estimated_pace: "00:09:59", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s16, team_id: teamid, name: "Sixteen",   estimated_pace: "00:07:27", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s17, team_id: teamid, name: "Seventeen", estimated_pace: "00:06:09", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s18, team_id: teamid, name: "Eighteen",  estimated_pace: "00:07:53", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s19, team_id: teamid, name: "Nineteen",  estimated_pace: "00:08:02", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s20, team_id: teamid, name: "Tewnty",    estimated_pace: "00:09:46", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: nil, team_id: teamid, name: "AltOne",    estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: nil, team_id: teamid, name: "AltTwo",    estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: nil, team_id: teamid, name: "AltThree",  estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: nil, team_id: teamid, name: "AltFour",   estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: nil, team_id: teamid, name: "AltFive",   estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
])

SupportUnit.create([
  { team_id: teamid, support_type_id: follow, tac_callsign: "Team One Follow", ham_callsign: "km0rat", support_status_code_id: initSupportStatus, current_stage_id: s1, location_lat: 1.5, location_lon: 1.5},
  { team_id: teamid, support_type_id: shuttle, tac_callsign: "Team One Shuttle 1", ham_callsign: "km0rat", support_status_code_id: initSupportStatus, current_stage_id: s2, location_lat: 1.5, location_lon: 1.5},
  { team_id: teamid, support_type_id: shuttle, tac_callsign: "Team Shuttle 2", ham_callsign: "km0rat", support_status_code_id: initSupportStatus, current_stage_id: s3, location_lat: 1.5, location_lon: 1.5},
])

stages.each do |s|
  r = Runner.where("stage_id = #{s.id} AND team_id = #{teamid}").first
  StageStatus.create(team_id: teamid, stage_id: s.id, runner_id: r.id)
end

Blog.create([
{ team_id: teamid,
  host_url: "localhost",
  access_path: "/xmlrpc.php",
  blog_url: "http://localhost/taxonomy/term/3",
  results_url: "http://localhost/node/133",
  access_url: "http://localhost/xmlrpc.php",
  username: "root",
  password: "rootpass",
  blog_number: 1,
  results_post_number: 1,
  category: "TEAM One"},
])

teamid = Team.create(number: 2, short_name: 'TWO', name: "Team Two", start_time: '2012-04-21 13:00:00 Pacific Time (US & Canada)').id
Runner.create([
  { stage_id: s1,  team_id: teamid, name: "One",       estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s2,  team_id: teamid, name: "Two",       estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s3,  team_id: teamid, name: "Three",     estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s4,  team_id: teamid, name: "Four",      estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s5,  team_id: teamid, name: "Five",      estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s6,  team_id: teamid, name: "Six",       estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s7,  team_id: teamid, name: "Seven",     estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s8,  team_id: teamid, name: "Eight",     estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s9,  team_id: teamid, name: "Nine",      estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s10, team_id: teamid, name: "Ten",       estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s11, team_id: teamid, name: "Eleven",    estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s12, team_id: teamid, name: "Twelve",    estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s13, team_id: teamid, name: "Thirteen",  estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s14, team_id: teamid, name: "Fourteen",  estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s15, team_id: teamid, name: "Fifteen",   estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s16, team_id: teamid, name: "Sixteen",   estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s17, team_id: teamid, name: "Seventeen", estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s18, team_id: teamid, name: "Eighteen",  estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s19, team_id: teamid, name: "Nineteen",  estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s20, team_id: teamid, name: "Twenty",    estimated_pace: "00:08:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus}
])

SupportUnit.create([
  { team_id: teamid, support_type_id: follow, tac_callsign: "Team Two Follow", ham_callsign: "km0rat", support_status_code_id: initSupportStatus, current_stage_id: s1, location_lat: 1.5, location_lon: 1.5},
  { team_id: teamid, support_type_id: shuttle, tac_callsign: "Team Two Shuttle", ham_callsign: "km0rat", support_status_code_id: initSupportStatus, current_stage_id: s2, location_lat: 1.5, location_lon: 1.5},
])

stages.each do |s|
  r = Runner.where("stage_id = #{s.id} AND team_id = #{teamid}").first
  StageStatus.create(team_id: teamid, stage_id: s.id, runner_id: r.id)
end

Blog.create([
{ team_id: teamid,
  host_url: "mojaverats.com",
  access_path: "/xmlrpc.php",
  blog_url: "http://localhost/taxonomy/term/4",
  results_url: "http://localhost/node/134",
  access_url: "http://localhost/xmlrpc.php",
  username: "root",
  password: "rootpass",
  blog_number: 1,
  results_post_number: 1,
  category: "Team Two"},
])

teamid = Team.create(number: 3, short_name: 'THR', name: "Team Three", start_time: '2012-04-21 10:00:00 Pacific Time (US & Canada)').id
Runner.create([
  { stage_id: s1,  team_id: teamid, name: "One",       estimated_pace: "00:10:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s2,  team_id: teamid, name: "Two",       estimated_pace: "00:09:13", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s3,  team_id: teamid, name: "Three",     estimated_pace: "00:09:15", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s4,  team_id: teamid, name: "Four",      estimated_pace: "00:09:45", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s5,  team_id: teamid, name: "Five",      estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s6,  team_id: teamid, name: "Six",       estimated_pace: "00:08:30", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s7,  team_id: teamid, name: "Seven",     estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s8,  team_id: teamid, name: "Eight",     estimated_pace: "00:08:15", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s9,  team_id: teamid, name: "Nine",      estimated_pace: "00:08:30", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s10, team_id: teamid, name: "Ten",       estimated_pace: "00:09:30", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s11, team_id: teamid, name: "Eleven",    estimated_pace: "00:11:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s12, team_id: teamid, name: "Twelve",    estimated_pace: "00:09:30", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s13, team_id: teamid, name: "Thirteen",  estimated_pace: "00:07:30", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s14, team_id: teamid, name: "Fourteen",  estimated_pace: "00:07:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s15, team_id: teamid, name: "Fifteen",   estimated_pace: "00:10:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s16, team_id: teamid, name: "Sixteen",   estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s17, team_id: teamid, name: "Seventeen", estimated_pace: "00:09:15", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s18, team_id: teamid, name: "Eighteen",  estimated_pace: "00:10:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s19, team_id: teamid, name: "Nineteen",  estimated_pace: "00:09:00", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus},
  { stage_id: s20, team_id: teamid, name: "Twenty",    estimated_pace: "00:08:30", completed: false, actual_time: "00:00:00", runner_status_code_id: initRunnerStatus}
])

SupportUnit.create([
  { team_id: teamid, support_type_id: follow, tac_callsign: "Team Three Follow", ham_callsign: "km0rat", support_status_code_id: initSupportStatus, current_stage_id: s1, location_lat: 1.5, location_lon: 1.5},
  { team_id: teamid, support_type_id: shuttle, tac_callsign: "Team Three Shuttle", ham_callsign: "km0rat", support_status_code_id: initSupportStatus, current_stage_id: s2, location_lat: 1.5, location_lon: 1.5},
])

stages.each do |s|
  r = Runner.where("stage_id = #{s.id} AND team_id = #{teamid}").first
  StageStatus.create(team_id: teamid, stage_id: s.id, runner_id: r.id)
end

Blog.create([
{ team_id: teamid,
  host_url: "mojaverats.com",
  access_path: "/xmlrpc.php",
  blog_url: "http://localhost/taxonomy/term/4",
  results_url: "http://localhost/node/134",
  access_url: "http://localhost/xmlrpc.php",
  username: "root",
  password: "rootpass",
  blog_number: 1,
  results_post_number: 1,
  category: "Team Three"},
])

puts "Seeding ends"
