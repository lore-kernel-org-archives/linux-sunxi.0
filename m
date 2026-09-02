Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3047ACFE
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379698; cv=none; b=rUzvhPSmuLm8zuZ0yA7go/Vhfgug/Jk+5BDE7z0Hm2W4koUX/FsJ9xradisuLrHSdY+Xg4zA2sAWtdNOd19PCRdDwei1z3+79bbeV4dXWULdf2eWKdGAeldYTzIQdLQSOuCGSKWai2/DMCX1uyfcbi7dzG2n7coFOpaxIEvverg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379698; c=relaxed/simple;
	bh=C0TvK1tf0KLvXbbBhNT8Ocws0Ga9btnZtn4piTCQI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UK+cCf8j7sTA8E/q4hIRxCwhWGZ2ehe6KiI3HnkIQm8gG58IMC5DtbrXTbAwypmFjUm778wHDmDp2U8clYHCVk6PQu828HO3Xsfd5leF8FV+D6xhqza7vEfA7l56vJOIxjLFpsnyhCmchnTMe0SHvI0bCTkP/rEhiqHvF/v+HZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+qVvV11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPZ/4Eik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+qVvV11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPZ/4Eik"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqvH82104773
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iYuD0uDqzSw
	HU/LAQJijWaTr64DX3VL/giE1/pE1aNo=; b=M+qVvV11pixl6KhVG9hStD56ULl
	HhKND36J+s25d8SnWLfEnCsAY3W2C+ZhwEZvtp7qAul1VrhtgDfrrq4DaqJ3ZzU1
	z1zZQu9vbVN44CrHCtmJU+rAK+B1f0vMgFdTAr7FwMGklBBSqneXiL8iZGWwEqXh
	UKPvlcpUK9dyrnYdJkNRcw7esBUv8iKEk/AQRSCskMJq0bPHgq21fdTbJ32poy2+
	nMQeKmQOL7itoHtqWbqTWimQkXWx/kGoao7+tLDMxjUAW76/aGKeVdqzanROnKgS
	lo+j+Cfv5Cx+MfNlIJRB/dUJu9xj5DWvLtvOl+rDuVSDntH2ZqBUk0bbQfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsdt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:08:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so2061669a91.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379694; x=1788984494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=FPZ/4Eik1Y191rb7YNBkMrLCPGH/409GZYGN6B+QBQvMrQMUxRLeomH4a/hLWdgh+X
         O/xtwNKe4tqnQvdKcZU95GvZ1wiCiMHG+ji7xgGipGmfkxY9n8ufVDDnzyLHx2BsH3g7
         eUE/GG8qMKqp7WePyymV2wWBmDjNFdDdGFUliOah6M9v4E17YzZcQx+r3rb9iPYsW6X/
         Uyi3nnlt5HSljV1tKatboxivpqzRipSmyqQZGeVlXESOPQ1h/Ok1zN92IDqK6jyaJU+r
         CGrBUMK9cWHHXsbaGgp+vjBMMeCVDQJ8E5TQbcXJzRNlq4DQ5r8REII3D3EJoYCRdFS0
         lKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379694; x=1788984494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=roUGCRoz5KxXQ0DtN/mk96/ibDc68VaK6/mCUwOzNnwdLRSOL/1t731O/rVTeQtm9Z
         g5dza1JDgCVvhchUeZmTtJisEM0YcM/vxluNyv4X/4ClbjVJ0kKZeEpl20l1Rpea8Pi+
         wCbCFUx6f5fApEJaBOpt6raoas7hu5RzBuRk/9wBveyIcc8Y4Kg5DUYWZNnch26YW+La
         WfDyReO0bRnai1pDmptfpkfhi9WuZ11QHefhVUazM2cs8WY/Np+iBtzM78kRqTs3jOA5
         bh1ydriMVTYD65/2TphBL+q/fdg/mxr5AkbWq7sU5Xu8UA2XEpgUW+OSTlwj2msIenlz
         8Vdw==
X-Forwarded-Encrypted: i=1; AKwUvBxWsfAnyyMAUhBg0WI0rgU26fY2Pa70MOWm2ORK3CUSdUE6Pt1r3DgFWez84/PFPG6rKV5dY7yxTpYrjQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l7SGLHaVcK51K7LYEiekMUsTZu20eEDBDABxZZSuaV3NTeGidj
	11jnFXc9K8YALxcucSQq4CvGXMRrCEeXPIehWAEmWLKK4Pj33EZ3QakBJcVkraRiyvgUC9H3Izh
	gIY+4wv/aPjrCF2PPzyn6rLvtAfQbeCTcIUvenlJlKypEBSeH1nI74VS9xvJDKvwDqQ==
X-Gm-Gg: AYBFou1Wy48G95B0kT2eQr4a7/Hyzx/dq73A/rM5J9y3L5Hwh24sl0W0k7DC0MFL8Zj
	nOsiDn0ADrbWRAbVpzFL4Fwj7gSV5l8vt/c5CVDU7zNW6DrjZUkww8F15XB13PBb5XNMEkUBf4S
	XYRwKwuLOhvg5178sJIfe1FbXtleLWS9gxFav4uqk5sOhBG3qUlWuBVFydshLVqSTDppUtpphd4
	2Xs7YnszKjDjyEFOBrnXTitTqeThc0FJ/qT/N9GIJz9uXMHuYguR40LflRmTnrUCHzwHmexsnTg
	TKJLTSebY7Sof+9EFlzSopRi6GrWcYhrlSBujtsFevWfdjRUGHOLCNrqtjC7LwvioKgCW2eq/nh
	8lPvmzKDEDgxpeMSJNMiqe6lBMFA=
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811241a91.3.1788379694176;
        Wed, 02 Sep 2026 13:08:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811125a91.3.1788379693552;
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
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
Subject: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:02 +0530
Message-ID: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a98822f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wC0OwQwoyMak49iRU1pBzaadpr5UftXj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXxTsrq/couQYE
 /dO6+Da3YSHt2E/rAdtRgsV95r0/s/7OYU+sRh+wJDfiNBuFS+Nh0dkcz0tRpI4J3i6YooiB34t
 unTnjmohbksj3xdgUKkUZqM6nvuxCVwMwpkODVI7jk7FilGZ2+dQUdB6bWPlCYfzb4UMg7F0reo
 ACygIz5zXB12t2SJObgFOMCfiMIk8xsPzz+p8WOT5IKzvLQmPlO4f2NXEVw7lBQQju0kJ6CO6Np
 RaPekFM6BuwADqE/bbwMv2zXmhaedX+RP+0emJaThvpzHNAsC8Jfjm7Zaa0Fw6uyqmp8fgOR+nw
 zQXhRwWdhgnG8Mo8qbPZAHIqWOLqvjFZkWBHu1dON6kkc9FansnXyhf/pck95HFQz31R51lswW1
 RgMGehl9PEMVP6k0y+fGnLLaUcoKMncSOGXHMQthZgEHUHTv0S3cgpST0lW7AjOUMM2Ui1onyl6
 qs618FVyvjTqA8vZFhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX2eMtqqNpEdLa
 OyG4tN7iiA4mo0fr3vq8ZVlgXdVD814sM5PZxN5v/qHuZQrL6lb2++6vB4GPFd+aHnKKUvKfHoM
 I5GW50elS8hoPTtmSnt4I3SHGUaZCx0=
X-Proofpoint-ORIG-GUID: wC0OwQwoyMak49iRU1pBzaadpr5UftXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.55.0

