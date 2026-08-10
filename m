Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241C36B043
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343140; cv=none; b=ZEEQseX4pB0yJOWyB/aRL4Czq/4f1wUipkju8nRiKsNMJCMPZuGfa3PbhhD2AdrcseNLuGapFeL6zMlXkfFgjgQcOjfobbIam+iEybN5Y39aRZIz1c/JbyyiL4LgDsPZFLahxyERq+mee2QYHMrEdh/857TA3QIGm6IPAyEV9mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343140; c=relaxed/simple;
	bh=II68ycjz1nQ/E4fomySwRBEgaqnw2HhCSWBJVYb8Gbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EMLRfQeoyWl8R3hrSKwQUlWw19aMJ9JvvQ4uQGyUtepNB3zPM2mUBvjrczIBDtBgN6RJ8fVvyuIyL4JbOaJZqqHYcLoz5jaN5xc/srEN3zykKgaALHud5Q2gYG7y1xHUYe+hFI7zzZKTKHC1gdwKLFRz+3tGH3nBBMLsx9YIqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiCJwKVj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiCJwKVj"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce98cb8165so13101685ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Aug 2026 23:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343138; x=1786947938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEmwjKRPxWjvxM9agZBy10ArpaTDJu1wZiUuC9YJp84=;
        b=RiCJwKVjiDH+bVkEZLLUD6rRBypWnFaaljnLfSmJ+nMal1sz1UvLbrQy+nLz1bO86m
         4EZvVPlrux0SrIGeMHE+9Fg7kdE95LQNso9b57opRcY0h9LSXRLLIfg36CCCfA6Grjl1
         op+UopM606jWhTBpgvn2r3pMYNUl18SQDPwwv5c97/0QZCyk3qNb9H4mDQq2DwpJNMCz
         1PBqD+X0dWSjTudWbQ1zHLEtegadNR++8gnrJDsGYzDy8mYDWpwgANw8hAG4Eb69x7sc
         NXMazMNpV6MDspeR0hlKCyJS5WHJknBOLEfEdQ8ZFrqw/9Lq8KAX3EpHC9X9SHIUWPYV
         FQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343138; x=1786947938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEmwjKRPxWjvxM9agZBy10ArpaTDJu1wZiUuC9YJp84=;
        b=FdO42vBSL5nUelJrooM+lHJFJF9tBlJ/nzsN6WJ8FEchaiA2fgVHhBmKh4WZCWh644
         bJueQ+8QFzGt4Z0LeIVrBtbNJyqe+x0NM2PM73ruc5A2Weg5d+kdh2k2VQRMw5P3hj0g
         +2OnJ305hvuiLQimvQKGMzDLD4dZcLXbnlefbMnAdTJLQWuHt9J+F0zYGwPtJJqu9f3p
         P1GcwCzskSxTvH/PdaRJAXz/vw01DuZXMuAHWA2fM/yZyqZ4bGseTo6/bTQeaO9EG2R7
         DHAfp0ZMbgRAlC0qOO0BTDx4sox/+ImisaQ3emF7JVoWCgHjqEbb21eMY7Dc/9rgVPRc
         4ZFg==
X-Forwarded-Encrypted: i=1; AHgh+RrvMxInvATz5O+MBjyyB+1ekKJSahmfRa+dQHluNa/CjjrPBwZkgoNd1XWZLHjR84+OLTRwH/MBvGFPmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIdGcJkizAW7f8pFNO7UXZRjMIOFn+INGqqg8hl8iW8x5tKF/m
	y6jQyZv51NeWR5ybVbCYn+Ary79DgsgZwuOrXU6nIJqNRfZiMoHbRUiq
X-Gm-Gg: AR+sD13Vo8CeKFfySzaRBxFfHRXgW1b9RREa5Q1kA2Bic6SKGZPqL+vjE4X0CLISzuF
	ru1yMoUfB2S1SYgq2Uw7rB+H5kdNCcxy7dFZOjdqEv4IpZyyeXD/CfaTOLqicVH3aXBRRBJaKqv
	tIhPgY19JqyeUax7sieCe+B22gICqgCl3dk98qMoNcXYx5REbcAGaEmNCHYVZdE3yUpkEQvo0Dn
	TyK0Z+vh40XKj5rTIs7IhEXepDrUrsDc9Lg1z7IvEokZroR0ywZj5BFxiKGCRgCYCHg+yXPGkaV
	YFeW5GrmUufwQHb5d+XQu7CFAOomf8qoLgPWpmlXtOamC6CKl3jGn7VX99SuHr0bpa748hQy9ee
	Meeb1F+iVqBnt5Nu7+iSgCVt3ultRu32s83mIzzjdOIV/Ixmxr8axfdWZtp6YGZSvG7Fvl1YHrx
	YNmdpPB0xO7/YVall9CzJcnrwfhRNUetlzV50XVljRAwLkI24SqRXkov0D8yvfERDiwgo6ZXNxT
	k+JzYXyUUVKahm0
X-Received: by 2002:a17:903:37cc:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d2b2e1b741mr165459175ad.8.1786343138312;
        Sun, 09 Aug 2026 23:25:38 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:37 -0700 (PDT)
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
Subject: [PATCH v2 2/3] media: sun4i-csi: disable interrupts when stopping streaming
Date: Mon, 10 Aug 2026 13:25:20 +0700
Message-Id: <20260810062521.1709379-3-congnt264@gmail.com>
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

sun4i_csi_start_streaming() enables the frame-done interrupt in
CSI_INT_EN_REG, but sun4i_csi_stop_streaming() only stops the capture
engine (CSI_CPT_CTRL_REG) via sun4i_csi_capture_stop(). It never disables
the interrupt source nor synchronizes with the handler.

Capture stops at the end of the current frame, so a frame-done interrupt
can still fire shortly after stop_streaming() returns. If userspace then
closes the device, sun4i_csi_release() calls pm_runtime_put() and the CSI
block is powered down (clocks gated, reset asserted). A delayed interrupt
handler would then read/write CSI registers on the gated block, which can
hang or crash the system.

Add a helper that clears CSI_INT_EN_REG, reads it back to flush the posted
write, and calls synchronize_irq(), so no handler can run past that point.
Call it from stop_streaming() before returning the active buffers and
freeing the scratch buffer.

The start_streaming() error path (err_disable_device) has the same
problem: the frame-done interrupt is enabled and capture is started
before the s_stream call that can fail, so a handler can run while the
error path frees the scratch buffer and returns the queued buffers.
Apply the same teardown there. Store the IRQ number in struct sun4i_csi
so it is available in both paths.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
index 4e0c2df45d4d..51173faea871 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
@@ -112,6 +112,7 @@ struct sun4i_csi {
 	const struct sun4i_csi_traits	*traits;
 
 	void __iomem			*regs;
+	int				irq;
 	struct clk			*bus_clk;
 	struct clk			*isp_clk;
 	struct clk			*ram_clk;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index e911c7f7acc5..fd83dbd1a3ff 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -43,6 +43,23 @@ static void sun4i_csi_capture_stop(struct sun4i_csi *csi)
 	writel(0, csi->regs + CSI_CPT_CTRL_REG);
 }
 
+static void sun4i_csi_disable_irq(struct sun4i_csi *csi)
+{
+	/*
+	 * Disable the frame done interrupt and wait for the handler to
+	 * finish. A frame may complete right as capture is stopped, so an
+	 * interrupt can still be pending here; without this the handler could
+	 * run after the device is powered down (pm_runtime_put() on release)
+	 * and access registers on a gated block.
+	 *
+	 * Read the register back to flush the posted write so the disable has
+	 * reached the device before synchronize_irq() waits for the handler.
+	 */
+	writel(0, csi->regs + CSI_INT_EN_REG);
+	readl(csi->regs + CSI_INT_EN_REG);
+	synchronize_irq(csi->irq);
+}
+
 static int sun4i_csi_queue_setup(struct vb2_queue *vq,
 				 unsigned int *nbuffers,
 				 unsigned int *nplanes,
@@ -328,6 +345,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_disable_device:
 	sun4i_csi_capture_stop(csi);
+	sun4i_csi_disable_irq(csi);
 
 err_disable_pipeline:
 	video_device_pipeline_stop(&csi->vdev);
@@ -353,6 +371,7 @@ static void sun4i_csi_stop_streaming(struct vb2_queue *vq)
 
 	v4l2_subdev_call(csi->src_subdev, video, s_stream, 0);
 	sun4i_csi_capture_stop(csi);
+	sun4i_csi_disable_irq(csi);
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&csi->qlock, flags);
@@ -438,6 +457,7 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
 		dev_err(csi->dev, "Couldn't register our interrupt\n");
 		goto err_unregister_device;
 	}
+	csi->irq = irq;
 
 	return 0;
 
-- 
2.25.1

