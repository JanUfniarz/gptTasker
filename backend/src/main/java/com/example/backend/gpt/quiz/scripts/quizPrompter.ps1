function contents($topic) {
    return sgpt --temperature 1.0 "Tworze quiz na temat '$topic'.
        Potrzebuje od 20 do 30 pytan z ktorych kazde
        musi byc calkowicie unikatowe,
        slowa w pytaniach nie moga sie powtarzac.
        Podaj te pytania oddzielone od siebie tylko znakiem &.
        to dla mnie bardzo wazne abys podal mi dokladnie to
        o co cie prosze i wylacznie to o co cie prosze
        zachowujac dopowiedni format czyli abys miedzy
        pytaniami stawial znak &.
        Pamietaj o tymze kazde pytanie musi byc calkowicie unikatowe
        i nie moze powtarzac ani slowa z poprzednich pytan."
}

function rightAnswer($topic, $content) {
    return sgpt --temperature 1.5 "robie quiz na temat '$topic'.
        potrzebuje odpowiedzi poprawnej i kilku nieprawidlowych.
        Odpowiedz musi byc zwiezla, krotka jak do quizu.
        Pytanie brzmi: '$content' podaj prawidlowa odpowiedz.
        Bardzo wazne jest abys podal tylko i wylacznie odpowiedz
        w taki sposob aby twoja odpowiedz mogla byc uzyta
        jako odpowiedz w quizie.
        To bardzo wazne abys podal tylko i wylacznie odpowiedz
        na pytanie bez zadnych dodatkow w stylu
        'prawidlowa odpowiedz to...' napisz tylko i wylacznie odpowiedz"
}

function wrongAnwers($topic, $content) {
    return sgpt --temperature 1.0 "robie quiz na temat '$topic'
        potrzebuje odpowiedzi na kazde pytanie
        jedna poprwna i reszte bledna tak aby rozwiazujacy quiz
        musial sie zastanowic ktora odpowiedz jest poprawna
        czyli bledne odpowiedzi nie moga byc poprawne
        ale nie moga tez byc w sposob oczywisty bledne,
        nie moga byc absurdalne maja byc prawdopodobne ale bledne.
        pytanie brzmi: '$content'.
        podaj od trzech do pieciu blednych odpowiedzi do mojego quizu
        oddzielonych od siebie znakiem &.
        Podaj tylko i wylacznie odpowiedzi to bardzo wazne
        abys nie napisal absolutnie nic poza odpowiedzia.
        Podaj bledne odpowiedzi. ogranicz sie do maksymalnie
        jednego zdania na odpowiedz.
        Bardzo wazne jest dla mnie zeby odpowiedzi byly oddzielone
        od siebie znakiem &, pamietaj o tym blagam.
        Bardzo wazne jest abys podal tylko i wylacznie
        bledne odpowiedzi bez zadnych dodatkow
        w stylu 'bledna odpowiedz to...'
        napisz tylko i wylacznie odpowiedzi oddzielone znakiem &"
}

Exit 0