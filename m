Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F823064A0
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Feb 2026 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771538128; cv=none; b=Eme6hAB/784vBzrfUfp0fiHUwGoyoUA9lmkeYlqzI0wisxbk5g0nRFoKHpQGlUAuKPNJSQotdNxYH7jyHmsWS33rN1OoLP4ZTKSnNFwwovIAqgBZsLRXaPfEbxLqHbGtawfQ7ugYGfXk+Ndtjj1VgFDMTydFPUv5I6pvtVCKAvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771538128; c=relaxed/simple;
	bh=j+b7fUTEUl0rVc4PrgEmTYHal7hJnoJDVNQM2t/DnkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X3k+QJDqoITUsMy3kI0F8sfcDnLpafNdPRxyqv1BxfO3LKqIKH3q9QFIG730UVzdtMnqhD61q+pRdTK8y8MHJWGSQSy0+F4oK1o2dVREV0MSyVyWO7lDJFH1sx/c937iooggEHnG2j8oMaKdDtOs8tA0PZpUHySOmqcZiA5xI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cGOtijqP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cGOtijqP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=rb4auJXP+QCfWH3ANOoL4dRGEJWizRw0Mek7tVIJigs=; b=cGOtijqPVvk4MGrc3q6In+PkJh
	yPxqu0lANZ3FSi1TEx2QUNkRTRcqBc20tD+9e1XHFW7lEsFu41qyJYIWm/srEhhR707kavg2KZTmL
	ukfHxtaXvq8ZAe8JhuBfuFeQtETa7UgCABZhwPsmwmU0mYsgcZjBvbRUziAXKPwez+/aYJ6eZpZ67
	1Bc1+OJ20E/tEbytZ97yYv6qJPbtVCfZ9JLSQZlfCvkGyhYPw9oZm+zYcX3aG6QmvbCs+SnrYOUQH
	hqKvlRP7gmPtNc15g9r4nv6ln0ASN7H8FBnKMW/5uzm/GFsaFnWUxJDnUvVkU+RXWsB1l+cwPjx87
	atyokbUg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBzZ-0000000C7Bz-0Is4;
	Thu, 19 Feb 2026 21:55:25 +0000
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
Subject: [PATCH v2] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
Date: Thu, 19 Feb 2026 13:55:24 -0800
Message-ID: <20260219215524.468142-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
v2: add Reviewed-by & resend

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

--- linux-next-20260218.orig/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ linux-next-20260218/drivers/gpu/drm/sun4i/sunxi_engine.h
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
