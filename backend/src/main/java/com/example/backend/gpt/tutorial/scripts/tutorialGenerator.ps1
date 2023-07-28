. C:\Users\januf\Desktop\IDEA\fullstack\backend\src\main\java\com\example\backend\gpt\tutorial\scripts\tutorialPrompter.ps1

$topic = $args[0]

$headlineRes = headlines($topic)

$headlines = $headlineRes -split "&"

$tutorial = "<@start>$topic<@topic>"

$intro = intro($topic, $($headlineRes.Replace("&", ", ")))

$tutorial += "Wstęp<@head>$intro<@paragraph>"

foreach ($headline in $headlines) {
    $paragraph = paragraph($topic, $headline)

    $tutorial += "$headline<@head>$paragraph<@paragraph>"
}

$ending = ending($topic, $($headlineRes.Replace("&", ", ")))

$tutorial += "Podsumowanie<@head>$ending<@end>"

Write-Host $tutorial
Exit 0