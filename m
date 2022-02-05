Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E362F25
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Feb 2022 23:33:51 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id o12so19712472lfg.12
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Feb 2022 15:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hTGxMUD+Y/e2SIuHcf/n5N/bPbvSPfdhfosfyFHnjSM=;
        b=AQgPUOEAAjsob5q1TYDcbdFYKdASPIsg0LD2bQ9Ww+lq1e8NGppyzWXIZc6oGuO5si
         5OlTFy1CH3JL0RFpk8mg1tC/FwmkL3AbT4MKU8dMfWOIS5hEcoNwPtobYKy7hdYHYnXf
         K/R/Oj1bTYZf9WXAfwUt46sbtEjtDCBdlX69AFQzDz31jya8LcyMcvvJ3B4iS1t92cYG
         lzbRVQltOoBMM8QlAOi+ZgEQE3/B7UhM250O5Px6vc1PkXuuxWXEt9DG8qKAVJvU3end
         wCrtoOFSKS7gzJAhibl1wtLa7tkgmvjZ79bQtA9xabREftpEZTD+K3L1cvGfjsGSDonq
         YzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hTGxMUD+Y/e2SIuHcf/n5N/bPbvSPfdhfosfyFHnjSM=;
        b=fbTfLBjAQViLmNaGzx5ibNvjKli3+Je5Px0/DHUwoIx7a3XJw9FMX3Q7JIX8t32+av
         K+A/kPKp6UYWRAI/3W6l2Rbo3ZoZidSOPZ3V2VRUSZhA2yVfRzfdoNcVt1VPaL3guPQN
         3jQiYyU0Ndoyn6TeZ/eH6K1Ne8sH34gWBbmBq2aF7g2JRyvXQ8Y3MGGR/gqF8e8q6Zj0
         Fjglw3WlcLyyQ0y8ma+iXKsqrcL1PBBFKnhFQZZnWVtDeNUGx4AifQJnC3lePzlKEY4e
         Q0VTbBZug3azhXp1KaOwmx2Ye7ozZHt8mQcK3Fl+U2JWOpTJUGZB7UjR0X8lgFyDttbp
         ytpQ==
X-Gm-Message-State: AOAM530ZOV4bIKZQRyY72GuYZ4Rzj0wfiX+8ioj+dbhinAd7Y/uVJPUm
	fxIzLZS/q6EfRXBjXLAYjKg=
X-Google-Smtp-Source: ABdhPJwUsYwrar5ZAoigpEbg5JFCfrjJ8wLITtvOjwBLyZsNPKwjEXajuiSrFa/SoMQ6m7N/SK3Q4Q==
X-Received: by 2002:ac2:4c09:: with SMTP id t9mr3715612lfq.406.1644104029408;
        Sat, 05 Feb 2022 15:33:49 -0800 (PST)
Received: from localhost (93-80-64-103.broadband.corbina.ru. [93.80.64.103])
        by smtp.gmail.com with ESMTPSA id m12sm888400lfj.90.2022.02.05.15.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 15:33:48 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: sun6i-csi: fix colorspace in sun6i_video_try_fmt()
Date: Sun,  6 Feb 2022 02:33:31 +0300
Message-Id: <20220205233332.67316-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With gstreamer 1.19.3 all attempts to capture video in YUV formats on
our Allwinner H3-based custom board with an ov5640 sensor result in
pipeline crashes with the following messages:

	Device '/dev/video0' does not support 2:0:0:0 colorimetry
	Additional debug info:
	Device wants 2:0:0:0 colorimetry

Fix this by setting the correct colorspace in sun6i_video_try_fmt().

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---

Actually there is a second issue with sun6i_video_try_fmt(): reported
bytesperline is wrong for planar YUV formats, but I believe it will be
fixed by [1].

[1] https://lore.kernel.org/linux-media/20220205185429.2278860-40-paul.kocialkowski@bootlin.com/

 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 607a8d39fbe2..682c26536034 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -368,7 +368,11 @@ static int sun6i_video_try_fmt(struct sun6i_video *video,
 	if (pixfmt->field == V4L2_FIELD_ANY)
 		pixfmt->field = V4L2_FIELD_NONE;

-	pixfmt->colorspace = V4L2_COLORSPACE_RAW;
+	if (pixfmt->pixelformat == V4L2_PIX_FMT_JPEG)
+		pixfmt->colorspace = V4L2_COLORSPACE_JPEG;
+	else
+		pixfmt->colorspace = V4L2_COLORSPACE_SRGB;
+
 	pixfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	pixfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
 	pixfmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
--
2.35.1
