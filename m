Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043DB3002DC
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jan 2026 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422925; cv=none; b=DkJM9oVMwvuDMgiyoyOg6k0xBLJgT1k08eaLwrc/Z4bvGphh0SeChZ+tv4jXBrKKnIo16Y2zpb2GP/DenRs0AvunAjeCzq5Awpr90P068en8+RvfkGAFLDa2U6zBr5tsdaj4gvqo/uTVziWxo4ehDUhMp55XZnH7JJdNWrJe5ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422925; c=relaxed/simple;
	bh=hhHVJuWcsGPZS4w0Oz7Y8dL6uLtRGKYuwtyUBBadydw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ABhegtGV1LImSkhvOO5cC2gi3UulIXM3fmGrDzXSQhtOvmx65TIhOBv/skojhUSFnUs7yKHKowRdmLUlxNuFwdYroQCZ4AJ+5+Hp0oYOtKcCypAIkNySJkoQIKv2evwkmH/ztvWUUOQTNTY0yJ3X9nnExh5qBb1PaX2zYDPAQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3Y4iqg4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3Y4iqg4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso49991415e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Jan 2026 02:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422922; x=1770027722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxdsOX1mc8rr4Qts+Y9ulGeC1IJPumDA0ysh1WBo1IU=;
        b=G3Y4iqg4yjKyHTI53i4jHWSbm03PgxpqfI39TuII7GJusHK/J/Vb3TQ/Po/8e/R3Bz
         IX1+xmAORUoMv8a9nJQWddNvtCPVN6rxoJeq5gyclFLgm5499llSkmahFeZA/x3vroxp
         GHZclfrdMTwB+3Ryg5MbFIdAFpDxY6w5U6e2YUJUGS0XZxib6s3ceR7GuSlbETyhOkJV
         kGoJmmYiFdcKwLhSDmGQ+gDhCjnrD+PGC86Ss++BZOt6oXK4KJm30CUu8RAUBJ3ge0qL
         I8cmmrgJ9MUY/u6TBowqnEdlskaEUkhQAQCKwl+0v8Yze2ze9rbWJYhO0jtMaaVsdAdW
         i0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422922; x=1770027722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxdsOX1mc8rr4Qts+Y9ulGeC1IJPumDA0ysh1WBo1IU=;
        b=n2gGoIgBqJq+KMaMAnauYL9vkJlHqnZHDD17BSD44bAGmzwEaMIyQmX5E2kiBnT06E
         7/DxnslvbjiRlHvW9kgSel6wCST5yrghRnEnOAlkYhfJapwtHNMokwoX7MkkNfQKfmMZ
         DuyXOKFYsFe9K4LbxGp5cnVP0cNQETavj7dGdss/5oWlciMX/ZhrfGn4esejgGbbDtUu
         4OtNOecxVXFs1AH8jfLze9KE1WDWwZeH6n1WR8w1CuVD3CfIEhAmeYXyJQXLo5qp5diU
         21npHEDMWrUcJrclFSbTMwkF0CEOcnY7xMs+fj63vyzD88r3xcEhfWPn02XHUjfSpK0Q
         nm0w==
X-Forwarded-Encrypted: i=1; AJvYcCXla/BPS5fX/5ifrfENy3oeZVtu1eHcUviIGP5dqNBWw0sL7S/8IWLQpPt4fwyXn3Pmy4mVQJxhWg7lZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YweDAm7x4ISZ2TanX6NzpZmsPRNwgor/GIbqAuD0FNiFnIzO6ta
	kLzfe3+7PacUVZxdBV7VNrTCIxSbazFoQKZrphwQNdFYC7iX1Vi0Ol0yrohDMErf01ZF8A==
X-Gm-Gg: AZuq6aJgvqq2YYP6WWfNkjXporNFnefJi2HYueICaVuTtih6qTOA2eJEIlVczS53JoN
	eCtGCFnDFhUJrbxD/RM1L4NiLvdU5Ow2SHz09gHq1f4YIsITt6P7OwLnSAKnJkGrDyRZWUiGFcm
	Uw0w+UNEJZw6V3H1Nb2NxXe6X4tz8x+Ali6srwhWzSainD6Hw6sduM7cWkHz+WWnu/ztDyMQcmn
	c7mFNwosd0BRKz3LMTibuH61eVnduvTvX4OlKiBvq5v9pxN6XdYXGyNGGeLKGAAl/HF0qNyenO2
	M3YIbNkOYWMAsis9ADgDFu7k2c6Z64IQcInREidt3zEbmNvKj14vDTTD23FMz1rq0IduKI8JOmd
	21Qrejo8JubfEPG6euFtDq9HeLV1b0uuDG6VmOWkeG4Z6YbwS8/XldoGXJDWkmg7ODYGjqwBNMj
	KIbXjb71PiNo13gKMhI81OYbMj4QHSawrwBcxU2BRKgA7yCWcGBWZdfainzyL/ZqZSR2nG
X-Received: by 2002:a05:600c:4f86:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-4805cf6749bmr56202315e9.22.1769422922324;
        Mon, 26 Jan 2026 02:22:02 -0800 (PST)
Received: from thinkpad ([5.215.56.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8b4fc3sm263805995e9.13.2026.01.26.02.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:22:01 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] media: sun6i-mipi-csi2: Propagate format to source pad in TRY mode
Date: Mon, 26 Jan 2026 13:51:49 +0330
Message-Id: <20260126102149.39563-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun6i-mipi-csi2 does not support any format conversion. So the format
on sink and source pad must always match. This limitation is handled for
ACTIVE state via mbus_format member of bridge private structure.

To enforce this limitation in TRY state, user space should only be able
to set format on sink pad. The sink format must be propagated to source
pad to ensure consistent behavior.

This also aligns the driver with userspace relying on media controller
based format negotiation.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index b06cb73015cd..6ee0f6685663 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -369,15 +369,26 @@ static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *mbus_format = &format->format;
 	struct mutex *lock = &csi2_dev->bridge.lock;
 
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN6I_MIPI_CSI2_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
+
 	mutex_lock(lock);
 
 	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(state, format->pad);
+		*fmt = *mbus_format;
+
+		/* Propagate the format to the source pad. */
+		fmt = v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
+		*fmt = *mbus_format;
+	} else {
 		csi2_dev->bridge.mbus_format = *mbus_format;
+	}
 
 	mutex_unlock(lock);
 
-- 
2.34.1

