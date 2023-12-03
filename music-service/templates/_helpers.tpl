{{- define "labels.currentdate" -}}
{{- now | htmlDate -}}
{{- end -}}

{{- define "labels.version" -}}
{{- .Chart.Version -}}
{{- end -}}
