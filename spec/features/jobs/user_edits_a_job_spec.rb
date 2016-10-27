require 'rails_helper'

describe "User edits a job" do
  scenario "a user can edit a job" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = company.jobs.create(title: "Developer",
                              description: "Yayy!",
                              level_of_interest: 90)

    visit company_job_path(company, job)

    expect(page).to have_content("Developer")

    click_on "Edit job"
    fill_in "job[title]", with: "Reporter"
    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Reporter")
    expect(page).not_to have_content("Developer")
  end
end
