. C:\Users\januf\Desktop\IDEA\fullstack\backend\src\main\java\com\example\backend\gpt\tutorial\scripts\tutorialPrompter.ps1

$topic = $args[0]
$headline = $args[1]

$paragraph = paragraph($topic, $headline)

Write-Host "$headline<@head>$paragraph<@paragraph>"

Exit 0