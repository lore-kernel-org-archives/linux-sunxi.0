Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C5134B5
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Nov 2023 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDxMflMd"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so3793527f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Nov 2023 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516788; x=1701121588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=;
        b=DDxMflMdexLd7ibZX5HR8laZS4RWeLNuRxXZILVpzma9kRw2AOEH7AVscvIC32dTTY
         3xnNZjNNwXrRHoNGTfmGIzkFBdEVUvc9JUbyr0aAm56J9je2P0wh5Mw/ShW1r9TTOtWA
         /hGvJ3eLfcKT6ajy7uu057VpP3JUjRLrWbScsqm7RxoyEYaK17gPxw4GJ3lgv3afn+83
         +0dt2qyAwo3mcX2lC20EuVB1cyH3auDH51siI9Uv3mQJuYKQYe4NDL2v4d71nr+tj+0/
         fZi0sd1X3ZNCqYL7w6w9bOx/f3VvhY6VSbll2fP0XuI/N6eunEpWLhBS3pE/9WgO/ZH7
         lqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516788; x=1701121588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=;
        b=N0rmUJ1K/uEYVm/ezshDQ5ngsgByro6kRAXeNOrFmmXLhB5Vc403E0AYEpFBLym+qg
         VHQbKcAA/NhaCed/OsoJVW28hkKVYBYXNxopTc9PXzET/oM5wAlCPvLA9lryHJ2CKsO6
         +G2BfCoM22XSZMlY25QPDTSZnkkm7H4m39e+5zjH2Y9J7KGpsGUkBU0kFGw4ZJx18qBY
         7QJNkGK7/tQwozqy+yd/vouoHmj8wW+17ZQOr1V39qo/M079UGZjp4SuK188fCMYZF/C
         z609omaVqO7ICJWa7g6CWtuaKVEEWusTOv9EA3CWa6Mh/i5r2/0aFDvzBNHbrgE3IZUK
         gDoA==
X-Gm-Message-State: AOJu0YyYbTMZ5UZlDfSOBr/krp09l3S8BBRrdFKK6itZs8X1MZGi/hRJ
	7qGHZvnsFYTvsXYz6XherFI=
X-Google-Smtp-Source: AGHT+IHp3LoF2DOrCwbBP5ZAP28MyKKAznq0CT/uy4NViD6EoST7Z+71CXBfeYQKBX9yVV00pAiniQ==
X-Received: by 2002:adf:e9cb:0:b0:32d:9d3a:d8c0 with SMTP id l11-20020adfe9cb000000b0032d9d3ad8c0mr5215561wrn.60.1700516787764;
        Mon, 20 Nov 2023 13:46:27 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:27 -0800 (PST)
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
Subject: [PATCH v4 00/20] remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:03 +0100
Message-ID: <20231120214624.9378-1-hkallweit1@gmail.com>
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

v2:
- change tag in commit subject of patch 03
- add ack tags
v3:
- fix a compile error in patch 5
v4:
- more ack and review tags

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
