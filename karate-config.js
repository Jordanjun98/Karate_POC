function fn() {


    var config = {
            urlBase: 'https://restful-booker.herokuapp.com'
        };
        karate.configure('connectTimeout', 5000);
        karate.configure('readTimeout', 5000);


//    if (!env) {
//        env = 'staging';
//    }
//    var config = {
//    // variables & api paths
//    }
//    //'karate.env' - Get system property
//    var env = karate.env;
//    karate.log('karate.env system property was:', env);
//    if (env == 'prod') {
//        config.baseUrl = 'https://xyz.mgapis.com/';
//    } else if (env == 'staging') {
//        config.baseUrl = 'https://abc.net/';
//    }
//    karate.configure('connectTimeout', 5000);
//    karate.configure('readTimeout', 5000);
    return config;
}