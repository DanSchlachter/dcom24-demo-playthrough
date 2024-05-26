namespace demo002;

entity Conference {
  key ID: UUID;
  title: String(100) @assert.unique @mandatory;
  startDate: Date;
  endDate: Date;
  participants: Composition of many Participant on participants.conference = $self;
  demoBooths: Composition of many DemoBooth on demoBooths.conference = $self;
}

entity Participant {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  email: String(100);
  diet: String(50);
  conference: Association to Conference;
  demoBooth: Association to DemoBooth;
}

entity DemoBooth {
  key ID: UUID;
  title: String(100) @assert.unique @mandatory;
  date: Date;
  timeframe: String(100);
  prepLead: Association to Participant;
  speakers: Association to many Participant on speakers.demoBooth = $self;
  conference: Association to Conference;
}