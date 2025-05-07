Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F328EA6A
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649354; cv=none; b=ACHaQIoBCxpI+1ThPPasKawhpCQTHdXql278CzZc4+ZFh1NUjxpZ8tfh4F/ogT7Ns8wHrhWNjyW2mMp4XdRVfbpUstWQX9v3+XvJCc/0MWbsgPQ0k1TlGl+giuDdEv5a70yVPRX3DwsXABXnEcI3UoaUpMXq0K5u7w4l9erjznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649354; c=relaxed/simple;
	bh=y44t91H76ffOAexooq+mJGs7u/Q9UpjMnTFzLrl8Be4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eL08++WLyGBbYUh72YRm+HaoaSixBNExObdLfNTp/P8mhn468i/CtbKrQRx15J3Q4G+4SbeT7I1fywG5azGB+sM+cGW5LIDwARtm0pkL65eQ8it5zXFD7sA1kLKIuNAUtRekCSLIr6nL7OtdOafwFa3YedpSa/osRf5Pac9iskY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNQzIIU2; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNQzIIU2"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72b82c8230aso95632a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649351; x=1747254151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6UX68KruPGnR61q1oninfcr4e5yK5hNeU8tagVAmo0=;
        b=YNQzIIU238D0kDBkziN07jqTQsIy9IZIoUoGkV0afxR4sxtNk9wlK64B6mf8bjseTs
         8ukhgklx3pGaD015IYwVNAdsEyBv7rp4mKKDqmDs6vicTYx7xNn2NbTJ6WQ/OwkkqqAH
         iBeYajc0432mwDRvklp0VL4QxdFIg0Hp3lIKV085gJ+rAUMhmwXwgLZpkTd6/Opvy7y0
         6tvn2mCXeDN9uH/l+STnChWn71+W3Smi/c0uFTHmsqDaUkhlA8Lss5E6yk61hBqwpbI3
         aBxoOlj27NTycmNqM26M/IOFSTLH1AUMOBJEhrD4MrI7iXqMw6YGFXga0AAcVdxxJINP
         /pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649351; x=1747254151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6UX68KruPGnR61q1oninfcr4e5yK5hNeU8tagVAmo0=;
        b=bz3G7+qJGHkrTYh+7GxNLeKmA5alE3dGimQPOPRtB6oda8u2ze6exLaRCVNzDj1clW
         0IK3UePOKsN/E5Jjllqkf+YgMBfjEOCYlCp+b2RuobxIZEKLy2PIxsHHc+vXxx0RKGBa
         cHPtTyZm35SJcWkBsFdyx3u5wNVP5jGzBntddodZG0CPNghm0103Fhrb7T8u9+WB+tDT
         2z2enHDToD+pGnV3xvjnwK+4NMmTveDLo0NJXzhgaKj2Gg4QEfPDw1AeCzLWw4OraRjU
         ey87XUWopRJMWfjJFt/ExXD2oeLQy6fOvab8Qp2oJImCwRRpfSFoLqgH5P/7pIyL+14Q
         E8oQ==
X-Gm-Message-State: AOJu0YyMzQl/W1sJJC+MPPEYz8+zfE+vlXGcQoCNJnVbo8VnOgrYMwZK
	VHQes4DL8sf+EQKNnDfW3Sn/He1eIsCamlzi3IFxiUMJZcBqvtd3zk0XYA==
X-Gm-Gg: ASbGncuLxng4DJ9j6bLAtF2up97aejdjcI020kwZ3Wc1Y7DFUZzrZBGSgItI923xBSA
	D+lnQqPL0ic4SgOw3MtO4RXELIUHz3ZRD/L6dPSIMEpbxaRVXq+eP8KCd2Hpqi9rYdqUuZmZpnE
	foXTLXXFTYrXrbEcVQVxAOPd3ubtpl5E763mM/cjh9QLZGEEjJTMPznoSRhUAw8GZvovHtO5eQ6
	ZqbOglLmE3HTcZUYMcsznXqHuWkItqr9k388sAGA/TAIhH7WLzqG4MjEJg1/gq2h2whY5K3Tica
	afIpx6tZVViLRb1JDpFuInW/RcNrJ3LGT72N1JnIqHETrHvMGX6Dc1MVdki3daHn+LCydts=
X-Google-Smtp-Source: AGHT+IGPGpn615U0r/Oli0xmd+gPDn6qmrBYBvqajhJLToKFTwGprcGZAZPK+hG5gePgwhRtCLZmSw==
X-Received: by 2002:a05:6830:6216:b0:72c:3235:3b99 with SMTP id 46e09a7af769-73210b11cb2mr3068146a34.19.1746649351312;
        Wed, 07 May 2025 13:22:31 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 05/24] drm: sun4i: de2/de3: add generic blender register reference function
Date: Wed,  7 May 2025 15:19:24 -0500
Message-ID: <20250507201943.330111-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 7fe5ce20082a..43c413052a22 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -217,6 +217,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-- 
2.43.0

