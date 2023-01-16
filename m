Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585892586
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 13:12:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCF8A67842;
	Mon, 16 Jan 2023 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673874762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMWrrVURFOdZlPDrSQjPvTy4WvSl6jIkUYePEf/jIB0=;
	b=UxVaOrSFyjouFhmAZS5h/SHqg6/IBoomW+s8b5fEhWFAWA1efS1iNCNo9MTfiOdWSRlfH4
	IuwBsCDFgJiJ3QDWRnvZ4uqKadiBVb9NSDFX89/jMiBC7vXyL0fVdOsB1TOWOp7He7ew7Z
	o243vwFfHr16dc7/p++LjWOTeZ/30Mg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673874762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMWrrVURFOdZlPDrSQjPvTy4WvSl6jIkUYePEf/jIB0=;
	b=Vv7gBxVnrO8Kq1tEjCJb2E8h180KuG7452sbf68LEcxGEP4e0TzBeSUTEQiPViQc+qF6gF
	CIhea/utyyyqTxBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F227138FA;
	Mon, 16 Jan 2023 13:12:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aNMZHkpNxWNrNQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 13:12:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org,
	daniel@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 18/22] drm/sun4i: Remove unnecessary include statements for drm_crtc_helper.h
Date: Mon, 16 Jan 2023 14:12:31 +0100
Message-Id: <20230116131235.18917-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116131235.18917-1-tzimmermann@suse.de>
References: <20230116131235.18917-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several source files include drm_crtc_helper.h without needing it or
only to get its transitive include statements; leading to unnecessary
compile-time dependencies.

Directly include required headers and drop drm_crtc_helper.h where
possible.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 477cb6985b4d..37dc66332bbd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -8,8 +8,8 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "sun8i_dw_hdmi.h"
-- 
2.39.0

