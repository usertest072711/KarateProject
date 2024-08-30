package JavFaker;

import com.github.javafaker.Faker;

public class RandomDataGenerator {

    private static Faker faker = new Faker();

    public static String getName() {
        return faker.name().fullName().toLowerCase();
    }

    public static String getEmail() {
        return faker.internet().emailAddress();
    }



}
