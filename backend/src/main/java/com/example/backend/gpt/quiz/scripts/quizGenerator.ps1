. C:\Users\januf\Desktop\IDEA\fullstack\backend\src\main\java\com\example\backend\gpt\quiz\scripts\quizPrompter.ps1

$topic = $args[0]

$outputPath = "C:\Users\januf\Desktop\IDEA\fullstack\backend\src\main\java\com\example\backend\gpt\quiz\scripts\output.txt"

$contentsRes = contents($topic)

$contents = $contentsRes -split "&"

$quiz = "<@start>$topic<@topic>"

foreach ($content in $contents) {
    $rightAnswer = rightAnswer($topic, $content);

    $wrongAnswers = wrongAnwers($topic, $content)

    $quiz += "$content<@content>"`
                    + "$rightAnswer<@ra>"`
                    + "$($wrongAnswers.Replace("&", "<@wa>"))"`
                + "<@question>"
}

$quiz = "$($quiz.Substring(0, $quiz.Length - 11))<@end>"

$quiz | Out-File -FilePath $outputPath -Encoding utf8

Exit 0