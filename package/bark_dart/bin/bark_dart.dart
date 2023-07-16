// ignore_for_file: avoid_print, unused_local_variable, unused_import, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:galaxeus_lib/galaxeus_lib.dart';

import 'package:path/path.dart' as path;

void main(List<String> args_raw) async {
  Future<Directory?> getPackageDirectory({
    String package_name = "package:bark_dart/bark_dart.dart",
  }) async {
    Uri? res = await Isolate.resolvePackageUri(Uri.parse(package_name));
    if (res == null) {
      return null;
    }
    List<String> paths = [...res.pathSegments];
    for (var i = 0; i < package_name.split("/").length; i++) {
      paths.removeLast();
    }
    Directory directory = Directory(path.joinAll(paths));

    if (!directory.existsSync()) {
      directory = Directory(path.joinAll(["/", ...paths]));
    }
    return directory;
  }

  Directory? base_directory_lib = (await getPackageDirectory(
      package_name: "package:bark_dart/bark_dart.dart"));

  if (base_directory_lib == null) {
    print("Maaf kami tidak bisa menemukan directory library");
    exit(0);
  }

  // Directory directory = Directory(base_directory_lib.path);
  Directory directory_lib =
      Directory(path.join(base_directory_lib.path, "lib"));
  Directory directory_template =
      Directory(path.join(base_directory_lib.path, "template"));

  Args args = Args(args_raw);

  // List<String> args_lowercase = arguments.map((e) => e.toLowerCase()).toList().cast<String>();
  String name_exe = "bark_dart";
  String help_msg = """
A command-line bark_dart.

Usage: ${name_exe} <command> [arguments]

Global options:
  help                 Print this usage information. 
  version              Print the version.
  reload               Reload package bark_dart.dart


Available commands: 
  create     Create a new Dart project.
  list_template list template 
  clean

Run "${name_exe} help <command>" for more information about a command.
""";

  List<String> commands = [
    "help",
    "create",
    "clean",
    // "run",
    "list_template",
    "version",
    "reload",
  ];

  bool args_is_to_json = args.contains([
    "--toJson",
    "--tojson",
    "-toJson",
    "-tojson",
  ]);
  bool args_is_force = args.contains(["-f", "--force"]);
  bool args_is_verbose = args.contains(["-v", "--verbose"]);
  bool args_is_help = args.contains(["-h", "--help"]);
  String? output_data = args["-o"];
  File file_output =
      File(output_data ?? path.join(Directory.current.path, "output.json"));
  String command = args[0] ?? "";

  String sub_command = args.after(command) ?? "";
  if (command == "help") {
    try {
      args.arguments.removeAt(0);
    } catch (e) {
      print(e);
    }
    if (args_is_help) {
    } else {
      args_is_help = true;
      args.arguments.add("-h");
    }
    command = args[0] ?? "help";
  }

  if (!commands.contains(command.toLowerCase())) {
    print(help_msg);
    exit(0);
  }
  bool isSucces = false;
  if (command == "reload") {
    Directory directory_pub =
        Directory(path.join(base_directory_lib.path, ".dart_tool", "pub"));
    if (directory_pub.existsSync()) {
      await directory_pub.delete(recursive: true);
    }
    bool is_procces = true;
    Process shell = await Process.start(
      "bark_dart",
      [],
      runInShell: true,
    );

    StreamSubscription<List<int>> shell_stdin = stdin.listen(
      (event) {
        shell.stdin.add(event);
      },
      onDone: () {
        is_procces = false;
      },
    );
    StreamSubscription<List<int>> shell_stder = shell.stderr.listen(
      (event) {
        stderr.add(event);
      },
      onDone: () {
        shell.kill();
        is_procces = false;
      },
    );

    StreamSubscription<List<int>> shell_stdout = shell.stdout.listen(
      (event) {
        stdout.add(event);
      },
      onDone: () {
        shell.kill();
        is_procces = false;
      },
    );

    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (is_procces) {
        continue;
      } else {
        await shell_stdin.cancel();
        await shell_stder.cancel();
        await shell_stdout.cancel();
        break;
      }
    }

    exit(0);
  }

  if (command == "clean") {
    void cleanFolder(Directory directory, bool is_current) {
      print("dir: ${directory.path}");
      try {
        List<FileSystemEntity> dirs = directory.listSync();
        for (var i = 0; i < dirs.length; i++) {
          FileSystemEntity dir = dirs[i];
          try {
            if (dir is Directory) {
              if ([
                ".dart_tool",
                "build",
              ].contains(path.basename(dir.path))) {
                if (is_current) {
                  if ([
                    "build",
                  ].contains(path.basename(dir.path))) {
                    dir.deleteSync(recursive: true);
                  }
                } else {
                  dir.deleteSync(recursive: true);
                }
              } else {
                cleanFolder(dir.absolute, false);
              }
            }
          } catch (e) {}
        }
      } catch (e) {}
    }

    cleanFolder(Directory.current, true);

    exit(0);
  }

  if (command == "version") {
    print("bark_dart version: 0.0.0 (stable) on ${Platform.operatingSystem}");
    exit(0);
  }

  if (command == "list_template") {
    print("Get Templates");
    // durationTimeOut ??= ;
    DateTime dateTimeTimeOut = DateTime.now().add(Duration(minutes: 1));
    List<FileSystemEntity> dir_template = [];
    bool is_complete = false;

    var str = directory_template.list().listen(
      (FileSystemEntity fileSystemEntity) {
        if (fileSystemEntity.statSync().type ==
            FileSystemEntityType.directory) {
          dir_template.add(fileSystemEntity);
        }
      },
      onDone: () {
        is_complete = true;
      },
      cancelOnError: true,
    );

    while (true) {
      await Future.delayed(Duration(milliseconds: 1));
      if (dateTimeTimeOut.isExpired()) {
        await str.cancel();

        exit(0);
      }
      if (is_complete) {
        await str.cancel();
        break;
      }
    }
    print("");
    for (var i = 0; i < dir_template.length; i++) {
      FileSystemEntity dirTemplate = dir_template[i];
      print("\t${path.basename(dirTemplate.path)}");
    }
    print("");
    print(
        "Jalankan Command ini untuk membuat project dengan template\n\n  ${name_exe} create name_project -t name_template");
    exit(0);
  }
  if (command == "create") {
    try {
      String two_args = args.arguments[1];
      List<String> templates = [
        "app_bark_template",
      ];
      if (args["-t"] != null && (args["-t"] as String).isNotEmpty) {
        templates = args["-t"]!.split(",");
      } else if (args["--template"] != null &&
          (args["--template"] as String).isNotEmpty) {
        templates = args["--template"]!.split(",");
      }
      if (templates.isEmpty) {
        templates = ["app_bark_template"];
      }
      String name = two_args;
      bool is_force =
          (args.arguments.contains("-f") || args.arguments.contains("--force"));
      Directory directory_create =
          Directory(path.join(Directory.current.path, name));
      if (directory_create.existsSync()) {
        if (!is_force) {
          print(
              "Directory ${directory_create.path} already exists (use '--force' to force project generation)");
          exit(0);
        }
      }
      await directory_create.create(recursive: true);
      if (templates.isEmpty) {
        templates = ["app_bark_template"];
      }
      if (templates.length > 1) {
        print("Creating ${name} using template ${templates.join(",")}...");
        for (var i = 0; i < templates.length; i++) {
          String template = templates[i];
          Directory directory_template_package =
              Directory(path.join(directory_template.path, template));
          if (!directory_template_package.existsSync()) {
            print(
                "Failed Creating ${name} using template ${template} karena tidak ada template");
            exit(0);
          }
          Directory directory_create_folder =
              Directory(path.join(directory_create.path, template));
          if (!directory_create_folder.existsSync()) {
            await directory_create_folder.create(recursive: true);
          }
          directory_template_package.copyTo(
            directory_create_folder,
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );

          directory_create_folder.renameRecursive(
            origin_name: template,
            new_name: "${name}_${template.split("_").first}",
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );
          // directory_create_folder.renameRecursive(
          //   origin_name: template.split("_").join(" "),
          //   new_name: "${name}_${template.split("_").first}".split("_").join(" "),
          //   ignoreDirList: [
          //     "build",
          //     ".dart_tool",
          //     "node_modules",
          //   ],
          //   ignoreFileList: [
          //     "pubspec.lock",
          //   ],
          // );

          directory_create.renameRecursive(
            origin_name: template,
            new_name: "${name}_${template.split("_").first}",
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );

          directory_create.renameRecursive(
            origin_name: template.camelCaseClass(),
            new_name: "${name}_${template.split("_").first}".camelCaseClass(),
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );
        }
      } else {
        String template = templates.first;
        Directory directory_template_package =
            Directory(path.join(directory_template.path, template));
        if (!directory_template_package.existsSync()) {
          print(
              "Failed Creating ${name} using template ${template} karena tidak ada template");
          exit(0);
        }

        print("Creating ${name} using template ${template}...");
        directory_template_package.copyTo(
          directory_create,
          ignoreDirList: [
            "build",
            ".dart_tool",
            "node_modules",
          ],
        );
        directory_create.renameRecursive(
          origin_name: template,
          new_name: name,
          ignoreDirList: [
            "build",
            ".dart_tool",
            "node_modules",
          ],
        );
        directory_create.renameRecursive(
          origin_name: template.camelCaseClass(),
          new_name: name.camelCaseClass(),
          ignoreDirList: [
            "build",
            ".dart_tool",
            "node_modules",
          ],
        );
      }
      print("""
Created project ${name} ! In order to get started, run the following commands:

  cd ${name}
""");
      exit(0);
    } catch (e) {
      print(e);
      exit(0);
    }
  }
}
