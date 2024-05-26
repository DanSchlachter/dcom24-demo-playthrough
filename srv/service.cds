using { demo002 as my } from '../db/schema.cds';

@path: '/service/demo002'
@requires: 'authenticated-user'
service demo002Srv {
  @odata.draft.enabled
  entity Conference as projection on my.Conference;
}

annotate demo002Srv.Conference with @changelog: [title, startDate, endDate] {
  title @changelog;
}

annotate my.Participant with @PersonalData : {
  EntitySemantics : 'DataSubject'
} {
  ID @PersonalData.FieldSemantics: 'DataSubjectID';
  email @PersonalData.IsPotentiallyPersonal;
  name @PersonalData.IsPotentiallyPersonal;
  diet @PersonalData.IsPotentiallySensitive
}
