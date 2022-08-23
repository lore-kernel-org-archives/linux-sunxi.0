Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECFBA23
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Aug 2022 14:40:07 +0000 (UTC)
X-QQ-mid: bizesmtp72t1661265512tv4qnbxg
Received: from localhost.localdomain ( [182.148.14.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Aug 2022 22:38:31 +0800 (CST)
X-QQ-SSF: 0100000000200040B000B00A0000000
X-QQ-FEAT: WKaXkSLX6oPvwq+MKc5hCiMwcC3Ep1DE4kY/h+ZI0DwfQSr3WMyYXentQeUXx
	uE8b+A/x8R2sPArPaBqr2/rRgbRhHZuTnmvjQTR+rhfKuy5GNo6tb0Hs/NnOxX4hPeyPFa2
	ZBkqiHTONJJxSbhfldbxo3Oe/McKwZAGlBXDcTjws+m37/O/iBNbgXKOOYxjpDDnHO6Z9i1
	Xxhe+h9T0OUGdg7+gETJCGpNTG41KH77n8URzoqQXCIQCw+iHGuOjpoDMOPH3k4tFhXx1y9
	0X2DkAXD3qsUGhY4SAT7uSci2Oii+dgwuDVV7aHGNbFuwpBero310WCmEnxFq8o0bU5rBkl
	9rrjiIpjJaNBVv/R+T4BOLgZQ0dGHgPNf9PJVnh5JoEUIJSxhFw+4i0sROk5z30nHEhanDh
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: yong.deng@magewell.com,
	mchehab@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] sunxi/sun6i-csi: fix repeated words in comments
Date: Tue, 23 Aug 2022 22:38:20 +0800
Message-Id: <20220823143820.29860-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7

Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 682c26536034..fac004389b6b 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -177,7 +177,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	/*
 	 * CSI will lookup the next dma buffer for next frame before the
-	 * the current frame done IRQ triggered. This is not documented
+	 * current frame done IRQ triggered. This is not documented
 	 * but reported by Ondřej Jirman.
 	 * The BSP code has workaround for this too. It skip to mark the
 	 * first buffer as frame done for VB2 and pass the second buffer
-- 
2.36.1

