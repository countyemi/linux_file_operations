<h1> disk_usage script</h1>
<p>The disk usage script checks for directory and file sizes in the path provided.</p>
<ul> 
  <li>it takes one compulsory argument. "the directory path" and</li>
<li>two optional arguments "-n" and "-d"</li>
  <p>"-n" is followed by an integer which specifies the top N directories to display</p>
  <p>if "-n" is not passed in the command line argument, default is 8</p>
  <p> If "-d" is passed, then list of directories and files should be displayed. if not, only directories should be displayed</p>
</ul>
<p>this is the test case for the diskusage script <img src="./images/disk_usage_test_case.JPG" ></p>

<h1>backup script</h1>
<p>the back up script takes two arguments.</p>
<ul>
  <li>source and</li>
  <li>destination path</li>
</ul>
<p>it creates a backup of the source with the destination and timestamp</p>
<p>it also creates a tar file of the back up. It checks for the installation of tar on the host machine before creating the backup and installs it if it is not available</p>
<p>this is the test case for the backup script <img src="./images/backup_test_case.JPG" </p>
