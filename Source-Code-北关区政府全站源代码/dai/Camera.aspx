<%@ page language="C#" autoeventwireup="true" inherits="test_untitled_Camera, App_Web_wksq4ark" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>在线拍照</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="testpro_div container-fluid">
        <div class="row">
            <div class="col-md-6 photopadding">
                <span>正面拍照</span>
                <div class="selphoto_div">
                    <img id="photo1" src="/Images/userface/noface.gif" onerror="this.scr='/Images/userface/noface.gif'" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="camera_div">
                    <video id="video" autoplay="autoplay" style="width: 100%; padding: 1px; text-align: center"></video>
                </div>
            </div>
            <div class="col-md-4 photopadding" style="display: none;">
                <span>侧面拍照</span>
                <div class="selphoto_div">
                    <img id="photo2" src="/Images/userface/noface.gif" onerror="this.scr='/Images/userface/noface.gif" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <style>
        .photopadding {
            padding: 20px;
            text-align: center;
            font-weight: 700;
        }

        .testpro_div .selphoto_div {
            padding: 10px 70px;
        }

            .testpro_div .selphoto_div img {
                width: 100%;
                height: 408px;
            }

        .testpro_div .camera_div {
            margin-top: 60px;
            width: 530px;
            height: 395px;
            background-color: #ccc;
        }
    </style>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Webup.js"></script>
    <script>
        var video = document.getElementById("video");
        var videostream;
        //开启摄像头
        function EnableCamera() {
            navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.msGetUserMedia;
            if (navigator.getUserMedia) //  
            {
                if (navigator.webkitURL)//  
                {
                    navigator.getUserMedia({ video: true }, function (stream) {
                        video.src = window.webkitURL.createObjectURL(stream);
                    }, function (error) { alert('没有检测到摄像头!请确认摄像头已插好或是否被浏览器禁用'); parent.ShowTab(0) });
                }
                else if (navigator.msURL) {
                    navigator.getUserMedia({ video: true }, function (stream) {
                        videostream = stream;
                        video.src = window.msURL.createObjectURL(stream);

                    }, function (error) { alert('没有检测到摄像头!请确认摄像头已插好或是否被浏览器禁用'); parent.ShowTab(0) });
                }
                else //  
                {
                    navigator.getUserMedia({ video: true }, function (stream) {
                        videostream = stream;
                        video.src = window.URL.createObjectURL(stream);
                    }, function (error) { alert('没有检测到摄像头!请确认摄像头已插好或是否被浏览器禁用'); parent.ShowTab(0) });
                }
            }
            if (!navigator.getUserMedia) {
                alert('您的浏览器不支持在线拍照功能,请尝试切换chrome或edge浏览器以获得最佳体验!')
                parent.ShowTab(0);
                return;
            }
        }
        function StopCamera() {
            if (videostream)
            { videostream.stop(); }
            video.src = '';
            videostream = null;
        }
        //重置拍照
        function clearPhoto() {
            StopCamera();
            EnableCamera();
            $(".selphoto_div img").attr('src', "/Images/userface/noface.gif");
        }

        //從video元素抓取圖像到canvas
        function capture(video) {
            var canvas = document.createElement('canvas'); //建立canvas js DOM元素
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            var ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0);
            return canvas;
        }
        //拍照操作
        function shoot(type) {
            if (!videostream) { EnableCamera(); return; }
            var canvas = capture(video);
            var imgData = canvas.toDataURL("image/jpg");
            var base64String = imgData.substr(22); //取得base64字串
            SFileUP.AjaxUpBase64(base64String, function (url) {
                $(".selphoto_div #photo" + type).attr('src', url);
                parent.shootCallBack(url, type);
            });
        }
        $().ready(function () {
            parent.getCamara(window);
        });
    </script>
</asp:Content>
