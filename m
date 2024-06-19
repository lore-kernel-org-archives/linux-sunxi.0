Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA1F11CA9
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760274; cv=none; b=QlZIfnhWC0Q0Usut1uOZVhWOr/0IEAsZk/O5GbUswGwRQvcGTO1pHWIy9uTD4q6VyDabOGvUYbn4mO1G6A1PWx7fV3cFPoNR704ENPSL6Nrtdanv0/QheE6SFm4yBK7vUxV6uzpEd0UVgithzfFXut29Jqkt59EwdQM6O9+PFzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760274; c=relaxed/simple;
	bh=fhKbz6+wr6roy/hhRss/GWu3sliCltbVi4WtlztKcVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unz9L8iZrAvxCn8SyDlrawMklKRkux8h0ODTJt43RXR6zvA1vt8BnBpjaUiWHKP1d9mqtJw2koO1Zs8G0FRmKlBTVp8rFyFzyTXNDH0ySf86y0AYBGYmNosnm7AtJxiBKG0VmW8IboVNPgQH5e0wGB2SeiTqSmOMZahgD/PO8/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DTGoHKaz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DTGoHKaz"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD154122D;
	Wed, 19 Jun 2024 03:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760251;
	bh=fhKbz6+wr6roy/hhRss/GWu3sliCltbVi4WtlztKcVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DTGoHKazYQqmCsRVL4cE9FSxdDvhjpq8cnvnVDUlmPdOL7kbFX49A8mUfR4XgM65l
	 5j1l2E23ImfhUFXOTSkaTCm9sxnVxb0AwOM0TTrJFIB1P4bLcEX0CBpdY6Xnh2m39i
	 Kym2edd9xjz7Us2KYjG3sbe/uhVmIOMr2O4eER64=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 8/8] [DNI] media: renesas: vsp1: Validate all links through .link_validate()
Date: Wed, 19 Jun 2024 04:23:56 +0300
Message-ID: <20240619012356.22685-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move validation of the links between video devices and subdevs,
performed manually in vsp1_video_streamon(), to the video device
.link_validate() handler.

This is how drivers should be implemented, but sadly, doing so for the
vsp1 driver could break userspace, introducing a regression. This patch
serves as an example to showcase usage of the .link_validate()
operation, but should not be merged.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_video.c  | 98 +++++++------------
 1 file changed, 37 insertions(+), 61 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 88806eddc839..0fd78c22b635 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -45,51 +45,6 @@
  * Helper functions
  */
 
-static struct v4l2_subdev *
-vsp1_video_remote_subdev(struct media_pad *local, u32 *pad)
-{
-	struct media_pad *remote;
-
-	remote = media_pad_remote_pad_first(local);
-	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
-		return NULL;
-
-	if (pad)
-		*pad = remote->index;
-
-	return media_entity_to_v4l2_subdev(remote->entity);
-}
-
-static int vsp1_video_verify_format(struct vsp1_video *video)
-{
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct v4l2_subdev *subdev;
-	int ret;
-
-	subdev = vsp1_video_remote_subdev(&video->pad, &fmt.pad);
-	if (subdev == NULL)
-		return -EINVAL;
-
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
-	if (ret < 0)
-		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
-
-	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
-	    video->rwpf->format.height != fmt.format.height ||
-	    video->rwpf->format.width != fmt.format.width) {
-		dev_dbg(video->vsp1->dev,
-			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
-			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
-			video->rwpf->format.height, fmt.format.code,
-			fmt.format.width, fmt.format.height);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int __vsp1_video_try_format(struct vsp1_video *video,
 				   struct v4l2_pix_format_mplane *pix,
 				   const struct vsp1_format_info **fmtinfo)
@@ -1061,14 +1016,6 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 
 	mutex_unlock(&mdev->graph_mutex);
 
-	/*
-	 * Verify that the configured format matches the output of the connected
-	 * subdev.
-	 */
-	ret = vsp1_video_verify_format(video);
-	if (ret < 0)
-		goto err_stop;
-
 	/* Start the queue. */
 	ret = vb2_streamon(&video->queue, type);
 	if (ret < 0)
@@ -1157,14 +1104,43 @@ static const struct v4l2_file_operations vsp1_video_fops = {
 
 static int vsp1_video_link_validate(struct media_link *link)
 {
-	/*
-	 * Ideally, link validation should be implemented here instead of
-	 * calling vsp1_video_verify_format() in vsp1_video_streamon()
-	 * manually. That would however break userspace that start one video
-	 * device before configures formats on other video devices in the
-	 * pipeline. This operation is just a no-op to silence the warnings
-	 * from v4l2_subdev_link_validate().
-	 */
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev *subdev;
+	struct media_entity *entity;
+	struct media_pad *remote;
+	struct vsp1_video *video;
+	int ret;
+
+	if (is_media_entity_v4l2_video_device(link->source->entity)) {
+		entity = link->source->entity;
+		remote = link->sink;
+	} else {
+		entity = link->sink->entity;
+		remote = link->source;
+	}
+
+	fmt.pad = remote->index;
+
+	subdev = media_entity_to_v4l2_subdev(remote->entity);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
+
+	video = to_vsp1_video(media_entity_to_video_device(entity));
+
+	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
+	    video->rwpf->format.height != fmt.format.height ||
+	    video->rwpf->format.width != fmt.format.width) {
+		dev_dbg(video->vsp1->dev,
+			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
+			video->rwpf->format.height, fmt.format.code,
+			fmt.format.width, fmt.format.height);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

