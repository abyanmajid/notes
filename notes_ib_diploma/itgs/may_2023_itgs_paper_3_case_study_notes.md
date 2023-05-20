# <strong>ITGS Paper 3 Case Study Notes (May 2023)</strong>
*Date written: May 18, 2023* \
*By: Abyan Majid*

## Table of Contents
1. [Summary of Case Study](#summary-of-case-study)
2. [Augmented Reality Mirror](#augmented-reality-mirror)
3. [In-Store Companion App](#in-store-companion-app)
4. [Customer Service Robot](#customer-service-robots)
5. [Smart shelves](#smart-shelves)
6. [Additional terminology](#additional-terminology)
7. [Sources to cite in the exam](#sources-to-cite-in-the-exam)

## Summary of Case Study
A retailer in Europe, MCA Sports, aims to enhance its physical stores—especially the
one in Geneva—to create an engaging shopper experience and future-proof its
business. Toward that goal, MCA Sports will implement the following technologies:
- Augmented Reality
- In-store companion app
- Customer service robots
- Smart shelves

## Augmented Reality Mirror
AR mirrors allow shoppers to project their images onto a large screen and virtually try
on different items of clothing

### How it works
1. The image of the shopper standing in front of the mirror is captured by a camera
or sensor (usually RGB cameras)
2. The AR system processes the image and analyzes the shopper's body shape,
and size, and creates a model of their body out of it.
3. The AR system tracks the position of the shopper in front of the mirror in
real-time using computer vision (Beyond the syllabus: specifically using one of
the following: pose estimation, ML SLAM algorithms, or feature extraction)
4. The virtual clothing items, which are pre-designed and mapped to the shopper's
body shape, are rendered and superimposed onto the shopper's image.
5. The AR mirror projects the combined image of the shopper and the virtual
clothing

### ADVANTAGES & DISADVANTAGES
(+) Allows customers to virtually try on different items of clothing, providing a more
interactive and immersive shopping experience.


(+) Eliminates the need for customers to physically change clothes, reducing the time
spent in dressing rooms and the effort of trying on multiple garments.


(-) May have limitations in accurately representing clothing fit, texture, and colour, which
can affect the realism and the try-on experiences.


(-) Its sensors, cameras, and software may be prone to malfunctions, software bugs, or
compatibility issues, which would be detrimental to the try-on experience should it occur.


(-) may raise privacy concerns as they involve capturing and processing images of
customers. The article does not mention the extent to which the image of the customer
is used by the system.

## In-Store Companion App
The in-store companion app will use augmented reality to overlay information about
each item of clothing. The app can only be used when shoppers are physically in the
store.

### HOW IT WORKS
1. The shopper captures an image/or real-time recording of the piece of clothing.
2. Through image recognition based on machine learning, the extracted template
from the captured image is matched against product images in the database
3. Once the corresponding product is found from the database, all information
related to it is returned to the UI (presumably, it’ll only appear if the (i) button is
clicked/hovered)

### WHY IT CAN’T BE USED OUTSIDE THE STORE
MCA Sports may implement the following to restrict app usage to only within the store’s
region:
- QR/Barcodes — These can be required upon entrance to the store, or when
wanting to try on any clothing. Denying to scan the QRs deny the user from
accessing the app.
- Bluetooth Low Energy (BLE) Beacon — These beacons emit signals that can be
detected by the app when the user is nearby. If not detected, the user can be
denied access.
- Geolocation — By checking the GPS coordinates or geofencing, the app can
identify whether the user is within the proximity of the store. If not, deny access to
the app.

## Customer Service Robots
Customer service robots use natural language processing (NLP) to guide customers,
and they can communicate in Chinese, English, French, German, Italian and Romansh.

### How it works
If the customer asks questions:
1. The robot uses sensors (e.g. proximity sensor, motion detector, etc) or
computer vision to detect customer’s presence.
2. The robot uses NLP algorithms to detect language spoken by the customer (limited to Chinese, English, French, German, Italian, and
Romansh).
3. The robot uses speech recognition to convert words spoken by the
customer into text and then converts it into machine language and
processes it
4. The robot accesses the knowledge base to obtain an answer. This can either be done by if-then statements or template matching between binaries.
5. The answer is turned from binary into text and voiced through its text-to-speech engine.

### If the customer wants to be guided around:
1. The robot uses computer vision to capture its surroundings in real-time
and create a model/map of obstacles to avoid
2. The robot uses predefined maps/routes (*Beyond the syllabus: this is done
by computing the minimal spanning tree*)

**Interpretation of the tablet in the robot’s chest** — it is probably a camera for computer
vision for navigating the store.

### ADVANTAGES & DISADVANTAGES
(+) Customer service robots can provide quick and accurate responses to customer
inquiries, minimizing waiting times

(+) Reduces human error because its answers are based on a knowledge base by an
expert, which is especially useful when asking questions about the quality/features of a
product (e.g. what’s it made of, etc)

(+) — ARBITRARY — If the robot has multiple processors, it can handle a large number
of customer simultaneously

(-) Expensive (expenses include hiring experts and computer engineers, inference
engine, machinery parts, maintenance and regular repairing needs)

(-) Robots may lack the flexibility and adaptability of humans in handling situations that
involve creativity (e.g. giving an opinion whether a clothing piece fits a customer or
looks good)

(-) If the computer vision and object detection model is trained poorly, or if there is an
error in the predefined routes of the store, then the robot may struggle in navigating the
store.

## Smart Shelves
Smart shelves will use the existing radio frequency identification tags (RFID) and a
stock inventory system to gather information about customers’ behaviour.

### HOW IT WORKS
1. Each product has an RFID tag which contains a unique identifier. These tags are
typically attached or embedded within the product or its packaging.
2. There HAS to be RFID readers placed throughout the store, which would emit
radio waves to detect and read the information stored on the RFID tags
3. When a customer interacts with a product (e.g. take it off the shelf and put it
back), the RFID tags are read by the RFID readers, such that real-time
movement of the product is captured
4. Then the data is transmitted to the stock inventory system and product
availability is updated real-time. So for example, should a product never be
returned to the shelf, the system will assume that it has been bought.

### ADVANTAGES & DISADVANTAGES
(+) provides real-time data on product availability

(+) automates inventory tracking, reducing the need for manual stock checks

(+) collects data on customer behaviou and demand patterns for MCA Sports.

(-) Expensive (cost include smart shelving units, sensors, RFID technology, digital
displays, hiring of software engineers for setup, maintenance, etc)

(-) May occasionally encounter technical issues like connectivity problems or inaccurate
data capture, affecting their reliability

(-) Dependence on software engineers/computer engineers or other IT guys because of
the engineering’s steep learning curve

## Additional terminology
- Augemented reality — a technology that superimposes a digital information
such as an image, video, or 3D models on a user's view of the real world
- Companion app — a companion app refers to a software application designed
to work alongside or support another main. In the context of the case study, it
assists the AR mirror’s functionality.
- Customer service robot — an autonomous or semi-autonomous machines
designed to interact with customers and provide assistance or information in a
retail or service-oriented setting (often equipped with AI algos, sensors, decision
trees, and/or knowledge bases)
- Interoperability — the ability of different systems, devices, or software
applications to seamlessly work together and exchange information in a
coordinated and efficient manner.
- Smart shelving — a system that incorporates sensors, connectivity, and data
analysis capabilities to enhance inventory management and customer
experiences in retail environments (usually incorporating RFID tags and data
analytics)
- Stakeholder analysis matrix
(IMPORTANT) — a tool used to assess
and map stakeholders involved in a
project.
    - Power: how much control or
impact do stakeholders have on
the project
    - Interest: how much do they care
about or are affected by the
project.

<p align="center">
  <img src="../!assets/stakeholder_analysis_matrix.png" />
</p>

**Benefits of the matrix**

It allows us to:
1. see which stakeholders are most important and need more focus.
2. see how stakeholders relate to each other and if there might be any conflicts or
agreements between them.
3. decide how to communicate and involve stakeholders based on their situation.
4. identify stakeholders that are least useful or unwilling to work so that this issue
can be addressed early on

- Stock inventory system — a set of processes, tools, and technologies used by
businesses to track and manage their stock of products, which is useful for
addressing product availability and for forecasting demand.
- Technological determinism — a view which argues that technology is the
primary driving force shaping society and its development.
- Technological skepticism — a view which argues that there is a need to
constantly raise questions or concerns about the potential risks, drawbacks, and
unintended consequences associated with technological advancements.

## Sources to cite in the exam
- When talking about RFID and stock inventory system:
    - Charles Walton (conceptualizer of RFID)
    - TechTarget.com (they had an article on how RFID works and its applications,
one of its points alluded to stock inventory system);
https://www.techtarget.com/iotagenda/definition/RFID-radio-frequency-identification#:~:text=The%20RFID%20reader%20is%20a,in%20the%20RFID%20tag%20itself.
    - One of Uttarayan Bagchi, Alfred L Guiffrida, Liam O’ Neill, Amy Z. Zeng
(authors of a paper titled “The Effect of RFID On Inventory Management and
Control”);
https://www.researchgate.net/publication/226051008_The_Effect_of_RFID_On_Inventory_Management_and_Control
- When talking about augmented reality:
    - One of Steve Mann, Hirokazu Kato, Ronald Azuma (modern augmented reality
researchers)
    - Harvard Business Review (hbr.org) (they had an article on how AR works);
https://hbr.org/2017/11/how-does-augmented-reality-work#:~:text=Augmented%20reality%20starts%20with%20a,which%20analyzes%20the%20video%20stream.
    - ArayaSolutions.com (they had an article on AR mirror and its benefits);
https://www.arayasolutions.com/virtual-dressing-mirror/
- When talking about stakeholder analysis matrix:
    - Indeed.com;
https://www.indeed.com/career-advice/career-development/stakeholder-matrix
    - One of Charles E. Lindblom, Ian I. Mitroff, and R. Edward Freeman (notable
figures in stakeholder theory research)

$y=x^2$