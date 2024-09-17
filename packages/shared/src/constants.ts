export const PLUGIN_TYPES = [
  "SOURCE",
  "WORKFLOW",
  "VIEW",
  "SIDEBAR",
  "EFFECT",
  "AUTH",
] as const;

export const INPUT_TYPES = {
  SWITCH: "Checkbox",
  TEXT: "Textfeld",
  RADIO: "Einfachauswahl (Radio)",
  CHECKLIST: "Checkliste",
  FILE: "Datei-Upload",
  DATE: "Datum",
  DESCRIPTION: "Hinweistext",
  TEXTAREA: "Textbereich",
} as const;

export const INPUT_TYPES_ARRAY = Object.keys(INPUT_TYPES) as [
  keyof typeof INPUT_TYPES,
];

export const PROCESS_DEFINITION_STATES = {
  PENDING: { COLOR: "purple", NAME: "In Vorbereitung" },
  LIVE: { COLOR: "grass", NAME: "Veröffentlicht" },
  PAUSED: { COLOR: "bronze", NAME: "Angehalten" },
} as const;

export const PROCESS_STATES = {
  NEW: "Neu",
  ACTIVE: "In Bearbeitung",
  FINISHED: "Abgeschlossen",
};

export const EVENT_TYPES = {
  PROCESS_CREATED: "Vorgang erstellt",
  PROCESS_ACTIVATED: "Vorgang aktiviert",
  PROCESS_FINISHED: "Vorgang abgeschlossen",
  PROCESS_REACTIVATED: "Aufgabe reaktiviert",
  TASK_TOOK_OVER: "Aufgabe übernommen",
  TASK_HANDED_OVER: "Aufgabe abgegeben",
  TASK_LEFT: "Aufgabe verlassen",
  TASK_SAVED: "Datenfeld geändert",
  ACTION_EXECUTED: "Aktion ausgeführt",
  INVOLVED_USERS: "Mitarbeiter:in hinzugefügt",
  TRANSFERED_TASK: "Aufgabe übertragen",
  FILES_UPLOADED: "Datei(en) hochgeladen",
} as const;

export const EVENT_TYPES_ARRAY = Object.keys(EVENT_TYPES) as [
  keyof typeof EVENT_TYPES,
];

export const DAY_IN_MS = 86400000;

export const DELIMITER = "=>";

export const ERROR_MESSAGES = {
  UAUTHORIZED: "Sie sind nicht berechtigt, diese Seite aufzurufen.",
  BAD_REQUEST: "Die Anfrage war fehlerhaft.",
  NOT_FOUND: "Diese Seite wurde nicht gefunden.",
  INTERNAL_SERVER_ERROR: "Ein interner Serverfehler ist aufgetreten.",
} as const;
