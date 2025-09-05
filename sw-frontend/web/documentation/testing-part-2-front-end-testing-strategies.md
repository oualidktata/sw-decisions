
# Component Driven Development
It's the development and design practice of building user interfaces with modular components. UIs are built from the “bottom up” starting with basic components then progressively combined to assemble screens


CDD helps you scale the amount of complexity you’re faced with as you build out the UI.

## Why components?
Modern user interfaces are more complicated than ever. People expect compelling, personalized experiences delivered across devices. That means frontend developers and designers have to embed more logic into the UI.

But UIs become unwieldy as applications grow. Large UIs are brittle, painful to debug, and time consuming to ship. Breaking them down in a modular way makes it easy to build robust yet flexible UIs.

Components enable **interchangeability** by isolating state from application business logic. That way, you can decompose complex screens into simple components. Each component has a well-defined API and fixed series of states that are mocked. This allows components to be taken apart and recomposed to build different UIs.

# Component Story Format (CSF)
Component Story Format (CSF) is the recommended way to write stories. It's an open standard based on ES6 modules that is portable beyond Storybook.

In CSF, stories and component metadata are defined as ES Modules. Every component story file consists of a required default export and one or more named exports.

CSF is supported in all frameworks except React Native, where you should use the **storiesOf** API instead.

# Storybook
Storybook is a tool for UI development. It makes development faster and easier by isolating components. This allows you to work on one component at a time. You can develop entire UIs without needing to start up a complex dev stack, force certain data into your database, or navigate around your application.

Building components in isolation allows you to **stress test** them to find **edge cases**. With Storybook, you write stories for each of these cases by supplying props to your component.

Storybook helps you document components for reuse and automatically visually test your components to prevent bugs. Extend Storybook with an ecosystem of addons that help you do things like fine-tune responsive layouts or verify accessibility.

Storybook integrates with most popular JavaScript UI frameworks such as angular, react and view.
## Interactive stories

Not all component variations can be reproduced with props alone. Some UI states can only be reached via **user interaction** like dropdowns, modals, and hidden form elements. In the past, you interacted with the component by hand to check whether these states looked right.

Interactive stories (beta), which allows you to simulate user behavior to run after the story renders. It cuts out the grunt work of messing with components manually.

✅ Runs in a real browser
⚡️ No waiting and no-flake
🐙 Powered by Testing Library
🛠 Low maintenance
🔍 Fast visual debugging


# Resources
[] https://www.onpathtesting.com/blog/qa-testers-what-is-the-agile-testing-pyramid
[] CDD: https://www.componentdriven.org/
[] storybook: https://storybook.js.org/docs/angular/get-started/introduction
[] Interactive Stories: https://storybook.js.org/blog/interactive-stories-beta/

