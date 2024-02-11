# URL do endpointu
$baseUrl = "http://localhost:8080/v1/gpt/tutorial/"

# Identyfikator tutoriala, który chcesz zaktualizować
$tutorialId = 1

# Tworzenie URLa zgodnie z identyfikatorem tutoriala
$url = $baseUrl + $tutorialId

$primaryColor = "Greeen"
$paragraphToGenerate = "mono i stareo"

# Dane, które chcesz przesłać w żądaniu PUT (w przykładzie - zaktualizowany kolor)
$jsonData = @{
    "primaryColor" = $primaryColor
    "paragraphToGenerate" = $paragraphToGenerate
} | ConvertTo-Json

try {
    # Wykonanie żądania PUT
    Invoke-RestMethod -Uri $url -Method Put -Body $jsonData -ContentType "application/json"

    Write-Host "Tutorial o ID $tutorialId został pomyślnie zaktualizowany."
} catch {
    Write-Host "Wystąpił błąd podczas aktualizacji tutoriala o ID $tutorialId. Błąd: $_"
}