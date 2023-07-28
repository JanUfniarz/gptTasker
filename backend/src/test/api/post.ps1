$BaseUrl = "http://localhost:8080/v1/gpt/tutorial"
$Topic = "śpiewanie"

$Url = $BaseUrl + "?topic=" + [System.Uri]::EscapeDataString($Topic)

$ContentType = "application/json"
$Encoding = [System.Text.Encoding]::UTF8

try {
    $Response = Invoke-RestMethod -Uri $Url -Method Post -ContentType $ContentType

    Write-Host "Odpowiedź serwera:"
    Write-Host $Response
}
catch {
    Write-Host "Wystąpił błąd podczas wykonania żądania POST: $($_.Exception.Message)"
}