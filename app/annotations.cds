using { demo002Srv } from '../srv/service.cds';

annotate demo002Srv.Conference with @UI.HeaderInfo: { TypeName: 'Conference', TypeNamePlural: 'Conferences', Title: { Value: title } };
annotate demo002Srv.Conference with {
  ID @UI.Hidden @Common.Text: { $value: title, ![@UI.TextArrangement]: #TextOnly }
};
annotate demo002Srv.Conference with @UI.Identification: [{ Value: title }];
annotate demo002Srv.Conference with @UI.DataPoint #startDate: {
  Value: startDate,
  Title: 'Start Date',
};
annotate demo002Srv.Conference with @UI.DataPoint #endDate: {
  Value: endDate,
  Title: 'End Date',
};
annotate demo002Srv.Conference with {
  title @title: 'Title';
  startDate @title: 'Start Date';
  endDate @title: 'End Date'
};

annotate demo002Srv.Conference with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate }
];

annotate demo002Srv.Conference with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate }
  ]
};

annotate demo002Srv.Conference with {
  participants @Common.Label: 'Participants';
  demoBooths @Common.Label: 'Demo Booths'
};

annotate demo002Srv.Conference with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#startDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#endDate' }
];

annotate demo002Srv.Conference with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Participant', Target : 'participants/@UI.LineItem' },
  { $Type : 'UI.ReferenceFacet', ID : 'DemoBooth', Target : 'demoBooths/@UI.LineItem' }
];

annotate demo002Srv.Conference with @UI.SelectionFields: [
  title
];

annotate demo002Srv.Participant with @UI.HeaderInfo: { TypeName: 'Participant', TypeNamePlural: 'Participants', Title: { Value: name } };
annotate demo002Srv.Participant with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate demo002Srv.Participant with @UI.Identification: [{ Value: name }];
annotate demo002Srv.Participant with {
  conference @Common.ValueList: {
    CollectionPath: 'Conference',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: conference_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
    ],
  }
};
annotate demo002Srv.Participant with {
  demoBooth @Common.ValueList: {
    CollectionPath: 'DemoBooth',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: demoBooth_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'date'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'timeframe'
      },
    ],
  }
};
annotate demo002Srv.Participant with @UI.DataPoint #email: {
  Value: email,
  Title: 'Email',
};
annotate demo002Srv.Participant with @UI.DataPoint #diet: {
  Value: diet,
  Title: 'Diet',
};
annotate demo002Srv.Participant with {
  name @title: 'Name';
  email @title: 'Email';
  diet @title: 'Diet'
};

annotate demo002Srv.Participant with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: diet },
    { $Type: 'UI.DataField', Label: 'Demo Booth', Value: demoBooth_ID }
];

annotate demo002Srv.Participant with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: diet },
    { $Type: 'UI.DataField', Label: 'Demo Booth', Value: demoBooth_ID }
  ]
};

annotate demo002Srv.Participant with {
  conference @Common.Text: { $value: conference.title, ![@UI.TextArrangement]: #TextOnly };
  demoBooth @Common.Text: { $value: demoBooth.title, ![@UI.TextArrangement]: #TextOnly }
};

annotate demo002Srv.Participant with {
  conference @Common.Label: 'Conference';
  demoBooth @Common.Label: 'Demo Booth'
};

annotate demo002Srv.Participant with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#email' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#diet' }
];

annotate demo002Srv.Participant with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate demo002Srv.Participant with @UI.SelectionFields: [
  conference_ID,
  demoBooth_ID
];

annotate demo002Srv.DemoBooth with @UI.HeaderInfo: { TypeName: 'Demo Booth', TypeNamePlural: 'Demo Booths', Title: { Value: title } };
annotate demo002Srv.DemoBooth with {
  ID @UI.Hidden @Common.Text: { $value: title, ![@UI.TextArrangement]: #TextOnly }
};
annotate demo002Srv.DemoBooth with @UI.Identification: [{ Value: title }];
annotate demo002Srv.DemoBooth with {
  prepLead @Common.ValueList: {
    CollectionPath: 'Participant',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: prepLead_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'diet'
      },
    ],
  }
};
annotate demo002Srv.DemoBooth with {
  conference @Common.ValueList: {
    CollectionPath: 'Conference',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: conference_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
    ],
  }
};
annotate demo002Srv.DemoBooth with @UI.DataPoint #date: {
  Value: date,
  Title: 'Date',
};
annotate demo002Srv.DemoBooth with @UI.DataPoint #timeframe: {
  Value: timeframe,
  Title: 'Timeframe',
};
annotate demo002Srv.DemoBooth with {
  title @title: 'Title';
  date @title: 'Date';
  timeframe @title: 'Timeframe'
};

annotate demo002Srv.DemoBooth with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Value: timeframe },
    { $Type: 'UI.DataField', Label: 'Participant', Value: prepLead_ID }
];

annotate demo002Srv.DemoBooth with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Value: timeframe },
    { $Type: 'UI.DataField', Label: 'Participant', Value: prepLead_ID }
  ]
};

annotate demo002Srv.DemoBooth with {
  prepLead @Common.Text: { $value: prepLead.name, ![@UI.TextArrangement]: #TextOnly };
  conference @Common.Text: { $value: conference.title, ![@UI.TextArrangement]: #TextOnly }
};

annotate demo002Srv.DemoBooth with {
  prepLead @Common.Label: 'Participant';
  speakers @Common.Label: 'Participants';
  conference @Common.Label: 'Conference'
};

annotate demo002Srv.DemoBooth with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#date' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#timeframe' }
];

annotate demo002Srv.DemoBooth with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate demo002Srv.DemoBooth with @UI.SelectionFields: [
  prepLead_ID,
  conference_ID
];

