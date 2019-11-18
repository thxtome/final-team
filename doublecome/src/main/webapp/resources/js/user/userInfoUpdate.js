let email  = $('#userEmail').val();
email["placeholder"] = "email";


function upload() {

    var percentage = null,
        clippaper = document.querySelector('.uploader__clip'),
        clippaperLength = clippaper.getTotalLength();
        clippaper.style.strokeDasharray = clippaperLength;
        clippaper.style.strokeDashoffset = -clippaperLength;
  
    function Init() {
  
      var fileSelect    = document.querySelector('.uploader__input'),
          fileDrag      = document.querySelector('.uploader__label'),
          fileSize      = null;
  
      fileSelect.addEventListener('change', fileSelectHandler, false);
  
      // Is XHR2 available?
      var xhr = new XMLHttpRequest();
      if (xhr.upload) {
        // File Drop
        fileDrag.addEventListener('dragover', fileDragHover, false);
        fileDrag.addEventListener('dragleave', fileDragHover, false);
        fileDrag.addEventListener('drop', fileSelectHandler, false);
      }
    }
  
    function fileDragHover(e) {
      var fileDrag = document.querySelector('.uploader__label');
  
      e.stopPropagation();
      e.preventDefault();
  
      fileDrag.className = (e.type === 'dragover' ? 'uploader__label hover' : 'uploader__label');
    }
  
    function fileSelectHandler(e) {
  
      document.querySelector('.uploader').classList.add('uploading');
  
      // Fetch FileList object
      var files = e.target.files || e.dataTransfer.files;
  
      // Cancel event and hover styling
      fileDragHover(e);
  
      // Process all File objects
      for (var i = 0, f; f = files[i]; i++) {
        parseFile(f);
        uploadFile(f);
      }
    }
  
    function parseFile(file) {
  
      // console.log(file.name);
  
      var imageName = file.name;
  
      var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
      if (isGood) {
        // Thumbnail Preview
        document.querySelector('.uploader__file').src = URL.createObjectURL(file);
      }
      else {
        document.querySelector('.uploader').reset();
      }
    }
  
    function updateFileProgress(e) {
  
      if (e.lengthComputable) {
        percentage = (e.loaded / fileSize) * 100;
        clippaper.style.strokeDashoffset = (-clippaperLength + (percentage  * clippaperLength) / 100);
  
        if (e.loaded === fileSize) {
          document.querySelector('.uploader__file').classList.add("show");
        }
      }
    }
  
    function uploadFile(file) {
  
      fileSize = file.size;
  
      var xhr = new XMLHttpRequest(),
        fileSizeLimit = 1024; // In MB
      if (xhr.upload) {
        // Check if file is less than x MB
        if (file.size <= fileSizeLimit * 1024 * 1024) {
          // Progress bar
          xhr.upload.addEventListener('progress', updateFileProgress, false);
  
          // File received / failed
          xhr.onreadystatechange = function(e) {
            if (xhr.readyState == 4) {
              // Everything is good!
  
              // progress.className = (xhr.status == 200 ? "success" : "failure");
              // document.location.reload(true);
            }
          };
  
          // Start upload
          xhr.open('POST', document.querySelector('.uploader').action, true);
          xhr.setRequestHeader('X-File-Name', file.name);
          xhr.setRequestHeader('X-File-Size', file.size);
          xhr.setRequestHeader('Content-Type', 'multipart/form-data');
          xhr.send(file);
        } else {
          console.log('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
        }
      }
    }
  
    // Check for the various File API support.
    if (window.File && window.FileList && window.FileReader) {
      Init();
    } else {
      document.querySelector('.uploader__labele').style.display = 'none';
    }
  }
  
  upload();
  
 
  