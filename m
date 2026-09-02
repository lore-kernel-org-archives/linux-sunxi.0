Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E142E410
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379687; cv=none; b=o5RLGB3FZKJjf0FOvQp1WcPqwALHsgTbHIJJItp0C4jl182mdZg+8o2Um0GmaHXDDINoImJ3rTVbGAY8X7QcCaXO0QXFOhMrflnfAjblvtSLq/FVNQGxBU0gq8O7M+fe63+swJwn34NUWI9GA4XZjvwiEBsl2gNJIAE093eaqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379687; c=relaxed/simple;
	bh=7irciqc861lyg2o5ao1Cr0/B5JpGbM206OChW/MMQ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYarvw/uusB8GDZsaabLKQVtU1f3TG12IJ32vFiJcX5tKE3IGHmYTsMwPkPUU79H4y8sJcgGAluURpo8Jj7nQAHC7crdldNYPlSmOr6ItGmTidECzdDXMLhR97dba7f5PkwHVUHg+abj1xfamTVVzFcEqMlAxJxc9wN3nnPfoJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tz3iT1Z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cfyXNEze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tz3iT1Z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cfyXNEze"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqsHQ3377582
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V62NrpgUOu9
	gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=Tz3iT1Z08cE3L1Tsg6uwOfDDlUn
	OlK172bribh74PRXIRNSvRLnJcuTmAmGXtzeJq5+oXtGDt24T0SgWNFTKMUvsN2c
	o3xyvGkqECHDErCIEqxM99+VAwarBlIDHogFfV74HBGoCmSh/+CnU44qEFsEgMc0
	LpF2U7coKzkS1YPs0gz7Hbj/JooKnj6bCPL8V1vKhdMaLff6/5fMHjACVdDv2QJu
	tO6X72JpKItRX+1tQrpTgNjGGbGiD905GrptgN/0LH1HTDuNsrLJCjw3enNv9gfP
	TCtWu6AsZWs5xIO4Z0Gu480RmSQw51flp895ecr+MPU1PEDsQtnsH27/A+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnhfxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:08:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94a158dc8so23349555ad.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379684; x=1788984484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=cfyXNEzekvn3OJLCZ10njZx4oTE6nAMQIhdx12Nj5hZ4NPZ7c3pVg74I53kkL9Q1Ep
         8XvYdK0T7lYvu8DPkJfVPhCV6XXwLfbIUfRd/u4eJko64eR4iYpODhxWiUaa1l3XWRJO
         cz+DuEAtqBV6aazorWFbTYFlgOwJpMNA4HPu/q0uAAJMsoxj8gc9tg7Rp656+yLS5kyk
         c4zDUiv2BCZUQGR9G98wfNRmacNNSQvK96aHmlBgbPE9st7eMNHbl49F5BdwH10kDzI9
         jQkyX+G7Z7CYl5XsbmEWUKDXW7woaf2XOqmoxjNgCA7P/y0mDPLTmlxluu/mZBkpXnz0
         U4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379684; x=1788984484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=ViRAA6qwwQKSLWlthxSl1FDzyRLcoj0M87c8xOuiAHZ5tkjl57IwcDWihb4pyCO3s8
         1aKcGPhX9VUG+sYrFlwjK5ubq9k0/ZN20HPTNAGJu6rd2dtjGNG7EKIBuWL7CuCofGRT
         wlZgwPyOUc/+jh0zERUFDuE65BLUyAf9dnPeb5sX6/zkrwFekgQN7hdHrbE2lwVPJMSD
         88yfNBW66AOhn/PJCzkvgic/lsQqe+jawBJj1VM5hojmAYw2jqk0SdhQ/v+LooNGv4Cg
         MbqwT2wSbSjhMHc1ZQdr2eBxyEMznAkEz/0CWWXO0zsDfcLZBPQ8fEyUYchJeWB7Ayss
         mJHg==
X-Forwarded-Encrypted: i=1; AKwUvBwpc/zP9LmhN8FZlnwEM0NQYJB15zqte53V90z82fRE34xgVjHT2gvCA66hFLoJnxcirOsO8wnc/v9Jug==@lists.linux.dev
X-Gm-Message-State: AFuF++mp7B/OzD0mvV44GzVKYojJlyOVu5dWDGrrF4TGlikFzVBHQ2zG
	h6abjhrefFrFhTSvyTPAAiB4AvRI74RkFhC0x0HCpg9vtVpOFksNtNSVe4gSQMC5J8N2x9N5idf
	BO1qtct+c+00sfzPPkTuXb4D/q62uVl8oi2CCQkIgipXYAqP3R4GJQAmUpQ5aW0br+A==
X-Gm-Gg: AYBFou10Pbra6EvJt/W5Pg+AfvZgk5aFtVCyGvW/9YyV2E9zq92N6ELIy6QZVh30z5P
	s8PljauZyJZmuep+3tSEqyhuI6yqASgeCrPNdnuALHqxWlP1Ecp00BjfD+MMj+G1MddEPIMXTf9
	xBiwiDUsm6di6FzbL/zHs2MLrDYOH3VIgTSPDyfoQrt1aElTV6x9E7VoHTQUMRD+VT6j4yFReDt
	zzuqswJTUZRTJtIyG5v4M0U6DyzuaDq3mK3Y0i6N3cY/Bg8/9NuK3e+J3++AM53hMJlDdHbKRVe
	12wRMhvK5+IQsRVbVWPsdN1mrX2BNA3+ewND+mOU1U1vVsmDPBSsou//7tJ5Al8Lxo1uAzYTUIy
	pNttyODeUsPAQb6k3XxQJWB+lRtA=
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445895ad.4.1788379683913;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445245ad.4.1788379683366;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:02 -0700 (PDT)
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
Subject: [PATCH v2 4/6] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:01 +0530
Message-ID: <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: gXCL1J_UMSPXIgOtwUOaEyyxu5CwrErc
X-Proofpoint-ORIG-GUID: gXCL1J_UMSPXIgOtwUOaEyyxu5CwrErc
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a988224 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YVK2hjuZJVh9DdmUNrMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXywIRKN5SbX5M
 7URzOCImIS80gsX+ScyxGAO6urictv22rcLgiCBu907IwQKrmv/dcy7oLnMp15F2VPK6X3m1b9S
 LsdvXfpztTSPRYOiRnvQ5zElHYvIez2RLxoRMASqVOVezpAHebovsSvbB2vtlZlhEs2w5Hle6yp
 GmV529rJqvtASyRQ5ULAK+xV1MfVCGIaXYfhKi0PJOwzYJ+dhX3XLz6qh+dmcyeSmF7rWp2ZW00
 PwdZF9jTa7hoaGittVtRmUdWoGOc29qLia70jUiKEof5lnL3zK0ZxA0X6n0u+UMwJmzuR+Ix2P1
 GTCEQDVtI3RRq1Bcr1aq0JTeniBZkh8F2bgb5w3QsV8tBtxuki6/Hl/NUJv/gZzlV4MmZmVrGYf
 nZT5OIltCWE3KB827D9iERVU3yS0x/XYHOikNLumZUy5ZpOJ34AaqKt3UYaVYDqn1I1gcAATbeV
 wZZwQTExW5RXhDNBxmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXzxVzWyd09tV9
 RDSYCgfTILbZCdR6jh+Xlfw5JiKy2KrzbO/mAdpLif3YLiow6xwJxeN/4tsD/PJnUFb/Q5kau63
 P8IDR6hr108zJVvhxoKptIRsXhQ79Yk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..3d37cd446583 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -803,14 +803,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -849,9 +847,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -866,7 +861,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.55.0

