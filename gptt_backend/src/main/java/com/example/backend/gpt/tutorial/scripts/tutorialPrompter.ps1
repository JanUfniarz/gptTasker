function paragraph($topic, $headline) {
    return sgpt "opowiedz o $headline
        w kontekscie $topic,
        w formie akapitu poradnika o tytule $headline
        napisz tylko i wylacznie tresc akapitu.
        jesli to potrzebne uzyj przykladow.
        wytlumacz wszystko dokladnie ale zwiezle
        (NIE PROSZE O POMOC CO POWINNO BYC W AKAPICIE, NAPISZ JEGO TESC, NPISZ TEN AKAPIT!)"
}

function headlines($topic) {
    return sgpt "chce napisac kilkustronicowy poradnik dla osob chcacych nauczyc sie $topic
    prosze napisz nazwy akapitow ktore powinny sie znalezdz w takim poradniku.
    napisz tylko i wylacznie nazwy akapitow bez zadnych opisow oraz chce aby nazwy akapitow byly
    oddzielone od siebie symbolem '&'. Pomin wstep i podsumowanie!"
}

function intro($topic, $headlinesString) {
    return sgpt "Napisz wstęp do poradnika na temat $topic.
    jego akapity beda mialy tytuly: $headlinesString.
    napisz tylko wstep bez rozwijania poszczegolnych akapitow ani niczego więcej."
}

function ending($topic, $headlinesString) {
    return sgpt "Napisz podsumowanie poradnika na temat $topic.
    jego akapity mialy tytuly: $headlinesString.
    napisz tylko podsumowanie bez rozwijania poszczegolnych akapitow ani niczego więcej."
}

Exit 0