{{- define "database.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "database.labels" -}}
app.kubernetes.io/name: {{ include "database.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
tier: database
{{- end -}}

{{- define "database.selectorLabels" -}}
app.kubernetes.io/name: {{ include "database.fullname" . }}
tier: database
{{- end -}}
