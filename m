Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AACA186600
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Aug 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676079; cv=none; b=L9DZXliS2c9LndeYpohDLTD08claBownDzFNk7XJSfut8a3P2qVdbQWsVvFoKxwR7YYUdXL1dILIVFiXSNkt1t9KB/LHY+Ug4RhYSTuJ7F06VTc+y2TjY/used7XrVocnTnNZ0bmeod0tsO1lcFWd2StN4Yuw3/37WOmGomWPYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676079; c=relaxed/simple;
	bh=tf0gc+Fe9/W9nbNtwdjzHM9gsYlIcyofSdubnqTEUoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXW4KzKTODpGAIW1kZanoi4b75iIbzaT00lHsv1d167i1ECt6HSnLygkfcrnjoOWWHcC1H85FA8HyGJ7o3mFhoipicTjhzmrt9Mc8ULyBtMc+qRVqt+JK0aR1zuZS7WD1ahwNkNg2mEOdwAxy9SACnt6ZPKq0DGfqZFeRAlkgRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cb2PW3I4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cb2PW3I4"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E058A8F;
	Mon, 26 Aug 2024 14:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724676010;
	bh=tf0gc+Fe9/W9nbNtwdjzHM9gsYlIcyofSdubnqTEUoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cb2PW3I4Hy4uVS5oXuJOP4NG0db2CPbZKoXMXxjLLPLD0Yehvn+YpFHkRG/j9YUr8
	 TywusXbvI0FS/ed1upfdHbKZ9BbH0vesI+nVO4KssWuYD4cIeAe5KkguG0TCE58bWL
	 SCoTBxV3CjwZUHYhPeUPMUNSeG6i4CqIOycQqE+g=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 4/7] media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
Date: Mon, 26 Aug 2024 15:41:03 +0300
Message-ID: <20240826124106.3823-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() function prints a one-time warning if it
gets called on a link whose source or sink is not a subdev. As links get
validated in the context of their sink, a call to the helper when the
link's sink is not a subdev indicates that the driver has set its
.link_validate() handler to v4l2_subdev_link_validate() on a non-subdev
entity, which is a clear driver bug. On the other hand, the link's
source not being a subdev indicates that the helper is used for a subdev
connected to a video output device, which is a lesser issue, if only
because this is currently common practice.

There are no drivers left in the kernel that use
v4l2_subdev_link_validate() in a context where it may get called on a
non-subdev sink. Replace the pr_warn_once() with a WARN_ON_ONCE() in
this case to make sure that new offenders won't be introduced.

A subsequent change will improve the v4l2_subdev_link_validate() helper
to properly support validating video device to subdev links.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Extend commit message with third paragraph

Changes since v1:

- Switch from WARN_ON() to WARN_ON_ONCE()
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7c5812d55315..d3196042d5c5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1443,11 +1443,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	bool states_locked;
 	int ret;
 
-	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
-	    !is_media_entity_v4l2_subdev(link->source->entity)) {
-		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
-			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
-			     "sink" : "source",
+	/*
+	 * Links are validated in the context of the sink entity. Usage of this
+	 * helper on a sink that is not a subdev is a clear driver bug.
+	 */
+	if (WARN_ON_ONCE(!is_media_entity_v4l2_subdev(link->sink->entity)))
+		return -EINVAL;
+
+	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
+		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
 			     link->source->entity->name, link->source->index,
 			     link->sink->entity->name, link->sink->index);
 		return 0;
-- 
Regards,

Laurent Pinchart

