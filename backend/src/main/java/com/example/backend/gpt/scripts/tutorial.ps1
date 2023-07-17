#Skrypt generuje plik tekstowy z poradnikiem na temat podany w argumencie

$topic = $args[0]

$headlineRes = sgpt "chce napisac kilkustronicowy poradnik dla osob chcacych nauczyc sie $topic
    prosze napisz nazwy akapitow ktore powinny sie znalezdz w takim poradniku.
    napisz tylko i wylacznie nazwy akapitow bez zadnych opisow oraz chce aby nazwy akapitow byly
    oddzielone od siebie symbolem '&'"

$headlines = $headlineRes -split "&"

$resultPath = "../results/$topic.txt"

if (Test-Path -Path $resultPath) {
    Remove-Item -Path $resultPath -Force
}

New-Item -Path $resultPath -ItemType File

Add-Content -Path $resultPath -Value $topic

foreach ($headline in $headlines) {

    Add-Content -Path $resultPath -Value "`n"
    Add-Content -Path $resultPath -Value $headline

    $paragraph = sgpt "napisz prosze tresc akapitu $headline
        do poradnika o tytule 'jak nauczyć sie $topic'.
        napisz tylko i wylacznie tresc akapitu.
        jesli to potrzebne uzyj przykladow.
        wytlumacz wszystko dokladnie ale zwiezle
        (NIE PROSZE O POMOC CO POWINNO BYC W AKAPICIE, NAPISZ JEGO TESC, NPISZ TEN AKAPIT!)"

    Write-Host "paragrapr $headline written successfully!"

    Add-Content -Path $resultPath -Value "`n"
    Add-Content -Path $resultPath -Value $paragraph
}

notepad $resultPath