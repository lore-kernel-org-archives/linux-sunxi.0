Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC5F3806B5
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 06:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343144; cv=none; b=ZMHOjcR98bn8dBIH8Z9gMd6dudH0V2YnpSkB/2b5Kt+RUJ4IaDYVUi5dae3EVj31iqdVteZKk26XatAGjNLuZx+t8/Wp0eZyzvm8Z5hhNzAKmODd1vCi9IMV91yzZCaQzUVdaPDPwPWj/JuLb7YL3DGZItikXG1UFz0f7USrZTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343144; c=relaxed/simple;
	bh=VxI4YwnIEvRBHYTD62MGgVzbo0v1YE11LFlnHHYsuyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQ0Uu5yRD4oo4LRAKsNsPu+nxq02yiGybwfIyNmF/48xs0VrpKIKDp9JKqjHkZSuCqP0UFp5QyISM5xngVjDC4FdD0DjbFgKnE2GnKPgf2Hrm6kMID58w/34eboCMjtObGCFgur3yar/BfHj81De9vW7s/oxhtvX6wawHnjUrKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJyrN9SB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJyrN9SB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacb8416a1so14292515ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Aug 2026 23:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343142; x=1786947942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6svQF5GPAZfouFfjRsxMRw5S+3HKyD/RZ/OlzpdStc=;
        b=cJyrN9SBZ6eyr8TpstxrG9fTubyzfqGMyvI7/VTJ+Svttj47CFsvInVwKpHv92ZknV
         kHcxrwrCawl280ZTsgS/73xffzMK92X05sJgAaL2YEN4fVK89IUEsiSNppEF/OxUK7mK
         libLhNrgn4ABEFB4EJFBr9in4jRx2QEEruezTdP8kPxP8k9dnT52wBvGJ3a/o8Elmh0n
         iSiQbqXDaqLf7opIu6RfKQyezMGsDd6oFK9Fdg/wUIprC/5+sOD/azBpnU7Tk6FVaywv
         EHcfRn0P0VMjXsb9Rk885Gj8+hCoUO52KfGJJbF2VpcQQJg4AnTge25wx8/hAsQGODl4
         P7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343142; x=1786947942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6svQF5GPAZfouFfjRsxMRw5S+3HKyD/RZ/OlzpdStc=;
        b=n1LgBTK/mwX9acmoYCnPkj+vnIluZaf8IfhVV7iQJWCQuvgwAmchQwfIFT9C2Syd7F
         4g2MaQqMxAUq5ZzRqCfUd9hVSMvVeAajbnR9Fj7aAJ1/LXoIWFtuYS4CApPI1qi9N7n8
         S26Z+Rpor2t9abq6lejy0Pqbwkm+1LxNUF196Sk26j2OoVWsO4cLgmGuWTJs/y2Tk+Ww
         47ZrY4p/58R5ZYyHBAGQnQXcMn81VmToevfloOt7e0cbo5CpPGjx4mSAHKmNLSuiI2FG
         pcyraU5TK9G437XwGiAkU38MTFhFS803IgEJVMPvEivjwlTji5cpshv0c81dcAchEEbf
         hwfg==
X-Forwarded-Encrypted: i=1; AHgh+Rrq88DeP9knor1kKic3K/fML6cZ052LsP2TfSxnZSacz0n3f6zcjh53l+Gz7C2l/UtgcXIEk8flqJN/ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhVbyoqVYb77ZukxHMqkVNqSVO1b8L+DmO9QiraxoBS4dH5XBi
	rNR5zbegpdng8CQ6MKUgt0aG0LAy3bN7pfXKj2Ie0Ml8IIwO3v9ye+RX
X-Gm-Gg: AR+sD13r8AmvzN0EhRLKu8h14N5ExmdawKRC0VpvF4IOtOx5vkp/qs60VeM4Ff2cn+g
	YhK0IIrskVP3SQGzWEOlGWa6ecsBiQ2qO12Cbc5STlf0jCfG0DoT6XfLDIdn7TesQ/4+fp1hvbj
	hD6hl2k8Wj3raWmE2l+Lzwxh0jVYMO/Z2bmfG/7434bArKpY+5yCS+YOInAxZMX+boxfOFeiVLu
	ITn6sHvLt4HCTTLjMXugXvSCMDjUz6+rn+LUjsom4OTGL5r6mOpRQkDDgr+3LY1NriDKxq8OsM0
	vSUZKIyKDlzxDS8D4fkVCcSHnWEXLjJZUhurtq7cnwbrkDHo4gs6yROy81OwqOsoYeAxnGhG3Fg
	st0F3bumWcZoguy4viFA8M2TTme5Rcj3BH+FJ7yLCSu5uoAvINqz5gNy9JahbYEg6UhK1Zalh+Y
	/+AWpBRhJ0yRKYLAXjYoIyUQhqBziDsgts8s9v/A+csGK2drhnKlsG67exuD81fxhGkWEtjsw5N
	2lcag==
X-Received: by 2002:a05:6a20:d43:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3cbce7999e3mr19834403637.13.1786343142488;
        Sun, 09 Aug 2026 23:25:42 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:42 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: sun4i-csi: add notifier unbind callback to drop the source subdev
Date: Mon, 10 Aug 2026 13:25:21 +0700
Message-Id: <20260810062521.1709379-4-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810062521.1709379-1-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_notify_ops only implements .bound and .complete. The .bound
callback caches the remote sensor's subdevice in csi->src_subdev. When
that subdevice goes away (e.g. its module is unloaded), the V4L2 async
core frees it, but without an .unbind callback the driver keeps the
stale pointer.

A subsequent VIDIOC_STREAMON reaches sun4i_csi_start_streaming(), which
calls v4l2_subdev_call(csi->src_subdev, video, s_stream, 1) on the freed
subdev, resulting in a use-after-free.

Add an .unbind callback that clears csi->src_subdev. The pointer is only
dereferenced by v4l2_subdev_call() (NULL-guarded, returns -ENODEV, so
streaming fails cleanly) and by sun4i_csi_notify_complete() (which only
runs while a subdev is bound), so clearing it is sufficient to prevent
the use-after-free.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 .../media/platform/sunxi/sun4i-csi/sun4i_csi.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index a8711336a754..f19508f2c7ed 100644
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
+	 * The remote subdev is being freed. Drop our cached pointer so that a
+	 * subsequent sun4i_csi_start_streaming() does not issue a
+	 * v4l2_subdev_call() on the now dangling source subdev. The call is
+	 * NULL-guarded and returns -ENODEV, so streaming fails cleanly.
+	 */
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

