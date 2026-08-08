Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566326CE05
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187188; cv=none; b=hhydt/SAwPyWYHt7dd51EfUp7Sp7AdIwUqE5w1rIUilWjrAW4a/kzR0i1zsPM/ixyggqqeL2DQF7HMydSDJjlsCv28Uo9eEUUzdRTYO/fj1kz0rlUb7cT0L34i2xKe7zRyXglX6MYvikoMvt9PGPU2sQvba2+lmfN8M28i83KGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187188; c=relaxed/simple;
	bh=tDsFj4Lh9ROCK1QL6OxCscLJBiWTpO7vMwF1199NUaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WEt+tk6wywrqMwChPCkS0Szc5Te6SDKndKOz6y2Jo00j6PD3DX2jtx48NcwQ/uBDK9j38dLF2jObZBQKcPNaE5lSBnKnvDapUu5aIUwYxGONS/TvqEYgqZuIWlzMYmPAqDyJRsYGxrmvmUc0QInkazp/thjvIeV+OGgLz4tDeoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r98i6F0Z; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r98i6F0Z"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceab75934dso4556435ad.2
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Aug 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187185; x=1786791985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=r98i6F0ZlKSSovUxxfPCvXS6qJHARND6bJJB/daTompIXXAbc2t/5ZD7myg6zxbKLv
         TluQOVFzNYcfcWd7ke0iPkYHKs1tiS3cRxLKB3y+9wsBzMmDv/Xz4SkSWWS+a4qICBl0
         yl27qevapfsFyqFwBRZi3BrJWPe1HZAB5Kg5YOD1FOd1SIU9pa1jh94tZQGcyYxwccll
         b6Bymo7JRvK4CSUAMJcyQ5qaNucek9HvaTMKfAKHC+eHJ7X+n1txXfUFtzD9PINisQCh
         njHu5y88ehHglaot7ybg83LNdDeLlJiyFTzQjYZdpX0aCsGy+l8ZMISo7SZ09dPdRIqX
         +R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187185; x=1786791985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=bcH1jXd5z3sYqXYd9UJck4AOQYOiqAD/JMckIvDA5g7Br3DkC89Ln51pkjSGBiWCaX
         lVgghU1XsFqI1eewU0eFL7vNsHYL/eMKEa4tWAeEqrAF3esb5IzuqIJ8bqv7E+9aUB84
         GMUxBkZfEnYosmNK32j5NQ4rKexlz2M1JLcikA9DGwuo5mB7JnkYCd5q0t3zaVRT9CJu
         GV2n7aVJz0Z7/h7A4Svu0RazHUUrt3R3XfweLQfbGcuhzryTxpL5siVCUdKARTov96gh
         8b5Avbex/6sijTO08j9CWXgJ/zgznToHz0OpawQJoQiG45Ken782s31aZqUpJQu2wYTq
         G/fQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUKL7cXdLKOo6gyOxa9waONl98gq/l3cSBua7ZieaRrbLDdBxLfiAhVPOyVZq4nQkQWFhW0iEZfGJ45Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt3YGAia+xm6E8nHoWWbVqipG1T8hoidSp8oR0+IeFDd/+OQst
	7vhCZDpNPSO80drXolQ//1I+0ohzCTZthUNE7JinmUqXR2k+OUauHFxJ
X-Gm-Gg: AR+sD11hW9x5n3c4RTubQYFlf1zI8Vvnu4XE+0wOYht05UA4JC8hJCCq/JLbz1XhYj2
	yEeyPS6Ul8ZVs8a9xKKNw9Tap7AeqNd9l7LpOHpDrPXMbpfeLATwTIb4yu2lZH9jFtDSsANDlr/
	8THFyOT2fj4QeiGExvKTIHayWnbxyo+jMHFiNY+zgsDGOzDiLo7KmTewUCLawKRjFXEOD0MPQwS
	l1sAJspOxiT+L5hH0pPWZzQVnfC16XJ4TnIOmMJRoYYrVJ9fSXIDK/oNVYj5IxBvkp9xSn9YpG6
	qunmixNe5Q2b3K4YUkRY2J3wF/z50H3cUrxKGl+38NlaOmK+pTpc6E1O5nlZbTyntlmPIleLLP8
	z1O3PvLHqf+2aor5mAIDWpC+aQFa/RcAsooBjAuv674pwT6joObdM7fYCziUM8hqP3yFXC8NTH3
	oudMMMIS40IiTBYSVAMiuaTphGGn5jWknkdxRo2+hSxs1XWjXak9WFVbn8An5+SqcFGiHjUpOM6
	kSlMw==
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr33954628a91.5.1786187185202;
        Sat, 08 Aug 2026 04:06:25 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm15243343c88.6.2026.08.08.04.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:06:24 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 1/3] media: sun4i-csi: fix video device and subdev leak in notify_complete()
Date: Sat,  8 Aug 2026 18:06:15 +0700
Message-Id: <7804a3c87beefde14e0358fa2a11e63005525890.1786184456.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_notify_complete() registers the bridge subdev with
v4l2_device_register_subdev() and the video device with
sun4i_csi_v4l2_register() (which calls video_register_device()) before it
creates the media pad links and registers the subdev nodes. If any of the
later steps fail, the error path only unregistered the media device:

	err_clean_media:
		media_device_unregister(&csi->mdev);
		return ret;

The already registered video device and bridge subdev were left behind.
Because this failure propagates back through v4l2_async_nf_register() and
aborts probe, the driver's devm-managed struct sun4i_csi (which embeds the
video_device) is freed while /dev/videoX is still registered, so a
subsequent open() from userspace dereferences freed memory.

Unwind the registrations in reverse order on error, mirroring the teardown
in sun4i_csi_remove(): unregister the video device with
vb2_video_unregister_device() and the bridge subdev with
v4l2_device_unregister_subdev(). Also unwind the intermediate v4l2/media
registration steps so every early return leaves no half-registered state.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..a8711336a754 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -85,11 +85,11 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 	ret = sun4i_csi_v4l2_register(csi);
 	if (ret < 0)
-		return ret;
+		goto err_unregister_subdev;
 
 	ret = media_device_register(&csi->mdev);
 	if (ret)
-		return ret;
+		goto err_unregister_video;
 
 	/* Create link from subdev to main device */
 	ret = media_create_pad_link(&subdev->entity, CSI_SUBDEV_SOURCE,
@@ -114,6 +114,10 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 err_clean_media:
 	media_device_unregister(&csi->mdev);
+err_unregister_video:
+	vb2_video_unregister_device(&csi->vdev);
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(subdev);
 
 	return ret;
 }
-- 
2.25.1

