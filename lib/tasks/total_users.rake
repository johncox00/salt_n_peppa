namespace :initialize do
  desc "initialize user aggregate columns"
  task :user_totals => :environment do
    User.all.each do |user|
      user.total_reps = user.workouts.map(&:reps).inject(0){|sum,x| sum + x }
      user.total_workouts = user.workouts.count
      user.save
    end
  end
end
