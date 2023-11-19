Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5E6105
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Nov 2023 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf8hf0/w"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5431614d90eso4857598a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Nov 2023 02:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388890; x=1700993690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=;
        b=Zf8hf0/wp4O12qmWWh4X2w15sW5jF5WITEyZy/PXDZsxqbVe1Dort0NhvUq9qyG84S
         0c5GDzS8Yh8UW5EaQJYswMX5u5+MTcD9X2FD/+TcrcL7ifKwdHcf+H67ksLGt4NNSqv0
         EX57jpqtjxyqQIQXM3LV8YmoJ3UF0ZRFvz7AcpK/fobgJgueYZs79MxD7j44WIuLe7qh
         reUlzoHNbJLY/QUa+9ncGAPvxg1dtRcDFsTgb6PkL1GOqUSlqyutUdG8N5CZcGAIJulE
         O5exhf7Ua+25Xph9gVkMfitt6YK6SE/UsioLgaDDfibfFtYj3LuzFxeJmneKXybkAnyx
         mNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388890; x=1700993690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=;
        b=FZJr5mwJ9T/1A5aXYPv/jWeIV0awzL2CkztJec3pJlCyShxfjHMUEG0vZn/Yj5wwhs
         uPG6oy79rKI2ObBtaSRvHDPdupLhS/uplDTPv2nfP/9Fe2nixm6+1R84T11TY0/UczM1
         9ncunLA5EXatdI7cl9+Rvwc//fT/siV8ZQODLTIXb54sX/jocRw162btGoXKC7cppul1
         QD9ZvQJNB2/gqKvEcfb073hxfCDrwqwnsNDeHNuALCmBd1YpmYkJF3Ku9pmQMXYdMk+I
         8lAH/YO+zTLhmTAPQtzdPvk5TDoiUaIK3WvIJE3I1yEgBTRjmrRzSBMzOLsPrgNieSkt
         VMzw==
X-Gm-Message-State: AOJu0YzyJ3wt0Q52NO92m1uBtSZzi6NGxI3trY9v2M/P7VdxcTHv8r4X
	hR/15EFL2rLyBFHx21WAoAA=
X-Google-Smtp-Source: AGHT+IHOF+5hNhpCmZw786pHF3YEeb1uoXP2y9dXXmqI2pn0mNpGlk9gn3AwL3Ck7UOdLXgeibJ+dg==
X-Received: by 2002:a17:906:ae51:b0:9bf:63b2:b6e2 with SMTP id lf17-20020a170906ae5100b009bf63b2b6e2mr3041311ejb.26.1700388889532;
        Sun, 19 Nov 2023 02:14:49 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:49 -0800 (PST)
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
Subject: [PATCH 00/20] remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:25 +0100
Message-ID: <20231119101445.4737-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
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
