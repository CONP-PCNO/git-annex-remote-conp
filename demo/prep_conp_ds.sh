
# create a new dataset
# TODO standardize annex backend to whatever CONP wants
datalad rev-create demods

cd demods

# the payload in the dataset for this demo
content_path='content'

# initialize CONP special remote
git annex initremote conp type=external encryption=none externaltype=conp autoenable=true

# figure out CONP special remote UUID for this dataset
conp_uuid=$(git annex info |grep '\[conp\]' | cut -d ' ' -f 2,2 | tr -d '\t')

# have some fake content
touch $content_path

# save the state of the dataset to get annex keys for everything
datalad rev-save

# figure out the annex key for our fake content file, because we use it
# as unique ID for the CONP server side, but this could be something
# else as well
content_key=$(git annex lookupkey $content_path)

# "upload" content to CONP server, this could/should be done by another remote
# like SSH-based push
cp $content_path ../conp_sever/$content_key

# Tell the dataset that content for our fake content is available from
# the CONP special remote
git annex setpresentkey ${content_key} ${conp_uuid} 1

# drop any content, CONP server has it, dataset can become an empty shell
datalad drop . --nocheck

# done on the server side
cd ..

# this is what a user would do to obtain all data from a dataset via the CONP
# special remote (that is invisible to users)
datalad install -g -s demods clientds
