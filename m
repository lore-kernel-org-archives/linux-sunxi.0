Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0996346FBB
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279837; cv=none; b=oP5lTx24ZbF0ZHsQ30TGobZK45YdxDZHXMlaIu6+PjHEfmsomS/6myfHpJMdgrpIr/gcjhdzaZEfbenXBWq+Ycn/NWi3AvtU9d36n3+SgasaoawpTsZVNyMIYUSqFQr3WnWX1sX0BBCy1BLUxBwv6S261YDDkkaJH5+tRI6IPIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279837; c=relaxed/simple;
	bh=ye213JbTqvKJ7OHw/ZpY6LCcPpjvObWagFZelGOjlaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1XXeO0f3Z1sB1k25jMvjH5O5HFdrjFGX9YTMQo3lAD/PNQ3/usrxKOdQydBA2Uto7WF3o7be/HJ4NTZ9ayYISoHs2t5u6hIVuarkAsTs6qF7tezIcas4+suPDMGRX051qR6HzCBF8UpwgOU9nTu5j9Ad3BudpwmEufoVEmrnT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krodRSGP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krodRSGP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477563bcbbcso5302475e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279833; x=1762884633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMq6+f8w/XMhRL94h1i6thbehjh3w3EiU9h31KM0Dlo=;
        b=krodRSGPM9iYkDJXt3E6fRDOh+v47WAc64AuSurZlJJtAnSdb2Ox34MdidLa92Eomy
         80DH5RtWx/FU8IscRgShu3Ey+KmUvtlbvTe4bWBVmSr7x2r3Ueqm//7JPivMwsxooMpw
         ePzOaxGygTcDf+sY9o0KPVLwT9ClLuAv2ZLwSGpWjmEi7NrEYWkdD/zSI2rnk8O9jhaj
         kMqzZ5anW2H1XixuElHUPyL/a2t8zkOIG/8dOS1No6DlWJnXl4CQlx6aQMF4bfRmsZM0
         hDv8kINEHVGX1cr8zlY1xX4+jKGCW3sT3y+VW+IdoEXvkRwhRK6U1oqFg/oiVR1lOfmS
         ej2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279833; x=1762884633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMq6+f8w/XMhRL94h1i6thbehjh3w3EiU9h31KM0Dlo=;
        b=RKNkqySINk9UPf0PgAw5b7tImWhJHJe2OmzI84urh9L0usvOs1Nvun4D4dbOc3yGqx
         xsc1p7MXiXhcaCLcEqRjYSZpDNfwp20Kp6Pqvxhl1gpDJDCOFVc3IB56CEG6/5S6txPt
         uEClY+rnrVM9OSUArvhGrsrCvvjPg4JamoIQBZYIzSoGWscbcYE/SNolXY9EyX3YcIey
         /waTI/VMJODJ11wTcQHwwZbO1NFyfc3+E6z66zevyjvGYDAQvJoGQvBLL9lo8F9PaunB
         fXgfddNadB/ZgN06la1vz2DhR/4kuxr1Mr63dl9gExfsk30LJ9u0QmSw7QHUYXrqpOlg
         x4JA==
X-Forwarded-Encrypted: i=1; AJvYcCVuxwtscIjv5VN+9N9yyNLeS3t5m9ESviKTDU+WFJVfAtNjiL72JpT9YyNjehOgziMnhHXn1zkYJdu8NA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2eJFE3J68xcUctk1GylNSLr/7EqPHUedN0GyvuFcyY4CXC8To
	vmifi7hPCMe2WQkMTkSJAXXu3i71uPgKv2DLtWAnOpw/tDR6vMf9p6Yv
X-Gm-Gg: ASbGncur/7v5eWfDKrroj0AnTBVXui9Ekcrm5XRD/XN+TASlLIS5Z8S8rd4OCfB6vYW
	5Xhc14o6hTIpQujKeThUnVax5Rw0fpZCI/Gt2RawxQTiMraQZ21nEnsHHDqf3Zs70H/7Dr7mDf4
	WCNe82FxZ4nsMLmOwbOLOE4tW434jvAvKI3s0gIgzZJKbOYQGKRlNB7SvGWCgWECfLfa8nxQugr
	qDPvAC/GS00FBP8lXA8KrIGtwW9k1ZGWcnjKvpUBW6kQfwdE8jmhak1RZHqMBTOGenLNk14hpsE
	eHBYtKu5+L4PGBCJ5pxkqHYEpRZIkrvQuOsqPgT3VLjSqr0pEtOYEIw3gxJUbolwXFL6HWoH8rk
	qpoL2tshL4x+YcTVEJXYIVRQ7UoQhddT7+KMExgolHSOCkJWVj4uCTnwOQQaujSG9PmzFltkuYV
	IiM5IwvjiWkWDqncl+PQ==
X-Google-Smtp-Source: AGHT+IGAou+/VWjl/+havcgVpIaUje7S46iuTOTBDTJA+e9THTDoYyFzTPWTWOtjQVDGfLuUQylUOg==
X-Received: by 2002:a05:600c:1e1e:b0:476:6ef6:e28c with SMTP id 5b1f17b1804b1-4775ce23c7amr2190455e9.38.1762279833261;
        Tue, 04 Nov 2025 10:10:33 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:32 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 25/30] drm/sun4i: ui_scaler: drop sanity checks
Date: Tue,  4 Nov 2025 19:09:37 +0100
Message-ID: <20251104180942.61538-26-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They can't be triggered if mixer configuration is properly specified in
quirks. Additionally, number of VI channels won't be available in future
due to rework for DE33 support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 2fc54dc20307..c0947ccf675b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -132,9 +132,6 @@ void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	if (enable)
@@ -155,9 +152,6 @@ void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 	int i, offset;
 	u32 base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
-- 
2.51.2

