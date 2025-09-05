This documentation will cover these advanced topics related to forms:
1. Forms validation
2. Custom Form controls
# 1.Forms validation
## 1.1. What is form validation ?
Angular form validation is an integral technical process that verifies if any input provided by a user into a web-form is correct and complete. You can manage validation in a template-driven approach or with Angular reactive forms. Based on what is entered, the form will either allow users to proceed or will display a specific error message to help the user know where they went wrong with their data input. 

Depending on which validator failed, the on-screen error message gives feedback, indicating what is wrong and what exactly needs to be filled in or re-entered as data. In general, apps use forms to allow users to perform data-entry tasks like signing up, logging in, updating online profiles, submitting sensitive information, and more.  

Angular runs form validation every time the value of a form input is changed and to confirm if data inputs filled in a web-form by a user are accurate and complete. To do that properly, Angular calls a list of validators which are run on every change that occurs.
## 1.1. Good practices for validation
### Practice 1:
### Practice 2:
### Practice 3:



# 2. Custom Form Control
The Angular Forms and ReactiveForms modules come with a series of built-in directives that make it very simple to bind standard HTML elements like inputs, checkboxes, text areas, etc. to a form group.

Besides these standard HTML elements, we might also want to use custom form controls, like dropdowns, selection boxes, toggle buttons, sliders, or many other types of commonly used **custom** form components.

For these custom controls, we would like to have the ability to configure them as form fields using the exact same directives (ngModel, formControl,
formControlName) as we use for standard input boxes.

The goal is to make these custom forms fully compatible with the Angular Forms API, so that the component can participate in the parent form validation and value tracking mechanisms.

This means that:

- if we are using template driven forms, we will be able to plug the custom component to the form simply by using ngModel
- in the case of reactive forms, we will be able to add the custom component to the form using formControlName (or formControl)

# How to create Custom Form Controls
When creating forms in Angular, sometimes you want to have an input that is not a standard text input, select, or checkbox. By implementing the ControlValueAccessor interface and registering the component as a NG_VALUE_ACCESSOR, you can integrate your custom form control seamlessly into template-driven or reactive forms just as if it were a native input

# Create reusable nested forms
POC


