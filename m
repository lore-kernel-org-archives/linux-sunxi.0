Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09A33DEF4
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279807; cv=none; b=qlfHRr9wYRS6IfzxMuWd34dxnEAbrcHBNkEfH3t0e4c6xih7R8T8ZFvkZ0WHltiRAj3n8UuykQuafJAmuug9n/7hC/oSxyaJiSp+MxHi/GtSlyfllrjFVnggdUfM2yLTn/6TTnRDy5JoiMe6quLks3eX5DEbdeY7QG1K46rLf8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279807; c=relaxed/simple;
	bh=aREJ13it41dhVSZnZkEIp556vGl5b/Ra76n/PoBdPPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K12JONb/EELk+CBiki6lUE9V9WKgA+0pWActUaylzuFIQaLWo3C68jyD4Ttp7nkLBZ3yTHhPoMt6j5uJMqjhJOgmiFj7utUbp0sHWe0GbHE4QgAyGemc3CY38WZa+pqXO7wrRmmzgXGSykwKCAPxMIl5TyBQBfdpDZfIX63QVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPj7xd+k; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPj7xd+k"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso78251785e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279803; x=1762884603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+/CRDV30StujBfkrHNR5F++4wuDv1TH5QOb5NIYpYA=;
        b=GPj7xd+kTvCzQVHp8+AHOrqLHpv36wp0P9sZD8n8XM20qbt+btzSfjtKDGuz5ijdLY
         RiEqgkvbqYWdvdbqaLogfcgZ8iwcbLfigTRfNXGMA54k4X+agTXiWfxeGcCAqgU3KfKO
         F369HdrbTPGjFjcXb1rwudIo8ZBf0xYQ94lemWZ5cknSEo36WuHbw6V+LqeRXaC9Ww5i
         WtBFv11PRA1cSvTdBeyza6JEGvZ5eS70Xr7d0ERsLkCWluGbQgLnjUHwLgqPTBCzG8N4
         a1NG0FnEDB3xkTwojWHaDZ+SHI7HGHN0VUPBSPtn9jrkNk8ffQZVbaHtZxNnBVncTR9s
         GWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279803; x=1762884603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+/CRDV30StujBfkrHNR5F++4wuDv1TH5QOb5NIYpYA=;
        b=anNYX1QwUiOEisua5TibAhFz+25nJwHxCBX1/yHMAgBVP87InYhu0F/20GPU8Enw9c
         McTZ4sffQLVAX8Ox706NVzogFV1Ihlt6IMWK550d6BVUk+4zrK+ulyYd0lQaZABm0X90
         uLXpG9wab1s2G4DKwLThIlkCSQRRm+z/qz2GBWTviznEcylABnHSTayzTEuhv1KY2Ags
         TlcxjDa6hYOJSiwgw/MUxVj7Jblm/3bj5erv3bp0wDFIMbg2MQ49sIdlEEBMXNzzPkNd
         /cXFdWg+crzeVr/T2xl+wxT9teUNS343CFz/itBpTLzNnHNkUh3z2Jx3k0+ykiBkh7FA
         Cf3A==
X-Forwarded-Encrypted: i=1; AJvYcCUEsB3Y4zD0kNh8dWBtsO+8y7PB0jBk3/dSA7tKFxclnGpH5W2BXtE/lUA4h+XKI35MTXYe42mTFxq/0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGbirIEcsPnORqylbwbzEFifsgA0299TYzJcphVGykVyFdTDdD
	dso888kNYm1eQyKOmQKNzU+9iT507GKeTWIOroPh4UmSptzrc/fs0H2l
X-Gm-Gg: ASbGncsLiYVPklhEvIf6aJr0Xg1IlRrWYVCfj7Qt6gCSvYaJnpR5mW+QOPBbITVurAz
	Up1edVDPsQrZXyTsXS4qBiPhlsVcE3X012XnbCco3Lqy05O6eQYxW/BbtjIXID5kkGcFAaUvwiH
	NqvhzVKEbpJiZUvjC41xjAwbaYBm4ltWt5AYEsBxKuv48yV6j5SGBlwhUooB7dVZwCkwzuBC5+I
	Uy9Kbsj7Jn4aT/GZFGPzMUvIefUuYzRf7ufy/WeQHEoB3YoKBQzfcc7zKHOIgnOcz3167OVGLBq
	ES5sSrpXja9DdA6Sw3X0HGln3Nu7MsdV4FU7Ca0nGTDHLkEMPTeuxMjS7mj4wDaKTGNVqdMepyT
	+j1gpH66ZF9CnSWKTLao48gieUujJRj1ekhgVlHtyD+BVmX0SkKkdUG3bjTUld7VO8oy/p6uPAz
	lg1QZG44SA3ZvmzriQYQ==
X-Google-Smtp-Source: AGHT+IGtn2Tb5IVfUa8fwzSIF6EUNQPbcBikspeOnI6L4J7SH1eZ3RvMdCq27U9/2nMsft5HkQB0Jg==
X-Received: by 2002:a05:600c:5251:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4775cdbd440mr2296855e9.4.1762279802950;
        Tue, 04 Nov 2025 10:10:02 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:02 -0800 (PST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
Date: Tue,  4 Nov 2025 19:09:13 +0100
Message-ID: <20251104180942.61538-2-jernej.skrabec@gmail.com>
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

Properly define macros. Till now raw numbers and inappropriate macro was
used.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index a1c1cbccc654..b5badfa2c997 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -39,6 +39,9 @@
 #define DE3_CH_BASE				0x1000
 #define DE3_CH_SIZE				0x0800
 
+#define DE33_CH_BASE				0x1000
+#define DE33_CH_SIZE				0x20000
+
 #define SUN8I_MIXER_BLEND_PIPE_CTL(base)	((base) + 0)
 #define SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, x)	((base) + 0x4 + 0x10 * (x))
 #define SUN8I_MIXER_BLEND_ATTR_INSIZE(base, x)	((base) + 0x8 + 0x10 * (x))
@@ -242,7 +245,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
-- 
2.51.2

