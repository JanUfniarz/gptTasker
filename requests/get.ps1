# Adres URL docelowego endpointu
$url = "http://localhost:8080/api/v1/data"

# Wywołanie żądania GET
$response = Invoke-WebRequest -Uri $url -Method GET

# Wyświetlenie kodu stanu odpowiedzi
Write-Host "Status Code: $($response.StatusCode)"

# Wyświetlenie odpowiedzi
$response.Content
