require 'spec_helper'

describe TagCell do
  context "cell rendering" do

    context "rendering important" do
      before do
        @tag1 = Factory(:tag, :important => true)
        @tag2 = Factory(:tag, :important => true)
      end
      subject { render_cell(:tag, :important, "posts") }

      it { should have_selector("h3", :content => "Tags") }
      it { should have_link(@tag1.name) }
      it { should have_link(@tag2.name) }
    end

    it "not rendering important" do
      response = render_cell(:tag, :important, "blog_posts")
      response.native.should be_nil
    end

  end


  context "cell instance" do
    subject { cell(:tag) }

    it { should respond_to(:important) }
  end
end
