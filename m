Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0D35E94E
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773493; cv=none; b=hpOTbi6VuNqkNwv21ADI2Ca1Bh90MK9oSQtyUI2MncPEYfiCOqQH+i3Usn4A+Z23aAEOXlJ476zmLey2MXoENQ/wHg2JE5TiVJFHkqIuVwlirw8vWUYmRHKPqXFhOPFTsbWbLrwLA1YwE6bC8iv6rmkBSAbBo5T8XaRVPUXggDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773493; c=relaxed/simple;
	bh=+QALvQiHMlQRwY0nMxJePPGFDWDjCRk+5uGBf54egKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7743CDa9z/nreIMfMMAJ1wKE2p4kHcNSi7Jq0Q0PuT3+phym7RPTbcxTwPvVrP38A7mPkiZgd+kae5VNDrDMZ2tcyJQObtvTZb6LabXpirJSKAGWAVw59qn5zm0+H8UH5vATnHdRi8IgaSgpDtt260XmaoT0q5ZE2cyf3Msk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/0Yxf7i; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/0Yxf7i"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49548e01d02so13157875e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773490; x=1786378290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/erqd8k66TTCAw8PMmbwYLxInnN4rdx5bNv3CpPzY8=;
        b=k/0Yxf7iI8Imbn6oyEnSR/1IoVcZvgqSo1yHn3reYc1XmHNJtV3zMzka5kvZdF7Vzg
         m7swlY+Bp6WYPX8EmWjUcNGqteYOln8jvyW2bDIfzsJwSyspFDKFJ1ijqyhYrrtW8epj
         MuYtXivotvj3zhf27H6Y0jVHqsAk3AcNnvNzKMk15mz7+ZAX/EiCmSV+9pWky783ACNW
         luR7eJFN7UYER5f7Gqm2E6/0/VbJb6lo92noyxeWZ2ElhVuO0uzC6MPLPQU2WqbQqKP7
         DAnKK4TsCWzoi6xfrPII92tCgW3SzYWvAI7kXHMJNU6aE9adTIg+Fp/d5qUbmqLcWlvS
         ULvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773490; x=1786378290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/erqd8k66TTCAw8PMmbwYLxInnN4rdx5bNv3CpPzY8=;
        b=a8aWA0fU+QcHUvV0zKEFlUgnrb5NgYq2AutQ8V4h2HcV08rFimYhYMjFRemgS/3BSB
         Ek/lMpBpmY1WRmWrtFHCdMC+Ft+EoF6Q0o4pkXSA+47EAOLAq4sZeV4UIJiGY23D0c4h
         TJCjArz4ThLLdooeAlsZtus7ScNnpjbcepWNNl/qR/VP5m9rYCLADA/i/7ulTDwhikds
         Ka41w3MjiG/Uq5Y5BOWljTIx8pCMJ/bW7kGiE2nwhAsr6nUUqJF9CNcdtxLofVFTlxq1
         RJZMEo+xj4gb0bFVhdngY9uHjhbM+rkoUqPySQAiAgR2uqSyIXUymMwlarco2LNv39Fo
         cChA==
X-Forwarded-Encrypted: i=1; AHgh+RoODHDrfBWj48yhMyYa6s3/K8dGtzgv8ZVEfBUACeUG3VRPkoW39y9VOqDOjmh90P8RJSIlwvbmck/FiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxF5lRy9oKDHU2N6TrIJPDQPwkkZ5bg1HyBgP1v+Ib6MfG/kFVg
	FG3JlF1lJOz3g1yA9AXG7osi6/Z/LkMScdB6wkEwjOE86PLb62eiie6d
X-Gm-Gg: AR+sD10yF0MVSWR96tYv+YUWOreA4JsBOvEdQp1PJRrQbB+qKqk3dv6XDSD6++gUEov
	ebbQCJcJkF/BmBZt46OWnFEH9gABSNaFmJ7G429QoKict6Ya6//CZdn2oVQ74/bttTnPJYonkjd
	7mfrohg3t6BDXVM8/odeEorGhVg3v7IWcq/NJR5jozsamPwj3/iTBghNFOW0nVHrPgwlxuXK0ip
	g9EBwP+C/ST9QnbCLNJvTc4oT42zOG1KUIUKLhSQAPK/XfFXFQq6ZAYdvmBXNrkj0lR1+AQHlNL
	GWiGN0LJ9i0XmYwRgyAGfgRax++NmiGOFrh6G+io12y5ID1hPvSYzzaak9+sIRLQCCzlGjt9GCZ
	cdstsr0gf5REyQa4CADkAgi+lC+fdr1YsGThwttn94ODp7FHtsO/x8ZORoz0NKV4H4CxTUMUO+5
	rSAP4Xlkx3BkPFQLm9aXhHGFdpyFuoUtbMcW+ei1mzGc3lOi6CvkuZOSwvu01ny+rxkRQPR18a7
	xBZACATyRHVkqGJ/iYPDveWe2N0Xkf65jdWzIvOiBD2g/g6vNWMKRrmAR/bp1R/02HKWbXfj54I
	tybx2Q7Jr1FpL1ymUoDpgDBP6LeXgZ55kCBn7EWtlUyzwRA37s7GHMDvomiUXOMo8HvxWrNVQYA
	2wOyEL9h1S5GnDjWdX44LmMcZL62hiF1StPitAWTmEuhS4/xwe49rSvXrilMzcnCHDDkCkOFgFB
	r4IA==
X-Received: by 2002:a05:600c:3f0d:b0:495:4cb6:71cc with SMTP id 5b1f17b1804b1-4980c66b530mr267029485e9.5.1785773490118;
        Mon, 03 Aug 2026 09:11:30 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 07/13] drm/sun4i: hdmi: Don't leak sync polarity bits into packet control
Date: Mon,  3 Aug 2026 18:10:45 +0200
Message-ID: <51ba0918ce016a4b45313d5df1b6ce31b8c8731e.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_hdmi_enable() keeps using the same variable after it programmed
the video timing polarity register with it. The leftover TX_CLK, HSYNC
and VSYNC bits are then ORed into the packet control register, where
each nibble selects the packet type sent in one slot.

As a result, slot 0 selects packet type 3 instead of the AVI infoframe
whenever the mode has positive HSYNC polarity, and the TX_CLK bits set
nibbles which the driver never programs.

Assign the packet types instead of ORing them into the stale value.

Fixes: 9ca6bc246035 ("drm/sun4i: hdmi: Move mode_set into enable")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 74c7c3720ba8..a27d394d0570 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -161,7 +161,7 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder,
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
-	val |= SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
+	val = SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
 	val |= SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
 	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
 
-- 
2.43.0

