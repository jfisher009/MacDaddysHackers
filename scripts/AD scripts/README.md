# General Walkthrough and tips for securing windows AD 
(Essential tasks and stuff is listed first. For general tips, see the last paragraph)

Before starting, I want to mention that aside from the Windows-specific tips and steps, everything that is 
discussed here is useful for any machine/position you have on the team. And if you end up only taking one
thing away from this file, let it be this: Please (as awkward and uncomfortable as it may be) ask for help 
if you need it, and if someone is struggling, ask them if they need help. I cannot emphasize how important 
good teamwork is in this competition. You can be the best/smartest programming/cyber defense/computer science 
student ever, but if the team isn't working together you will not do well. Take it from me - an accounting major. 



These first couple steps are interchangeable, but should all be first priority when the competition starts. 
Injects can wait until these first couple are all complete.

- change default Administrator password. Use the guide/password we prepare before the competition.

- configure/activate firewall

- If they are not already (you should check) block ports 445 and 139 completely. Don't allow anything through
  these ports.
  
- remove unauthorized users, emphasis on unauthorized administrators

- restrict administrator priviledges. in "GPO > Administrator Settings"
  the restriction should only allow administrators to do what is expected. Use common sense.
  
- Download the github repository. 
  In the "AD scripts" folder, open "scripts" and then see the "Download GitHub" file for instructions.
  It works in the practice environment if you want to try it out. Fingers crossed it will work on competition day.

These next few should be done when you have time. If an inject comes in, complete it first. 
Otherwise, when you have time complete the below tasks.

- Stop and disable printspooler. This is in the services screen.

- Enable BitLocker. This is in "Server Manager" > "Manage" > "Add roles and features" > "Features".

  You will need to restart the server for this change to take effect.

- Add logon banner (read below before starting this)
  The below text is what you should use. You can copy and paste this, just make sure to FIX DATE & TEAM NUMBER.
  Also, if there is an inject asking for this, make sure it includes anything and everything the inject asks for. 
  This is a super easy task so editing the logon banner is not something we should miss/lose points on. Ask for
  help if you need any.
  When pasting, windows will not wrap the text on the logon screen, so hit enter every once in a while to 
  "wrap" it yourself. You should also log out and log back in to not only make sure it works, but also grab a
  screenshot so you can make sure it looks good. You may have to log out a couple times for it to kick in:
  
  WARNING
  
  This computer network belongs to Team ## and may be used only by Team ## employees only and for approved work-related purposes. Team ## reserves the right to consent to a valid law enforcement request to search the network logs for evidence of a crime stored within the network and can be used to prosecute abuse.
  Updated ##/##/20##
  
- Create a password policy. 
  use common good practice
  
- NTP Setup
  There is a PNG of this on github. use it for reference also see the following link
  https://docs.vmware.com/en/VMware-Horizon-DaaS/services/horizondaas.install910/GUID-AEC90E5F-C5B6-447F-B03F-C1060C405E1F.html

## TIPS
Once these are done, all you should do is focus on injects, help others (please), and every once in a while do a check 
up on the machine to make sure nothing weird is going on. If we are using trello to keep up with tasks, please update 
the trello board as you work. It's very helpful for the entire team to know how busy you are, and it also helps you
keep track of what you're currently working on/what still needs to be done. That goes for any machine you are working
on. If there is something else of importance I forgot to note here, feel free to add.

Thanks, Jacob
