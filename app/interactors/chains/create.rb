module Chains
  class Create
    include Interactor::Organizer

    organize Chains::Create::Execute
  end
end
