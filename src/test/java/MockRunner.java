import com.intuit.karate.junit5.Karate;

public class MockRunner {

    @Karate.Test
    Karate testFeatureOne() {
        return Karate.run("classpath:ApiMocking/mock.feature").relativeTo(getClass());
    }

}
