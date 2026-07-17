Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB0F400987
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297030; cv=none; b=mmR6CxIhnyDTt8iU9E3AVWlZ1r8md1UECBgqBEHFqJAj1qWDjB2n+XNhqmsmGYPIyMLplx+5WYtMxRZdTLd91XBrSLY/8BkJMcld2I+dlwmHK6qKDbIoSfknsCslNOY/BaLhdDOS9zr1JWGVj058wZkvcKrbAInI55v1a2AFU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297030; c=relaxed/simple;
	bh=ex8HZdHS1q/bkU1HItgMEr14uQTiGY8DQ0yP+8KWPg4=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=XMZWFpsIPPVKx5nv05ll/cODy0phW5TN6ONbMpY+CCQEE1wWD5Ha4MCpQeWoJxOsK8baefmiXKQSx8W01vGAKwS98ylJoivPaj4m/OkLPRh5hcQYWa/+8lbhq63HCvXHf/h4LRNWgrfyVLh86xaYLCJ/H4Zll/0vNBzjSmzssTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iU0VwbYs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iU0VwbYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784297028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SaIYeA/Jygw7ChE2lz/n+i9CMUk9dImhyfQVRWidUS0=;
	b=iU0VwbYsJq4w9lQK0dsqu+D3puTglLczQ1a5XBJ7Thgbx2Ga0aQi+1/mPLFt5jx/0mpYdH
	2YriL8GPKC5Jb/h8z5iWs6lkCkBnxJ56e5JiVl9v0AhIoIjFmui5PZY6lkPOUZSrqGMhHM
	p1/eDEQPb85x+JoTIWloT7Itzfs3Uqk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-6LE9oJsXOzKaae6rZxynlg-1; Fri,
 17 Jul 2026 10:03:46 -0400
X-MC-Unique: 6LE9oJsXOzKaae6rZxynlg-1
X-Mimecast-MFC-AGG-ID: 6LE9oJsXOzKaae6rZxynlg_1784297018
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACD101945CB2;
	Fri, 17 Jul 2026 14:03:37 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5682B18005B3;
	Fri, 17 Jul 2026 14:03:24 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 17 Jul 2026 16:02:07 +0200
Subject: [PATCH v3 4/4] drm/panel: find_panel_by_fwnode() return a counted
 reference
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260717-drm_refcount_wiring-v3-4-023900c32e01@redhat.com>
References: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
In-Reply-To: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Jingoo Han <jingoohan1@gmail.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Alison Wang <alison.wang@nxp.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784296938; l=2362;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=ex8HZdHS1q/bkU1HItgMEr14uQTiGY8DQ0yP+8KWPg4=;
 b=Wcce0+dlDbxIuiF5oRxS8RYLj+33umEtxbC6TZM1cuTwUBliy7161daQ/+tCXoUYL4W3a37d/
 0s6+jw8bH9ICEbkzQuS6NDHRpePGlnBJV0pWJFJJycLYHlBwtjWs2V+
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VSHXH3-W85D0hzDpeJuyUZwc-6HMdm6z3qQiJqbr5_c_1784297018
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

find_panel_by_fwnode() is the fwnode-based counterpart to
of_drm_find_panel(), used internally by drm_panel_add_follower().
Like of_drm_find_panel(), it returned an unrefcounted pointer,
leaving a window where the panel could be freed between the lookup
and first use.

drm_panel_add_follower() worked around the missing panel kref by
calling get_device() on the panel's underlying struct device.
However, get_device() only prevents the device kobject from being freed.
It does not prevent the panel's kzalloc()'d container memory from being
released when the kref reaches zero.

Apply the same fix: call drm_panel_get() under panel_lock before
returning. Since find_panel_by_fwnode() now transfers a counted
reference to drm_panel_add_follower(), drm_panel_remove_follower()
must balance it with a matching drm_panel_put().

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 72cf86253c0cd..a00ae98ed0956 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -542,7 +542,13 @@ int of_drm_get_panel_orientation(const struct device_node *np,
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
-/* Find panel by fwnode. This should be identical to of_drm_find_panel(). */
+/*
+ * Find panel by fwnode, returning a counted reference.
+ *
+ * Behaves identically to of_drm_find_panel(). On success the returned
+ * pointer has been passed through drm_panel_get(); the caller must call
+ * drm_panel_put() when done with it.
+ */
 static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle *fwnode)
 {
 	struct drm_panel *panel;
@@ -554,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle *fwnode
 
 	list_for_each_entry(panel, &panel_list, list) {
 		if (dev_fwnode(panel->dev) == fwnode) {
+			drm_panel_get(panel);
 			mutex_unlock(&panel_lock);
 			return panel;
 		}
@@ -690,6 +697,7 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
 	mutex_unlock(&panel->follower_lock);
 
 	put_device(panel->dev);
+	drm_panel_put(panel);
 }
 EXPORT_SYMBOL(drm_panel_remove_follower);
 

-- 
2.55.0

