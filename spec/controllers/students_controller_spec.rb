require 'spec_helper'

describe StudentsController do
  it "test the rendering of the home page" do
    get :root
    expect(response).to render_template :home
  end
end