# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create (movie)
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.body.match(/#{e1}.*{e2}/m)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  ratings = rating_list.split(", ")
  ratings.each do |r|
    if uncheck
      uncheck "ratings_#{r}"
    else
      check "ratings_#{r}"
    end
  end
end



Then /I should see all the movies/ do
  expect(page.all('table#movies tbody tr').length).to eq Movie.count
end