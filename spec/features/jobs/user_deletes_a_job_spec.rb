require 'rails_helper'

describe "User deletes a job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = company.jobs.create(title: "Developer",
                              description: "Yayy!",
                              level_of_interest: 90)

    expect(Job).to exist

    visit company_job_path(company, job)
    click_on "Delete job"

    expect(Job).not_to exist
  end
end
