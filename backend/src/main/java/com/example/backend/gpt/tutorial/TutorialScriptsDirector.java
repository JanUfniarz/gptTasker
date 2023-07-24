package com.example.backend.gpt.tutorial;

import com.profesorfalken.jpowershell.PowerShell;
import com.profesorfalken.jpowershell.PowerShellResponse;

import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@Component
public class TutorialScriptsDirector {

    private final String path = "C:\\Users\\januf\\Desktop\\IDEA\\fullstack\\backend" +
            "\\src\\main\\java\\com\\example\\backend\\gpt\\tutorial\\";

    public String generateTutorial(String topic) {
        PowerShellResponse response = PowerShell.executeSingleCommand(
                //? "& ./tutorialGenerator.ps1 "
                "& " + path + "tutorialGenerator.ps1 "
/*
! & : The term './scripts/tutorialGenerator.ps1' is not recognized as the name of a cmdlet, function, script file, or ope
! rable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again
! .
! At line:1 char:3
! + & ./scripts/tutorialGenerator.ps1 glosniki
! +   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!     + CategoryInfo          : ObjectNotFound: (./scripts/tutorialGenerator.ps1:String) [], CommandNotFoundException
!     + FullyQualifiedErrorId : CommandNotFoundException
!
 */
                        + topic
        );
        System.out.println(response.getCommandOutput());
        return lastLine(response);
    }

    public String generateParagraph(String topic, String headline) {
        PowerShellResponse response = PowerShell.executeSingleCommand(
                "& " + path + "paragraphGenerator.ps1 "
                        + topic + " " + headline
        );
        return lastLine(response);
    }

    private String lastLine(PowerShellResponse response) {
        String output = response.getCommandOutput();

        if (response.isError()) {
            System.out.println(
                    "============================\n"
                    + output +
                    "\n============================"
            );
            throw new RuntimeException("PowerShell zwraca błąd:");
        }

        String[] lines = output.split("\\r?\\n");

        if (lines.length > 0) return lines[lines.length - 1];

        throw new RuntimeException(
                "Script did not gave any output"
        );
    }
}