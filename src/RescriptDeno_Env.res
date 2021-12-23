type t

@send external get: (t, string) => option<string> = "get"
