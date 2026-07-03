Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C623128B6
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 19:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107857; cv=none; b=ql4eGVLwsZb6/BE3CMV4LHAwYPrU9Ktajr9P/Mat5C5zi8IzoLMUmj1hQDwFzzGVfa9SRwh8oKffMeqxngVkvJSUh7EwcRs2uIIzmgCpNWnIzOawTtN8FKmUQf/u0tHlZPZLShVPHSwQ6iuVcbtVpxQXf/VFSKeaIJ6mhz/HjTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107857; c=relaxed/simple;
	bh=NnhqwgAxxECPDsfxQ59nhG13vP+RTyvfSeIEeTPm5Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTOOT0Hph799w6+hz1FqJy8VvZnVbGCl74WpB0ZDFGg+M7m/YJH6vjXULLl8bLtSz6PbnA2N1sm8laJ5Por/h6jGhv7MlKUIwpCykJIcFdrbwz4UGqQjx5PPjU3DLQsuB296JVgjSWlYxtkY3vYmWgxTA/Sg7bK6MNgEGSCUm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5ePMugh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdvK1KM2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5ePMugh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdvK1KM2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiOme678075
	for <linux-sunxi@lists.linux.dev>; Fri, 3 Jul 2026 19:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kb1iTkUxuam
	8tAkzwKjCMRd26ZQOwOz+Yg5JpRpyt18=; b=S5ePMughZWi7SvoZxYwP0onh31h
	eU4cwfBRx3ahw1LCRcXlkaJIXcfIMfCLwR7z/4iUWQKtrflPoO+2yG9bbv2cGOaI
	eUNir+DbQs4W6XkGR/ALtoBJhumLuXvMRvK0mYA6QVyCAnLjKHYfbljJLKY5PKxa
	tajy4e6gizpYUJdNjXNdCBgeIrKnfYLrf4vI3VCgDRtFCFh7PKsQ/HI/9bT++lwS
	r1cCfbVyFKrL3qO0imObXuw8ZZKequ0xSPmvOeGpkhmMbSWbkgyFk8Oy3q7PR/Kz
	4ENgssi0FTweX0znGsCWiiajLsQk1YuBOQeQNyxOeVbk+7xzCdP0FWyGR5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u32jpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 19:44:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so1503756a91.3
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 12:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107855; x=1783712655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kb1iTkUxuam8tAkzwKjCMRd26ZQOwOz+Yg5JpRpyt18=;
        b=kdvK1KM2Rdgh7gVr79MmF07Nul9Mlr3zOF2VBjwWPXejZFzOGauK9Jzh0ftkaipk18
         uw5VooobMK1bwdv6iVBdPaAWjRdBQFMvacf5LQwL99kBNWtn2sc/uK937zlNREyum6xa
         pWtH4U0ypN2BS8LQikW9pnR9JXaeJxHn+6WeLdXz0arG3mFfZ55SWShAwP+bqa3KtKuU
         jMrbS1jLIZPEHJGdbIAhVwVmLCiKJJF8wJa0MlClbtYJXezE/F9H6iqU6PKsZEkIWu+n
         JrXMle0Hsr+Il9Rbwh41yFAX/L4kmGlyfmtugiRSEY8JbZhTXyuBPE53p7sQBXe8osew
         qS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107855; x=1783712655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kb1iTkUxuam8tAkzwKjCMRd26ZQOwOz+Yg5JpRpyt18=;
        b=mIpSNAoj4C1WGP0lvac0eot0syGDzhqPEE/iwE0gyTV0956zLdi39f9Nae+/6fE+8o
         MSpdfDCzRqS/KWIoAGz5F7XJl4L+p7t1cRMN3PPWp1tWDtiFewOa6eY5hg7W77WbYhKl
         x+6oNa+D3LA1KQxZv3RPz8Yh8jKc4Aor5tJ/GgROZOSb1x+M93yFbXwhF6bWqE4Abqdq
         ETRrXh5IUGxK/y702epbYDrNRr/dpGo+qBUzg9oExRqZiMY+syCW5diXohSGsRsDNAg4
         arzcrNFEF7z9aqVP8DSraHZ4WJ84KEupscRP2tO66cXVyJJJjWXPAszo8DNYhAlP3KAY
         nE4Q==
X-Forwarded-Encrypted: i=1; AHgh+RruIOltxz1f1tnOg0iGwtWSmlxL9EYmplavsmimPVOlTNncXynUwbeacITRf1Iksp6SH3xee8N4tBnvBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTtqrXcskZQ9+uJaj1e2BGeIAOXCHgh7MX1NA+8kseBPkKl7h+
	4OC8yD1DSQd256KPu8l7/KicKK1eBSgZw5claBMR8L6ifu7QvdwtacR08pHt2ojYu3OiHjYslFb
	fApxZBlJps24oCpPWUYfnc6zyzBydhPRAmwdszTFrX1j2xiZgc4UByeDL2VsIaZ0rjg==
X-Gm-Gg: AfdE7cnkXYKCp/ncSBbguOagS3FMAhNYCC2YFo5bm0CM1Qu7q+acvbf1zNW+IEUi579
	tDJjcPNtVArnJTJloe9MoAIDkx/fS4tOXyyUSk9rdrC2B8+WB4DeY3ZwBjwIytFkOmYHDypaUE1
	3L6gwcMe5ZKVCJTQbJbiZHTM/squpcumg4Ma6L0ouKT4F25ZEww5LRKPMkdxjdF14TTMGUMmJnO
	YrSr3dFPiLtaP5OJQNi+zk616seSCnPGKWtUZvF+6FiVVUB6N9zn6OqPYCmtl7PPwHtP39a+e6W
	AFgsK/m61m1qfaE0VfzOY+M10/YoHj2ez5d7CLZ8qG/S9j8JaTgaj4uko9fbYMUSnqgWnJetDKW
	2EKWxGMX/WitkwfSxk9hcHLoZSPKCSxVvStMCzw==
X-Received: by 2002:a17:90b:5550:b0:380:540:d49a with SMTP id 98e67ed59e1d1-382802bcb77mr736226a91.7.1783107854556;
        Fri, 03 Jul 2026 12:44:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5550:b0:380:540:d49a with SMTP id 98e67ed59e1d1-382802bcb77mr736159a91.7.1783107853911;
        Fri, 03 Jul 2026 12:44:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:44:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 12/42] media: aspeed: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:25 +0530
Message-ID: <20260703193855.110619-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LwuKxNixWryoEdQ34q9Kg0uGRQJWwGy0
X-Proofpoint-ORIG-GUID: LwuKxNixWryoEdQ34q9Kg0uGRQJWwGy0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX0iY/JO0wpISY
 xRisTDsgxIcNlfNmsrx8IL0nZHLc0GXhKAmt8eog5aW9EBJvml0CnZ7xzyb12RUC/Uk3oORVS1w
 Vo+wlqRalwiKedgsfPHdFusesLf9Zmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXyZZuOY37QSQ2
 erWgatH2oYGp74f+30/m+gBBfmtgOfJvPhCleaE9cB0XVX/KHHgMVT3zUvJu6Ghh/aX/bSpoVsa
 jv/8fENAx0SSpGLMJ1lbSyLjhGxb0Il4MydEm27G1batpH3rHZpfeyGcqWcROYNkFki5X5u/Qjb
 ZmDDE7zLzeu7FZTmyHf9TIK+mIZ1kY2HRTxDTNgdC8ZGERJyGZY/AYjLqWWPfIWYCm1luKo3IJU
 PahK746FSAi3jQU8U6QVfgVWlWXFiYJm9EKUXP1CpnshSjqkkAqx3Ns9ZCoMNQ4yM0sdMmDI3NV
 07j0Ou8yMDZPYhK6bJUz7USLWFcuBzwh2dSL16D6KBZyD9W+3WiQCZruJ8ouZnIyYEkqYaGN0kp
 4sFDVw70ro0xeYjwx6ukZvigsC3n6C8ywWWraeAUZc/ZohoQNjYJVytq0IL25zHB8/XuGpnIb6N
 rQkYDYO7P/urhtQBeDw==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a48110f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gFEuJ_os7HuwQwkCt6UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the three explicit of_reserved_mem_device_release() calls and
rename the error label from err_release_reserved_mem to
err_unprepare_vclk to reflect that it now only unwinds clock state.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..7ba9314fdbd2 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2267,19 +2267,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 	if (rc)
 		goto err_unprepare_eclk;
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 
 	if (!aspeed_video_alloc_buf(video, &video->jpeg,
 				    VE_JPEG_HEADER_SIZE)) {
 		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
 		rc = -ENOMEM;
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 	dev_info(video->dev, "alloc mem size(%d) at %pad for jpeg header\n",
 		 VE_JPEG_HEADER_SIZE, &video->jpeg.dma);
@@ -2288,8 +2288,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	return 0;
 
-err_release_reserved_mem:
-	of_reserved_mem_device_release(dev);
+err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
 	clk_unprepare(video->eclk);
@@ -2343,7 +2342,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
-		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
@@ -2374,8 +2372,6 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 
 	aspeed_video_free_buf(video, &video->jpeg);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static struct platform_driver aspeed_video_driver = {
-- 
2.53.0

