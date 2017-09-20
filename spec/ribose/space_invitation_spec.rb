require "spec_helper"

RSpec.describe Ribose::SpaceInvitation do
  describe ".all" do
    it "retrieves the list of space invitations" do
      stub_ribose_space_invitation_lis_api
      invitations = Ribose::SpaceInvitation.all

      expect(invitations.count).to eq(1)
      expect(invitations.first.type).to eq("Invitation::ToSpace")
      expect(invitations.first.space.name).to eq("The CLI Space")
    end
  end

  describe ".create" do
    it "creates an invitation to a specific space" do
      stub_ribose_space_invitation_create_api(invitation_attributes)
      invitation = Ribose::SpaceInvitation.create(invitation_attributes)

      expect(invitation.id).not_to be_nil
      expect(invitation.inviter.name).to eq("John Doe")
      expect(invitation.type).to eq("Invitation::ToSpace")
      expect(invitation.space.name).to eq("Trip to Mars!")
    end
  end

  def invitation_attributes
    @invitation ||= {
      state: "0",
      body: "Please join!",
      space_id: "123_456_789",
      invitee_id: "456_789_012",
    }
  end
end