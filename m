Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9FA20DD9
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Nov 2023 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5aFoAO4"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a02ba1f500fso90820366b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Nov 2023 01:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732445; x=1701337245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NrHROUSPlT4bN2lnsfzxw2GPuZ9Bx12dzaePQbmqgMk=;
        b=g5aFoAO4JOT8ylmnb8x4oaolSRKra4CHtSifaToBX9oMNpXrdBGvHoYoHKDZgP/oQF
         Q982tEGUeOGybQjGxl/KTy+0UA75DPpkkgyYqPkBE5xRetC8MPRbk0956Y8BHaXoVOg3
         NkTqQ+rRMXXY52PqhnNsi3rcSCgevnJAZodc5ZD/U8sq0HqlpWeGPtvOczBPHPSpRTkw
         xFc5ipeFsGUljtzBAYpOgtbN59tGmwMQJ+ElF9HHWOzwxfHlUGVKPSaGvzKAF+7SjCtL
         VVFPJAg6KZPRyj8JFprF9yRWEBkDLTc0cxuM70xobNf3vmsAH/x39r/iSMx/S7TcSBtO
         PnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732445; x=1701337245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrHROUSPlT4bN2lnsfzxw2GPuZ9Bx12dzaePQbmqgMk=;
        b=TVBFXdUq53ogTTyvCrpS1ELLHopPyg48aoQB5V+FbGOU64eLphM4y928xmN7Bgt2HA
         u4k7xWSZULBLFweffS5nF+wW8VaXu1NU2q4W2isX0o/4Oi4vPS7VpdiEXYrNOQqa0ysg
         ZTGPacXn7iYuAN3d1daQRlSQIFgD82IgiNvNSGIk8vnuUyL9piIADilvIfN+OsVdx8YV
         hlxagXcfF7LD9DKZr6gqfgLiaF2ck411lolx7U7HDYK5yzdENVvG5y8fTDMWMqYFNUjo
         jpbBBWEgazutGJufBIKmeoEUvF2Q18uL7G9LmJ6Mye77vQvOixooxCvmY9hrtNzCxTwY
         PxhA==
X-Gm-Message-State: AOJu0Yx/fS249z0gkWOGSkHKu/0J0dQKvdYk1O9J2HWET7XtBv9RlkbH
	Iprg3fGkYQofJaxjCG2jLTM=
X-Google-Smtp-Source: AGHT+IH3UA4nrdAqScERrRmQjf0/m1eRztQQIu3xcCY1PXQ8GvVHymqtee93zJ05NL2jqGs5ig2nmA==
X-Received: by 2002:a17:906:290:b0:a01:b9bd:878 with SMTP id 16-20020a170906029000b00a01b9bd0878mr3573689ejf.14.1700732444513;
        Thu, 23 Nov 2023 01:40:44 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:44 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	intel-gfx@lists.freedesktop.org
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: [PATCH v5 00/20] remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:20 +0100
Message-ID: <20231123094040.592-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

v2:
- change tag in commit subject of patch 03
- add ack tags
v3:
- fix a compile error in patch 5
v4:
- more ack and review tags
v5:
- more acks

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---

 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c           |    1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
 drivers/gpu/drm/ast/ast_i2c.c                     |    1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         |    1 -
 drivers/gpu/drm/display/drm_dp_helper.c           |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c     |    1 -
 drivers/gpu/drm/gma500/cdv_intel_dp.c             |    1 -
 drivers/gpu/drm/gma500/intel_gmbus.c              |    1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c        |    1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c           |    1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |    1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c        |    1 -
 drivers/gpu/drm/i915/display/intel_sdvo.c         |    1 -
 drivers/gpu/drm/loongson/lsdc_i2c.c               |    1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c           |    1 -
 drivers/gpu/drm/mgag200/mgag200_i2c.c             |    1 -
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c               |    1 -
 drivers/gpu/drm/radeon/radeon_i2c.c               |    1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c              |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c            |    1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c            |    1 -
 drivers/video/fbdev/core/fb_ddc.c                 |    1 -
 drivers/video/fbdev/cyber2000fb.c                 |    1 -
 drivers/video/fbdev/i740fb.c                      |    1 -
 drivers/video/fbdev/intelfb/intelfb_i2c.c         |   15 +++++----------
 drivers/video/fbdev/matrox/i2c-matroxfb.c         |   12 ++++--------
 drivers/video/fbdev/s3fb.c                        |    1 -
 drivers/video/fbdev/tdfxfb.c                      |    1 -
 drivers/video/fbdev/tridentfb.c                   |    1 -
 drivers/video/fbdev/via/via_i2c.c                 |    1 -
 include/linux/i2c.h                               |    1 -
 31 files changed, 9 insertions(+), 47 deletions(-)
