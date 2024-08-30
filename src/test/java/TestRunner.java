import com.intuit.karate.junit5.Karate;

public class TestRunner {


        @Karate.Test
        Karate testFeatureOne() {
            return Karate.run("classpath:ApiMocking/api-test.feature").relativeTo(getClass());
        }


}
