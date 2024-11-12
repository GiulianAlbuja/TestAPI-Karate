function fn() {
    var config = {};

    var env = karate.env;
    karate.log('Running on environment:', env);

    if (env == 'qa') {} else if (env == 'dev') {} else if (env == 'prod') {}

    return config;
}
