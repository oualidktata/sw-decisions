#
### Integrating with the CLI using code-generation schematics
A library typically includes reusable code that defines components, services, and other Angular artifacts (pipes, directives) that you import into a project. A library is packaged into an npm package for publishing and sharing. This package can also include schematics that provide instructions for generating or transforming code directly in your project, in the same way that the CLI creates a generic new component with ng generate component. A schematic that is packaged with a library can, for example, provide the Angular CLI with the information it needs to generate a component that configures and uses a particular feature, or set of features, defined in that library. One example of this is Angular Material's navigation schematic which configures the CDK's BreakpointObserver and uses it with Material's MatSideNav and MatToolbar components.

Create and include the following kinds of schematics:

Include an installation schematic so that ng add can add your library to a project.

Include generation schematics in your library so that ng generate can scaffold your defined artifacts (components, services, tests) in a project.

Include an update schematic so that ng update can update your library’s dependencies and provide migrations for breaking changes in new releases.

What you include in your library depends on your task. For example, you could define a schematic to create a dropdown that is pre-populated with canned data to show how to add it to an application. If you want a dropdown that would contain different passed-in values each time, your library could define a schematic to create it with a given configuration. Developers could then use ng generate to configure an instance for their own application.

Suppose you want to read a configuration file and then generate a form based on that configuration. If that form needs additional customization by the developer who is using your library, it might work best as a schematic. However, if the form will always be the same and not need much customization by developers, then you could create a dynamic component that takes the configuration and generates the form. In general, the more complex the customization, the more useful the schematic approach.

## Publishing your library

## Assets in libraries
In your Angular library, the distributable can include additional assets like theming files, Sass mixins, or documentation (like a changelog). For more information copy assets into your library as part of the build and embed assets in component styles.
## Peer dependencies
Angular libraries should list any @angular/* dependencies the library depends on as peer dependencies. This ensures that when modules ask for Angular, they all get the exact same module. If a library lists @angular/core in dependencies instead of peerDependencies, it might get a different Angular module instead, which would cause your application to break.
## Related
## Resources