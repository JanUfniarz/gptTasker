function contents($topic) {
    return sgpt "podaj od 20 do 30 pytan do quizu na temat '$topic'
        (nie podawaj odpowiedzi). bardzo wazne jest abys podal
        tylko i wylacznie to o co cie prosze.
        Pytania oddziel od siebie znakiem &.
        Prosze zachowaj nastepujacy format odpowiedzi: 'pytanie&pytanie&pytanie&itd'.
        Bardzo wazne jest dla mnie zebys zachowal format odpowiedzi o ktory prosze,
        czyli zebys pomiedzy pytaniami stawial znak &."
}

function anwers($topic, $content) {
    return sgpt "mam pytanie do quizu na temat $topic, pytanie brzmi:
        '$content' podaj prawidlowa odpowiedz oraz
        od dwoch do czterech nieprawidlowych. bardzo wazne jest abys
        napisal tylko i wylacznie to o co cie prosze.
        Prawidlowa odpowiedz podaj jako pierwsza,
        oddziel ja od nieprawidlowych znakiem % a nieprawidlowe
        odpowiedzi oddziel od siebie znakiem &.
        Prosze zachowaj nastepujacy format odpowiedzi:
        'prawidlowa odpowiedz%nieprawidlowa odpowiedz&nieprawidlowa odpowiedz'.
        pamietaj ze tylko pierwsza odpowiedz ma byc prawidlowa,
        pozostale koniecznie musza byc bledne, to bardzo wazne."
}

Exit 0


#sgpt "robie quiz na temat 'gitary' potrzebuje odpowiedzi na kazde pytan
#ie jedna poprwna i reszte bledna tak aby rozwiazujacy quiz musial sie zastanowic ktora odpowiedz jest poprawna czyli bled
#ne odpowiedzi nie moga byc poprawne ale nie moga tez byc w sposob oczywisty bledne, nie moga byc absurdalne maja byc praw
#dopodobne ale bledne. pytanie brzmi: 'jaka jest roznica miedzy gitara akustyczna a basowa. podaj bledna odpowiedz do moje
#go quizu. podaj tylko i wylacznie odpowiedz to bardzo wazne abys nie napisal absolutnie nic poza odpowiedzia.Podaj jedna
#bledna odpowiedz. ogranicz sie do jednego zdania. mam juz odpowiedz podaj inna"