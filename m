Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAD52FB2
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Jun 2021 08:22:57 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB8081FE5C;
	Fri, 25 Jun 2021 08:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1624609376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n83/+9s2T5Nzubb+gy66mf0gKEocr9OM5q295e9qPfs=;
	b=2VwZW+QuZQdKIwo/BtptHdc6LE1Uavy+PW2A8LYhbwmt3mSQv4lDVyzz0WzRVnBgyxcbHm
	NlpvlgxYT/lOW1XhW2IIfdIm3A/Sc8aRLaooBbmlNOyJSl7NA6YTO4eKnfMgdicYbAZR4i
	DO6+obZNzYEjR8UB82pUqWAS4hgdlkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1624609376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n83/+9s2T5Nzubb+gy66mf0gKEocr9OM5q295e9qPfs=;
	b=o3fQdTNLVHh5970RBO6mIFq5blkEA+2h/NDmQ/ZhmABezPVIHBQS+2d+2QRBq25g690uro
	+iiJO6QfgDJ44fAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
	by imap.suse.de (Postfix) with ESMTP id 78E2A11C9B;
	Fri, 25 Jun 2021 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1624609376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n83/+9s2T5Nzubb+gy66mf0gKEocr9OM5q295e9qPfs=;
	b=2VwZW+QuZQdKIwo/BtptHdc6LE1Uavy+PW2A8LYhbwmt3mSQv4lDVyzz0WzRVnBgyxcbHm
	NlpvlgxYT/lOW1XhW2IIfdIm3A/Sc8aRLaooBbmlNOyJSl7NA6YTO4eKnfMgdicYbAZR4i
	DO6+obZNzYEjR8UB82pUqWAS4hgdlkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1624609376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n83/+9s2T5Nzubb+gy66mf0gKEocr9OM5q295e9qPfs=;
	b=o3fQdTNLVHh5970RBO6mIFq5blkEA+2h/NDmQ/ZhmABezPVIHBQS+2d+2QRBq25g690uro
	+iiJO6QfgDJ44fAQ==
Received: from director2.suse.de ([192.168.254.72])
	by imap3-int with ESMTPSA
	id 2MCpHF+S1WAISwAALh3uQQ
	(envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	james.qian.wang@arm.com,
	liviu.dudau@arm.com,
	mihail.atanassov@arm.com,
	brian.starkey@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	inki.dae@samsung.com,
	jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzysztof.kozlowski@canonical.com,
	xinliang.liu@linaro.org,
	tiantao6@hisilicon.com,
	john.stultz@linaro.org,
	kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com,
	laurentiu.palcu@oss.nxp.com,
	l.stach@pengutronix.de,
	p.zabel@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	chunkuang.hu@kernel.org,
	matthias.bgg@gmail.com,
	bskeggs@redhat.com,
	tomba@kernel.org,
	hjc@rock-chips.com,
	heiko@sntech.de,
	yannick.fertre@foss.st.com,
	philippe.cornu@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	jyri.sarha@iki.fi,
	emma@anholt.net,
	linux-graphics-maintainer@vmware.com,
	zackr@vmware.com,
	hyun.kwon@xilinx.com,
	laurent.pinchart@ideasonboard.com,
	michal.simek@xilinx.com,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	linux@armlinux.org.uk,
	kieran.bingham+renesas@ideasonboard.com,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	hamohammed.sa@gmail.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v4 27/27] drm/zte: Don't set struct drm_device.irq_enabled
Date: Fri, 25 Jun 2021 10:22:22 +0200
Message-Id: <20210625082222.3845-28-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in zte.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/zte/zx_drm_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_drm_drv.c
index 5506336594e2..064056503ebb 100644
--- a/drivers/gpu/drm/zte/zx_drm_drv.c
+++ b/drivers/gpu/drm/zte/zx_drm_drv.c
@@ -75,12 +75,6 @@ static int zx_drm_bind(struct device *dev)
 		goto out_unbind;
 	}
 
-	/*
-	 * We will manage irq handler on our own.  In this case, irq_enabled
-	 * need to be true for using vblank core support.
-	 */
-	drm->irq_enabled = true;
-
 	drm_mode_config_reset(drm);
 	drm_kms_helper_poll_init(drm);
 
-- 
2.32.0

