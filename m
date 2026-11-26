Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729487;
	b=caLLj3IBva7F5no8TgVehhyUUS5vJNBQubueVW2cfivYOsTtfKsXrqpQCpyhWDk6CiHk
	 C3XpWkX3v+vz5RL2zdvIvvPppch8CYe0G1XzhVkPbnKNCpvqq+zoupYGi10VlysqU1AcA
	 mvVgFHzM1DmYEiu6CeSuuAbSAPF45b6WpiNVGo5qu3QHBQJFEtH7DbC34w4fTDtG87vtS
	 TztLoD8pvo783egj6MIsPK83japZ/2oi0yNzsdjZ/ZcadOs+/ZvZOHhvglqJyYf2Y/aH4
	 B+3+o3vdDqJ0DcSx0ortD+W7upizamHk5974Q2Je6rVUQRtMLjzytusCCwv1T1nubUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
	b=L09pP7tcYhVc6UeC0pquKMSTG1V1HIlTBeEIlEDGPdRbpL0mCKEgtnQs+63kXywIpcuR
	 Qg0XpQ0kBegNyh7VImG4YvUpI8iSUGuF+eakV/P18zA798HyKRvO5z+O/zq/pegEeH9NZ
	 qT0GpWfF8DIxZZ+d0t+/q5NegCYy111nbsJyBUb5Fu2Z3BznP8vg0HQx5n/wimrkmC3yw
	 ZFfPWLNYYbipeHjCMAizJJcxDOmYaVQVeP6XrgYQIGBKIs58KTOXAgSeCW6BXaB4JhiZQ
	 h8ujYKJH84ylK67syrYh3/SVBmZxO7WGPd1p5t4OXamNkff8lOo16Q9kPCCdGhxcg7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p9cMLNut;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE06606A6AE
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE06606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p9cMLNut
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5041297f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729485; x=1796334285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
        b=p9cMLNutATl+BJf31Wspg/P8r8ao+ZZNzN0L9lj0ihHmpGEgIFBYVaF+U+Tyyw+YP2
         G59xHHVaH7cw7XU/UTpoidLCua3B3PwwMCTK/IeUdtcevhLAime4J4bUIdNeCDi3iqvI
         fKNlkcsx/B7QOkqrDfavyr16W34vwyZq7xLO2f1/5Cvc8I3o51r99K357O3Bc2Jys+QO
         ha9GX0YgoyzLOppT5PPSgeJZ5ZeBa8r9uI3Tm5j8bojekxcM0tsiDHCD/WPqhT6tD+VY
         7m+iBi9I1uIeHsT9ncsjiiYt4GvFKkedwdvDmZYSHmLrqgP2fdZ1Bn9VJWpFI/qxiF56
         dkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729485; x=1796334285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
        b=QbVdL48Lacpyky3KNtUYxIy/qU2jH4S+ON9Yl14CcJW5PB6XPrmsV3WY6dv/eA5LCK
         8j01MnhPBUi75zYlN8Q1va+4k2bIfSimIkXPD1jV5lRsvkpaY886RuVXGE0qmG7uti8F
         p7HAz0l/sRrGnqQLBUfs3++oBdlchPeUcJq0cjQ0dWLOHxkKSfCco8ZF1NErcxkRIdTw
         jEqzWWT/8TPMOOGExrIpfJsH3/LG5Ki5mXg7QvLhr1FFy68hYEgZjBTt3YeXZr6Kwktu
         I8V8dY5A6IqGPtMEwEsEePMZsl4kvk/RVqyNEQBhbB8vBwxN0u8SMj2exELVwlftTWZ3
         UkVQ==
X-Forwarded-Encrypted: i=1; AL+hErG4PC9NlHrAdCPOF2DWgA7oHqQCMIa5hjgVggQmZMvYYnJh4xciKXJDZ41LE1sux79YhH2WjAhtJzBjmg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+ExMTSSC7LUEJqQAKJuFJBvDfdht2oxWP2Go3p+aUHyQZ6Ax3f
	xNyov+WNfIz4TeGzIRkmjd1aH+DTk/6DP4YTaJTVq+5iQRXS5YOXRCN4
X-Gm-Gg: AZFdTZd5ID0B8n8h7ed6ol5c74B4YLKSlRNwG6u14NwPBTidmR8eaRlJ5kTbqTA2y9u
	BcDeIW2B+w3cya2QnYzvWOTb5ro5OEZknc1BO7KnH+O9xQpQ66e2tnqx/MMh0H+jhPqbm6Z+uny
	zldm9M5hRLUY7N1IQtitFBf9CoLYb8MbSJ9FM6M4ML7wp6iZWq9aYoUBz7mxnVLiEHLZGvBWK6z
	aUuHSMVACl9StLYraSAdUoLQEMxy+ADGsEcrlDc5aQO+pQ9CsQuXmTrE6FLDyLxYM7Sw+PK3Ote
	7/6P+QXSmvEq2BZSNK/7CoktisZyxVDbyRcmBG/3onR2bT1xUaHvkiGaO1t8JvGJk8L/eA4dB4a
	Q1isnXgOiTbNTCovNv8MsCbUZDISP7yCchmL9A7u1y/BhcGVAbAM328IeZHO/GO5NcIcJbv65zG
	v7MU68vZnQBHli+gVVGA9FnGHcdk1Pyk48t+lEBhEQuv2snl00J+TqnV8C7Liu9gzxkSx7Xv9xl
	FD0NHGFi0h2HukzPa6kB+RtvNMILYBlQDJMT0AZDLFK75GN9p9BI1SiTnYC7IqggY2ehWEYCxaF
	Vc8Yo8IC2BXlDI+w4N5WgRmmxM08un6vogf3UlG9hldlgxTS5rfLm+Y9Dx3ATkXH6NnlqTRR+7l
	Dp+Jdcs/VL1XZq2X1SzKeCKq7zBg7wRUgZvEnXkpRTssYqhBifVJ+it06chvIEa1WggtqMRao9M
	xnNZE3zqwjm7bMsn3Wr6DXT8QQ6jxY+634vzwjMGzwS382Sr442wZB/up2kbg7BJo5FmSKO1uFx
	3HwIB1k5YbgBsYB9X9ex0vzMXed5+n7nQXvXc/Viw==
X-Received: by 2002:a05:6000:2b8e:b0:4a4:7dd0:2177 with SMTP id ffacd0b85a97d-4abb55185b5mr27115538f8f.49.1795729485342;
        Thu, 26 Nov 2026 13:44:45 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:45 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] drm/sun4i: tcon: Request LVDS reset as shared
Date: Thu, 26 Nov 2026 22:44:26 +0100
Message-ID: <20261126214433.3562326-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

H616, and other SoCs with the same die like T507, have one LVDS reset
line for both TCON LCDs. The TCON driver requests it exclusively, so the
second TCON LCD fails to get it with -EBUSY and the display pipeline
doesn't come up when both TCON LCDs are enabled.

Request the LVDS reset as shared. The driver only pulses it once in bind
with reset_control_reset(), which is fine for shared resets, since the
reset core triggers it only once.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 20740fa10ce8..77b6026bc895 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1170,8 +1170,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		 *
 		 * If the property is missing, just disable LVDS, and
 		 * print a warning.
+		 *
+		 * The reset is shared, since some SoCs have one LVDS reset
+		 * line for multiple TCONs.
 		 */
-		tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
+		tcon->lvds_rst = devm_reset_control_get_optional_shared(dev, "lvds");
 		if (IS_ERR(tcon->lvds_rst)) {
 			dev_err(dev, "Couldn't get our reset line\n");
 			return PTR_ERR(tcon->lvds_rst);
-- 
2.43.0

