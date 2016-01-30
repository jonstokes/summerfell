class CreateHotspotGuest
  include Interactor::Organizer

  organize CreateGuest, CreateTransaction, AuthorizeGuest
end