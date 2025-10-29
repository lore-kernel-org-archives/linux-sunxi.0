Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13201F4188
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Oct 2025 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724169; cv=none; b=VBgTsvWwF39XCrGCBpER043OmVzvarx2tuGi3EmQFVbK8uxohsuvdcCDD9fffwyKWw3pAHKCXKS+e7C/GfDiB8qeSMk5nBHmas4doJ+CkL6qajQBUcCqpGTRJQmS1rTkqfvZ2WkKlcvj7fGpnH+JKT6R6qbIhGjQykYlVBWCjyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724169; c=relaxed/simple;
	bh=1GaD607Sv/bHk2ImqjRGCbXa2CMQD2Ts9MTofIV/RBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YpE5sOmK3sBBHo0mOPAi0rkCAU626k3t5AePyrCy5HMU4k6WJFyQ8qdQyjWujjox41zhgf/qYx34qVnM+XEc/qo+cTqHOklPr9h0yi/BaDvggDKVtQCVUmclT3/tU3macOK3H5OV9hZHfNIC1lzusr/Qitx3Owq4n6urUf6jMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWarF4pf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWarF4pf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-793021f348fso6170228b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Oct 2025 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761724167; x=1762328967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RLA/DGKm3EXMzePk9BvP8NDtl/YaS8WddbAf4crKqY=;
        b=GWarF4pfztMyY9zQWxy/IXkyyHaSCjntYIJhgKSIqLDJhOXD3PtCmtHzYfJj3BTMIs
         CJt2WRjFbj6ONiTcWAtxNqOsesN83CNqj5Ol/EuUX9GuR+zDjClMaCLiyPE7j5y5S4zM
         uE0/KrfRZtCi1MHK+jOa4sBsfINt3AFlU5ffONF8XpJ6SjGJLXObPgCjQjjpRaNM8LKC
         1GWFOpyiZtam+yAx24mDjA7mLOPDQl5RAwbwmlOt9GCm98Ll3HFLfj4KDyoohaZ9YcnB
         CssJN79BWQh0UHAOVwAiAUV2dch2DJEEGlJAnpXa6DH3XGYAhE5KISSmVD2CeCfk8jO5
         AQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761724167; x=1762328967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RLA/DGKm3EXMzePk9BvP8NDtl/YaS8WddbAf4crKqY=;
        b=BGeQZE9+KRTloM1bqbEV6dRbOBhFSfUMt3TDi8V11QoDCzCmNumjHg5QupuTv2f4Aq
         djbrWv6SQ6PicXovQcJi8z1R6HHJuOIlJp9C8UiOkQ3dWBWuHJeTulcy3dzrBJBsC14q
         Gb8c3jGX66SczUDiU8iuO54b+o94BDsEnhRoDdEkDNUjO8ZkgbjFcNa6Ujyn+WWI0Qva
         xeMK2/gvY7Eyi0xy3nLBxabYdHOpYPWDtBIijf1gESVsa5REs1Q5vSpL/vWhVSJZpK5j
         r325RU0yJ1VcEo0VLYw2g5qknFcsJ3MJC5qtPewlrA6LogDWD2iK0cDK4S1fnh699vyi
         vkqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9//pc1EgKMK4CN1V9fgYL6iRiOyNV0ajQ/uX5aISwIbKalDU4vwdEYi0ZKuq6dqPdaEgqq+bLI/z9mw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5RzR5OtsGxcmBFKO821VB6vQSQ0MM0q7/jW+Ubexel1jon0AL
	iX60BD2FGm3SuolP51RV9DMdhBur5np00J+tS8o0Y7Rx5wD7tLDCIdSd
X-Gm-Gg: ASbGncuvI9l+IxdpbYxRtVxircHbxZeiVOfLY55AyKWOATiblx87Rz5mCzY+Wp5tEiy
	WPD4cN61Sdb5Fwf81K1jppYKq0F+18SE5j1VsX7cstvNVYUdV7QK+SyFOHWY/NuN5Mw8o44ipJT
	ZwHaITBB2m9zX+GvRlapGiocVi5ye0t2t0VLbUOnGsVUZKTBa6D6NFJlHfkR9vnrQMVO93FxEnW
	vvItvGX1fXBG/lu2Cfin7nOkT3tRpoDJ/kI60QFC9VqdYv49vSbTv0hpvEkdPxWPF7ZzH0BCSH0
	tuagJgY3pOI2aEyVbT5z1AQfe/ZB0DYcblCsLJDH3WhNAMsQTusaJjRxsDWFYlkAvuBVDrBhIMT
	oSSNOl8WNCtTD1jTxnqWtEcjaEuoSlbpmp6TdzUKTsHTKyyYaQos0gzSNZFjDVn66Yzq8bWd9Ev
	CAHM4d7Qkrp3fszZHtWWDZQg==
X-Google-Smtp-Source: AGHT+IEjGFYHvTA0394tCrKBxDkPiihw2m2Mpe1BSWvzEwpLa5iv/ijoEfCshocB13qZhqbfk34Zvg==
X-Received: by 2002:a05:6a00:4907:b0:7a4:f552:b524 with SMTP id d2e1a72fcca58-7a4f552b7d3mr1920900b3a.28.1761724166997;
        Wed, 29 Oct 2025 00:49:26 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a41404dddcsm14151864b3a.38.2025.10.29.00.49.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Oct 2025 00:49:26 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/sun4i: Fix device node reference leak in sun4i_tcon_of_get_id_from_port
Date: Wed, 29 Oct 2025 15:49:10 +0800
Message-Id: <20251029074911.19265-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a device node reference leak where the remote endpoint node obtained
by of_graph_get_remote_endpoint() was not being properly released.

Add of_node_put() calls after of_property_read_u32() to fix this.

Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine with remote endpoint ID")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291d..9214769a2857 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -970,6 +970,7 @@ static int sun4i_tcon_of_get_id_from_port(struct device_node *port)
 			continue;
 
 		ret = of_property_read_u32(remote, "reg", &reg);
+		of_node_put(remote);
 		if (ret)
 			continue;
 
-- 
2.39.5 (Apple Git-154)

