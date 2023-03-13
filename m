Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2829AD
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 15:51:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE9EB1FE11;
	Mon, 13 Mar 2023 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678722701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9tHsUCjDPd9jdHngzUELtdqEbSwTIzTBRxnWmIHxWw=;
	b=UreD8Unlia8qIMxdWmYBTFaa3Zz8grpRPcQdwhBJvgGxZSi7bzYN+0gpDand7/ZKYg+exG
	sla+hhLDi+n0AQzAUFNxjwHlTksYnunHDKVw8iEyYAGnqYcW++h4Hwpq5UVB6aBT6AnJUL
	KvGOBHNyn9zbNro9GSOtx8GHW+3rPBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678722701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9tHsUCjDPd9jdHngzUELtdqEbSwTIzTBRxnWmIHxWw=;
	b=qh7ijtEgqVs+Gu9y6TurdRp9FqbGvCtzZzuPM18sflo4YES1dyMQBETS6yvMabNWHV50nH
	R5LqXpjWF/94hpBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F9FC13517;
	Mon, 13 Mar 2023 15:51:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mKtIHo1GD2RhegAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:41 +0000
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
Subject: [PATCH v2 06/25] drm/fsl-dcu: Use GEM DMA fbdev emulation
Date: Mon, 13 Mar 2023 16:51:19 +0100
Message-Id: <20230313155138.20584-7-tzimmermann@suse.de>
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 8579c7629f5e..c09ba019ba5e 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -20,7 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
@@ -333,7 +333,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto put;
 
-	drm_fbdev_generic_setup(drm, legacyfb_depth);
+	drm_fbdev_dma_setup(drm, legacyfb_depth);
 
 	return 0;
 
-- 
2.39.2

