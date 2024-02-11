# URL do endpointu
$baseUrl = "http://localhost:8080/v1/gpt/tutorial/"

# Identyfikator tutoriala, który chcesz usunąć
$tutorialId = 2

# Tworzenie URLa zgodnie z identyfikatorem tutoriala
$url = $baseUrl + $tutorialId

try {
    # Wykonanie żądania DELETE
    Invoke-RestMethod -Uri $url -Method Delete

    Write-Host "Tutorial o ID $tutorialId został pomyślnie usunięty."
} catch {
    Write-Host "Wystąpił błąd podczas usuwania tutoriala o ID $tutorialId. Błąd: $_"
}