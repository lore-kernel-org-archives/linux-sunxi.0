Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723086;
	b=nhWuq0UdRZzJm0ZyNaGi174ktohcx/yzN9SRYZRmjJ+zHy9MC253dTGg9It/pf2YeBsU
	 S6YarA12XXlNsN/Rl18p+YNKZmcCyk2KvsL+e5K1Lw/a5qy6QJKiJ1Qsr6Mm6FogjqTwE
	 yzyBNTPHKhX1LU+SEW+nnJyYYT0iUPyJc8uGs9Wct5oKboW9ZhPlJa3iavUvWuYoY/XpB
	 H/Re+hv4Wiwqi3IqEJAWt0ysJtVqCPloU4zeNlPgYv2V6OTKiV76AzL0zWB92/DVGQnU7
	 BBON9Jw0VZbbXgzqU/NTBHC3CPweNoD1Og7k9fjNZR/NWPvLDR3wUNzeSKWtA6Doi5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
	b=BlT8kaEU9GankNzxBQ/zWkCVouI3djNkDvvCX4aKeZyhSKl3pTkeRyMh8IwabcA0qfZE
	 V/eA7PV2ypP2uPcqr7v9lp1MALapLjK71KfM6qj97zNeodjJR5W+zQ1Pe4WuSSzvLQag3
	 10rPkIh4qOel0n7ySFZozx+3FvM3wNvT/1uIVFK8JISmQFyNGuJQ/r0p80+1Oe8QePaYf
	 sQ88my8Q7ILenHJ3DDkPgqJzrxLF3JGdVfAsgTYLkNCd3nsnVNbPgeJ4sE9k4DSVr12PL
	 mQJh0X9Xv3vHSBct96M5XZZHRGE9rMKfVmXuH+FFtPiV+rRq9MZEp0Ou/iJaJ45xVKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qrvg586u;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2B1606A329
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2B1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qrvg586u
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so17483415e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723085; x=1795327885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
        b=Qrvg586u8EGIJw2LHFiPQILnhQjepQvWcOxKl2jcHAY08WZ0uP8Ch5lFwAiGXsqtnj
         vpYPNoOhMnbzJEjsW6c8Ym0T73dOPKJNNKHE4/0xdzE8jGhB1beuwj6AYVVtSqTM//sb
         G4r8BNjEtCg9CMcBjhKiPvHJ7PaTYkEqP5O4En7z8wSwGNfHYeq3/mRRmaPivAHzfprB
         uh5ST8/Jjq2+TPpopAlDJh+P3oAnRtoLDKlv6ekOQ64VWCH1hVmdNWddao1Uy//6z58K
         VJoS8wBSj+kCDY/w2JFlvRDcM+lg+YhBsmn/LIOZAbnDPz5hUDE/0SVVwjEhNjbbIUrh
         waqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723085; x=1795327885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
        b=F3cy8DQOnlKMYLHbCGg8nkO7EkNfOHnlDDdODcVrGly92mHu9RfDEa+DQNIcRNbape
         g+VtkO4GB9nNQ5Vee+IlBd7fjptoy0nVfenjWqf6uFCpyo9bH2qNpfwpwvfB5GOLgu45
         18FGX8JWX1fYqYvVsxZUKKAemnhdwSHJXqVoTrDO8IslvvewmPmxyyLFaIvj5NjsLjCX
         YSlI4zK7sPY8i0K2oVznRaamVZXReNRYU8uIucrgKJOg4CprjbwtY5B5SdQvPpDGEIy/
         S/CAZhxhnma6CvMPGhQDUGJhLtmqXPF1YOTs9t5bI3hmwDJSX1rdv9STRWse1C13zz3E
         QLjA==
X-Forwarded-Encrypted: i=1; AL+hErEEpNjxUhEPjfHRtrtlymOGFPZqdH4WRsKlJ13x7XFJbURMLZSS1wIDXfsorxP7dT0h3S1R+E9ljBe/ng==@lists.linux.dev
X-Gm-Message-State: APuU4Z/tfX9nnP21p30gK7DNM9graGACUEalzWifqP8drOv1iXDF/HAq
	DS5nIn2RiMd2RDYnn0HzUIW8svWpqfQ1OAwAPkaRxOv3PbiAxouHGW8h
X-Gm-Gg: AYBFou3LZJiqnLoTGf998YHpU8rMUymcaFezBTXYKwm0sEfXzd9p91SVhMJIt/YQOGe
	1U/Xl9qVSI3/lWe8bUoSuPadI91BV7tzsuX7IDOkrxJiJa7+SE2GbmN/jHXu5OR5ZQvfAgI17t9
	pbnUndqdRfykh4gYSgxOjiwpd6A/PSAk50XZ2rXfhr3/D0dJlsbxNcqnDha3jHT0GljeeRZpFPp
	LWHWc/pXkCLgJKzSMaEmSQt6uDg3FCAobW/be+RGs+9NPMc13XUks3IrWAcZfXaDbn91Rjp2P8I
	UEQTE/9mAEpT3+kSUdqTqjzw4Z3mVLkOpZ7xVnr9jpnPIZAL2XT24WN2fUwXPlannx1qgFQqsuy
	Wsg7xXmWttWE6+1IPvmbFrKvRJg0B6Y6NBTJl8JtpMi4RMgfH/miCCwNxQeonfMalzhFgCF9Uoo
	gjWGRjgCKGAXsV59SPKcuKw0DsK0zxZ8E8NB6BwlihaNO6bbrBZNVh0VUS9hrNSnHc+7z2+qM5+
	PaTSaZ4/xEY1GaoGEpuFqkfl+QPtliZF31RzPabbNQwrMy5o2ygGdEawrZkEprdWidFkfdxRvic
	Lr3SCIN0HviyfuUaYqzA5QbRjEsPNyfMTvHSve4prIQEtD8JeQxiAw3vct6epxdrNd4MwfijJcG
	jChOD18vSWs1J95PbQWUyxbQfpGbP7UUqpJxFH2RwuH/fGtf5HaNA8Pxqr2dDYJpvCY6L2zQazC
	YkW1JdhiuPr4ZXoUXKszyyX/95QhzPTxu6TrAIiPQ94U1GjhEzdKWwWKE4F0BX9/dyJdkgOjB4V
	eKGSCbCDtkfng==
X-Received: by 2002:a05:600c:3b98:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb55a8c128mr151718065e9.25.1794723084885;
        Sat, 14 Nov 2026 22:11:24 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:24 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 3/8] drm/sun4i: Add support for DE33 CSC
Date: Sun, 15 Nov 2026 07:10:57 +0100
Message-ID: <20261115061102.229680-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 71 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ce81c12f511d..70fc9b017d17 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -205,6 +205,72 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct regmap *map, int layer,
+				  enum sun8i_csc_mode mode,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val, base, csc[15];
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = DE33_CCSC_BASE + layer * DE33_CH_SIZE;
+
+	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
+	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 {
 	const struct drm_format_info *format;
@@ -238,6 +304,11 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		sun8i_de33_ccsc_setup(layer->regs, layer->channel,
+				      mode, state->color_encoding,
+				      state->color_range);
+		return;
 	}
 
 	base = ccsc_base[layer->cfg->ccsc][layer->channel];
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 2a4b79599610..d2ba5f8611aa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -18,9 +18,14 @@ struct sun8i_layer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
+#define DE33_CCSC_BASE 0x800
+
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 void sun8i_csc_config(struct sun8i_layer *layer,
-- 
2.43.0

