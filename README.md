# CS1635-Fall2022
Repository for the Univeristy of Pittsburgh class CS1635 for the 2022 Fall Semester.

## Run Instructions
To run this application, run `flutter run` in the `cybersheet` directory. When prompted input '2' to select building flutter for web/chrome.

## How to Use Cybersheet
There are two options on how to use Cybersheet, you can create a character from scratch by following `New Edgerunner` or, if you already have a .json file of a character (like `Sample Edgerunner.json`) then you can select `Edit Edgerunner` to go straight to the play/edit view for characters.

### New Edgerunner
Follow through the various options for creating a character, not selecting options (leaving them blank) will randomly select options for you. Note: this randomization does not apply to the Friends and Enemies sections of the lifepath.

### Edit Edgerunner
This view allows you to edit the components of your character in a visual view. The pages are organized under tabs and are as follows from left to right:
[ Overview, Skills, Equipment, Cyberware, Lifepath, Notes ]

In order to save your character for future use, you must select `Save Edgerunner` in the top right hand corner of the page to download your character file.

#### Overview Page
The Overview page allows players to get a glimpse of their characters stats, health, equipped weapons, and other key components. Stats can be edited as text fields, and can be rolled by selecting the button with the name of the stat. Weapons can be rolled by selecting the keyboard icon in the specific weapon to be rolled. Health and Humanity are altered based on stats they are derived from. 

#### Skills Page
The Skills page gives the player a snapshot into their characters available skills and automatically assigns the values to them based on character stats.

#### Equipment Page
The Equipment page displays the character's items and can be used to move items around (whether they are equipped/stashed or on your person) create and delete items. Deleting items involves moving them right inside the stashed column or left inside the weapons column.

#### Cyberware Page
The Cyberware page displays the character's cyberware augments and allows the user to open a dialog to record the various cyberware their character has installed.

#### Lifepath Page
The Lifepath page gives a view of the backstory options the user selected during character creation.

#### Notes Page
The Notes page is a place for the user to jot down session notes in between uses of the character sheet.
