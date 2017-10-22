# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Models involved
Every event is an instance of model `Event` <br />
An event has the `type` attribute. There are 2 types of event: `concert` or `exhibition`<br />
**künstl_saison** is `Season` <br />
**va_projekt** is `Event.project` <br />
**datum_von** is `Event.start_date` <br />
**datum_bis** is `Event.end_date`  <br />
**va_raum** is `Event.location` <br />
**va_title** is `Event.title` <br />
**anzeige_besetzung** is `Event.performers` <br />
**anzeige_programm** is `Event.program` <br />
**abo's** is `Event.abo_serie` 
