Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B74641CB54
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773503; cv=none; b=YjDRFo1zBhdIuCh9G/u74r81YBjNbGBWzbvkxOorWR5GjrqdwkF1mPZ0kXADGfXEq5VPmPjM/7obxreL2I3Fugq36o6tUNZsmYl+amBWwdEYpu8uZrXyjcAsK7xhqnPjznY/sTYIqVYvHy2Tz22LEttOIb6t5um4dBvtyoMkk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773503; c=relaxed/simple;
	bh=gvyoux8vKAY8xTz8Xgc+NXDdABzVbfVGAT7Su4RCXP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFMqz1NtA9ynvExfThzKvc2qKZWv9wn5P1f1nimEetlMm6jliPO6Qv284mzP+6L01BZGy15dHgR2oTBcvHRSE7kYLEusJcrBvgQO/w4VFw/vJboltJiiuVouAyRJAbq3qFcevOTKcghtX+QlrVz4xq3BD0bbqQZh3i1/XMMmd64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p25rom45; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p25rom45"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954afac04bso27145845e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773496; x=1786378296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5EYEilaxvTpzeLrRhoCx5eknHZ5V8aHsBlGVEU3TBs=;
        b=p25rom45vpdxbdbSCv5YS0lzp/IoE1KZXNDx/eAOhHDYR1KC6NglFFGp2Oc3CUP53e
         xneQB4sXnz1hnR9RnlFmRco2fu1RX6b9DFOP6UFoe6Zaevr8DwtMpNPum6V4gtJ0T3i5
         GPfNIs2VVXUEN0olRAxQhvlMf6n8hxmQswncjTA/p/rmMZdr/OcUfNCp7sx2LSv86aYm
         aVin9bpRyE+c8eBVEuifUdghF0MToMeWeD/BG12hFNp+AbvBu0XqUGZOet3idKUxLJN9
         SkZiKVDESQm5+/68VBTsl1dFqIJkGBC8i0RPL/Dz4eZRNrVbCJmyZVC0JyUJtVQY+BhX
         Q/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773496; x=1786378296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5EYEilaxvTpzeLrRhoCx5eknHZ5V8aHsBlGVEU3TBs=;
        b=aXhuYnWE1kA9IPSqlC6+fk+0wKVOGy6Fn8GRMfk/10FkLHwBhiqpGzJ1OlhHawWT7P
         GoRlvKZVQfZVqJ14DQ8Rhj+A2T0WbWrUeq+KjIMPu14ArOqVpoga/NBg8VqFmCT8+Ccy
         0fzVFRR3gQbVZ/Z8E16fYXvQindH1WhF9q1wLdgoTSCeJMaWyOKl6VLuOAoJQcgQekF+
         XQMJY1GrTbCgWWIoc3PbtmU0I31Bj+/ygWQq4Ci+LMyRvDvrMkKhnDLwJvJd4EDgnr1p
         u7y1O5sy3IID9M1cakgSuxDuy4bBR+Ouq1TPXC/J4sO4sSqR/Qik8Y+nKKJUPewt7Zdw
         6/oQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTYdRETGxbU0IIh30LnjgMAGB9LHH/37/SeBJoBmik19bpcXwbnr68/JK5u1KTdVISs+JDLwEMX+EYQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxslud4mKvd1PXSdmR/sjA3urf14PfkSLueg5joxYjp/woP1reN
	UOBg0aPfiEMDWjDunOeKRA2y7QSHeC00yoKcNZEpROAcH3VZfGk8ps+V
X-Gm-Gg: AR+sD10C5L8VWQB5uo4zZAaNRkGpoXHxM9PToxwkskX4jiVqUqyX5EhYcIFNSvFEOk0
	SKrhTUOZqdH0px6+yuqnsJ3ulO1dMg5U5QRohuvs+Mgt5mh503d9ImAEyYYrlBkkjTRgWAnM2S0
	FW4JoRCWE6w8i4Uvw0CH/lbsnuklsAGjb6nBvWXHUK81VYKACUi6AFM5+A0fdwLjWEQDXpW/jAR
	OPe6x8YviLyc5xmWWr8Re9R9HqZO5Nn1rK4WFgaz+cqkMz/AJ6vLZ0ZHo0hNu0SXmQo2BHHgV15
	+zkwxgX2x+p9vgf3Op6Niwx2dJRbwW9jWGwrL0Bt/d6sHnfAg5VHzHyl9FkSQp46awaecXpWwUW
	eGwq1Y3AlBMQ2Wb9j1LidCGgTGSV80Mf4Me/4IY80uw3/J3y/JlwJA33p1eG6PnsP0f/l+Mdo8q
	ZpEH0zJi4ZR6z7zPsTHqs3BmxuVK/c0P+TRQrqgh+Iv+w1IiLXav3XziqlvSlZCDUAj48GO7Bp1
	usznIoOySsaxNT/n1fPIBxmygfA6cAeOokT5n7lfSm58mYx1PtQrqqinQ8zYFGBtgeqQ7bDaG9w
	0+OC8Kv8PpDuaTgy4fiy37U+abQ7wWTNqA4nj0YhDZWI3tVVPr6ZVWUeLzgr6xrwYpAC0vChJqk
	LY0dkd8ub8yvUeLofbMSvkiAHpYW5Z6AUDYZRuhU18bveiFJ+/g7+PS3WSG3PJkZxQ99UVROrJx
	zyXYkVQfcjfDSx
X-Received: by 2002:a05:600c:470d:b0:498:490:3bbe with SMTP id 5b1f17b1804b1-4980c679d1fmr255703765e9.16.1785773496293;
        Mon, 03 Aug 2026 09:11:36 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:35 -0700 (PDT)
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
Subject: [PATCH 10/13] drm/sun4i: dw-hdmi: Drop TCON TOP port reference
Date: Mon,  3 Aug 2026 18:10:48 +0200
Message-ID: <43ffcc17f7c3f94c1d7bd1ee89134c766e84df35.1785772659.git.jernej.skrabec@gmail.com>
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

When the HDMI controller is fed by TCON TOP, the port node used to
enumerate the possible CRTCs is never released.

Fixes: 57e23de02f48 ("drm/sun4i: DW HDMI: Expand algorithm for possible crtcs")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 96532709c2a7..51cdfa1ae3bf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -83,6 +83,8 @@ static u32 sun8i_dw_hdmi_find_possible_crtcs(struct drm_device *drm,
 				of_node_put(remote_port);
 			}
 		}
+
+		of_node_put(port);
 	} else {
 		crtcs = drm_of_find_possible_crtcs(drm, node);
 	}
-- 
2.43.0

