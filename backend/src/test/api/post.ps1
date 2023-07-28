# Adres URL docelowego endpointu POST
$BaseUrl = "http://localhost:8080/v1/gpt/tutorial" # Zmień na właściwy adres URL swojego backendu
$Topic = "glosniki" # Tutaj wpisz swoją wartość dla parametru topic

# Budowanie adresu URL z parametrem zapytania topic
$Url = $BaseUrl + "?topic=" + [System.Uri]::EscapeDataString($Topic)

# Ustawienie typu zawartości i kodowania
$ContentType = "application/json"
$Encoding = [System.Text.Encoding]::UTF8

# Wywołanie żądania POST
try {
    $Response = Invoke-RestMethod -Uri $Url -Method Post -ContentType $ContentType

    # Przetwarzanie odpowiedzi (opcjonalnie)
    Write-Host "Odpowiedź serwera:"
    Write-Host $Response
}
catch {
    Write-Host "Wystąpił błąd podczas wykonania żądania POST: $($_.Exception.Message)"
}