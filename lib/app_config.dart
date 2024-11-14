String baseUrl = 'https://api.themoviedb.org/3';
bool isProduction = false;
String sentryDSNUrl = '';

//TODO to use this pass this variable while running app using => --dart-define=secretClientId=my_value
const secretClientId = String.fromEnvironment('secretClientId');

void setupEnv(Environment env) {
  switch (env) {
    case Environment.dev:
      {
        baseUrl = 'https://api.themoviedb.org/3';
        break;
      }

    case Environment.prod:
      {
        isProduction = true;
        baseUrl = 'https://api.themoviedb.org/3';
        break;
      }
    case Environment.stag:
      {
        isProduction = true;
        baseUrl = 'https://api.themoviedb.org/3';
        break;

      }
  }
}

enum Environment { dev, prod, stag }