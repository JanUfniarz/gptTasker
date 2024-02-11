. C:\Users\januf\Desktop\IDEA\fullstack\backend\src\main\java\com\example\backend\gpt\tutorial\scripts\tutorialPrompter.ps1

$topic = $args[0]
$headline = $args[1]

$outputPath = "C:\Users\januf\Desktop\IDEA\fullstack\backend\src\main\java\com\example\backend\gpt\tutorial\scripts\output.txt"

$paragraph = paragraph($topic, $headline)

$paragraph = "<@start>$headline<@head>$paragraph<@paragraph><@end>"

$paragraph | Out-File -FilePath $outputPath -Encoding utf8
Exit 0