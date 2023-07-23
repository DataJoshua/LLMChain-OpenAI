module Users
  class CreateToken
    include Interactor::Organizer

    organize Users::CreateToken::Execute
  end
end
