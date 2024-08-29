<img width="301" alt="image" src="https://github.com/user-attachments/assets/e9241517-d16f-4fb2-b3aa-15025a8171b7"># Week 4 (Build Automation Tools)

### Task and project

- **Task:** A single atomic piece of work for a build e.g., compiling classes, generating Java docs
- **Project:** A composition of several tasks

Each task has a NAME, which can be used to refer to the task within its owning project, and a FULLY QUALIFIED PATH, which is unique across all tasks in all projects.

### Task actions

A task is made up of sequence of ACTION OBJECTS i.e., `Action.execute(T)` to execute a task

You can also add actions to a task e.g., `Task.doFirst()` or `Task.doLast()`

You can also abort executions using exceptions:

- `StopActionException` : aborts execution of the action
- `StopExecutionException` : aborts execution of the task and continue to the next task

### Gradle - Build Lifecycle

1. Initialization: projects are to participate in the build
2. Configuration: task objects are assembled into an internal object called Directed Acyclic Graph (DAG)
3. Build tasks are executed in the order require dby their dependency relationship

### Gradle - Task Configuration

- _Configuration Block:_ Setup variables and data structures needed by the task action when it runs in the build

- _Closure:_ A block of code specified by curly braces, holding config blocks and build actions

Example:

<img width="410" alt="image" src="https://github.com/user-attachments/assets/7b3ee000-9d60-47ef-b1fd-74ad01f9883e">

### Gradle - Tasks are Objects

Every task is internally an OBJECT, and each new task is of `DefaultTask` type, which requires functionality required for them to interface with Gradle project model.

**Methods of `DefaultTask`:**

- `dependsOn(task)` : adds a task as dependency of the calling taskk (dependency runs first)
- `doFirst(closure)` : adds block of executable code at the beginning of a task's action
- `doLast(closure)` : adds a block of executable code to the end of an action
- `onlyIf(closure)` : a predicate determining whether a task should be executed

<img width="275" alt="image" src="https://github.com/user-attachments/assets/4b9e7255-16ea-4d69-9bdd-ebd61833e71c">

<img width="189" alt="image" src="https://github.com/user-attachments/assets/a13f15ef-27cd-458a-9930-8ea800d3e31a">

<img width="306" alt="image" src="https://github.com/user-attachments/assets/927819ec-5452-486c-8869-99192c02d98c">

**Properties of `DefaultTask`**

<img width="427" alt="image" src="https://github.com/user-attachments/assets/1f75bbd7-11c1-422e-bcb8-7133bf7ba4d1">

Properties other than built-in ones can be assigned to a task.

<img width="301" alt="image" src="https://github.com/user-attachments/assets/299a160b-8c67-4bab-8ccb-50f881734257">

### Gradle Task Types - Copy

A task of type `Copy` copies files from one place into another

<img width="236" alt="image" src="https://github.com/user-attachments/assets/deea8d40-5268-4ed5-b1a2-c7cb77f6a3df">

### Gradle Task Types - Jar

A task of type `Jar` creates a jar file from source files. It packages the main source set and resources together with a trivial manifest into a jar bearing the project's name int he build/libs directory.

<img width="412" alt="image" src="https://github.com/user-attachments/assets/d39cb1c7-4cfb-4c83-8191-dc443ddfc355">

A task of type `JavaExec` runs a Java class with a `main()` method

<img width="338" alt="image" src="https://github.com/user-attachments/assets/986b14dd-04ae-4cc9-894b-ac73b5fc2607">

### Gradle - Java Plug-in

A plug-in is an extension to Gradle which configures projects. 

e.g., the JAVA plug-in (via `apply plugin : 'java'`) adds some tassk to the project which will compile and unit test your Java source code, and bundle into a JAR.



