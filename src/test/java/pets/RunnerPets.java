package pets;

import com.intuit.karate.junit5.Karate;

public class RunnerPets {
    @Karate.Test
    Karate petGet(){
        return Karate.run("pets").relativeTo(getClass());
    }
}
