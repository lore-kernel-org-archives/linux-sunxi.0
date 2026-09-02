Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656643901F
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380292; cv=none; b=dZKPRGCMR6lDSQxEKdUaziM63fihNDmw9tPYoJzE+g4K8vazf7jbd3vLXD+ganz2swxPLs1wsh7ZWNf+b43PLyiCPQqnccF1/SjMv9pd6pjtA1HVuuDenVx1LN9zfFOk//5xwU4exDAeyy9Lm1Q0+OOEkzAO8uwDSkmuPguBHLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380292; c=relaxed/simple;
	bh=tu2KryeovncNxz0Q7S57/L3IkDxCbPfu04qaMvAxHkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9WYyLnsKqba8A7Q9rkM0uywn+Dgmt2VU4Y+TWjucaFoRXG7V9Mqt2kDPXSU7GFw4vM1M+LqBwpFQc9nIFHBNvh5ee2bxLJEOPhYeHNBPWI02OhtiECPR2eMbTZREBVbqGEXeINNYjhpyZSzleW2+72Uv/TjZAaCuWeoNWhU+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1mAbS1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdOSBzIx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1mAbS1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdOSBzIx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH4eU2685637
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1oZVnfNKBlF
	giLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=; b=j1mAbS1WwfUQzBqYP4YaGonJ+T4
	V6thqxNqjhIzlgurylVjTlfyJZSSx1MPoTQW+WhdcuCa671cADb5o4lEppbNkINg
	TtkwmDTl/CqQnuLj5+fhseH5ZAKcISvU19C3g+b+wmJossW1jTj4R/jJUU6LlSpT
	DynUEriHFzK7gm5Zf6v535ockse4QpLNoVFuzoMNfEseuW1jQbYOg4w42n6YtYtI
	qulXr/KcFR0lGSJlAv/bSjvIviKn2nbcjixPH+BTYJIjD2IoDPycDXWUY/bZcJhk
	M4Hdd6KE3FnU45yCKveXXDWsxiO+ZgXjOcw5u2VwllK623xZ0443Sk9K3fA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a87t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:18:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so19113885ad.3
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380289; x=1788985089; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oZVnfNKBlFgiLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=;
        b=kdOSBzIxv4NgHb1PpssXZU0MXByXVZgHAqSGG4K0MOGS9f2bWkKZSiQNpE4UPlCdxH
         QWkl3rsKRKXepkIgvVDdhF0O4lDvN0px46Xk6mFxxeVgvMEGyHTc1uAduHMvnjXqId5F
         GhZLx/s8VNJZe0JrkAsabg52xY6dIQch2F9wAIlcPNEdHSVtmjj9sMi3OG9GdUlz4cKA
         3biS/FLAb0N30fWS6roFZH6/rhtvg2skQq1a3K9lATA7YewDDNGYGpQFkQ21yARdOgQO
         KxLbNk5GK4V0jpMWoeDheem/OvJLBQIqIVG/NM/TQJZ+PfGcaY/YpcZgRq+22dRLKFKl
         Dq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380289; x=1788985089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oZVnfNKBlFgiLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=;
        b=T7PuEeF7RTMlgOPEAwNTs4b7pqqh0nzwJuQleQpTMB5lYPYSK24up1wOnZK5sgFNBD
         eI/dCDCwTo1CX1sKposZvC59LAtddF1OYnYRO3aQdh01ac64s3SOnm4sQIqMZmfo8AA3
         0pP125Ijwis2wdnOgU189Gsds4kgUszWmjG2EacWRWAg9bT34HZ0k423sYtgasFL8XjF
         1NVA3F+crYjnRqfR/1QaL8fcUbnO34f+1aex7CDqQD5QXFGD9rqd2bi9O3hWRMuerEG1
         8B/bgxOu5lxIIxp3hzAgbSdjl6qBVLYQfHptp3RyRklbxhuBi0oZD2XGheJQIzZfoEoz
         j8cA==
X-Forwarded-Encrypted: i=1; AKwUvBxQwzP76uUnh7g7Sij8Sle1j/EWDUu98Wd2dJ0idmdtvoNELizpBCKj0Si4p0vWWD6QoSdRyp62AYMnSA==@lists.linux.dev
X-Gm-Message-State: AFuF++lttnNzTU+A/1dVWUzus6Q5f74FHhRLWN9YosqM/u04NMo/Hb6e
	xR6TV/U7fgRg6I2pbwPm7PvfXTR4HJHLfkEYUQpOVEnjhi+WszdR/IN3rle9R/k22C+M8eUlA9Q
	ulqz1DFhaXaf4FfsF/qcSpaaFU9iLIt/zHK2kdec8hV6/Ua6WOIBH/W/dQQzZDbH4Xg==
X-Gm-Gg: AYBFou0Gfnzc8a02CiE+DUv3B707lurLXJ4KgEx0vvCiBIMEaXuSC7pVD9DL4RW7zwI
	6Nr3ZJuhux3tks58dwgACvB+3o2v4Ca7whPeaA2woNFk6c7fCnHqJQ2YKIpZjL2OKGAeAxaoh4s
	3GZhuttohZEb008M3Y9FeI9gZdBJMVCoydgyntw1BX3FdJkXmzGzVP4CAucmefBUpC96Uv7uR3P
	kyT/QBmcyxZQHZUbYAo4R3vpBq7Q0k6M+C8HdvPMmZDHBP/mnEK6OiCSghrgptliaTYFmq5b/Ll
	1jwLpr7pG6AycuD1WWALiJPMMBXiepYA8cdK9BEcNHRAZi/VecJwGIdvAMEGOsTy8Wc5RAjeKI4
	UyxF0fgVUUekzOTmJTRKpy6SSs24=
X-Received: by 2002:a17:903:9cc:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2daef813b09mr84025195ad.21.1788380288469;
        Wed, 02 Sep 2026 13:18:08 -0700 (PDT)
X-Received: by 2002:a17:903:9cc:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2daef813b09mr84024465ad.21.1788380287974;
        Wed, 02 Sep 2026 13:18:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:07 -0700 (PDT)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 9/11] drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:38 +0530
Message-ID: <20260902201640.2024648-10-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: 3w-VY_NQfS2oHUsAUcsSyrkY8xVw_hvf
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a988481 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=QbF1duAvIEq2M5YqX_oA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX66t71rgr53e1
 rXFckXmIua0j8N7yxVKj6UwWq+FMe9fqp3d0jMFfPiS2Wb1pPiQDoeO3IhbzpD2GZiZlP3L6V8R
 9cYEwbvibGkEmzTW3hHOL6biO0G0jiPSBR0fDAeRauCx62PY7hmztgFZOcgyl4L2YQHQWNAwMkD
 Fkm8DXgA+p0MbMGAHw+qVFXZuYsrnEBiJ2Io5KoWtcgNTd5iOoWQVIGIgBtTTGVVbkcZ0EFWEUf
 1tIymD7HyPGT11son7sqpdQwDntJVR/17APo4u12v0QJ7QuDbRbyHdgP44NulII87HI+3fmP3cV
 xGHLhBWWfmELfMnv6d8/HfsDAOn3iQ6DKH8qNmWw2uLrhyZS97UgLLrg97YzQMw3/R+21XgnAVP
 cHLvkOHeJMc8vftEBvhfP/e3AQow3EiBQk1aSIhCFcrUkeBjE6zR6P8UTRby47ngeiAkr7fhjbK
 pjjr+Sk4txWNDDWwXNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXxmwI3VwXZnzd
 sZhz2oNsIUdoazrDckmmxzRsrLVVh1KlOTcZ4ALPgH1ysO0MOId88LCA5XCDoZ6NmhoW61kg97u
 dvJDIjgredim2MC2QdxhvHAdXueqFAc=
X-Proofpoint-ORIG-GUID: 3w-VY_NQfS2oHUsAUcsSyrkY8xVw_hvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 53ab1a2a5aaf..e93a7a299b52 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -203,7 +203,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	/* Try the reserved memory. Proceed if there's none. */
-	of_reserved_mem_device_init(&pdev->dev);
+	devm_of_reserved_mem_device_init(&pdev->dev);
 
 	ret = zynqmp_dpsub_init_clocks(dpsub);
 	if (ret < 0)
@@ -255,7 +255,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
 err_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
 	return ret;
@@ -276,7 +275,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
-	of_reserved_mem_device_release(&pdev->dev);
 
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
-- 
2.55.0

