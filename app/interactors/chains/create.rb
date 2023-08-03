module Chains
  class Create
    include Interactor::Organizer

    organize Chains::Create::Execute, Chains::Create::Train
  end
end
