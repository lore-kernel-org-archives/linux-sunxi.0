Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ACE3F076C
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380258; cv=none; b=NzpAO0FCsEclNKMdw9LFVGYsGaHOATvpwlvHG9G5BGXhEp9O1IrKvAAySgp+wmshGkAg9JX7+ikQXqHT+A7B71yxJVT3qJAnJQoRE6iLfGMXT5v2MIlQDPtEyxXQcwaRpDVa9AgfFW7ktRyhk2Jlqye8DcTNjcPEdAxgob4rHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380258; c=relaxed/simple;
	bh=5yT5XBjqsEv3D8HNbTipP9IFk8BDzIAWoxf+M9L+UbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXMaxUEc0nsk648hlloYtM322VYiFl4QHoN7D3SvW0zE5vVzTAYAzapZwst8lpSY5+T8+YxwDYK50AkZzPt2DW+eXlDTOE4Yd5rNJlDquD1SK5LuL4NXZKqjNPZPqxWEkZvTY5sHvZXx5gfyu+7oftpidYMktaQRCC7ul2Z6Hw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKzTE0q9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOhJzx6Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKzTE0q9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOhJzx6Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHC9w2796901
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fJookc6jcAF
	EyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=; b=cKzTE0q9kggbsu9YuOq1kAkuDdR
	YJhvVN+czMppY1U0nol/0Nu9eJg+w/VFZzYpLp6tDgr08w/mOjZzQMor1M5ZJ43s
	aqFqFF8zPGXQ974shwBrtJIoDDhkVNz9CXms9H9Ur4Nh5EJh3egmeDqIa8aVm3HB
	f7W+dmLT4Bpgj5WrbBijZpdzHBScjhtTOCpC5WtmF8n6Kg8j3e12752VkYVhsUAV
	euJrXiqfaKFvPGVbkivLLcukuLJ4/t0MfC0ImtQmBOwomB4h1Tyd5aDhFDADBn7C
	wt5VIxwjnf6q4IbxY62WHm94TJBj9F6OQtfzZFVnS5QgaNIjYXnDEWEc8lA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9qaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:17:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so2660251a91.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380255; x=1788985055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJookc6jcAFEyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=;
        b=hOhJzx6QjZYO+66l7KEUmXa6Mm3xpUqwdgcwaVHnXE6yJ3NW+TxUwp+iEdgXVn24Ka
         GgGB/XpXFjdC7DEipaWA4r9JLZS4H5TtpZXvqTFOjKULQV8NGlGNAlMTClYK9R7JCmz7
         l2P9uZhgQRW1XHF5p6uCx7xepUkzQEmvdvRPSVGvL3x6PB5UwSKJYUUzTCjedL/ClMnl
         FRTX+l8Dm+e3oq4A679nIIOC+SZgCUQdiKfiXC2siT4xT27rXqdFFJ8ZGATPLPX88KfA
         FGmrzF+hWonWEhc/fHsx8NAeva1fkJC7ydSPEJM3hQw7gXmvYkvYrKwx4zRVcbF/SBvG
         y6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380255; x=1788985055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJookc6jcAFEyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=;
        b=cYYitbRUkjARmw7kNYiRJIp1tfGHzzO7XmuJXbhkjKh7R8UNZ1nDB/18HQrbHIIPbf
         BwUIBHoVPXGnFIacl1wKn/oNfG0nn9B2BESXe4c85PWAwQBuHIT9ES8fd4LjlaeiHv1F
         T+rPsB43oh5hg0swVA4wJ3QdZ16odM5szVcVkaoUB+DKmw2JrP5PQuMV+2aaleCOWjmN
         FucmpbBtBR5xBUSagt/xTduBEFnlnayLdgFBoFgwCNwkGuZtbKO3Lru9vz8nP2bKEwkA
         3KxdNroAV8Xo7ULHhuY2PzjTmtWYaw72oKzQzaD3TFknil9jcz/czapjFR57H1LEjyGq
         m0AA==
X-Forwarded-Encrypted: i=1; AKwUvBw0/pvCdeY6+2LJ2PJllNOI8SoDKCqA4UOWwAlNbAJgKop+jHobzMH3CTxg3jUBzzqRcOSdwD3kzZYqTA==@lists.linux.dev
X-Gm-Message-State: AFuF++lAcLf/ci6aq7VOecdMF1T0P1lEeg31Jol+/G6HK8c2T53xLtL1
	/mCtvJMTNaT0njD8fu4Clt3hq+QyyAA9m2MnuFvoC/GZHErO/BGs64jwH9vUw8uvpz0FAM2kNOa
	KWYtq42RCfpyiVUm8fMd6czsNM8hEznpLi0YZhWr/I0VUuVq1FLxKlqWRSDE7NlOzWQ==
X-Gm-Gg: AYBFou3Eku2Y8BgTM9fZuoeSY1L7urnMayPzGvtTUbQjOslVWW31OKqFnWTHveFRzFu
	ck5Flck/9e3pzRf49ZX3n8sVcS0OU3302MzW9A3sbCQEQJOPx1n9E4W8dSElTkKr3nSzFqb5kys
	87Dx9oVHIp9sYLyjZgPYJHTe5yYQPugJvr08nDzyxQ8GyQ93s4WBdu2G5ncNwNUqcXc2eWr3gHQ
	DUZzT3PGHIq+fxhrnIn6Uzc4otLXJh4dI6EmLS/dfsz8Pz5Slt2VSU2KelEVwkZj8uLr+DHiDJx
	PLUP77N+TtDpwHBoyyGy4+cRTMoCY37cGLCwYPuO5dcxXg+7WLiy4E1qwhnqmfuCBM50gVyBfui
	BmwSfNQ/3uhFDEbdV5rd3P6ORQrk=
X-Received: by 2002:a17:90b:4b0f:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39aee238df1mr8817762a91.21.1788380254758;
        Wed, 02 Sep 2026 13:17:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0f:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39aee238df1mr8817663a91.21.1788380254041;
        Wed, 02 Sep 2026 13:17:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:33 -0700 (PDT)
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
Subject: [PATCH v2 5/11] drm: malidp: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:34 +0530
Message-ID: <20260902201640.2024648-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: FFDBto1HBhXQguIV50x-xMwM9k96n3ZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5e2ypKOREmvS
 ZEBOzlUSAfvehfv+/Iq9tT92iAbNqxiDKsAWgoywM9ECbNHNcmOS8jAWEZGZJV7GFX1dH0Irp/Q
 +ua/Nh26ZQuzB3wFUPxIAQAhDPtEJpCJsrzkfsNPU/EVI+1W7qpHLannFYSmDTQrHeNDlnycBUn
 i8JATsIOxdAbZ8xpo0n4Se8l2Gu/AUIk36j7tN6hVrTemv0VYL7bR5zC4RLMEGXFJKe7Ukslw/8
 n9DENeg1I7dAppNCeeeTGiuoyUaViX0/Ce42Q/uGvQGfqxhkAR7G3l/SMKXVuRvCA4SxvCKjNP/
 rz+23U5exb3eCAVvyQ+rZRBlVMVNHrkPeY7+rE3MJFvn18ufzAiuq9M0utKpsnmRhn9DqPqfosS
 lmQ6H7cEa3yuE+vpl0ZRdQGaKHnbnyBSkZeTyJreBWL+dYpKGGdZaXagTYekNzM0C1FQVLoGW4E
 hNXmAsgxyG4U8NeRc4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX2qbd3sZQ/0zN
 M/h1qj6zyLnyUfDv2klet7CJkGZshBINnLwX0V6IabEeaATUwJdptuSJlc7KXpb9OpgZiWVAY2w
 YDBq7zYJhQv8AcEC10rJ0ZvCIjiLC7A=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a98845f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=JOjAg5lxkONN77W759IA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: FFDBto1HBhXQguIV50x-xMwM9k96n3ZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 23fa942ae4bb..3e17513c3114 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -758,7 +758,7 @@ static int malidp_bind(struct device *dev)
 		return PTR_ERR(hwdev->pxlclk);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -887,7 +887,6 @@ static int malidp_bind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -913,7 +912,6 @@ static void malidp_unbind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct component_master_ops malidp_master_ops = {
-- 
2.55.0

