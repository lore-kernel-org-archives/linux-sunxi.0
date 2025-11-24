Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F0B25F7B9
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Nov 2025 03:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763955194; cv=none; b=U5TlF1B9pj7TxwN8hg9sQ6sXeU0WXfgGTCgNFB7gfkAy87ymgfSEtXLe6I/vE0miBONupZ5UcNqo+JGgWR/n6/OrhMPbKJibnORnF+aZ8xgTognHWkNE20bmBBd/I3qk7jZg7dtncwyJZefbnxOcH9vJHS1PQhJPWtDHBmM4HgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763955194; c=relaxed/simple;
	bh=1MLhbNsl5pv53VQ/4YLTdMepQ4rhdKATMUZXuOJXmcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GT10rPG4yHKg5pNodE22IGEm54Ja35AcZYY+4YybXfbk07EnmOdTJUDSWobgc2k03l0YqUTGHGE4AZsmPD49lzPa4cvJCxu7ar9TCTHTjjZfXRQ4FB5XPLEgGKdnGkeNuz95Bdqw4CKwOZ/Q73Hz7eTAOo1eX8UnFaOjOxXOeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C/mvJ0Xw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C/mvJ0Xw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WnjebnCbyhIJCqYGfT+EMWNZgo8OAm4RZR6/CdfXmyk=; b=C/mvJ0XwsvWfbsvGYuIIzrscD0
	avq65He/rFXByzKLxCZA7BIBnJRXOLlqr+p1E1nzP3+qXcgdKDktYYwtKrIdqzOF3vKwo9cVynP0+
	mztNOwN40kijAhpmNpI2Qu67G56TPS4H2tyVqGoTIGUAi/P5qLEVujDkB7w1p2dHn25Iwlwf5RMVy
	Y6XQORdTy06z8leJ8eCPf0z6pLYNdcMdT2hmgL30rtUxkdmNY8n9ruaLU804jQj4QvcEQMWXxcIpa
	8X/HP7EU/3tNIT+cLQl+/HB8PmXzXgXYMcWYsjRZQEwhvhhDe8iPGjVh1uA/nKaXdKUpZHenUlfMs
	REms8JQg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNK2-0000000B25D-0NdQ;
	Mon, 24 Nov 2025 03:33:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
Date: Sun, 23 Nov 2025 19:33:01 -0800
Message-ID: <20251124033301.2987159-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the kernel-doc notation, add a missing struct member comment,
and add a missing "Returns:" function comment to eliminate kernel-doc
warnings:

Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
 kernel-doc format: * @mode_set
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set'
 not described in 'sunxi_engine_ops'
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
 not described in 'sunxi_engine'
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
 for return value of 'sunxi_engine_layers_init'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sunxi_engine.h |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- linux-next-20251121.orig/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ linux-next-20251121/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -114,7 +114,7 @@ struct sunxi_engine_ops {
 	void (*vblank_quirk)(struct sunxi_engine *engine);
 
 	/**
-	 * @mode_set
+	 * @mode_set:
 	 *
 	 * This callback is used to set mode related parameters
 	 * like interlacing, screen size, etc. once per mode set.
@@ -131,6 +131,7 @@ struct sunxi_engine_ops {
  * @node:	the of device node of the engine
  * @regs:	the regmap of the engine
  * @id:		the id of the engine (-1 if not used)
+ * @list:	engine list management
  */
 struct sunxi_engine {
 	const struct sunxi_engine_ops	*ops;
@@ -140,7 +141,6 @@ struct sunxi_engine {
 
 	int id;
 
-	/* Engine list management */
 	struct list_head		list;
 };
 
@@ -163,6 +163,9 @@ sunxi_engine_commit(struct sunxi_engine
  * sunxi_engine_layers_init() - Create planes (layers) for the engine
  * @drm:	pointer to the drm_device for which planes will be created
  * @engine:	pointer to the engine
+ *
+ * Returns: The array of struct drm_plane backing the layers, or an
+ *		error pointer on failure.
  */
 static inline struct drm_plane **
 sunxi_engine_layers_init(struct drm_device *drm, struct sunxi_engine *engine)
