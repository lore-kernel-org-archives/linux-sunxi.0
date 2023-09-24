Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B3FD29E
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:26:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-99357737980so620130766b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583573; x=1696188373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mum4j91XFiU8Xtc7TFcTf1fNSOJNvZg3YC6vHA1cwnU=;
        b=mTsEodrryWIjWWYkzHtHeoJ+Ar8dA1OZPlByRfTiHHL2gkO/3+GiE4Y9vgEWdSHvT1
         Y51dyrMuRza6Q07eJqJ0o0RBWsylTBlyGdt6sBzqn59UrM8VLqBQ/oCsSEhd8JlKYSat
         W2g/cwUwpUmfAtynNzLz9qQ41vFGPorTkQ0n7P12yoVa8emjF8ZFftPm4LFeGksBNkCL
         ehNMvlvW3l/4stNWB8vyFcePnHyznMvxNGqgQkWeTLstYZja4OWaxmvT6iHmhR2QC7Ch
         jxvXwm/Y8CQTDNWHK4Ky3LKRwR8/kpChxEm5XNwYkJORk6PJX+hNzklI8Kc+9V1EJVCO
         9J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583573; x=1696188373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mum4j91XFiU8Xtc7TFcTf1fNSOJNvZg3YC6vHA1cwnU=;
        b=smsuYZFMozpk/nXl5l8twJFbHIrK7gG3GJuk2ToxnlppLXYEtDnkkRJD0MuAzm+7tu
         QkmA4Mawf+SKXlsehMZtdYNt5Ma433w9J7pI0Vg6Y7FWtJ+2ekImkTMc1/lPKq+w2785
         ujVfIejM8UWaYb+18oD+2D/b3m9lhXASAmXYoIy7d/PYc+JKFltdav1XQxlUOHaHt0pP
         KYqA30QcqbcU3cqfwNEqybNX3sTF2WzZzt2VkwMD8coySXKxSVgnNcSlbwiEm8/yAsTI
         TwBEyQKNU90OfwP2mS3HcnFOI5LSi16kJdYpavGWKGdG1s1PD+yeUcqubKfZBkQsPMrV
         OGJw==
X-Gm-Message-State: AOJu0YxByyIN+keZ8Sd1Pvet5Qy09Pw5ujGQmoOc1wzuX8KnO0hvEdsL
	mAK7kJ5JWqXmsQkruxD/RPM=
X-Google-Smtp-Source: AGHT+IHXITx2ykaLrpQKUUcUVgZplQwvgEedTJsw9ydWxvo2fANUWEHTFIz/szbg85S67tayV/onBg==
X-Received: by 2002:a17:906:31ce:b0:9ae:6ffd:be12 with SMTP id f14-20020a17090631ce00b009ae6ffdbe12mr4738928ejf.76.1695583572612;
        Sun, 24 Sep 2023 12:26:12 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:26:12 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@gmail.com,
	daniel@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/7] drm/sun4i: dw-hdmi: Fix initialization & refactor
Date: Sun, 24 Sep 2023 21:25:57 +0200
Message-ID: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Main goal of this series is to fix race condition between probing display
connector driver and sun8i dw-hdmi platform driver. Sometimes, boards have
ddc-en gpio specified in DT file. This is handled by display connector
driver since commit 920169041baa ("drm/sun4i: dw-hdmi: Fix ddc-en GPIO
consumer conflict"). However, because there is no link between it and
sun8i dw-hdmi driver, probe order isn't determined. If display connector
driver if probed afterwards, then sun8i dw-hdmi driver won't be able to
read EDID and thus fall back to 1024x768. This can be easily solved by
using bridges and linking them together. Coincidentally, switching to
bridge model is also long term goal.

I found out some other issues when working on them (missing phy deinit and
memory corruption during executing fail path). Since there is now a bigger
chance of deferring probe, it's also good to skip reporting deferred probe
as error. This often confuses users when examining dmesg output, especially
if there is no error code reported.

I also throw 2 refactoring patches for a good measure.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (7):
  drm/sun4i: dw-hdmi: Deinit PHY in fail path
  drm/sun4i: dw-hdmi: Remove double encoder cleanup
  drm/sun4i: dw-hdmi: Switch to bridge functions
  drm/sun4i: Don't show error for deferred probes.
  drm/sun4i: dw-hdmi: Split driver registration
  drm/sun4i: dw-hdmi: Make sun8i_hdmi_phy_get() more intuitive
  drm/sun4i: dw-hdmi: check for phy device first

 drivers/gpu/drm/sun4i/sun4i_drv.c      |   3 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 191 ++++++++++++++++++-------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |   9 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c |  13 +-
 4 files changed, 151 insertions(+), 65 deletions(-)

-- 
2.42.0

