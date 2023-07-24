. C:\Users\januf\Desktop\IDEA\fullstack\backend\src\main\java\com\example\backend\gpt\tutorial\tutorialPrompts.ps1

$topic = $args[0]

$headlineRes = headlines($topic)

$headlines = $headlineRes -split "&"

$tutorial = $topic + "<@topic>"

$intro = intro($topic, $($headlineRes.Replace("&", ", ")))

$tutorial += "Wstęp<@head>$intro<@paragraph>"

foreach ($headline in $headlines) {
    $paragraph = paragraph($topic, $headline)

    $tutorial += "$headline<@head>$paragraph<@paragraph>"
}

$ending = ending($topic, $($headlineRes.Replace("&", ", ")))

$tutorial += "Podsumowanie<@head>$ending"

Write-Host $tutorial

Exit