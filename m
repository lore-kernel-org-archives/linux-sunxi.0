Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686ED3812ED
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773482; cv=none; b=cmOlkenR9wOk0Ef0XwgGOWDKvBQdX6O8IESJsZxht4ptCA7YJ3w+BEK4+KJ3Fe97JUEKhS5dfMoOBW05zYShgd8UWIXTa8uNQpWwj1UMg68TBn67J93lB3oQeoBnRKTgq3L33e8Ek9fre6kK97LnX9PsJGg/4/ALDIl1rWE3JGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773482; c=relaxed/simple;
	bh=80mgdYTJk4Rz9CLE9ia/R7HWxlTEEHYwqY28O878r2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjiGa6laJTpS8DARRfuczHtcTLTA+28ofSbEYNWdCEeXjAWItB47dcpXB1jJ9U+9unu0TMQz4WRbGn23xGL5XtxdOJp4MG6TVArVpFymVyHddG7ZGfWp83YOsLr0zCwREJgxkQEN1xb2UAexb09Gz7Y1uYTLG1xF/GJT8U8zDhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0cvcY7h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0cvcY7h"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-496b7622a83so15115395e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773478; x=1786378278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8mU3xQ3VaqFI9TKErwKoPI9PJbEs0xdMOgJUVHqdkY=;
        b=P0cvcY7hs6HVWwFKC9WPAgiSwofFkvLdkM1H7JpHsZS+OvBzAae+CbguvwvZWRm/I8
         qYlhU5vHAz33vyk9LpA0h4RHWarcHC2Hujwn9TYrCds4+OH+LmhYAI+56ibsPTUoAN1o
         hKzXAgrFWt1/Tgae4dg1s9S6C4JOU6Wih3t3lLKhkxgNnlrMbd11dyF8CVA+VKicPMqK
         RrpzQC7Vwfw5wFWM4LvgRhLm5i+NRjNE0sYh3VdYgOwBZHfaQIq3xwM2OVV9AY1nv03r
         HcIydBjZScQwcDaXGBImnjWcEg8H8auniWNMxkY99MS0chwS7werFOCts+LPeHp1lRcQ
         fE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773478; x=1786378278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R8mU3xQ3VaqFI9TKErwKoPI9PJbEs0xdMOgJUVHqdkY=;
        b=XZsUyStAF3PCPKD/9cx1FIA/b8g59EyyUCMSzJ1pCPXzXwu/fLob9/n10hH4Fb38++
         esKf91jVMoZ8h3YJLrzUhO08N4MCsEi7OGCRznSlRbLbrMbfIBlz1iO3JiRzo3w2NZTp
         GA+3eA13aynIzrdQvxMRXfaSiWkhCii7Hux2IdF0xLO0KBBlUsctN/xSrJV6zDYd/bnq
         QsU72R0YTWndaPnh/1HVuh127TWxrtF6X/ID2lXNLi0Sdo892MdV6rxV9w/qBNOVtaI4
         6L5jyTwzVK1psenaGPtDT43SRsSBB10jEbTyo0zqUvGcA6Vsjzn6s9Ew8Jd3yPlRx1X6
         96Hg==
X-Forwarded-Encrypted: i=1; AHgh+RrPsCRGyqGfiF1afHNaM1PCNbBf/H8Gs3PQx/PVls42uJaKnUEL0GajLQzA/JW+yMwcZaOlCjOEDXVu4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxldDFiMGtVxpD9qSQU/YnRpfiCKpKavzcf5oki5q7jyFgXB9zD
	2AaBRtHFKahjBCp9QvUtniEMrROZXR/3HUGukZtYVtHPOIa8BYrWqxKBdQbGTg==
X-Gm-Gg: AR+sD12HE2aHPLsoKULxeI5zPFGr+08WTj3DDAOZaFTMra0RfqipoZYxZpvKmbaGoFt
	4iraL1oUcBuWTomAZp9FfSmCtJ13O9FLPce86DSuLszIqV4eiT8DqeFZEcYw3CAuCpM9VsADAZ1
	yDb5x/IZrbsa1eU9YcljUVITgLUsSh9ttLOYngSsVvkS9Dj04JE+Q9OSE5adNQnprfNjt0s+ygx
	b3VE+czC1YbfWcalOl0XwLIexSUACKZLK30y9G0B0QhyvWqYOsAW64FsMr0ik4Jgotgby//Twxu
	XlhrXjSveC/AsuROy1z8JuyiuMkiI5KSGymUUPHGC72MTh4cp+cMqxEn088wBAvMciBSLrLHjRQ
	OcTt3rz6uP/toSPyinn2wFYFs6PP3CdK85N6hhXZU3Jvqc8jeil9UMc92/l/RHIUxHB/Swwq4U3
	HeghywjKHgUpgLYWR5U7T6mP/heYrEfnZlZnMVEWMPqFSzJFzMc4VNcSoDRQM/nP5ryjF32cER/
	Ge81Wo4XsxxoVRu/vwprl8iqt2geoqM2ZAiCBdtJCufa/KaNMQ7V0lRGaajmTdpezzVfKre8Fzg
	THSI7i254Jz6Bm/sMFtP5xNntUJ7B9rLiIY+0L4qNM11xdZdE6TQoLDLQwrw6FKkiaJu2OPpJSC
	MbhgaW57isSDXQWGGjqIlgrua+DeMBkgTeCAnOvGJjg6Gkby+q4+eRGJ2vqirnI0TtbG6kAvVw1
	y2oQ==
X-Received: by 2002:a05:600c:8b43:b0:496:c93d:35d9 with SMTP id 5b1f17b1804b1-4980c66b45emr202147415e9.6.1785773478485;
        Mon, 03 Aug 2026 09:11:18 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:18 -0700 (PDT)
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
Subject: [PATCH 03/13] drm/sun4i: vi scaler: Restore opaque alpha in video modes
Date: Mon,  3 Aug 2026 18:10:41 +0200
Message-ID: <c48ba85b9e4478d51afde4f36839fd1c1d363b23.1785772659.git.jernej.skrabec@gmail.com>
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

The DE3 mixer initialization clears the entire mixer register space. This
also clears VSU_GLOBAL_ALPHA, despite its hardware reset value being 0xff.

The VI scaler uses Video Normal mode for subsampled YUV formats. In this
mode, VSU_GLOBAL_ALPHA provides the scaler output alpha. Leaving the
register at zero causes the scaler to produce fully transparent output.

Set VSU_GLOBAL_ALPHA to 0xff whenever configuring a DE3 or newer VI
scaler. The register is ignored in UI scaling mode.

Fixes: c50519e6db4d ("drm/sun4i: Add basic support for DE3")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 2 ++
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index d4412a62c2f0..a5cc99981006 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -975,6 +975,8 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 
 		regmap_write(layer->regs,
 			     SUN50I_SCALER_VSU_SCALE_MODE(base), val);
+		regmap_write(layer->regs,
+			     SUN50I_SCALER_VSU_GLB_ALPHA(base), 0xff);
 	}
 
 	regmap_write(layer->regs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 245fe2f431c3..d89c0cbe188d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -36,6 +36,7 @@
 #define SUN50I_SCALER_VSU_EDSCL_CTRL(base)		((base) + 0x28)
 #define SUN50I_SCALER_VSU_ANGLE_THR(base)		((base) + 0x2c)
 #define SUN8I_SCALER_VSU_OUTSIZE(base)		((base) + 0x40)
+#define SUN50I_SCALER_VSU_GLB_ALPHA(base)	((base) + 0x44)
 #define SUN8I_SCALER_VSU_YINSIZE(base)		((base) + 0x80)
 #define SUN8I_SCALER_VSU_YHSTEP(base)		((base) + 0x88)
 #define SUN8I_SCALER_VSU_YVSTEP(base)		((base) + 0x8c)
-- 
2.43.0

