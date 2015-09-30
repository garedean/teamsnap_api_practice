module StaticPagesHelper
  def team_member_email(member)
    @team.member_email_addresses.select { |team_member|
      team_member.member_id == member.id }.first.email
  end
end
