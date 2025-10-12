Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1FF2FB610
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297052; cv=none; b=NFvBp4u72Ro2/MkGOWTPvIJOyfEUAnha785zwppJa5TdyxOg5bx/sS34mtjFmVdC2/5uEDEqBWQyDPLqJ5diSB3Grm+UD7XWAy8//PLEpfnB49xjJHDcPCcY/o6g42uiBt4hF7lnhC1mAURcIgtm86oEsU0XL6rWgq8riv1Q+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297052; c=relaxed/simple;
	bh=JE+9t2uTRyVmHQwjLdQehz8MHh5AG1h3FeCTYbIFTxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJ+Bs68aXZRzU3D//tiUqi8n7BGN0CFbVYZnnNVmZ2LSN/+iY9DHz66ZyIDf88xo78bRYsKUhJpcF9StWvaxmTKg2qYJGS195gM5++Mp+rH7DwByxn7FH8lX5vmL89t/WZS4Ibsp37I+4WclbQ/WHiwG8OHTaAa8LtAWZXK1nbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+UMqYoF; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+UMqYoF"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b4f323cf89bso619456866b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297047; x=1760901847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx6RwmSdgU4IIQBCfnjkaHIgGiO5u++wyA5NWC/K61U=;
        b=j+UMqYoFJkZyLucfkkbAcrydJxGS4zSy+899uaM3bHj6k5vOO9o4xT5VznxntQNgEi
         k6sL3F98X3/q/jVv6dsj3AENEDXj7PewXEJwj50hf9JpPGD6eniis0JKp4L0lX6UfPZO
         X4NMD6S/Krl/RRvKaAIKazis0bnWN/2jAFbEMsabnXevq03b1jMjlYyAEQW7gU4y/vqM
         LisgC90MMGaawKJ9LUxLdSIVUjaGdAP/YXJFFu+3fGdZliTYmQTxnW8alVBcmqYs6IhC
         NX8hbhwGuRHZoT6CzUVphqf6CFQd3CIQu8ipc0omclnxtjK+k3+XrP3IcDw5gHKcvjPq
         Dnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297047; x=1760901847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lx6RwmSdgU4IIQBCfnjkaHIgGiO5u++wyA5NWC/K61U=;
        b=GaadCFjh+XKKNltvXXfWIyevWxSxW/uHNvSky+miNhyUchsM+BwXWQMBOshvJRFbmh
         y9IR9HSDGHZHmBvRO7sGjTUi+VouqIE+Y/VdqJZaGyX8W66EKwI2IoKetxAPyd+XjERH
         nITbYwQ0w2tGXW8cu2KGMDDQjGfO4dmHC4d8aKqw2GJ5+Up4CLLq/SUeNZCHyoyJrqfb
         rh6/EUJBn/0ibv/OVFEx5eky3w5M4rNwyHd+jzMcb4UgGI/j1sCrc2O+D+g6/zIDPbZf
         oszIC4KrroRgkcLPXdNX4rJsL8JFny4dOYDRjgpNuNmYAlt0LpVhdpnYuavSmySxdfV2
         Mj5g==
X-Forwarded-Encrypted: i=1; AJvYcCXbVC+oAGPzb9+p93MYeEDRNOEK0t3FMwh6FsTKN7XE8Vup3zMzO1+zBZYowPFgPgkDqoRjFBo4c8wA2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRemhHheK4QE6LyfMBBZHN/wGeFMlEcTtP/kr6W+/Hx2E+ufol
	/SapR/BISQM8cwewN2bus7jRfaePg1iyIDzzrUGg5bLQY4oOi94QREBu
X-Gm-Gg: ASbGnctr8y+DHBz3bNpt8p5pOexKwH+BLwggxRP5Ba83R4iGEYZMJq+QNZnFJHsP8+l
	D8oDE6JGj1mBaty8iRJCyUbKuJYzolkzmnfa+8BxXgdlkfdmHJuBeN6kjJnTpTHH6LjInHDX7LZ
	1B1Wfig6LteVpg/fP1ScVEzwP6sf6uT2j/pJcX7uBQcMLedFFr0UiuIKOGOBxlQh/P5jdiqLxKD
	hlZaTGl8JmxuKlUwoDTAqpaxCWEdrQzeGRiY0H7jsoRnC1vEXApnh/bxiU2OCHKhbJ7w2QZFPRA
	K+De7RMyPpCIk94gEyX8uBt53ywIdWvLrN7/EJvWHjI2R4CVZViuHmiqJpkuuIoEZJiq9bt6jHR
	0rKeqoiSQYR1TB4YsUnFKTAJRtVOPQIqPGgOhpVFq2uQhcKhAV6XPVDknHD1m/gNzABAhewVkD7
	9jtWn8+4/QMWGoGvT5dHjY49nfsp05wjo=
X-Google-Smtp-Source: AGHT+IGH9C/CoLClf1Jkf0CjCgobVw/ZwbzYhFdY1bLk6LH3leZZDbDIp409NxGuCUrOaIqSIPGpIg==
X-Received: by 2002:a17:907:3f97:b0:b3c:8940:6239 with SMTP id a640c23a62f3a-b50ac3cbd52mr2018365366b.52.1760297047252;
        Sun, 12 Oct 2025 12:24:07 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:07 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
Date: Sun, 12 Oct 2025 21:23:23 +0200
Message-ID: <20251012192330.6903-24-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that channel base calculation is straightforward, let's update VI
scaler base calculation to be simpler. At the same time, also introduce
macro to avoid magic numbers.

Note, reason why current magic value and new macro value isn't the same
is because sun8i_channel_base() already introduces offset to channel
registers. Previous value is just the difference to VI scaler registers.
However, new code calculates scaler base from channel base. This is also
easier to understand when looking into BSP driver. Macro value can be
easily found whereas old diff value was not.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 0e308feb492a..fe0bb1de6f08 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -836,7 +836,8 @@ static const u32 bicubic4coefftab32[480] = {
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return sun8i_channel_base(mixer, channel) + 0x3000;
+		return DE33_VI_SCALER_UNIT_BASE +
+		       DE33_CH_SIZE * channel;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 73eecc4d1b1d..245fe2f431c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -18,6 +18,8 @@
 #define DE3_VI_SCALER_UNIT_BASE 0x20000
 #define DE3_VI_SCALER_UNIT_SIZE 0x08000
 
+#define DE33_VI_SCALER_UNIT_BASE 0x4000
+
 /* this two macros assumes 16 fractional bits which is standard in DRM */
 #define SUN8I_VI_SCALER_SCALE_MIN		1
 #define SUN8I_VI_SCALER_SCALE_MAX		((1UL << 20) - 1)
-- 
2.51.0

