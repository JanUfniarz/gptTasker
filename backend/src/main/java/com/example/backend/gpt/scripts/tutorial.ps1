#Skrypt generuje plik tekstowy z poradnikiem na temat podany w argumencie

$topic = $args[0]

$headlineRes = sgpt "chce napisac kilkustronicowy poradnik dla osob chcacych nauczyc sie $topic
    prosze napisz nazwy akapitow ktore powinny sie znalezdz w takim poradniku.
    napisz tylko i wylacznie nazwy akapitow bez zadnych opisow oraz chce aby nazwy akapitow byly
    oddzielone od siebie symbolem '&'. Pomin wstep i podsumowanie!"

$headlines = $headlineRes -split "&"

#$resultPath = "../results/$topic.txt"
#
#if (Test-Path -Path $resultPath) {
#    Remove-Item -Path $resultPath -Force
#}
#
#New-Item -Path $resultPath -ItemType File
#
#Add-Content -Path $resultPath -Value $topic

$tutorial = $topic + "<@topic>"

$intro = sgpt "Napisz wstęp do poradnika na temat $topic.
    jego akapity beda mialy tytuly: $($headlineRes.Replace("&", ", ")).
    napisz tylko wstep bez rozwijania poszczegolnych akapitow ani niczego więcej."

$tutorial += "Wstęp<@head>$intro<@body>"

foreach ($headline in $headlines) {

#    Add-Content -Path $resultPath -Value "`n"
#    Add-Content -Path $resultPath -Value $headline

    $paragraph = sgpt "opowiedz o $headline
        w kontekscie $topic,
        w formie akapitu poradnika o tytule $headline
        napisz tylko i wylacznie tresc akapitu.
        jesli to potrzebne uzyj przykladow.
        wytlumacz wszystko dokladnie ale zwiezle
        (NIE PROSZE O POMOC CO POWINNO BYC W AKAPICIE, NAPISZ JEGO TESC, NPISZ TEN AKAPIT!)"

    $tutorial += "$headline<@head>$paragraph<@body>"

#    Write-Host "paragrapr $headline written successfully!"
#
#    Add-Content -Path $resultPath -Value "`n"
#    Add-Content -Path $resultPath -Value $paragraph
}

$ending = sgpt "Napisz podsumowanie poradnika na temat $topic.
    jego akapity mialy tytuly: $($headlineRes.Replace("&", ", ")).
    napisz tylko podsumowanie bez rozwijania poszczegolnych akapitow ani niczego więcej."

$tutorial += "Podsumowanie<@head>$ending"

Write-Host $tutorial
#notepad $resultPath