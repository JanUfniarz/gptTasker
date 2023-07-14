# Utworzenie tablicy asocjacyjnej z parametrami
$params = @{
    name = "Clemens"
    email = "clemens.dra@gmail.com"
    pin = "7843"
}

# Adres URL docelowego endpointu
$url = "http://localhost:8080/api/v1/data"

# Wywołanie żądania POST z parametrami
$response = Invoke-WebRequest -Uri $url -Method POST -Body $params -ContentType "application/x-www-form-urlencoded"

# Wyświetlenie kodu stanu odpowiedzi
Write-Host "Status Code: $($response.StatusCode)"

# Wyświetlenie odpowiedzi
$response.Content