const fs = require('fs');
const cp = require('child_process')
const path = require ('path');
const HUB = 'docker.io';
const NAMESPACE = 'dengyongchao';

const updateImages = (data) => {
    data.forEach(([n, o]) => {
        try {
            console.log(cp.execSync(`docker pull ${o}`).toString());
            console.log(cp.execSync(`docker tag ${o} ${n}`).toString());
            console.log(cp.execSync(`docker push ${n}`).toString());
            console.log(`${n}`);
        } catch (error) {
            // console.log(error);
        }
    });
}


const getImages = (filename, imgReg, nameReg, newImageNamePrefix, newFileName = 'updated-') => {
    const file = fs.readFileSync(filename);
    
    const str = file.toString();
    
    const images = [];
    
    const newStr = str.replace(imgReg, (imageURL) => {
        const name = imageURL.replace(nameReg, '').replace(/@.+/, '');
        const newImageURL = `${HUB}/${NAMESPACE}/${newImageNamePrefix}${name}`;
        images.push([newImageURL, imageURL]);
        return newImageURL;
    });
    fs.writeFileSync(`output/${newFileName}${path.basename(filename)}`, newStr)
    fs.writeFileSync(`output/${path.basename(filename)}.txt`, images.map(it => it[0]).join('\n'));
    return images
}

const  pipelineImages = getImages(
    'pipeline.yaml', 
    /gcr\.io\/tekton-releases[/A-Za-z0-9:@\.]+/g, 
    'gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/',
    'tekton-pipeline-'
)

// updateImages(pipelineImages);

const  pipeline1Images = getImages(
    'output/updated-pipeline.yaml', 
    /gcr\.io\/google\.com[/A-Za-z0-9:@\.]+/g, 
    'gcr.io/google.com/cloudsdktool/',
    'tekton-pipeline-',
    ''
)
// console.log(pipeline1Images);

// updateImages(pipeline1Images);



const  pipeline2Images = getImages(
    'output/updated-pipeline.yaml', 
    /cgr\.dev\/chainguard\/[/A-Za-z0-9:@\.]+/g, 
    'cgr.dev/chainguard/',
    'tekton-pipeline-',
    '',
)

// console.log(pipeline2Images);

// updateImages(pipeline2Images);

/**
 * Triggers
 */
const triggerImages = getImages(
    'triggers.yaml', 
    /gcr\.io\/tekton-releases[/A-Za-z0-9:@\.]+/g, 
    'gcr.io/tekton-releases/github.com/tektoncd/triggers/cmd/',
    'tekton-triggers-'
)
// console.log(triggerImages);

// updateImages(triggerImages);

const interceptorsImages = getImages(
    'triggers-interceptors.yaml', 
    /gcr\.io\/tekton-releases[/A-Za-z0-9:@\.]+/g, 
    'gcr.io/tekton-releases/github.com/tektoncd/triggers/cmd/',
    'tekton-triggers-interceptors-'
)

// console.log(interceptorsImages);

// updateImages(interceptorsImages);



/**
 * Dashboard
 */


const dashboardImages = getImages(
    'tekton-dashboard.yaml', 
    /gcr\.io\/tekton-releases[/A-Za-z0-9:@\.]+/g, 
    'gcr.io/tekton-releases/github.com/tektoncd/dashboard/cmd/',
    'tekton-dashboard-'
)

// console.log(dashboardImages);

// updateImages(dashboardImages);

const fullDashboardImages = getImages(
    'tekton-full-dashboard.yaml',
    /gcr\.io\/tekton-releases[/A-Za-z0-9:@\.]+/g,
    'gcr.io/tekton-releases/github.com/tektoncd/dashboard/cmd/',
    'tekton-'
)

// updateImages(fullDashboardImages);



const resultsImages = getImages(
    'tekton-results.yaml',
    /gcr\.io\/tekton-releases[/A-Za-z0-9:@\.]+/g,
    'gcr.io/tekton-releases/github.com/tektoncd/results/cmd/',
    'tekton-'
)

updateImages(resultsImages);

