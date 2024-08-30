function fn() {
  var env = karate.env; // get system property 'karate.env'
  var config = {
    baseUrl: 'https://api.freeapi.app/api/v1'
  };

  // Retrieve the userId from Karate's global scope
  var categoryid = karate.get('categoryid');

  if (categoryid) {
    // If userId is set, include it in the configuration
    config.categoryid = categoryid;
    karate.log('Category ID is set to:', categoryid);
  } else {
    // Handle the case where userId is not set
    karate.log('category ID is not set.');
    // Optionally set a default value or take other actions
    // config.userId = 'defaultId'; // Optional
  }

  return config;
}