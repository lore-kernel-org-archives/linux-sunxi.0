Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1770419FBB
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773498; cv=none; b=WOA8fKmGQntg5FOEkPEntSUzeCzO33Y2lu2chx+OJiScIqu9teEPdtJtl3/+FfboL7qEp8M2Sa7RSxwYfUpLrcXxqPy9von7j275UrbZhKKcACZW0g07nJnocu9fimw/+MFkTdT8NBnwILM6xIGwewJ8zSBDPMFeEUsZrspHghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773498; c=relaxed/simple;
	bh=E/V2va673I5SwbBWXJYlP+dI9gNQdHSoB8iXM8ofRmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCuPw2afEErVcTDGjvimsc8Qb6Q0RobHt+mvq58ksLaf1tLRjISWt+m+kfWkFWrJQGTnIEgrRwmHF4BBTg6TGGI+NpPIyGLv/1zioc+4JEQQeyv1o0cTEkVz60lYRxWgzPJolVkdc9iPLiicW5tXhn0V+PoscsdOPohFxVgOJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yt4DuGba; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yt4DuGba"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954afac04bso27145545e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773495; x=1786378295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQSiWGawSQuy9JjtPPgjfFND1Bm19QyKn7xZ0H2UpZ0=;
        b=Yt4DuGbayzU/dHNt1SA4DK8+vtXTS2WIYZGDDNrflWbKzUs7cTy8704ZMj0a9DIavZ
         QW6ViMHbP/XhZdtg0aDpe4Uoi3HdMp9U6QrWRlYjsub1NCvRv0HURSNGgnuAzkT0CxOm
         gL8jg4C8RK5h2Cgdd7oFVSwV5NrRmD8lPPqJfG3/jVAxvirH0G6uJaP1D3LiBIrppLtD
         sd/i9Bj1AZPNtcHZJmOxbgJCNvawzApHkuwuQOjxrOKyRUh31IqSeOz3ZFcog+KMMDGd
         92q1ZC+Kezh4FK5QJ0lR3S3CeYsg7+jKhhXlmpd2lqlO4ckx1GNh4zoUnwlUj/nhXZY1
         boSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773495; x=1786378295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQSiWGawSQuy9JjtPPgjfFND1Bm19QyKn7xZ0H2UpZ0=;
        b=h12WCL+OxLP4oaQrObQfyyxQD5c6oKzD7WtX2zcEGF0YXTFB4atY+WVJLr3NLEDy52
         TNptnpz4FiuEHSM47a/B/GLpGM+H5NMBxTbTU8vY33sgbCBhADlQi4RVYEJM35Ft5oot
         Yix1WVBL4Xpty1+hHnTEEIKAf1Ix4Zn15a4LFgUKgIQMI2IFDv5AgP2hKQTBHV7OPQse
         WasJK0ae5UmCn1Vx819pM2oPGsBJ0ai+Xw069cpmMxUWQ+aGLeJ6ysq+FSUog53GwHvE
         +0OCLWOOsToCoIQdyp23QlgTMfzAso0aZo99+VNtYWbQ0TTdYmkpa0gHK3Z3r004tKl4
         JlVw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4HyAHpABCb8YbmFEqmbk4Yc4k6z8NRoNMLu0ltwxjkbByC89dTMtYYVevufHeuolqjWacFqzJsQqy8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt7unNem1JCiAGyu3+JyFgxwdf7NCrUogN3YgNe+tqLhCTiK2g
	zeG5s6kf70UG4h8OmCWnjMr0ixJwmKP/A0/T6DjEtkNJ1XuNFN0TrUCu
X-Gm-Gg: AR+sD11/JTTTiYDtySRI/JGaAMUCbmVvCGtD3j/RdbimKH5OWRdmIzKjt6Pp5o/wrqP
	+cSv74CLaTnmYQt2VGwgn7Mgtmg3bmjG2qJbCm/kF5JgS3FTARaS3/t3rRgjG/BNijldwtdrUB9
	i/vLtFPjnluRJk5NeifkzocIlw/6FGnaqkKe2uESWHcCCk6JCb09lgQPJ4la+RZUpnkH+xFfELl
	mmHFks/202gu6Of7dB4kHOQyn8Ep0S3oxW9RdH+AuMBhoiUMVXQoFCdWx2fwKW6Cwb3zeSTRZ8S
	Pl94iAh49M9x/rAtRR7BWbGSbGqwNjSyDHZin25/fBUXxeNLMeL0JWkQ4XuGBaZHt8NZq6chdqh
	XDLluIUr0vjBqLtyW3v9w0ub9CsA6nTfLTFgeZyOCsEps+zwwKeoozRyKaaTWLYbEqLBJzTH6xT
	04eDDrbOeDDGNxMX7p1nuC2gB8p9FJsCY27PZmBOSOVa1a/Aexe2IeXbKHmLpMiDmoZ631d+JDL
	2ujFCkYSU4bFur3wZQG3f9XZnazdCrlr3A6tRDQC2cYIkFSGqzS4bqqkFdrdiRNpdpsgxaIYor4
	NnhtTbvqLRooNXBe5ybR2+DwtY4QHlnCR4KX4mWo5RInqQ6bzthzU+lNCcqwW5NnEz/CIJlVAc2
	DKy5ZnTuYnBW1bGUwg3IVsC5IqZY5wRnMdpkwInxUUEXLj1rTRSOWqf28OCp85oG0u8soBF0jXS
	CPiw==
X-Received: by 2002:a05:600c:354a:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4980c673874mr224712255e9.15.1785773494475;
        Mon, 03 Aug 2026 09:11:34 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:34 -0700 (PDT)
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
Subject: [PATCH 09/13] drm/sun4i: tcon: Drop remote endpoint reference
Date: Mon,  3 Aug 2026 18:10:47 +0200
Message-ID: <3f5ec952ad80cb51efebf2fe230df50259041a23.1785772659.git.jernej.skrabec@gmail.com>
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

sun4i_tcon_of_get_id_from_port() never drops the reference taken by
of_graph_get_remote_endpoint(). The function is not only called during
bind, but also on every mode set through sun8i_r40_tcon_tv_set_mux(),
so the leak accumulates.

Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine with remote endpoint ID")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index de2d66623f7a..67047e3b657f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -972,6 +972,7 @@ static int sun4i_tcon_of_get_id_from_port(struct device_node *port)
 			continue;
 
 		ret = of_property_read_u32(remote, "reg", &reg);
+		of_node_put(remote);
 		if (ret)
 			continue;
 
-- 
2.43.0

