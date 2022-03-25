#!/usr/bin/env bash
# this script can be used to check if environment variables are delivered properly to environment 

declare -a sensitive_variable_list=( "PASSWORD" "TOKEN"  )
declare -a variable_list=( "CONATINER" "MAIN_DIRECTORY" "S3_BUCKET_NAME" )

sanity_checks(){
	echo "  ---------- Environment variables: ---------- "

  # do sanity check for variables and print
  for key in "${!variable_list[@]}"
  do
	  VARIABLE="${!variable_list[$key]}"
	  VARIABLE_NAME="${variable_list[$key]}"
	  echo "    * ${VARIABLE_NAME}: ${VARIABLE}  "
	  if [ -z "${VARIABLE}" ]
      then
	    logMulti "Error - The ${VARIABLE_NAME} environment variable should be set, but is not." \
	      ". That script is usually launched by a Kubernetes deployment " 
	    exit 1
    fi
  done

  for key in "${!sensitive_variable_list[@]}"
  do
	  VARIABLE="${!sensitive_variable_list[$key]}"
	  VARIABLE_NAME="${sensitive_variable_list[$key]}"
	  echo "    * ${VARIABLE_NAME}: [SENSITIVE] "
	  if [ -z "${VARIABLE}" ]
      then
	    logMulti "Error - The ${VARIABLE_NAME} environment variable should be set, but is not." \
	      ". That script is usually launched by a Kubernetes deployment " 
	    exit 1
    fi
  done

  echo "  ---------------------------------------- "
}

# run scripts
sanity_checks
