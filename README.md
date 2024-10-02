# onePercent
**onePercent** is a habit-tracking application designed to help users monitor and maintain their daily and weekly habits, as well as manage one-time tasks. It adds new features to the existing habit-tracker category while keeping a clean and minimalist interface.

The app is built using the **SwiftUI** framework, utilizing **SwiftData** for data management.


## Features

### Habit & Task Cards

onePercent is divided into three main categories, or "cards," for different types of tracking:

- **Daily Habits (`Daily` card)**  
  Track habits that reset every day. Each task has a **streak** counter to measure consecutive completions. When all daily tasks are marked as complete on a particular day, the user’s overall streak (shown in the toolbar) increases.

- **Weekly Goals (`Weekly` card)**  
  Monitor tasks that should be completed several times per week. Set a weekly goal for each task, which resets every Monday. The card includes a progress tracker for each task to visualize how close you are to achieving your weekly targets.

- **One-Time Tasks (`To-Do` card)**  
  Create one-time tasks that don’t repeat. These can be marked as complete or incomplete at any time. Task details, such as category, name, and description, can be updated as needed.

### Profile Management

The `Profile` card allows users to customize their profiles, edit their names, add short descriptions, and adjust the start time for daily habit resets if the default midnight option is not preferred.

## How to Use

1. **Create Tasks:**  
   Select the appropriate card (`Daily`, `Weekly`, or `To-Do`) and use the "Add Task" button to create a new habit or task.
   
2. **Track Your Progress:**  
   - For **Daily** habits, mark tasks as complete each day to build your streak.
   - For **Weekly** habits, click the plus button on each task to log completed activities towards your weekly goal.
   - For **To-Do** tasks, mark them as complete once done.

3. **View & Edit Task Details:**  
   Tap on any task to edit its details, such as name, description, or category.

4. **Customize Your Profile:**  
   Visit the `Profile` card to update your username, introduction, or reset times for daily habits.

## Screenshots

<p float="left">
  <img src="https://github.com/user-attachments/assets/cae60a0d-cd99-4d9b-a161-6e2b7447e111" width="300" />
  <img src="https://github.com/user-attachments/assets/47e759f5-f479-4e70-abbc-a61dd58e93b8" width="300" /> 
  <img src="https://github.com/user-attachments/assets/a87df598-06e1-4827-89d0-60e4a1c934cb" width="300" />
</p>

