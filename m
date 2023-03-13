Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657292CA4
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 15:51:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF97A1FE1E;
	Mon, 13 Mar 2023 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678722705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVPD3hmO7oBhoUD8QW0KwzqOFpqLgHoEibuscV/kT6Y=;
	b=lUaP6DoJE3QYOVpVUjA/uuZ3KhbXwT0vffOZLpK3gHMvdGuGuyZ98ifj43GFz+tkqmKmc9
	GN1BUduz9KUso0n++u1MTJqvYoiw0LTM5SmaO2bFX4dwLEgpYSVEDGGP6Y/H+7A0cTK0nO
	OoVPnMxQK7A3DELvOcXA1DEvmkJEmMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678722705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVPD3hmO7oBhoUD8QW0KwzqOFpqLgHoEibuscV/kT6Y=;
	b=FcIUu7F5RTx4gTbDF9bZviIfY2WWQvmh8yF9kIVIFiePQbGzRovpb4iOnBXMB35W7b+l2P
	WSfk20VeViZp9dAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80214139F9;
	Mon, 13 Mar 2023 15:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eMdgHpFGD2RhegAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linus.walleij@linaro.org
Cc: linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 21/25] drm/vc4: Use GEM DMA fbdev emulation
Date: Mon, 13 Mar 2023 16:51:34 +0100
Message-Id: <20230313155138.20584-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
References: <20230313155138.20584-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the fbdev emulation that is optimized for DMA helpers. Avoids
possible shadow buffering and makes the code simpler.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 0ccaee57fe9a..c8bf954042e0 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -33,7 +33,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_vblank.h>
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
@@ -387,7 +387,7 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto unbind_all;
 
-	drm_fbdev_generic_setup(drm, 16);
+	drm_fbdev_dma_setup(drm, 16);
 
 	return 0;
 
-- 
2.39.2

