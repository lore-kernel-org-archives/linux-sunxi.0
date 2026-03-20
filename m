Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A217E3D9043;
	Fri, 20 Mar 2026 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024098; cv=none; b=e7pntfHD2lloZB3asqKUTSz09gq2UQxLw8ffVa7+GYhQV0V5KPgP6rG6EgXw2IfDfa5LSn0DERxNOUv6hbk3hZfx6Br6InGHcgNGadi0FsizvcwYqcuOjTl3X+RrRcRfrjwfjx4bFS0uNqJBoa6/ebvyAT6xbFbqQ6C24wmYT2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024098; c=relaxed/simple;
	bh=tuuR1AzJjOp1SuGTOCMRWi7kE/ZiZUxh7g3mvF/HamY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgLSdA/6X16f/ifuH520gE8SoYLEVMduW4ESxxAkhfBdgoVovBKutsjCes7RO3jw+iQlHgahi/3ZcVacbotKikeH5J7kW0txruy++KVhKRSxm/GYwdCCOFCqT1/M+kNi1LO6nCd2/kcL+FxzPaoN4zaijyKB0TcAH8Mw1RybCjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCLKLO+5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCLKLO+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91BBC19425;
	Fri, 20 Mar 2026 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024098;
	bh=tuuR1AzJjOp1SuGTOCMRWi7kE/ZiZUxh7g3mvF/HamY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MCLKLO+5JRMtthUUxX+LLOSibil4YOX8Gv7lpNaLq4DgDaEygrusLceagJSD54nkN
	 g6zsCsJEZdP/5yddh/ZbI3dNeP45RlsEVSpX/+8JLECVHgjpL9L7vlW8g0dAUec1Tw
	 0jTF+FdKIBqbiS5be/IPiI+W8cYSf5b5hvnZ4zy8cWl5/xuo/k7GrHi3mmGD3C5RL3
	 9s/LXz5EnE3zarZ13/HdB9SaJ7Bt5hgZZEoLFtAFAbzrgsrd+s29boJr27A1OrhMGU
	 kNF9b56G5d/1rtEtWWdpmdMHBYLTHdDqq0+xdhfau6SyAdLdP11EZxmO73VXZl80Qm
	 vYcZ8kX/sQXPw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:25 +0100
Subject: [PATCH v2 18/20] drm/tidss: Drop call to drm_mode_config_reset at
 probe time
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-18-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tuuR1AzJjOp1SuGTOCMRWi7kE/ZiZUxh7g3mvF/HamY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S7P/m860DJO9uoVtv7vhf7e+J62aT59vOy+Z+ONZ+
 Qarv3+2dkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ9Jgw1le7sQVl7Hsr9V5M
 aW1aWaHKuc3p21emz+nZ+2zbfFP9moiyBQnLF/ql6B79t8fTbYZtL2MNlwHruW/fUk/eiJDrLvj
 GkXdWRawpVuqDwDHmSEHTVXb/Gl5s82ibYK5otK21ZHnFri4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have drm_mode_config_create_state() to create the initial
state called as part of drm_dev_register(), we don't need to call
drm_mode_config_reset() during the driver probe.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 2 --
 drivers/gpu/drm/tidss/tidss_kms.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c3ea3c50368b9f55ab02a0a02fc77..ddd9f428c2a96557ee02040320cbe5f6f0fd6052 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -169,12 +169,10 @@ static int tidss_probe(struct platform_device *pdev)
 		goto err_runtime_suspend;
 	}
 
 	drm_kms_helper_poll_init(ddev);
 
-	drm_mode_config_reset(ddev);
-
 	ret = drm_dev_register(ddev, 0);
 	if (ret) {
 		dev_err(dev, "failed to register DRM device\n");
 		goto err_irq_uninstall;
 	}
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 8bb93194e5ac686050c47f986b8cb6063eae22d3..b4779c09a1bfa5be7010bcd7d4f1379362996d2e 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -285,11 +285,9 @@ int tidss_modeset_init(struct tidss_device *tidss)
 
 	ret = drm_vblank_init(ddev, tidss->num_crtcs);
 	if (ret)
 		return ret;
 
-	drm_mode_config_reset(ddev);
-
 	dev_dbg(tidss->dev, "%s done\n", __func__);
 
 	return 0;
 }

-- 
2.53.0

