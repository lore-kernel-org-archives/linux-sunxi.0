Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D40D1CC164
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Aug 2024 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340937; cv=none; b=Zy0FB8fZ8lObCE5QKKFPcOiev21ahbuq3ipn3GWddf+8KNoD6Gm3bbMPdSOxes7Aevj63o0hO8CpWk5qrKwUTzPLOUpiTOcZmsJ159WdpfPy9cpFcleB6WqAGwRAIJAl7B8LlPgIZBx2WFucL+S5OPuO7pT0jKhH8HUCTuKb9m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340937; c=relaxed/simple;
	bh=g4UzTpjAkmH1/8Mi3biEb/L7TovlNwHywY7DzG7f2wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsKzQeBQ5nHIIcfT2knRovAo+AX03Wyo/OaypgG3GlmPaZyPESvUCKEsSu23tv/+dfIh5wMWrl/MAqN/Qsr73Cbk4jFed+GKd4AhkcI15TUifOUHYdX1FzUNAhKVIsCH426PRIlg1LIaPVEARQCCVupL2JQ4CA9JlEf+57oSrCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CMu3/vJC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CMu3/vJC"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E79FBB2A;
	Thu, 22 Aug 2024 17:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724340870;
	bh=g4UzTpjAkmH1/8Mi3biEb/L7TovlNwHywY7DzG7f2wA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CMu3/vJCap9NxISUHX76T7sb86mhw9cppcfHGK4Kfq3oCcT0Fs5ZKqxmg+xNrlYNp
	 7h3kpp95yRA6UbDdsKkLakgRMU+jp7xtXuHZ787PFTq3nACMjIznAWabsQRJxwYntl
	 5WrufxQtDSIySkDEmv1+0/1x6XCbe3fA938Z75N4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2 2/7] media: sun4i_csi: Implement link validate for sun4i_csi subdev
Date: Thu, 22 Aug 2024 18:35:22 +0300
Message-ID: <20240822153527.25320-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240822153527.25320-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240822153527.25320-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun4i_csi driver doesn't implement link validation for the subdev it
registers, leaving the link between the subdev and its source
unvalidated. Fix it, using the v4l2_subdev_link_validate() helper.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index 097a3a08ef7d..dbb26c7b2f8d 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -39,6 +39,10 @@ static const struct media_entity_operations sun4i_csi_video_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static const struct media_entity_operations sun4i_csi_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int sun4i_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *subdev,
 				  struct v4l2_async_connection *asd)
@@ -214,6 +218,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	subdev->internal_ops = &sun4i_csi_subdev_internal_ops;
 	subdev->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &sun4i_csi_subdev_entity_ops;
 	subdev->owner = THIS_MODULE;
 	snprintf(subdev->name, sizeof(subdev->name), "sun4i-csi-0");
 	v4l2_set_subdevdata(subdev, csi);
-- 
Regards,

Laurent Pinchart

