if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR vim
set -gx OMNIMOD_TECHNOLOGIES /home/jorros/src
set -gx PATH $PATH:/usr/local/go/bin
set -gx AZURE_SUBSCRIPTION_ID "177b3590-acd8-421a-87eb-8eb28cb12c86"
set -gx GOOGLE_APPLICATION_CREDENTIALS $HOME/.config/gcloud/application_default_credentials.json
set -gx BLOB_SAS_PYLON "?sp"
set -gx HH_SHIM_CONNECTION_STRING "mongodb://"
set -gx HH_SHIM_DEV_CONNECTION_STRING "mongodb://"

abbr -a -- g gitnow
abbr -a -- omd 'omnicli deployment'
abbr -a -- oms 'omnicli services'
abbr -a -- om omnicli

bind \es __fish_prepend_sudo
