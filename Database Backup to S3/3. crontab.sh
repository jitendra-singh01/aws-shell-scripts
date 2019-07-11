#script 3 - Setup Cronjob

# This shell script takes input from user and validates input given by user using the function val_fun and then creates a Cronjob 
# by the parameters passed by user

val_fun()
{
 if [ "$2" == "date" ]
 then    
	 if [ $a -gt 31 ]
	 then
		 echo "$2 must be between (1-31)"
	         while [ $a -gt 31 ]
	         do
			 echo "Enter the $2"
                         read a
			 a=$a
	         done
          fi
	 echo "$2 is $a"
 fi
 if [ "$2" == "month" ]
 then
	 if [ $b -gt 12 ]
         then
                 echo "$2 must be between (1-12)"
                 while [ $b -gt 12 ]
                 do
                         echo "Enter the $2"
                         read b
                         b=$b
                 done
          fi
	  echo "$2 is $b "
 fi
 if [ "$2" == "week" ]
 then
	 if [ $c -gt 31 ]
         then
                 echo "$2 must be between (0-6)"
                 while [ $c -gt 6 ]
                 do
                         echo "Enter the $2"
                         read c
                         c=$c
                 done
          fi
  echo "$2 is $c "
 fi
 if [ "$2" == "hour" ]
 then
	 if [ $d -gt 23 ]
         then
                 echo "$2 must be between (0-23)"
                 while [ $d -gt 23 ]
                 do
                         echo "Enter the $2"
                         read d
                         d=$d
                 done
          fi
  echo "$2 is $d "
 fi
 if [ "$2" == "mins" ]
 then
	 if [ $e -gt 31 ]
         then
                 echo "$2 must be between (1-31)"
                 while [ $e -gt 32 ]
                 do
                         echo "Enter the $2"
                         read e
                         e=$e
                 done
          fi
  echo "$2 is $e "
 fi 
 if [ "$2" == "sd" ]
 then 
	 if [[ ! -d $sdir ]]
	 then
		 while [[ ! -d $sdir ]]
                 do 
			 echo "Enter a Valid Directory path"
			 read sdir
		 done
	 echo  "The Source Directory is $sdir"
 fi
 fi 
}
echo "Enter the Date"
read a
var_a=date
val_fun $a $var_a
echo "Enter the Month"
read b
var_b=month
val_fun $b $var_b
echo "Enter the Day of Week"
read c
var_c=week
val_fun $c $var_c
echo "Enter the time in hours"
read d
var_d=hour
val_fun $d $var_d
echo "Enter the time in mins"
read e
var_e=mins
val_fun $e $var_e
echo "Enter the Path to Script"
read sdir
val_f="sd"
val_fun $sdir $val_f
echo "$e $d $a $b $c /bin/bash $sdir" > crontab.txt
crontab crontab.txt
