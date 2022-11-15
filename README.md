## Enigma Project
### Self Evaluation

##### The following self eval is done with reference to the [Enigma - Evaluation Rubric](https://backend.turing.edu/module1/projects/enigma/rubric)

### Functionality

With respect to functionality, I believe that this project has earned a 3.5 or 3+. The enigma class has methods for encrypt, decrypt, and crack. The CLI was succesfully implemented for all three scenarios as well. What may keep this below a 4 is that the crack method returns a different key from what was used to encrypt the message originally. 

### Object Orientewd Programming

For this project there is one class (Enigma) and one module (Shift). Enigma holds the methods for encrypt, decrypt, crack, and a series of helper methods that support these three main functions. There is opportunity to move the helper methods outside of the class as the class feels long, but I also wasn't sure how practical that would be if I was keeping to one class. The module is where all the methods regarding the shift and rotation of the letter characters takes place. The way it's built means that all three methods (encrypt, decrypt, crack) utilize the same shifting methods. I decided to pull these methods out to their own module because of the repetitive nature of the original encrypt, decrypt, and crack methods. These methods are served better by utilzing a shared method pool. Overall I believe this project meets expectations for OOP and is worth a 3.

### Ruby Conventions and Mechanics

The enigma project demonstrates code that is properly indented with lines of reasonable length. Ruby naming convention is followed and classe, module, method, and variable names should reflect meaning that can be understood by someone reading the code. There are a number of hashes implemented in the project. Particularly in the helper methods in the Enigma class. There are some methods that exceed 10 lines and are an opportunity for additional refactoring. Overall I believe the project earned a 3 for Ruby conventions and mechanics.


### Test Driven Development

Regarding TDD, methods were extensively tested through rspec both at the unit and integration levels. Through simplecov, I can attest that 100% of the relevant lines were covered. Mocks and stubs weren't implemented in this project. With this in mind, I believe the project earned at 3 for TDD.


### Version Control

For this project, a little over 100 commits were made and they largely have more than a few pieces of functionality each. In addition to the commits there were 6 pull requests made during the project. The pull requests were largely made by functionality with a bit of overlap when making corrections of code that was refactored or edited for a new purpose. With regard to version control I believe this project has earned a 3.5 or 3+.