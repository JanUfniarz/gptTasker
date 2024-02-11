//package com.example.backend.gpt.tutorial;
//
//import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirector;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.params.ParameterizedTest;
//import org.junit.jupiter.params.provider.ValueSource;
//import org.mockito.InjectMocks;
//import org.mockito.Mock;
//import org.mockito.MockitoAnnotations;
//
//import java.util.Objects;
//import java.util.Optional;
//
//import static org.junit.jupiter.api.Assertions.assertThrows;
//import static org.junit.jupiter.api.Assertions.assertTrue;
//import static org.mockito.Mockito.*;
//
//public class TutorialServiceTest {
//
//    @Mock
//    private TutorialScriptsDirector scriptsDirector;
//
//    @Mock
//    private TutorialRepository repository;
//
//    @InjectMocks
//    private TutorialService service;
//
//    @BeforeEach
//    public void setUp() {
//        MockitoAnnotations.openMocks(this);
//    }
//
//    @ParameterizedTest
//    @ValueSource(
//            strings = {"not in db", "in db", "null"}
//    )
//    public void processTutorialCreationTest(String param) {
//
//        String topic = param.equals("null")
//                ? null
//                : param;
//
//        when(
//                repository.findByTopic("not in db")
//        ).thenReturn(
//                Optional.empty()
//        );
//
//        when(
//                repository.findByTopic("in db")
//        ).thenReturn(
//                Optional.of(new Tutorial())
//        );
//
//        when(
//                scriptsDirector.create(topic)
//        ).thenReturn("<@start>" + topic + "<@topic>kredki<@head>Aby prawid│owo rysowaŠ kredk╣, nale┐y pamiŕtaŠ o kilku wa┐nych krokach. Po pierwsze, upewnij siŕ, ┐e k\n" +
//                "redka jest dobrze naostrzona. Mo┐esz to zrobiŠ za pomoc╣ temperˇwki lub no┐yczek do kredki. Nastŕpnie, trzymaj╣c kr" +
//                "edkŕ w rŕce, z│ˇ┐ j╣ w palcach tak, abyť mia│ pe│n╣ kontrolŕ nad jej ruchem. Gdy zaczynasz rysowaŠ, u┐ywaj lekkiego" +
//                " nacisku, aby uzyskaŠ delikatne linie. Jeťli chcesz uzyskaŠ ciemniejsze odcienie, zwiŕksz nacisk na kredkŕ. Pamiŕta" +
//                "j rˇwnie┐, ┐e mo┐esz mieszaŠ kolory, nak│adaj╣c jedn╣ kredkŕ na drug╣. To pozwoli Ci uzyskaŠ rˇ┐ne efekty i odcieni" +
//                "e. Na koniec, po zako˝czeniu rysowania, mo┐esz u┐yŠ sprayu fixative, aby zabezpieczyŠ i utrwaliŠ swoje dzie│o. Pami" +
//                "ŕtaj, ┐e rysowanie kredk╣ to proces, ktˇry wymaga cierpliwoťci i praktyki, wiŕc nie zra┐aj siŕ, jeťli nie od razu o" +
//                "si╣gniesz zamierzony efekt. Ăwicz regularnie i eksperymentuj z rˇ┐nymi technikami, aby rozwijaŠ swoje umiejŕtnoťci." +
//                "<@paragraph><@end>");
//
//        //* Method call
//        service.processTaskCreation(topic);
//
//        verify(
//                repository, times(1)
//        ).findByTopic(topic);
//
//        verify(
//                repository, times(
//                        Objects.equals(topic, "in db")
//                                ? 1 : 0
//                )
//        ).delete(any());
//
//        verify(
//                repository, times(1)
//        ).save(any());
//
//        verify(
//                scriptsDirector, times(1)
//        ).create(topic);
//    }
//
//    @ParameterizedTest
//    @ValueSource(
//            strings = {"╣", "│", "ť", "ˇ", "┐", "Ä™", "ŕ", "Š", "˝", "č"}
//    )
//    public void repairPolishCarsTest(String str) {
//        String res = service.repairPolishChars(str);
//
//        System.out.println(str + " -> " + res);
//
//        assertTrue("ąłśóżęćńź".contains(res));
//    }
//
//    @ParameterizedTest
//    @ValueSource(
//            longs = {0, 1}
//    )
//    public void deleteTutorialTest(Long id) {
//
//        when(
//                repository.existsById(
//                        eq(1L)
//                )
//        ).thenReturn(true);
//
//
//        when(
//                repository.existsById(
//                        eq(0L)
//                )
//        ).thenReturn(false);
//
//        if (id == 0) {
//            assertThrows(
//                    IllegalStateException.class,
//                    () -> service.deleteTask(id)
//            );
//            return;
//        }
//
//        //* Method call
//        service.deleteTask(id);
//
//        verify(
//                repository, times(1)
//        ).deleteById(id);
//    }
//
//    @Test
//    public void getTutorialTest() {
//
//        service.getTaskList();
//
//        verify(
//                repository, times(1)
//        ).findAll();
//
//    }
//
//}