//  -- Key Details --
//  
//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For precise version information, see __config_bootstrapper().
//  
//  -- Intent --
//  
//  This bootstrapper enables packages to be smoothly imported into a project without writing any code.
//  This is for the benefit of the developer as much as it is a convenience for extensions/importing tools.
//  The bootstrapper exists to ensure that packages are being initialised in the correct order.
//  Some packages may depend on other packages. This bootstrapper provides a framework for dependencies.
//  
//  -- Usage --
//  
//  1) Create a blank room with no instances at the top of the Rooms section of the Resources pane.
//     (Once the bootstrapper has finished, it'll use room_goto() to move to the second room.)
//  2) Import the bootstrapper scripts, and the oBootstrapper object.
//  3) Import packages as you see fit. Configure them as required. Ensure you import dependencies.
//  4) Hit F5. If the package makers have done their job, the packages will load without errors.
//  5) Have fun building a game using the tools you've imported!
//  
//  
//  
//  
//  -- Making A Package --
//  
//  For a package to interface fully with the bootstrapper, five things must happen:
//     
//     1) The package must use gml_pragma( "global", ... ) to execute an initialisation script;
//     2) The initialisation script must only define variables essential to the package's operation;
//     3) If further processing is needed, the initialisation script may queue a script into the bootstrapper;
//     4) Any further operations must occur inside scripts queued into the bootstrapper;
//     5) The package must declare itself finished once the initialisation process for that package has finished.
//  
//  Step 1)
//  gml_pragma( "global", ... ), or "global pragma" for short, is a new functionality introduced in GMS2.
//  It allows for code to be executed before the game fully boots - this means code is run before the first room.
//  This is handy because it means a script can be executed without writing any code at all...
//  ...unfortunately, the order of execution isn't explicit and is liable to change depending on various factors.
//  By using a priority queue system, the bootstrapper has a grip on the order of initialisation for packages.
//  NB. A package should only use a global pragma once to avoid conflicts!
//  
//  Step 2)
//  So that packages can depend on each other and so that the bootstrapper system is robust, we ask that
//  developers use the initialisation script (containing gml_pragma) for the bare minimum initialisation of a package.
//  Any processing that needs to be carried out after basic initialisation should be done in another script/phase.
//  
//  Step 3)
//  The bootstrapper exposes the script "bootstrapper_queue()" for queuing additional scripts for execution.
//  bootstrapper_queue() queues up a script with a priority, to be executed by the bootstrapper on game start.
//  N.B. Numerically greater priorities are executed first!
//  Please choose your priorities carefully with ample space between operations. Increments of 100 are recommended.
//  
//  Step 4)
//  Most packages will need to perform processing after running a global pragma (see Step 1).
//  This processing, as much as is possible, should be done in a different script (or script phase, see Example B).
//  By using various tools and design patterns, it is possible to have quite complex package initialisation flows.
//  Each example in this project demonstrates a different approach that may be useful for different packages.
//  
//  Step 5)
//  The script "bootstrapper_set_package_as_finished()" is used to indicate a package has finished loading.
//  The bootstrapper will work forever unless all packages declare themselves finished!
//  
//  -- Recommendations For Packages --
//  
//  # Display the author, license, and contact details in a __readme script. Indicate your dependencies here too.
//  
//  # Make your package name string clear and concise. Put that in the __readme script as well.
//    Other packages will rely on this string if using your package as a dependency.
//  
//  # Prefix masros/enums, global variables, and scripts with your package name (or an unambiguous abbreviation).
//    If you're using macros, please put them in a __config script so they're easy to find.
//    If your package has any other assets (sprites etc.) make sure they use consistent package naming too.
//  
//  # Please use this style guide:
//    https://github.com/GameMakerDiscord/gists/blob/master/coding-standard-for-packages
//    Publicly hosted packages on the GitHub will be refused if they do not meet this standard.
//  
//  # Try to avoid changing priority values between version. Changing your package name is also a very bad idea.
// 
//  # Try to use the phase system as much as possible. It'll generally lead to neater code.
//    Include a default: case in your phase switch statement. This helps to catch bugs.
//  
//  # If queuing multiple scripts, use increments of 100 between script priorities.
//  
//  # If you *must* use wait loops (and do try to avoid them), place them in a separate script.
//    This avoids having to handle messy phase values for scripts.
//  
//  # Add in lots of informative and clear error messages to help with debugging. Document your code.
//    Use @param and @desc. Write clear comments, even if you never expect anyone to need them.
//  
//  # Use __ double underscores before scripts that are intended to be "private" and not accessed by the developer.
//    This avoids clogging up the namespace and makes dealing with autocomplete for pleasant for everyone.