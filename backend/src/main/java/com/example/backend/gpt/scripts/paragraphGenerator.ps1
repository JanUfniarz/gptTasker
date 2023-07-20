function generateParagraph($topic, $headline) {
    return sgpt "opowiedz o $headline
        w kontekscie $topic,
        w formie akapitu poradnika o tytule $headline
        napisz tylko i wylacznie tresc akapitu.
        jesli to potrzebne uzyj przykladow.
        wytlumacz wszystko dokladnie ale zwiezle
        (NIE PROSZE O POMOC CO POWINNO BYC W AKAPICIE, NAPISZ JEGO TESC, NPISZ TEN AKAPIT!)"
}

$topic = $args[0]
$headline = $args[1]

$paragraph = generateParagraph($topic, $headline)

Write-Host "$headline<@head>$paragraph<@paragraph>"