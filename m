Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CE37AA7D
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187859; cv=none; b=hJ40E8Z5aGiVJTHczEXYL/jrr/X2/vKU5Zb2ZVoHS6iE35MeQEw6iSTzfzgNefsWavPnMfaMB4H1JjY9u/pFobLVqt+8ZV3ez8rjlZfYLTF1bvKSaEg+vP5nrF8SnEGlrGLZnZ/4J8qGYsu/lv1s1L01ciJXG75lXh8m6yKu4qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187859; c=relaxed/simple;
	bh=ON1kS1no0SPn9XlGXhFU53i+x3fCGvAcs6uB4rd1MZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U8b2/1ls/50ala7y1k1Uc1KBwTFHFh3F8787zd5tVTFcFj+p2Ou43tmD9Ef+zIWz/vb7Yfh6X9I/VKEI8nnu7g9jEelzBKMR1pW0r/uc9CrYzGD5z9LeK/+Jz0CNkSEgG5d3m3sCh6x5Ee5ZjPMhub0a2oKzPUg0umdNtdlf+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SM1ES7tQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SM1ES7tQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso3855585ad.2
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Aug 2026 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187857; x=1786792657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Vav1/IZDRyi5TmIe+ztFcmW7gzOkBU4RfYMZP3HSBU=;
        b=SM1ES7tQ6h0rfeNhsLqGZuaLNGuVPpXPbESvH7r3quQMGXym/RGL/WPBrUI4yDRnl2
         9wVH3uoFsXwAwHIcP2PKtSo4cliVlU9N6so2VrGOxiZ4jpIdU/7UZ/+LIEeM0gVYEpss
         t3yVvnxURkic26+8bU6OQw22SjeMKproYIHYuJosVRbIkNQ54UktwXgNRdZt15soVNdD
         EDTGKR8RibOm8CKGAKijdFYBdeddlEAU5n4+UyL1zffWYPzXmre/2+F2jRyZ8HFSqdpP
         SxrGynT4VkyqZEijyJj7zLzu5i/GBz6nUxF5ES9xgbxlYDRnvqZm5KGCLDWwazrsJ2bP
         WGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187857; x=1786792657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Vav1/IZDRyi5TmIe+ztFcmW7gzOkBU4RfYMZP3HSBU=;
        b=NekH3giiG0MM3xlAtnJ0J5DR5WNZFraU0yL07SHIXvM6LMpE+o26glQ/LBPit+q6c8
         Vy7oND31f0etBESB1ohSGScjzfyJHAiUX2cXwXH3rauHON/VzKxjtPZbY4rX6OIcBYaT
         WQQTHZXWIFVx/uW+WoxIJ8hzaRsFVv+MpdoZHsmEhvRoxW56H46H98laCtaAaS4fijaU
         z7Ri1W0Mzh1J/LaonuplAtSGWmM/wewiw1Z9nfy2mcpAvmxkfsP6B0yet5ZWKcna3NWq
         TK1R+rGMDj8Q7F5rwPOCj9O0XYeCcuuOo39zzAXsJI3wu5k/jSdvSXp94TnOzlq6pnaw
         nfIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCAuSW7HRIciZiTSPrqXb6a3mfHnionvvZlW+J8Gb5pud2/DwCkN+wdBbw7U3potDUjNbKj3gXz3H4Hw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/VHC7YNcjE48fBknGV9TU/K9dbhn3zGzJsO06+LlTjdwQE3+e
	ghvzDdEdQbL07ldJIJ/l3Kvi/lBEOUdB3LC1yV74FK+8I0rqXMCBkQfI
X-Gm-Gg: AR+sD13ES3gL6JF9hoTa1qx/Na2q945sIk52lbCJM5aOaltjSA0UXjn+zbLcC6jB3fA
	UlsP34y2ZmR3i9hEuuJfF3Bpd0/cF62gIzlYYxCNDKjudFey+chiW4vdEg6VD/LSqZNAFxI7R9X
	dufjGszQpd5Tg4zLvZ0Sp8kqbCKfMCJop65rYSSVYCcHW/h3TjbqRsQQuxhOUNkSRtlXl4jINnp
	0gsWAj921I6eg8YFZjYT7N8abpQtJaTo2h3iK74uEo6d3BhBN4Pmb7rvAkPElp3NBu0gVDVeS9X
	J1vpAdqQ3R8hW2KS8u2PRjvwGg7EJNJABMdhWUlTWtQrMuy4QzwcydKF+5hpf5OyVNS7l5QwNUD
	M5CJqkB+b14eDn4TPQL0mV/W4uNZCydis+8epY3hSUQSA2JS8Ak37g8VWwgE1pU5mbNPLh0v3QT
	BkjMGxtMExaA/aytQJWA0f2uohc4MZJDjsOg/l1NpDPVhs77TMxo2K4MjmvErNYse7+MsRTRyxl
	m4+KA==
X-Received: by 2002:a17:90b:448b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-3909d8c3b9cmr13238521a91.13.1786187857487;
        Sat, 08 Aug 2026 04:17:37 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde308sm18356313eec.20.2026.08.08.04.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:17:37 -0700 (PDT)
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
Subject: [PATCH v1 3/3] media: sun4i-csi: add notifier unbind callback to drop the source subdev
Date: Sat,  8 Aug 2026 18:17:28 +0700
Message-Id: <61d4901af20a4d2d0f9484328c173bbdfc52ec05.1786184456.git.congnt264@gmail.com>
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

sun4i_csi_notify_ops only implements .bound and .complete. When the remote
sensor's subdevice goes away (e.g. its module is unloaded), the V4L2 async
core unbinds and frees it, but the driver keeps the stale pointer in
csi->src_subdev and leaves the video node registered.

A subsequent VIDIOC_STREAMON reaches sun4i_csi_start_streaming(), which
calls v4l2_subdev_call(csi->src_subdev, video, s_stream, 1) on the freed
subdev, resulting in a use-after-free.

Add an .unbind callback that unregisters the video device so userspace can
no longer start streaming, and clears csi->src_subdev. Unregistering the
already-unregistered video device again in sun4i_csi_remove() is harmless
(vb2_video_unregister_device() is a no-op when it is not registered).

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 .../media/platform/sunxi/sun4i-csi/sun4i_csi.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index a8711336a754..6610ada1c06d 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -122,8 +122,25 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 	return ret;
 }
 
+static void sun4i_csi_notify_unbind(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *subdev,
+				    struct v4l2_async_connection *asd)
+{
+	struct sun4i_csi *csi = container_of(notifier, struct sun4i_csi,
+					     notifier);
+
+	/*
+	 * The remote subdev is being freed. Tear down the video node so
+	 * userspace can no longer reach sun4i_csi_start_streaming() and
+	 * dereference the now dangling source subdev, and drop the pointer.
+	 */
+	vb2_video_unregister_device(&csi->vdev);
+	csi->src_subdev = NULL;
+}
+
 static const struct v4l2_async_notifier_operations sun4i_csi_notify_ops = {
 	.bound		= sun4i_csi_notify_bound,
+	.unbind		= sun4i_csi_notify_unbind,
 	.complete	= sun4i_csi_notify_complete,
 };
 
-- 
2.25.1

