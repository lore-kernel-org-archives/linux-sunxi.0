Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C077417BC3
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773496; cv=none; b=gYmGiE1rYmnjTbNRAwRpO9pp9zi7sAB10yFH8+wvpfjWy4oHVrXdtZakidxDw8zuLOL/N6/RFVnbA8Y9wbk8o7G/9rC9Rup/vNRQ48omdRDg1qTgqqlvbKXUynEC+hSqGWS3UmcIAtl03ID/nNKDfSYBcYTL8kP+GoJFozItL3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773496; c=relaxed/simple;
	bh=tfv0vYDy2N9RvqMA4TSJVpdsIFekT4UQuZsb9p/jgHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GnR1pd5wQs9wLN5QWTrBUa0C1fUwY1Eag6V2ym7VYAVmXCtkTAnpYphwZLRqH70sIGPf0nq4uyHbXn0MFpxOPpTI3gTYYeqtXyYqXg7VVE3NIgsdK7TRoRSYk0JkyLWukP5sVMhaHu6msvPUWD/ZFwY89zE5D0FfAyC4u/6R4Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWyUybG5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWyUybG5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954df200ddso15187555e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773493; x=1786378293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2K51/FwVv7xc1HWMtJnTlI6NfH3sfU8zC/PFmRYZpYI=;
        b=rWyUybG5BiH5OLGHo5JGYqTimgJYNDmNcmfYrNrdK8mUQy/jBzrKPJbUznwVuar+B9
         3UHujnUSyKARvv9jomjkbtfSUV0Ba43d4DTKoXtvF/0lowNMgOt2uhFi/tK0PR3sHWWB
         MGSu8To38i0RWRfsqFMgI9yT7DFb8nzY702FsDNF59qZE/dp7Oj1G8sakhd3D+yfOquv
         KqsgsNbfBq7mo7szNoWZq30FU7IwsDWfXLkzDdhRkWVqoDSjtqtv/7s2AMEvD8AkZeGG
         1S6Wwsf1mbEgcqcWgx2exZcT4OzYNYcHkJ4hurXdZYaMNuOgpmylJLrqHhAqRdS9RQIr
         ezog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773493; x=1786378293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2K51/FwVv7xc1HWMtJnTlI6NfH3sfU8zC/PFmRYZpYI=;
        b=jTbr+n64Kl9jntzsnejspwW/MpD8cDdgIRzy21klmFqmri/XrHoDgSmRJYKSoqXFJl
         CfUvchJBDEQW0DiitBNKrGenZ8ncRPChPb8Awi0q1U4DJveM5I8WEA2QwLpAMYoYRpM2
         X95QSxLospAfnFXqjFGXghL+JFNM4tjwxv7qG/wY8g7bTlFFHsUOrc7Z1LdCVKCzfVTl
         P+4xvvITip5T4IcJoPSWBG6DaAsGsy7mN87DwayTfKtVDY3kguLlI14MzU1usISZ9e0l
         0UqKPBa5dZjy7AMSo7rqRyXJrYa4CHhA2h9xcz2Z7G6qHfCBRSN/0NE2xuYmBrxyJaGA
         Emew==
X-Forwarded-Encrypted: i=1; AHgh+RpUigNS4BZoAuw3KabFX/kEkg0T2D4aAdLlbP2F2+VaG8LdRA0NKMfTVTGrTy+NNHrt8oY3UuqdiQbVTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHDhsPXKnrWAd+4XEA3E0QKsIVEkvrJS4QZEjzDe6u6cTyUbA4
	uqCiRcX/Cd2C1xSg7gRDa3W8Ujy77qWEKfok7A0l/VOlNsdqvEPU2+Ih
X-Gm-Gg: AR+sD133+bjQEgLEMbR6sDM57vbngiDMCbol9lPOE39u52mYdP5Q7Vim8m2qiSdxvIb
	hQUufPkufsyuhsS4iff3j+UiQ6nF1wB3VF6CNfN3qAul27wU6twkQqkyvWTjo89ku5XLeA3sGlk
	ufBbHMjuluV1rOyApv4lAVX/3e1TEkywzEijU9B2e0dLABIuGr05tI/AsZlpfgzynPo5/Sbo9df
	frgRBWybmprDKyAsNm3LeLUtk8cGA7FGFQo7Xz759kODOwcL+hFQ2xD4GieCsVS6rwp7tPYpO7Y
	TeocJmkrh7NH8TxnCQes9Y9/AhrekUmdciZPdBPZOuIKf5BkcwZE/NCbOUiaVuqUMlDSapsOt2b
	K7Hx+c81775MXWq5iyX2YIYXqGFdAiHDeJs+Ha4Tuu4dwev0LJdzcpb0mEkGK7QyQZ+rhp4o32q
	PjELSqqDgf4ocHqm18TXZpwD4aXraLfL5BC8t7gM13uHUX/OuNMgCODb1R1ztJ79O+VOfDEJgB8
	jqxlmIJbQUM0ch3UcPolL5OE87zej4YoKos5rmXdltjBXRO/cfIjhuPiJV4WI0chof7Xph6JO/D
	wwv4aBVKnHueiIj8ZQZuI7ZCpSwMFNzxM4budfSAOzA0ZHox7zZ4DwJard9ioZtkeQpCyvJS4EW
	xsDn4s24FgKYEiuGjJJkrTVBsWqbxuWTBGcWmk4PEdCdglr306JredSkfjPwxp41nKYtvq/acyE
	dhdQ==
X-Received: by 2002:a05:600c:4444:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4980c645e1amr227533685e9.7.1785773492549;
        Mon, 03 Aug 2026 09:11:32 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:32 -0700 (PDT)
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
Subject: [PATCH 08/13] drm/sun4i: crtc: Propagate layer initialization error
Date: Mon,  3 Aug 2026 18:10:46 +0200
Message-ID: <b26a0d427d9dfae9c82e3ca90a67d24d8ece5a28.1785772659.git.jernej.skrabec@gmail.com>
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

sun4i_crtc_init() returns plain NULL when layer initialization fails,
while all its other error paths return an error pointer. The only
caller, sun4i_tcon_bind(), checks the result with IS_ERR() and happily
continues with tcon->crtc set to NULL. sun4i_rgb_init() and
sun4i_lvds_init() then dereference it in drm_crtc_mask(), which
oopses.

Return the error pointer instead.

Fixes: dcd215801b02 ("drm/sun4i: Drop primary layer pointer from sun4i_drv")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index c2f7f69baf75..3fa1f4fda0f0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -208,7 +208,7 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm,
 	planes = sunxi_engine_layers_init(drm, engine);
 	if (IS_ERR(planes)) {
 		dev_err(drm->dev, "Couldn't create the planes\n");
-		return NULL;
+		return ERR_CAST(planes);
 	}
 
 	/* find primary and cursor planes for drm_crtc_init_with_planes */
-- 
2.43.0

