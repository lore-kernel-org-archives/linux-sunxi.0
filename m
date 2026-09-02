Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C823B3C10
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379666; cv=none; b=TS+8QhVfzDdTJK9ABRMd7jcOP9P1P/uHOFJ02ERg1ROytKaBsY1GpVCSOuHPiTdyLwqTDT4yMaIYCtkZouPCwpvui0lucJSjYjti+3IRQuAAs1/haQeCYmfgypwsz1LE51Fc4Gli34DKWGSdZSIxcZirw5WlXtIH2dnzr3TlOk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379666; c=relaxed/simple;
	bh=edAqkzR2VHg8wkB7OCT1eoSkZr2X0FpnBQkzfDMc3IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5z4Bv1Q6JaY8L8Vfmp6LLRAhorBrJ5ubFOBYPGKuMI2MZxmg8GP97tKR3bN84yk6hyFABpi0MlMkunfzTRCCLKLuluJLpP5DtSwu83P9fuZO6zsZ/H2u0H6Xx3lKu5DcM9044jCWgg5hmNFy29jEmKxdw0ZGz6j2VZwhK0sqm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P64iHGeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki3DABKn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P64iHGeU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ki3DABKn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr4ZC1072140
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J9W8P08UQPf
	Jw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=; b=P64iHGeU+wqitnO2yOTz85CPPMC
	Nh9EN3gs+0SkmrParjRLd3P0cOTDHlUIuwGLTuKjTJxj2CRNpFTYEG6MPoVkvEoN
	KRHTCcUMHiCjR48T3RBTIkIlHfwEfHUJn8w9LZX6cIPl6V72APy3F7KN8w5EZhOh
	JmIfKfn1M9o8qLLLslSCCHkih+JlFWsLs5eIut+RLMcZtwCohJ/vch0JdGhdKGlx
	05ci71hJL1xR4/y/O1dq2OyMXjVfwO3NqnxZVBv4QnG1GPIFy2RU34XcrhpbqbY2
	dqXpMxp8akRJCDdTl+S71BL///ZwoRsnXT5kuM5vJcaDjuDRWHNG9Ls4ndQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1s02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:07:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396638f9a18so2661090a91.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379664; x=1788984464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=Ki3DABKnYStltAfaKOTgxxY5C2gmPxLRQvRZ5H8kp67r8DzzUh/WZJrFRobbmiH626
         KmrK32f50L9HFm4ZCF5PfYdctdwipJGGgBYfu0x5UH7J3P1U33a9TdSb+i+PYHHWaFjb
         sVd/9MSZs5kJBHjtraO5/bqN5EJ/IQ+55rBvoBfRoMy1n3nK2La2wwLMdU97F7jZfrX8
         zZA8s1Mf1BJ2kHtJz0GAUm0wY9+GxPoCymQjgREzShjvYChXDD4nNM8GOq6xPEFX/RPJ
         5OxmrJq4G96jncdYRPDHF4SmT7NEonj/025nLeTevUVsGiE3JU6jhym5DUlhZWRnsaRh
         mEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379664; x=1788984464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=m6Zob/DcOiLXteqYFB37Luaa8SOn+G0wE2553pOiKMhuR/Sj1AeUxxUTlSmvAAd7BI
         ZYb6zneJWCQOCfRqf7qQqp/A9t8fIBTSTtKmJ0UN1EgCDLVE+OnqgL5UHK1H0805mZYk
         +IKDjx8w7gvgV83r0E686n5vrcRnVqDN4nmiapqqmrGCJllbaIL+Mea4eTYbVRevEK7G
         tdQDEBLWDJdNDEOOPa8MTqKuc6jKNKXJWSbfe9Z61VXRRIPWzeaSb0GlFFKcx3aEZJjG
         LdNHDC/N617XvYXOIqnIVr93bf4Bt+oWMwqJb0hFaMFY1IeymYmC0Xp9x9n13o6sMX1d
         duNw==
X-Forwarded-Encrypted: i=1; AKwUvByQQraa1ZoWsIdFDCZ/M62nPRZacSlJKxFnrxOp1rAi4Xm7jbolEjx11QhpxNXz9Jn2pYCH0/qrl3ju+w==@lists.linux.dev
X-Gm-Message-State: AFuF++kiyF9t2stbAYDvTky943JYiaFQGLDI7YChqD2zpg2mw5e7eIP0
	eiXJzXqQWlsBUaXGMaZxF51l5Xifhgwz2YqgPfX/FJt6RT8/E+8iQn9UYvnLi+ZaMqtNuun2YlM
	0TNCeuYM5TiuOYgvaIe+46aodXoIwsedEgM+U/sAkb5Q/QK/hciLol2JHJrk1nexozA==
X-Gm-Gg: AYBFou3+ksDuKk26LBVkSZx17QXEpU5T7NuuAt7wtt5lq0kaBg8Krrn4XvSvJQCV6Vn
	iqQTzli/eJBVcHnKgS73Y2OOiYkv7Y1M6CpJLoEmHDqjPZOkQZTwl3/kpFkU90VL5ANTMvTkAud
	s2knNDRAAG92/KBIRDjd0mQRC5F/Cou0K4jC8qJ6pjg2shtuV4OtSupedGlH6tzLBDriavkq/jh
	mPl9OUULRu2Gz3A7O9k0I8Dv/k8gvtR1hFX1mM9mR+Qq16uRjjUG1cGgvt4ncPJs/flw2TOESfa
	bYaQ+M9s/1VEcIwTXuZjBZ8EM7MjJiFOYhtWwd45r58FQFNgmIikeoVIctviRs6bUaL/P8rPM6J
	H8euJX1PhOysKtOu77hCFYHM0ZVM=
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639271a91.7.1788379663611;
        Wed, 02 Sep 2026 13:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639151a91.7.1788379662903;
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/6] media: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:59 +0530
Message-ID: <20260902200703.2016410-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nk19kaqmTNz-umF4qe9OSj94sfkuuxGW
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a988210 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gFEuJ_os7HuwQwkCt6UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX9ADxC3IgHNht
 eLWdq0R3gzy/+R8ZbgCZmbPTY5/PkqjnDmnoa8FfMQ+ZUn+/bSCVvCHXtvK/fWDt7LO2Fz0oWt2
 ZweROAPyy6j6dxAeXYzOvkR0OGZ5maw=
X-Proofpoint-ORIG-GUID: Nk19kaqmTNz-umF4qe9OSj94sfkuuxGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX44aKDazFqqfi
 9t6maRpG4TFcEgWjnNjxI2LWhNiNi1sAJ3gf6+sr6OdOlYLyX3DDNa/V1nA96rMqBZ3NFR4IITm
 ekp0LTCHUb5n0V/xAihSpr98drgp/bio3flFPcVclJeLE8+xvGZAcm0RiBO2GoDSwkrf0JbMEjf
 7HKJYfsWg27X9jrQZ2hOPMk0HFbaTtDVJiPcw3mys1SGR0Sc2V8F6PZm2rCV49EKbLbAgTUU2oH
 LOm55lyuF3gJ9FqlOkGJbh/Kt4lD5pexg6aSgRJiNv9HynOWq1iM911LoeDibxUERRLdcEjzds/
 nk4Z85SyVxDTOU8/9mVA5Rcf629PoYki2uwK4qfXGDY9E60t27Rp9x3PLfsSduR47aCff1Mx5rn
 na/xW+P7VOyFtqsH/AEBsC+z6XLrCWVMuF5vqyAEk7rrdg8kHsfr8FHKaKQMRcBpnp+e2UFXgmy
 qnCP9c89B0N0209YkDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

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
2.55.0

