Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712E95C6
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 19:40:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z5so1166575wrt.6
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Jan 2023 11:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsW+m3ul5OQdcVnmzwNhWTuRKTcC+JZAol0W+lGLwXk=;
        b=q00azvJz0ZDXV7IZ3WIisHnygM9r4eoV9ffFzYogNUeqW6COjpVbmUXQD1HcER46Wv
         A6JOlNhmLiSu9wQZLHwVMMauoPwy0KDHaCkxhLU9RCW4gNvgxcWdWeTW7Y2quA8tbUam
         d9wkydX2qZxezAxzKqHF+fUzu2AKHPIp3hornqmB79WHW1xs5IZ1uO6oUq+SurKUiEc2
         hxiyNf+dLKy9EoLa3tg/B2tHzA5NUB/qgXwNFz3OhOVrDzutxeU1F5oAd9dnilBgKtlu
         MNT6xlpWgI+6BK5djZ/+UvHFZDaE+Ts9kvIrIlB5lZrH1XBw2OHQsegJWpYqyC/k2+ng
         E0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AsW+m3ul5OQdcVnmzwNhWTuRKTcC+JZAol0W+lGLwXk=;
        b=ob8sjNLHIrrMiu9U8obc1x6XSQWRaihVIp/u73FZZay1YVAANvPstB2welNZ7apaNa
         9dGCLTqh0AcMIqiD6LAfqF7iDwOFAPg8Z2hxlViYqp0RMunIrpnhGu3VD2cjorMISh4G
         33vcrQyEferIpVTWJF07USsGwyzUJxr0aSdQFQb3gsleqZTXNS7/BUiH8TW0S2vc5yuq
         VPqIg6kcrS62wW0mKjUEaKTDZC3OW/g0E/GxpOgCkpPUUHc1RZYu3BMWkG/wx15D80/E
         uE/sLlTBA+RRuAUOq5S3OEVpOk2kFbShhjlz87CD1N/tBVPEwE+qfIWDKwNO+DpvcQjj
         d5cw==
X-Gm-Message-State: AFqh2kpe3+ysCJTTVB3ApyCVXWx0ANxCWy4y7/DwDySsYk2eLFyr7UkE
	/pMK5mJbXkB8BNwuNBjbjA9Ph+JzS4JbFg==
X-Google-Smtp-Source: AMrXdXv1yiO0KMkIhb11kmOe9UwhRGrUnDUzUMhysGvmoSAuv42gax0gvOWnRmIvbxOwN5QGQiTTgA==
X-Received: by 2002:adf:d4c7:0:b0:241:bc33:b188 with SMTP id w7-20020adfd4c7000000b00241bc33b188mr38980470wrk.18.1673034047147;
        Fri, 06 Jan 2023 11:40:47 -0800 (PST)
Received: from localhost.localdomain ([90.242.19.250])
        by smtp.gmail.com with ESMTPSA id bx9-20020a5d5b09000000b0023662245d3csm1968650wrb.95.2023.01.06.11.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 11:40:46 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From: adam@piggz.co.uk
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	mchehab@kernel.org,
	linux-sunxi@lists.linux.dev,
	paul.kocialkowski@bootlin.com,
	laurent.pinchart@ideasonboard.com,
	Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH 2/3] media: sun6i-csi: implement V4L2_CAP_IO_MC
Date: Fri,  6 Jan 2023 19:40:37 +0000
Message-Id: <20230106194038.16018-3-adam@piggz.co.uk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106194038.16018-1-adam@piggz.co.uk>
References: <20230106194038.16018-1-adam@piggz.co.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Pigg <adam@piggz.co.uk>

modify sun6i_csi_capture_enum_fmt to check the mbus_codes from the
pixel format array for the supplied format

Signed-off-by: Adam Pigg <adam@piggz.co.uk>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 69578075421c..54beba4d2b2f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -666,13 +666,43 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *private,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
+	unsigned int i;
 
 	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
+		const struct sun6i_csi_capture_format *format =
+			&sun6i_csi_capture_formats[i];
 
-	return 0;
+		/*
+		 * If a media bus code is specified, only consider formats that
+		 * match it.
+		 */
+		if (fmtdesc->mbus_code) {
+			unsigned int j;
+
+			if (!format->mbus_codes)
+				continue;
+
+			for (j = 0; format->mbus_codes[j]; j++) {
+				if (fmtdesc->mbus_code == format->mbus_codes[j])
+					break;
+			}
+
+			if (!format->mbus_codes[j])
+				continue;
+		}
+
+		if (index == 0) {
+			fmtdesc->pixelformat = format->pixelformat;
+			return 0;
+		}
+
+		index--;
+	}
+
+	return -EINVAL;
 }
 
 static int sun6i_csi_capture_g_fmt(struct file *file, void *private,
@@ -978,7 +1008,7 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.39.0

