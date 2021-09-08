Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD33172
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Sep 2021 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
	t=1631098575; bh=YY2yCPD5vLXF6o1p4UODyyT1QmHGm6Y/SxZTq/D9uMg=;
	h=From:To:Cc:Subject:Date:From;
	b=mYaLZngkt2nB4yE41SBYtnk11sdtwCw7txgKGBz2Q/2CJ0HBC+vnJHdMdqkqjJQiM
	 gQYiAehdspatbT9xsNwpwxOThXCXQztBA4qx3XaJn7L5n3/C/tXVPC5dbwh2QY+ulA
	 kJa/bp4QvEvzzF8d4CSUdarF7Ni73Q03Xmt7Iyio=
From: Ondrej Jirman <megous@megous.com>
To: Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-media@vger.kernel.org (open list:CSI DRIVERS FOR ALLWINNER V3s),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Ondrej Jirman <megous@megous.com>
Subject: [PATCH] media: sun6i-csi: Allow the video device to be open multiple times
Date: Wed,  8 Sep 2021 12:56:09 +0200
Message-Id: <20210908105609.1823449-1-megous@megous.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously it was possible, but a recent fix for uninitialized
`ret` variable broke this behavior.

v4l2_fh_is_singular_file() check is there just to determine
whether the power needs to be enabled, and it's not a failure
if it returns false.

Fixes: ba9139116bc0538 ("media: sun6i-csi: add a missing return code")
Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 0129dee798b4..da1f8b2852b7 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -510,7 +510,7 @@ static const struct v4l2_ioctl_ops sun6i_video_ioctl_ops = {
 static int sun6i_video_open(struct file *file)
 {
 	struct sun6i_video *video = video_drvdata(file);
-	int ret;
+	int ret = 0;
 
 	if (mutex_lock_interruptible(&video->lock))
 		return -ERESTARTSYS;
@@ -524,10 +524,8 @@ static int sun6i_video_open(struct file *file)
 		goto fh_release;
 
 	/* check if already powered */
-	if (!v4l2_fh_is_singular_file(file)) {
-		ret = -EBUSY;
+	if (!v4l2_fh_is_singular_file(file))
 		goto unlock;
-	}
 
 	ret = sun6i_csi_set_power(video->csi, true);
 	if (ret < 0)
-- 
2.33.0

