Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468E233BBAD
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 05:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303357; cv=none; b=sc3P/o5UHpE6UKeD7q4vlDV6mLhgaKN8UJKiOuhdK+fqb13g9uffGp/JC8xsbbHrzPiG9X4aThWLQdNJnzeS8f0PqhKhF40/1VFmZUCkc7dRT2n6z184CU+j5L+1TSPeBmxn5qJjnLO0azKoXPJaoRVRjAARZz/2C5awRwEtD28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303357; c=relaxed/simple;
	bh=nt6OxSmmCFCp2plgNXKiUV8ZCLQgCwiBJoQCG+R7L9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SRRwyL+rJd8S9GpKFMe8FUs7y8HX+bk3rTjKKvjVN7SEScQpN6f2Mz4XEC9j+PIiGh2gtX4vgv+JNqE6cSbTgV51wdHcPahHqMrTRp92LEnGFlMYRmsvJ/zQ2/xX20sZ01VhAirYRIYExKD0Fg/mpPqYQKkmAA3DvJUy0vmcB+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWC4kLQX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWC4kLQX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1514251f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 08 May 2026 22:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303354; x=1778908154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSXVZuQbVTBhNqf5XUUF1Kdmejk+jpH4iBZZY4c/Ed0=;
        b=qWC4kLQX7xi4cygn4sCNVOl+VdyKtwlUNCVz17jKXqA5k6Ey8MQEg3/faxmYJtFi/g
         HHewLoTBCwinlhJ1fe7Tvrg/hijdJ3jnRg0w3o+VdeGHivjVOD+ejo6DAsZgjJc/noXv
         sytug7kS6wIyg3X2nKH88vYUqFp1mpiRPzKgpujeqHMBS6y1eQx/3BN/bzKUlQsQQkGr
         0HbkseeVc9gTdLZp6CVWwWyLHdU5sId24JDt2WLP2k4DYS19amW7juFlX/nFyUO2ftLZ
         /wU2We0NLuZKNrY++R0ZYlg11r4ennszgRClbHgNfvuGRi6IpPF++o+doPJVupgp5hT0
         yftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303354; x=1778908154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSXVZuQbVTBhNqf5XUUF1Kdmejk+jpH4iBZZY4c/Ed0=;
        b=oUFwiHyRK8UHNB8sj52fBZ6kYUTOySBE9f9wGzK6w9MUNc5M8EJqU0G4M1FAOOgYrC
         AiX9/iIMlPyjbUBhe9m9kCbbI/qMDJOGYgQiKmjy+cem8aLrpSvWFPginh5oulrjhsmu
         horIQMrSghVX5B5HgN5tYPHVTNRAH0UTLLYdME9HBRiV3hE5PHcEFD8a51VJWrvOMwZK
         E3vHGkaNStAv/ABy9QGua9vj+dBKeh+CZCfFFf4kAHY0Iv66l+CB9IHvmtS0zKQYgCYv
         9PHeSVSqjNfdty4aScjwMyUQs5E0LUGsWFYsMIYpxncsLN43Ht5DKolRrQ0QWuFO1HkP
         FnrQ==
X-Forwarded-Encrypted: i=1; AFNElJ83jxwePO7YA0RSiuurtCXlN0WUFWO06n6sInjUS2GMzWfw0dvaU6nn3eZ1r6yko0lVNPtoAEGgULu/Eg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaPa0AtWf58ipyi2Tc1R72x0ZeBD0crn9GsX5kmIfTDlEcfZ5g
	JGRsWgncu9LsqQrVkxHF8tj+4XJRLXayksITOwaeEi+BfWgvJbduQbD6
X-Gm-Gg: Acq92OGMwZl3ZhRI1+D2dHeLzXI5dhz5VdJSlZB9gcWp49KuCL3fY/0sJ3nUuXViOt7
	5ejJF6x9nxI7feoiYT5lBuphxS2+FB+DjSEdT1IfubTjIiX82ForZDrr4owGfiJ3jLeqcmA4XcQ
	faullz8DKa9p3UwRbsDZqjdWD1xy7+A1rBpD/x1F0qHeewWAlpY2NESOJyyxSXgCo4Q6sf5yXef
	hbFYL7HtiivfY2jqiC/3zE6ArqgeGA1wsUiLtqVuGnHFw+NdESE8sMLVlxV6zSolcKLI2pc6Bha
	WSaI/pHOs+GzqVBwFUD+LTvFJ2kPGIJQV1PiroUq3IfIMjF2w5/KQJlejR9ElezUSRSIoYlU7id
	tR5+GMwuchb/oh6nXSRqX3pLNmtTU0T13t2Mo6oy0YaP8bGSQas2hPMBnRioNsJdcIhk4GKo/eg
	VM6MMWnzKuGfw0HrcTLCTemwvMIKoofZWUAxnvluHFeIE9CeI9vVdhS7VhbvZrb35MAyx6MM4TD
	eKjXhYLbkXunY6mRbgB
X-Received: by 2002:a05:6000:4007:b0:44f:f454:8a4d with SMTP id ffacd0b85a97d-4568c19b209mr1557183f8f.23.1778303354571;
        Fri, 08 May 2026 22:09:14 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm9500871f8f.8.2026.05.08.22.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:14 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 2/3] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Sat,  9 May 2026 08:39:20 +0330
Message-Id: <20260509050921.22158-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509050921.22158-1-arash.golgol@gmail.com>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
 - Fix Media CI robot warnings about open parenthesis
 - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
 - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260508161721.94285-3-arash.golgol@gmail.com/

Changes in v2:
 - No change
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-3-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f788b4234673 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					    struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1

