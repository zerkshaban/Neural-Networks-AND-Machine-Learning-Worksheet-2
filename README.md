# Neural-Networks-AND-Machine-Learning-Worksheet-2
7COM1033
Semester B 2019/20
10 Feb 2020
Neural Networks & Machine Learning: Worksheet 2

Aim
In this lab you will explore the use of Matlab facilities for numerical processing and their use for implementing Machine Learning algorithms. You will also install the Netlab toolbox and get started with using it. After completing
this sheet successfully, you will
• know how to write Matlab scripts and functions, and how to use them,
• have a working installation of the Netlab Toolbox,
• have carried out K-means clustering and graphically displayed its results
• have experience of implementing some essential elements of unsupervised vector quantisation in code.
Scripts and functions are important devices to organise your work, and to get the most out of the practical sessions.
Please see Appendix A for some further guidance and advice.
This worksheet is not marked and no submission is required.
Tasks
Read the remainder of the Introduction to Matlab by David F. Griffiths, available at
http://www.maths.dundee.a.uk/ftp/na-reports/MatlabNotes.pdf.
of which you read pages 1 – 32 in the process of completing Worksheet 1 last week. Also, take a look at the “Programming” section of the Matlab online documentation, especially at the “Scripts” and “Functions” subsections.
These materials will help you complete the tasks below.
1. Writing Scripts and Functions. The objectives in this task are deliberately trivial. The main objective is to
get started with scripts and functions using very simple examples.
(a) Write a script that displays “hello 7com1033“ 5 times.
(b) Write a function that takes a number n as a parameter and returns “hello” repeated n times.
2. Install Netlab. Visit the website
https://www2.aston.a.uk/eas/researh/groups/nrg/resoures/netlab/downloads
and download from there
• the Toolbox 3.3 file (netlab3.zip),
• the accompanying Help Files (nethelp3.zip),
• the file foptions.m.
In case of any issues, the files are also available from the 7COM1033 Canvas site.1
Install these Netlab using
the instructions on the Netlab website. Place the foptions.m file in the same directory where you stored
the files extracted from netlab3.zip.
3. K-Means. Further guidance for this task is provided in Appendix B for this task. You may read that before
trying the task, or try it first and use the Appendix if you get stuck, or to compare your solution with the
suggested approach.
1At the time of writing this sheet, the foptions.m link appears to be broken.

(a) Create a matrix of data points D = {(1,1), (2,1), (3,1), (5,5), (5,6), (6,5), (6,6)} in which each point
occupies one row in your matrix. Also create a matrix of initial codevectors C = {(2,2),(2,3)}.
(b) Show the data and codevectors in one scatterplot, using different colours and symbols for the data
points and the codevectors.
Can you estimate from the plot what the initial clusters will be? And on that basis, where would you
expect the codevectors to be after the first iteration of the K-means algorithm?
(c) Study the documentation of Netlab’s kmeans function and use that to run K-means clustering on the
data, starting with the initial codevectors. Show the codevectors produced by kmeans in a plot, along
with the data. You may need to pass in options to the kmeans function, which you can obtain from
foptions. A minimal example of running kmeans is
% reate matrix of data points as variable d
% reate matrix of ode vetors as variable 
options = foptions();
kmeans(, d, options);
(d) Consult the documentation on configuring kmeans via options. Set options(14) to 1 to have each
call to kmeans run one single iteration only. Use this to graphically display the data and the codevectors
for each iteration, starting with the initial codevectors (see above) and ending when the algorithm has
converged (i.e. when the codevectors do not change in an iteration).
(e) Use your code to kmeans to cluster the data provided in the data.mat file. You may also experiment
with the data in the sparrows.dat file.
4. Simple Competitive Learning. Write a function that performs one step of Simple Competitive Learning.
The function should take a data matrix, a matrix of initial codevectors, and a learning rate as parameters. It
should choose a data point at random, find the winning codevector, move it towards the data point, return the
codevector matrix updated accordingly. Use the following function as a starting point:
funtion odevetorsUpdated = smStep(data, odevetors, learningRate)
% hoose a data point randomly
% ompute distanes of all odevetors to the data point
% determine winning odevetor
% ompute hanges to winner's omponents
% assign odevetors with the winner updated to odevetorsUpdated
end
Add your code to actually implement the functionality outlined in the five comments.
Use the function to compute a step of Simple Competitive Learning, starting from the data points D and
codevectors C you used for K-means above. Display the data, the initial codevectors, and the codevectors
after an update in a scatterplot. Experiment with different learning rate settings, and verify that the winning
codevector gets closer to the data point as the learning rate increases towards 1. Can you demonstrate how
learning “overshoots” when you use a learning rate greater than 1?
Compute a second step by using the updated codevectors produced in the first step as the starting codevectors
for the next step. Develop a loop that performs 10 steps of learning, and finally write a function to carry out
n steps, given a data matrix and a learning rate.

