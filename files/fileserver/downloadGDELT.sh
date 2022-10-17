#!/bin/bash 

#Get url towards latest GDELT master file
content_regex="export.CSV.zip"
curl -v --silent http://data.gdeltproject.org/gdeltv2/masterfilelist.txt --stderr - |grep $content_regex | while read line ; do
   IFS=' ' read -a content_components <<< $line
#    echo ${content_components[2]}
   IFS='/' read -a url_components <<< ${content_components[2]}
#    echo ${url_components[4]}
   IFS='.' read -a file_components <<< ${url_components[4]}
#    echo ${file_components}
   Year=${file_components:0:4}
   Month=${file_components:4:2}
   Day=${file_components:6:2}
   if (( ${file_components} > 20220224000000 ))
   then
      echo downloading ${content_components[2]}
      csv_file_name="/data/datasets/${Year}/${Month}/${Day}/${file_components}"
    #   echo $csv_file_name
      curl "${content_components[2]}" --create-dirs --output "${csv_file_name}.zip"
      unzip "${csv_file_name}.zip" -d "/data/datasets/${Year}/${Month}/${Day}"
      rm ${csv_file_name}.zip
   fi
done