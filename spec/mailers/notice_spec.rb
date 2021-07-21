require "rails_helper"

RSpec.describe NoticeMailer, type: :mailer do
  describe "matching" do
    let(:mail) { NoticeMailer.matching }

    it "renders the headers" do
      expect(mail.subject).to eq("Matching")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
