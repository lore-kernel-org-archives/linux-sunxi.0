Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818778;
	b=FEomqYyczhB4c7fwlGUxNPbQhM4ORAonz64YQ6Gbnih/H4wObWkp6d5BsdKE2bmIlb8k
	 NsxXy9QV3CIID37NjvEiyS2SrClWZZT3oy/rZRGqq3FVx3kxwwlny+k352epOuwD+aOlh
	 etmbmLy5DYxwZ1bdiJKGGxJ8wO/o+RqnIRMokMB36aZrU95719UfV9F5yxV404exnjVZP
	 XOdnqG1biJ33J9x4hMYtOTKfmxNUnLG80Aib63/KXxOD7SG6P5IPXB1XVhP3ySJRgFFfs
	 /sx9nx8Qf3E+mU5NXShS65TOzBTXwRxv3liiXUel37R2HtsK11F3SdpkenkTqC7p16w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
	b=edu8Eb0h/EZOXvYFrzuuAg7CHsM96mTYjFfTMBxqG1vD08qn/2pceZOA9HkdObqGOACw
	 1HUptalxOllGtpEWZnQN6mxAYKHTWCCtq9YVEjL8obZOOKP4KmUH5g9yVdnzfnKqOvdJM
	 IP5x2nDNqbq0TbVMxOir92VfgMr3xBNjX1ZaysBEAASm5AWN+iv7DHKADdDxjuFm9VUSA
	 rnbM3dTOqjc6tNBy/VlsDnO1uYV340+gamwRLDmq8YLCzQBHjJrUzj64irCfB6ZzAW7N7
	 BS7hZd++ELlcWHRKmNxZ5Y3CmGiOctfiFU+elvySkxsvlU+nHy0Wq8fJLG/qp70y2PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L8wbj/hx";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E3E606D823
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E3E606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8wbj/hx
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7271545e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818776; x=1794423576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
        b=L8wbj/hxR9Lk1yF+u98JqSxpQDP7vsduUJmQi6KBJ+Gu0EgQKfSCTstEqjgA6CYuon
         nrVeIWS7V1aX7qN7rag8E8UjUGShT6+THT6GIYeA3xgZS81hbd17LZSHBFBjauqfYgYF
         n0QlcfXbLN1BShsDqE1J0ILEP2XIp+TFtPLZf1eF0+HWFi6mSsxKhG99bRF7PmUQWlYr
         Dr9XtovlpbPxKyTIZarZqLK51enFSjTHSaZPEp1ucAtTLdIHgY4KBuqI7VHkA7stFVPv
         /tB2t/Xh931G8FTWiISmm0hzZvFCIQx7Nmg7yf+9IljQdYHvw+M7tNDic3EEaSotWDxe
         q6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818776; x=1794423576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
        b=IgAmQLrbkzN4ahhhNfCpmYewAxCcucLRcHIbZIgo+62kECUpsmYOo+g2FggjlDwjal
         9Kw2YgP03SwSCB2J3sdR1jwYy0Xq6NHkeThDeJ+X42qsBQA7HCpeOJYin5iMOOtxZdIY
         smEYqA7I7XLD0CPqwOQRA+QkDujvXWe97moddH0DgD6GtIIds78rL+eLj+lW2/GmTcsj
         lZsg6N++ivqlshNqdAxiBssUdccmWnfAw5aqy0tN0fGvomvajZGkI+fo/tFVqXXQXiLs
         boOWQ3zayYPxsxKyC/5+iYm5xuoT1ecsaBuc4kC9E8Sw966cr1hgdIy7D/q9KbTIRk6A
         geTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOmhM3xb2iXGD39gFJ6NbEdcmg0XjKxbnCm+b7cKumWvdZOeKk1+CiLFO5innPWl0D51qBFAmBi1FZkA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+T65r/UE8lFAR7YrqMGN8A0hCYcYIrbWCJeRmMU+48R5SDxZQ4
	zKy6OcZiKKIeyZSdydP9NCgR+VCw1pGeg3hBBXQXqrtSlr7MlaWSgSsylorXbQ==
X-Gm-Gg: AYBFou0bRpOKUtiJ7fo6mstrf7Qjc82S2HfF9HS5Xb4ELZYmrqxBg/ev1N/rnKyhCAO
	WL/sqhx2AvPYg3txGLdhc9ktkUXToldD40M+unjyZ+Cg4TAUH64tSgck32pmz/xeHV0xzB08Q4v
	jRQ/sMKd+DtyYIAqqjEe0/ZoyRTm/m0GdUJH7mKavXkNXzNDNYZwKFDpHxyQnXD7Ap/OC8GAH1O
	ExffA3KxtZiZ3WAn/cWFzWajeW3odEC4LJBavm/0BWDgb5+iQ07E05hjGRysmVJ+2PMSxUisxzZ
	WXvK+Ig4PphoiRIVPGI23kGpARbwiJ+ERI/6b9/vhDwj03WyyvgYqJGOcT8Out8aBkKgOqaf7w7
	MK8eGC8TMxifJXUqN03JHDPrlU4zDIErUogOhkCHP9Vrh32C8sW/UnxBBtR8VGVax7cF0lj0KK5
	DsymzC0xxuDTZomJDmn26o3O17IV92OlSVJxlburnc8TNWHkH0gku/+L0Kr/Txvn2PTuHujUFlf
	JKdSaGJ6rsMo4DYyAou0T1KD7iAKSKdEMciDb/B3+7zWkOnmSZbcft9A1Ddh/PoogTcIwDVskOf
	9LQKOg9qeRnsRW6TPF20DWK+82gzfxB3LdIRVLTxYW68FTjEmlaCYKCIEc3xKHtTgrLuoyHKx8s
	NURinVoyzIwA30y1kyh5WZ/HNn3/TqmLkgHgwEOLsvuUUm1XP02kiT8hWwOhQyC7PVwI6HQj1XW
	aYATurqjRQG1n5ILGloZzUKD882tpfpMjpstcv44X8G+bMLP+AKtVKOlPav9gpEr9GLkncV5OIs
	eAW/wtkYstogTOmaZWAieO3P1ESKSXRsR7XBojAQR91
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr383629925e9.22.1793818776367;
        Wed, 04 Nov 2026 10:59:36 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm3598795e9.10.2026.11.04.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:59:35 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: sun8i-di: Don't sleep while waiting for coefficient access
Date: Wed,  4 Nov 2026 19:59:30 +0100
Message-ID: <20261104185930.885203-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

deinterlace_irq() calls deinterlace_device_run() to start processing
the second field, so it runs in hard interrupt context. However,
deinterlace_device_run() waits for coefficient access with
readl_poll_timeout(), which may sleep.

Use readl_poll_timeout_atomic() instead.

Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 65bc426e5aac..bb90e0efa4d1 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -163,8 +163,8 @@ static void deinterlace_device_run(void *priv)
 	/* neutral filter coefficients */
 	deinterlace_set_bits(dev, DEINTERLACE_FRM_CTRL,
 			     DEINTERLACE_FRM_CTRL_COEF_ACCESS);
-	readl_poll_timeout(dev->base + DEINTERLACE_STATUS, val,
-			   val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
+	readl_poll_timeout_atomic(dev->base + DEINTERLACE_STATUS, val,
+				  val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
 
 	for (i = 0; i < 32; i++) {
 		deinterlace_write(dev, DEINTERLACE_CH0_HORZ_COEF0 + i * 4,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

