$mainCommands = @{
    'build'     = @{
        Description    = 'Usage: pub build [<options>] [<directories>] [--output=<directory>]
Use pub build when you''re ready to deploy your web app. When you run pub build, it generates the assets for the current package and all of its dependencies, putting them into new directory named build.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
        SubCommands    = @{
            '--all'           = @{
                Description    = 'Optional. Builds all of the buildable directories (benchmark, bin, example, test, and web) that are present.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--mode='         = @{
                Description    = 'Optional. Specifies a transformation mode. Typical values are "debug" and "release", but any word is allowed. Transformers may use this to change how they behave.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterName;    
                PossibleValues = @('release', 'debug');
            };
            '--output='       = @{
                Description    = 'Optional. Specifies where to put the build output. The default is the top-level build directory.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--web-compiler=' = @{
                Description    = 'Optional (added in 1.24). Specifies which Dart-to-JavaScript compiler to use. Possible values are "dart2js", "dartdevc", and "none" (no generated JavaScript).';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterName;    
                PossibleValues = @('dart2js', 'dartdevc', 'none');
            };
        };
    };
    'cache'     = @{
        Description    = 'Usage: pub cache add <package> [--version <constraint>] [--all]
pub cache repair            
The pub cache command works with the system cache. To add new packages to your cache, use pub cache add. To perform a clean reinstall of the packages in your system cache, use pub cache repair.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
        SubCommands    = @{
            'add'       = @{
                Description    = 'Installs a library in your cache.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--all'     = @{
                Description    = 'Optional. Use with pub add to install all matching versions of a library.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--version' = @{
                Description    = 'Optional. Use with pub add to install the best version matching the specified constraint. 
For example: $ pub cache add barback --version "<=0.8.0 <0.110"';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            'repair'    = @{
                Description    = 'It''s possible for packages in your pub cache to change or break. For example, if you follow a symlink in the packages directory and modify a package, this affects the canonical copy of that package in the system cache. The pub cache repair command performs a clean reinstall of all hosted and git packages in the system cache.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
        };
    };
    'deps'      = @{
        Description    = 'Usage: pub deps [--style=<style>]
This command prints the dependency graph for a package. The graph includes both the immediate dependencies that the package uses (as specified in the pubspec), as well as the transitive dependencies pulled in by the immediate dependencies.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
        SubCommands    = @{
            '--style=' = @{
                Description    = 'Optional. How the output should be displayed. The default is tree.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterName;    
                PossibleValues = @('compact', 'tree', 'list');
            };
        };
    };
    'downgrade' = @{
        Description    = 'Usage: pub downgrade [args] [dependencies]
Without any additional arguments, pub downgrade gets the lowest versions of all the dependencies listed in the pubspec.yaml file in the current working directory, as well as their transitive dependencies, to the .packages file.
It''s possible to tell pub downgrade to downgrade specific dependencies to the lowest version while leaving the rest of the dependencies alone as much as possible.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
    };
    'get'       = @{
        Description    = 'pub get [--offline] [--no-packages-dir | --packages-dir]
This command gets all the dependencies listed in the pubspec.yaml file in the current working directory, as well as their transitive dependencies.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
    };
    'global'    = @{
        Description    = 'pub global <command> [args] <package> [constraint]
Pub''s global option allows you to run Dart scripts from the command line when you are not currently inside a package. After activating a package, you can run scripts from that package''s bin directory. Deactivating a package removes it from your list of globally available packages.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
        SubCommands    = @{
            'activate'         = @{
                Description    = 'Usage: pub global activate [--noexecutables] [--executable=<name>] [--overwrite] <package> [constraint]
You can activate packages that live on pub.dartlang.org, a Git repository, or your local machine.

Activating a package on pub.dartlang.org: pub global activate <pub.dartlang package>
Activating a package with Git: pub global activate [-sgit|--source git] <Git URL>
Activating a package on your local machine: pub global activate --source path <path>

Updating an activated package: Once a package has been activated, you can upgrade it by activating the package again.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            'deactivate'       = @{
                Description    = 'Usage: pub global deactivate <package>
Use deactivate to remove a package from the list of available global packages.
You can no longer invoke the package''s scripts using pub global run, or at the command line.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            'list'             = @{
                Description    = 'Usage: pub global list
Use list to list all currently active packages.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            'run'              = @{
                Description    = 'Usage: pub global run <package>:<executable> [args...]
Even if a script is not configured to be run from the command line, you can still use pub global run';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };

            '--executable='    = @{
                Description    = 'Optional for pub global activate. Adds the specified executable to your PATH. You can pass more than one of these flags.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--no-executables' = @{
                Description    = 'Optional for pub global activate. Globally activates the package but doesn''t put any executables in bin. You have to use pub global run to run any executables.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--overwrite'      = @{
                Description    = 'Optional for pub global activate. Normally, if executables from two global packages have a name collision, the preexisting executable wins. If you specify this flag, the new executable overwrites the previously activated executable.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
        };
    };
    'help'      = @{
        Description    = 'pub help [<command>]
Print usage information.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
    };
    'publish'   = @{
        Description    = 'pub publish [--dry-run] [--force] [--server <url>]
This command publishes your package on pub.dartlang.org for anyone to download and depend on.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
        SubCommands    = @{
            '--dry-run' = @{
                Description    = 'Optional. With this, pub goes through the validation process but does not actually upload the package. This is useful if you want to see if your package meets all of the publishing requirements before you''re ready to actually go public.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '-n'        = @{
                Description    = 'Optional. With this, pub goes through the validation process but does not actually upload the package. This is useful if you want to see if your package meets all of the publishing requirements before you''re ready to actually go public.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--force'   = @{
                Description    = 'Optional. With this, pub does not ask for confirmation before publishing. Normally, it shows you the package contents and asks for you to confirm the upload.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '-f'        = @{
                Description    = 'Optional. With this, pub does not ask for confirmation before publishing. Normally, it shows you the package contents and asks for you to confirm the upload.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--server=' = @{
                Description    = 'Optional. If you pass --server followed by a URL, it attempts to publish the package to that server. It assumes the server supports the same HTTP API that pub.dartlang.org uses.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
        };
    };
    'run'       = @{
        Description    = 'pub run [--mode=<mode>] [--checked] <executable> [args...]
Use this command to run a Dart script in your package, or in one of its dependencies, from the command line. If your app uses transformers, pub loads and runs the appropriate transformers, then runs the app, passing in any specified parameters.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
        SubCommands    = @{
            '--checked' = @{
                Description    = 'Optional. Specify to run in checked mode. It defaults to non-checked mode.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--mode='   = @{
                Description    = 'Optional. Specifies a transformation mode. Typical values are "debug" and "release", but any word is allowed. Transformers may use this to change how they behave.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterName;    
                PossibleValues = @('release', 'debug');
            };
        };
    };
    'serve'     = @{
        Description    = 'pub serve [<options>] [<directories>]
This command gets all the dependencies listed in the pubspec.yaml file in the current working directory, as well as their transitive dependencies.

<directories>
    Optional. Use this option to specify the directories to use as input for the serve command, in addition to lib (which is always processed). The default values are web and test. Directories you might typically specify include the following: 
    -) benchmark
    -) bin
    -) example
    -) test
    -) web';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
        SubCommands    = @{
            '--all'           = @{
                Description    = 'Optional. Serves all of the buildable directories (benchmark, bin, example, test, and web) that are present.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--hostname='     = @{
                Description    = 'Optional. By default, the dev server listens on localhost. You can specify another host using the --hostname option.
For example: pub serve --hostname=127.0.0.1';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterName;    
                PossibleValues = @('release', 'debug');
            };
            '--port='         = @{
                Description    = 'Optional. By default, the dev server uses http://localhost:8080. To change the port number, use the --port option.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--mode='         = @{
                Description    = 'Optional. Specifies a transformation mode. Typical values are "debug" and "release", but any word is allowed. Transformers may use this to change how they behave.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterName;    
                PossibleValues = @('release', 'debug');
            };
            '--web-compiler=' = @{
                Description    = 'Optional (added in 1.24). Specifies which Dart-to-JavaScript compiler to use. Possible values are "dart2js", "dartdevc", and "none" (no generated JavaScript).';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterName;    
                PossibleValues = @('dart2js', 'dartdevc', 'none');
            };
        };
    };
    'upgrade'   = @{
        Description    = 'pub upgrade [args] [dependencies]
Without any additional arguments, pub upgrade gets the latest versions of all the dependencies listed in the pubspec.yaml file in the current working directory, as well as their transitive dependencies, to the .packages file.
It''s possible to tell pub upgrade to upgrade specific dependencies to the latest version while leaving the rest of the dependencies alone as much as possible. For example:
pub upgrade test args';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
    };
    'uploader'  = @{
        Description    = 'pub uploader [options] {add/remove} <email>
This command allows uploaders of a package on pub.dartlang.org to add or remove other uploaders for that package.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
        SubCommands    = @{
            'add'        = @{
                Description    = 'Add uploader.';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            'remove'     = @{
                Description    = 'Remove uploader';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
            '--package=' = @{
                Description    = 'Optional. By default, the package in the current working directory will have its uploaders modified. You can pass the --package flag to choose a package by name.
Example: pub uploader --package=transmogrify add bob@example.com';
                CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
            };
        };
    };
    'version'   = @{
        Description    = 'Print version of pub.';
        CompletionType = [System.Management.Automation.CompletionResultType]::Command;
    };
}

$globalOptions = @{
    '--help'       = @{
        Description    = 'Print usage information.';
        CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
    };
    '--version'    = @{
        Description    = 'Print version of pub.';
        CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
    };
    '--trace'      = @{
        Description    = 'Print debugging information when an error occurs.';
        CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
    };
    '--verbosity=' = @{
        Description    = 'The specified level determines the amount of information that is displayed:
-) all
Show all output, including internal tracing messages.
-) io
Show I/O operations.
-) normal
Show errors, warnings, and user messages.
-) solver
Show steps during version resolution.';
        CompletionType = [System.Management.Automation.CompletionResultType]::ParameterName;    
        PossibleValues = @('all', 'io', 'normal', 'solver');
    };
    '--verbose'    = @{
        Description    = 'Show all output, including internal tracing messages. Equivalent to --verbosity=all.';
        CompletionType = [System.Management.Automation.CompletionResultType]::ParameterValue;    
    };
}

Register-ArgumentCompleter -CommandName @('pub', 'pub.bat') -Native -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $wordToCompleteLower = $wordToComplete.ToLower()
    $commandElementValues = $commandAst.CommandElements.GetEnumerator() | 
        Select-Object -Skip 1 | 
        ForEach-Object {$_.ToString().Split('=')[0]}    

    $mainCommand = ''
    if ($commandElementValues -ne $null -and $commandElementValues -notmatch '^-') {
        $mainCommand = $commandElementValues | Where-Object { !$_.StartsWith('-') -and $mainCommands.Keys -contains $_ } | Select-Object -First 1
    }
    
    if ([String]::IsNullOrWhiteSpace($mainCommand)) {
        return $mainCommands.GetEnumerator() |
            Where-Object {$_.Key.ToString().StartsWith($wordToCompleteLower) -and $commandElementValues -notcontains $_.Key } |
            Sort-Object -Property Key |
            ForEach-Object { New-Object System.Management.Automation.CompletionResult $_.Key, $_.Key, $_.Value.CompletionType, $_.Value.Description }
    } 

    if ($mainCommands[$mainCommand].SubCommands -eq $null) {
        if ($wordToCompleteLower.Contains('=')) {
            $paramName = $wordToCompleteLower.Split('=')[0] + '='
            $values = $globalOptions[$paramName].PossibleValues
            if ($values -ne $null) {
                return $values | 
                    Where-Object {
                    $paramValue = $wordToCompleteLower.Split('=')[1]
                    if ($paramValue -eq $null) {
                        $paramValue = ''
                    }
                    $_.StartsWith($paramValue) 
                } |
                    ForEach-Object { 
                    $paramName = $wordToCompleteLower.Split('=')[0]
                    New-Object System.Management.Automation.CompletionResult $paramName=$_, $_, 'ParameterValue', $_ 
                }
            }
            
        }
        else {
            return $globalOptions.GetEnumerator() |
                Where-Object {$_.Key.ToString().StartsWith($wordToCompleteLower) -and $commandElementValues -notcontains $_.Key } |
                Sort-Object -Property Key |
                ForEach-Object { 
                New-Object System.Management.Automation.CompletionResult $_.Key, $_.Key, $_.Value.CompletionType, $_.Value.Description 
            }
        }
    }

    $subCommand = $globalOptions.GetEnumerator() + $mainCommands[$mainCommand].SubCommands.GetEnumerator() | 
        Where-Object { $_.Key.Split('=')[0] -eq $wordToCompleteLower.Split('=')[0] } | 
        Select-Object -First 1

    if ($subCommand -eq $null) {
        return $globalOptions.GetEnumerator() + $mainCommands[$mainCommand].SubCommands.GetEnumerator() | 
            Where-Object { $_.Key.ToString().StartsWith($wordToCompleteLower) -and $commandElementValues -notcontains $_.Key.Split('=')[0] } | 
            Sort-Object -Property Key |
            ForEach-Object { 
            New-Object System.Management.Automation.CompletionResult $_.Key, $_.Key, $_.Value.CompletionType, $_.Value.Description 
        }
    }

    if ($subCommand.Value.PossibleValues -ne $null) {
        return $subCommand.Value.PossibleValues.GetEnumerator() |
            Where-Object { 
            $paramValue = $wordToCompleteLower.Split('=')[1]
            if ($paramValue -eq $null) {
                $paramValue = ''
            }
            $_.StartsWith($paramValue) 
        } |
            Sort-Object |
            ForEach-Object { 
            $paramName = $wordToCompleteLower.Split('=')[0]
            New-Object System.Management.Automation.CompletionResult $paramName=$_, $_, 'ParameterValue', $_ 
        }
    } 

    $paramValue = $wordToCompleteLower.Split('=')[1]
    if ($paramValue -ne $null) {
        return TabExpansion2 -inputScript $paramValue -cursorColumn $paramValue.Length |
            Select-Object -ExpandProperty CompletionMatches | 
            Select-Object @{
            Name       = 'CompletionText'; 
            Expression = { 
                $path = $_.CompletionText.TrimStart(@('&', ' ')) 
                $subCommand.Key + $path
            }
        }, ListItemText, ResultType, ToolTip |
            ForEach-Object { 
            New-Object System.Management.Automation.CompletionResult $_.CompletionText, $_.ListItemText, $_.ResultType, $_.ToolTip 
        }
    }
}
