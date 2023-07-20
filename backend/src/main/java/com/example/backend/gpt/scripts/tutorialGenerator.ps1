. .\paragraphGenerator.ps1

$topic = $args[0]

$headlineRes = sgpt "chce napisac kilkustronicowy poradnik dla osob chcacych nauczyc sie $topic
    prosze napisz nazwy akapitow ktore powinny sie znalezdz w takim poradniku.
    napisz tylko i wylacznie nazwy akapitow bez zadnych opisow oraz chce aby nazwy akapitow byly
    oddzielone od siebie symbolem '&'. Pomin wstep i podsumowanie!"

$headlines = $headlineRes -split "&"

$tutorial = $topic + "<@topic>"

$intro = sgpt "Napisz wstęp do poradnika na temat $topic.
    jego akapity beda mialy tytuly: $($headlineRes.Replace("&", ", ")).
    napisz tylko wstep bez rozwijania poszczegolnych akapitow ani niczego więcej."

$tutorial += "Wstęp<@head>$intro<@paragraph>"

foreach ($headline in $headlines) {
    $paragraph = generateParagraph($topic, $headline)

    $tutorial += "$headline<@head>$paragraph<@paragraph>"
}

$ending = sgpt "Napisz podsumowanie poradnika na temat $topic.
    jego akapity mialy tytuly: $($headlineRes.Replace("&", ", ")).
    napisz tylko podsumowanie bez rozwijania poszczegolnych akapitow ani niczego więcej."

$tutorial += "Podsumowanie<@head>$ending"

Write-Host $tutorial