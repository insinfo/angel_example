/*// ignore: unused_import
import 'package:angel_example/angel_example.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:logging/logging.dart';
import 'package:file/local.dart';
import 'package:file/file.dart' as file;
import 'package:angel_static/angel_static.dart' as static_file_server;

main() async {
  var app = Angel(), http = AngelHttp(app);
  app.logger = Logger('teste')
    ..onRecord.listen((rec) {
      print(rec);
      if (rec.error != null) print(rec.error);
      if (rec.stackTrace != null) print(rec.stackTrace);
    });

  await app.configure(configureServer);
  await http.startServer('127.0.0.1', 3000);
  print('LogRecord  listening at ${http.uri}');
}

Future configureServer(Angel app) async {
  var fs = const LocalFileSystem();
  await app.configure(configureRoutes(fs));
}

AngelConfigurer configureRoutes(file.FileSystem fileSystem) {
  return (Angel app) async {
    app.get('/', (req, res) => res.write('hello'));

    if (!app.environment.isProduction) {
      var vDir = static_file_server.VirtualDirectory(
        app,
        fileSystem,
        source: fileSystem.directory('web'),
      );
      app.fallback(vDir.handleRequest);
    }

    app.fallback((req, res) => res.write('No exists'));

    var oldErrorHandler = app.errorHandler;
    app.errorHandler = (e, req, res) async {
      if (req.accepts('text/html', strict: true)) {
        if (e.statusCode == 404 && req.accepts('text/html', strict: true)) {
          await res
              .render('error', {'message': 'No file exists at ${req.uri}.'});
        } else {
          await res.render('error', {'message': e.message});
        }
      } else {
        return await oldErrorHandler(e, req, res);
      }
    };
  };
}
*/