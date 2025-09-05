

A React Native app is composed of JavaScript files and any accompanying images, which are bundled together by the metro bundler and distributed as part of a platform-specific binary (i.e. an .ipa or .apk file). Once the app is released, updating either the JavaScript code (e.g. making bug fixes, adding new features) or image assets, requires you to recompile and redistribute the entire binary, which of course, includes any review time associated with the store(s) you are publishing to.[1]


Code-push allows to push hot-fixes to mobile devices without waiting for the app store.

FF separates code deploy from feature release. FF acts as a safety net for feature releases. Here are some of the advantages:
1- Enable and disable features without following the regular lengthy release process.
2- The ability to test features in production for a restraint group of users.
3- Do A/B testing: 
4- Enable controlled rollouts that allow releasing new features gradually. The goal is to decouple the feature rollout from the deployment of the application.

# Resources

- [1] [Code push](https://github.com/microsoft/react-native-code-push)