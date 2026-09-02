Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE73A9D99
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380240; cv=none; b=JlH4XCq0CvGIZSsYleG594ywEBMBa5RLsB17NJxhAHGLMjRd3gVjBHDPuAdFIJVZNod100W3jq6uOKWQl29ErxaB1oJOiu8f05euiytXxXZ2LRcxD+elRAPLfti/od3eyerCDQ3s+aZwPE2Xt3xcVu4rzl7XZCu/zX7CCodaD2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380240; c=relaxed/simple;
	bh=J5fU6hQOqgYnobNq0y67Kn6rZ5FR9aF1CDB13ndNBPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRwaVKFcW3SlJzjW/Y8T9TWb0pGem2JBnrzxkcpCNGQXn4q6WJ9/ra1/R4v4Z6wVhX8qBpd+2vqk7HAElisMDnOBv6MrUKf1lBvUOib6vpftWJm8rgB9uhQ/xVqSCqRRdCIj70hjFd7jwxLacrbzMSgtAqAShjsYD+NwMrdc/X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0sYz4CC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcKaU/W0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0sYz4CC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcKaU/W0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH2jW3288550
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9lDnpS9AG8B
	MnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=; b=a0sYz4CCAZERJ5cvQgZ067dKOaN
	q3zsMGdWtgW4siEJGM7JhH5S27ck/eEvpze57SsRdLn6TIb6EYfN4QDUd0EgoQ47
	hCyZGr6sDbJ7x0sKo2J5FjWKamDlSx8J1AfHtG13YKSYWtdxi8lr8kdNCA37Mrn7
	ffVtMIw9RXL7cpU0LXHWe8Y2v1Hng0Cw8YAniRAajGPRp4mAkHO15m2C94aUICNL
	VtHZwWDy3QkuVzs9vQCqcXewaaRtyixuRjgqgrCtOI+jCbl0UhLpkfLp1PykMbjL
	qokITfmOkJByT5TuP8bH+8444POICdhc+B1vucMlN5DsaaxXwT4RQuCrmzQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8qx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:17:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2192712a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380238; x=1788985038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=;
        b=jcKaU/W0+hIu3SGsDA2EYNd758TrBByKlVvEFkX5ATRDkeJfIoh0gpL9aiU4tPnczA
         jCK2X6+o1gHxxv5cpFOHg4eQJM9CtrdpgjX0UnP3lJVYxhC5jx2VKIJpPWaTwe4AgtTO
         sT8h7vpJVzQR5q3riIZa9MzQ8dHHkKbIBBOe7NrgYoLv73HNpY5HIJdqffPA4R47aEYa
         VlO4h/HlTVxYANHTLEZvM1idGij2wsWIENt/iUFY2FzULd7LBnzFFRm4mw6ceT8OA9HA
         fGEmDskTk2+JPDwW2mYE/U2JNDoODSuQ2UCb6yYEIHsLugKvqOqCp4rymweSB5Hhq4FH
         BmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380238; x=1788985038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=;
        b=fikewXVqtgt4my6IO+/06GSyM174qexIcKGQUVq5s4AXBCHHMLG/5Oal8i7YSlWiYx
         Cg0oAuhAMTX5vOdo9KI19JAk2CWWws2kR+HneO47VKpndWDlyOXh7+s2DVcb4NYzIqoN
         0f2mUEq0MRIx6sSkJJz/qzBSxE0Ko3fSSP7PJoi+1V/evr7yqhCEsms3tNfSqmeaGxGh
         5h3L5ZxkTs8L6wyDQsxSqYpN6sTXZGxdZBWVNOAB9tyLodUy3SloASSsyGWNgfcHFcUY
         KONSk62nNs60FVS2uJxNKelllCHcqhRig67VXa4pyfrR9EXvhnBp4ASe0kN7SOZOwAfj
         SC+A==
X-Forwarded-Encrypted: i=1; AKwUvBz1lF3d5WK82qPdr/GCRgA/TvoI9g6xpV9Qr1ev5EocbmAK8CLqI8X2bPlx7aGtwF6ASqMOoSZ+O5IBBg==@lists.linux.dev
X-Gm-Message-State: AFuF++meU8NCBdcxVPzKLjl9V/+nS5bD0jvM2g1rOE2TEHeCCB0UnRTN
	iFU0W16gGqWzi04nkWJx2TQnpmMklPkxH1mOl6tMxMYvb4soz8EmiBaxEwQfOJw/D60gLx8hfes
	Qhzkh85uMAL8WLWbixA1b2zbQay1gaVo0rUR9ZVCjbpFTK4lM0XMyl6i/pR6lwdGpEw==
X-Gm-Gg: AYBFou30FurmMFkLdaivGt2fz1oEl2jaGXQ/aNsTdpkYOKiHvLrbfLNw2gcr/At6tJI
	xAMf6slyJhRGrdCHPH2aHWf+SPUdR5e53Rq4zgBO6Hu92G4SjCdIJinZtsZ6M2n1QRQhJvoXseN
	JPxqd/rg9HgURoDI6aHsOid62z8zl1Qmx4X5tkIjDDM5fjs3oDMzbR6RIz+WSsF54r8LhGldaVs
	3Pvg/CuoF+l2M4PrnxPdlxYcaZRKjGSyc18MkdST4hzNxPvnuey8jHDFQK4sX4c8EddWUtnr+Km
	p/jST6m7gFRgJRqzyEEZcec8hl2WDUr6W6NJvLmzyf0gVCVM6/8bLLEb+yhueog5GdzQnp0oQhq
	EZsnXbz7dQ/pqCrny1t9NEK0/GGs=
X-Received: by 2002:a17:90b:1dc9:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39aee17a0ecmr11378960a91.25.1788380237652;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc9:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39aee17a0ecmr11378858a91.25.1788380237159;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
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
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/11] drm: pl111: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:32 +0530
Message-ID: <20260902201640.2024648-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a98844e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=cxSrDiPXJhrM2elx99wA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX//O9n747uF89
 Ncm6SDD3CLKgm61g3iTqCe1G1sRMMTrH2b9Ek249zUgB1QLrrPQMZUamkBvis8GwxdCSiDC+0zd
 27FlX8Mxkk5/qNvPHFKEkAhZiKTHXsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX6U+vPhu+I2jf
 qj68IlZdDr7VC0PgK3tVThVaeOb4Q2xVjxOqVTN1Uu5j2Q1KlgPzgVgM3zRdnaPw+Ri7wjUNpvg
 OKVBVjqjxBoeK+KI04bOTpFD25B9QCjwTTKP41TxW0BbITwlurDSSFCNoH82gzw3n/J+6F2fUbZ
 U3OReatBnIwcTdzeNvBBOt8XH7QiSri8kSYjvGvzU+VuDol/p1TlbCC8cup21AVv25q/h59m2oP
 N2JmBAFx+LcVMBtyyrLvzE2g5xwpH5o9j3r70U82rPN5i2ZlIOOyj/cuG44LRDZVtqrGVWSbYYa
 YJ8FEr/cLYSz/rIRfx32p4RvikKS/YsLl5s/UtmsizKEU4SqRn+/Te5Wo7Gnmq+xsdTY0kUcCR0
 w48wtxFegA5/79IFcsiMpkDgm50nfTBawFcZj3iAzxaRFabcUW0tT0oK5tbfTRSj96BL7tfySCE
 ORywUVGWteHB+BfzD7Q==
X-Proofpoint-GUID: zM9UXz7qpuF40Io5oGms7204nwLQX3qP
X-Proofpoint-ORIG-GUID: zM9UXz7qpuF40Io5oGms7204nwLQX3qP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the explicit of_reserved_mem_device_release() calls in the
dev_put error path and pl111_amba_remove().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 8ec659b3c08e..a07b17261961 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -255,7 +255,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	drm->dev_private = priv;
 	priv->variant = variant;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (!ret) {
 		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
@@ -314,7 +314,6 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 dev_put:
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -330,7 +329,6 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 }
 
 static void pl111_amba_shutdown(struct amba_device *amba_dev)
-- 
2.55.0

