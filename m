Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261D87A
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Feb 2022 18:14:43 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id n14so16773556wrq.7
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Feb 2022 10:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=laSnQJpbry/7HDfeFASKUPW4HYc9KBwUxVn9S4td0qc=;
        b=c0WRI4mazSMxTdg2exnk+Q3pEXI74oiHYivOcAxyKozC7Y4/wrofRWWnCvtaPZhGxR
         IhujeWQfFo00DEXYokFGtCEV1Nn/dkAzptGSD5IEwXwkYfvy1qfoB3e94L+04fLU12+3
         pcpQ7uF/jzshj84kJryjM8O1p3msTMRKDo8oU509HnrI67clNXOfUUBLIc4+upY8iJaR
         lijHIn+cImvx6w0OH/8X7tgsuHtgADaACEwj7KzCQe1+ShF5wzUkQf1V0VpMSUNCbwen
         iJRaVoijltE0Hg7tQ28uZOYG9wwLUfhgUw87xdeEs/IH4v0p+SOczJhRr0p1Uu2joV3V
         27AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=laSnQJpbry/7HDfeFASKUPW4HYc9KBwUxVn9S4td0qc=;
        b=1KjajDH+nnKpvcv4H+X+5LH6LBwV/4eDkibYJrynMCltjPILjVJS83o/v/4DuXIib7
         xP6uqrjsmnPVxt/ERGkjYNkt+kLwGCzVQaxOH7FGXchLZkRSsiHLmOl0leV8LOtx99ft
         t79LiZ5Ajb9XNJJz3xRgSCJZCBSuIAmZq8OGvnvIKNJoQ3u+65dWQlb10dBm42unx6kU
         xu3d+3Byx6toWNKAytjqKo/cOhuFxpg8fC3wvOOLlkKnJpTDjQyL3uqX7RbvVZYv5ham
         vozb8gL4BiOhthKYPfBg1ItHk2Y+g2U5vxDJ1nGP+rtjTM/dP+IWndzUn9ZiSLj8zNs5
         20LA==
X-Gm-Message-State: AOAM532yPT1Qqrc+ZFgPet8MpuGBqGGvywjF5iQM5Daoa0l0oCFAinXu
	7N7vrKdTz34wgbZelOCIBDg=
X-Google-Smtp-Source: ABdhPJyhltbPdhysi/wISTmoSAx5kNxmU7sMGyLPJmQFUN5FgbPAW2+eU+jUkbBOfunmlYPPW6hcbw==
X-Received: by 2002:a5d:648f:0:b0:1e9:5445:4b13 with SMTP id o15-20020a5d648f000000b001e954454b13mr16540343wri.127.1646072082307;
        Mon, 28 Feb 2022 10:14:42 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id z2-20020a056000110200b001e7140ddb44sm10780677wrw.49.2022.02.28.10.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 10:14:41 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: samuel@sholland.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: mixer: Fix P010 and P210 format numbers
Date: Mon, 28 Feb 2022 19:14:36 +0100
Message-Id: <20220228181436.1424550-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that DE3 manual has inverted YUV and YVU format numbers for
P010 and P210. Invert them.

This was tested by playing video decoded to P010 and additionally
confirmed by looking at BSP driver source.

Fixes: 169ca4b38932 ("drm/sun4i: Add separate DE3 VI layer formats")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 145833a9d82d..5b3fbee18671 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -111,10 +111,10 @@
 /* format 13 is semi-planar YUV411 VUVU */
 #define SUN8I_MIXER_FBFMT_YUV411	14
 /* format 15 doesn't exist */
-/* format 16 is P010 YVU */
-#define SUN8I_MIXER_FBFMT_P010_YUV	17
-/* format 18 is P210 YVU */
-#define SUN8I_MIXER_FBFMT_P210_YUV	19
+#define SUN8I_MIXER_FBFMT_P010_YUV	16
+/* format 17 is P010 YVU */
+#define SUN8I_MIXER_FBFMT_P210_YUV	18
+/* format 19 is P210 YVU */
 /* format 20 is packed YVU444 10-bit */
 /* format 21 is packed YUV444 10-bit */
 
-- 
2.35.1

