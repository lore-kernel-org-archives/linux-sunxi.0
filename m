Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927ED383C6E
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380224; cv=none; b=OYT7unHemCLTe0WxkifbBDGOZa7o7m56Y/vELmmN/zRv4iVwGX4SwW2ch7ZtYyUVAXQt1E3XGL849A4Mv+5jR4W88rF5uaojkjnF0zqJudHhpxckITJAEToaJ2g6bNVJo9jVZGGYZsXkjfBC5utVQoQHkNFkxAOADcTbhZUDnSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380224; c=relaxed/simple;
	bh=cHMxNGmj/98vRoQHbpOwRpNqylCQwBoL0GeUiGdn0BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTOyPjGNW91Y7TB/mGXICACQRWAzyd5+bc/FH8I+SLYlccMTEUQF+VF0ptJUNlMqHba00BXJp00Lt0PZped+Rd4OB0kxaIzmTxHMRZxI/ANlZwQ5tnwTDnoPpxB4ZZ7Dg2SoP5rnz6SgowOk29D/+/nJRKZ1bTnNMYQxAS2N4d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvbVC+q9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEZtlWP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvbVC+q9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEZtlWP+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr3bj1714422
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AzXtSV/WWty
	dTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=; b=CvbVC+q9kQRRtFSCnNcyzsAX5tj
	yTWXuwhhl+7w/PCwuugp+uPc+vbrzE7anfZtzqn3uf46kLo72QjQf86fmd1F4AHh
	YZz5UIP4/Sl0EbR391MOBU/DWnz+wNtMd2+J6UiEf06DeZJ9UcSFFesMDBHrLTuo
	nyo+CJtNOEw4++m2/oAxc2OmlDoocqY5bhZkHlq6VkXFFqQrcYA3RFW8MxWkdwy5
	u4Daiw3zhz6A0Wd1VQbtsPS+efAub9dHQaYctpfIgSP8G4jPWB0Umbn3Ul2wHZvW
	Cnp59SwGnFPZwPQ09iNce1ycNwr4B7tBac3ES/O25zXm9HWjJ9tn9m4Zt7w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9ww6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:17:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1870717a91.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380221; x=1788985021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzXtSV/WWtydTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=;
        b=XEZtlWP+iXfChcj8Voi3L3NyOUMnDACiNytwZt3v6SMRN81e801M+FJlTmg0TaZ81f
         F+VzUFTyqEdozy74whywrrkLiHRQRUFnKyUJPVwCgem/aZGiSM05Dv4RO743b9dRqT1t
         lzU4DzSELipF17vfvghFtztO00LP7PiZDDCVf9PYdk5traIfAcPZAj23RBNTwXhsQ6Ij
         7VlehPigiSlJGXVxIcKVM8gcc1t8nhEMJ0QO/UTDt2kEwkoGn++lPlThBTlm2R4t2x6C
         F9run/9YZso3ueMVPFB8Upp/xwSem9HnTyCw0x6pfsBXGzOuL+oua2J1+jD/cdRbHBEP
         hRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380221; x=1788985021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzXtSV/WWtydTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=;
        b=MjkMdOqIHzwI+6Q3ZVNyKoeTNLfUGABfKK9H0rgQo4hX5Ryq21FIR16uj9EqRWTMcV
         C8bBBz04wFrewb5joe0/0vj9lXMY4QR0Y1cpJhbktAvtEWGyEnNflTd95i4NCX97aTXa
         LWIbgJmjYq/MxolXmL9yLEhS5f/vboS/S1AmqU6fUFn/wO0KIHcsTyoM1a2DO72wrvdq
         0VKJjhbWdy3xmVrDMl+TAZZ5+TQ5K0wonUvHUHBTp9lp0klvqX5DZ79CBBc4WPjQVB18
         1NlEGNjuk/avCAA8anNDZXiXI0k7yJY0dlIm89V6qYw/WyzntGKu+CMzbIi0osdxbzfm
         4Ieg==
X-Forwarded-Encrypted: i=1; AKwUvByYPHFllRIW9yTWgojMUbU/467KONEW2rdCeOXrpoYpKP74IKSkuUAsKMxPWE7a351rzUqo6+VPXgcTSg==@lists.linux.dev
X-Gm-Message-State: AFuF++kSUMhE5GveBlNQ7zMmWe5hT6Yacx9cUi93QBFbRf7XIG0fA8At
	QE5XtzcNAe2Ttiep4TdZlxX25lj+5BTe2rKpBzNn+ZsDxSsjVVetm6cuyb3lEXec21P8kiIq7x8
	lblOEwDxuBhVgX1fn35TMIMoEDkWb6Ux6DKBwkIie+4KOXqlgkCPXYbMsCfyWjvApVA==
X-Gm-Gg: AYBFou2SUytGVRk8btjplN0sWTcr/QDXIEQ0Tg4RIZhsOcpzmU+vJ0qqeSo9sg6AL++
	g8hIT+TzTRcmQgcBoNFjTMQzaAL67ULZ3AsYiSSudkwISW+j1wHmH4OkyTFLMinH5LTLHGVNJsh
	cbIKrfsccr5fS8VepHu+kvzHeqCM9sou4HCEsRsQw24V9e1pysE+8GbAKpCLZYTB0L09jsMiPkx
	mqgja22scwjM2URuRlPXfV2FCNgGMGjASzpZ+jVlg+1bs0klz4NfYdT1AMA0U4d1JvrUZU1Be2I
	h93D717iMJKLnrwjaH+bk7EQXTIOZ3CPl3b++/lPxTW3svK5D42gZ8Gk5BRYIMp+ifZJT2ANFFl
	jpyczoXd0PtcyjgmVTyAWOR6Q4dg=
X-Received: by 2002:a17:90b:3907:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39aee066e04mr8860747a91.14.1788380220860;
        Wed, 02 Sep 2026 13:17:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3907:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39aee066e04mr8860691a91.14.1788380220414;
        Wed, 02 Sep 2026 13:17:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:16:59 -0700 (PDT)
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
Subject: [PATCH v2 1/11] drm: logicvc: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:30 +0530
Message-ID: <20260902201640.2024648-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX4JVXDjelTuAy
 gyrtwtG0BiyDMIGJ39o4oUJ7PqgVKSuKywCaUzpcXAGKXVWRN07lqzbxvrAaCawJdTysewmD+Pb
 /V2bM70jGsfCURpJDTS53TzAIbl/BNmQlZgE7eIYvGICHtKhuU+TTLUtwJpWDVpHTpCewHIS4ad
 UWssY74/fY19x95QGfN4EtgE+i2MBZFjcFtdyLEfstquypa3Bg7v9gdiNReouwzwGPBBDNTNNcg
 1PAzEnwPOXSHs1BZtZ5CrNjG4HlbwnUim7quXWEOsGtl9M+fLO0Oo63os9E/aoSpzM7QOZXomeR
 nRqgIQ2MvQPTPLmCpDTUJSnZR/P2llxyJlBVB7mMOu1twUpc4RK6f8GN1quklbr/gPPsT1Fhh84
 +oKxtq21qNOlwYLuxeFk+bL41Kxx4WrgC6SrMMDmzSlcS0bTIGxJAgP6iJMI/CZrsWV0ucqTfZX
 z1jhSLxTPvAG46Y21OQ==
X-Proofpoint-ORIG-GUID: WFo4iy_CsouVj9v5aK8b4vXNcCMzQtmS
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a98843d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ReI0EElcLHst8dYcsfAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: WFo4iy_CsouVj9v5aK8b4vXNcCMzQtmS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXyLaD86a7hSyn
 T37g561h3u1iyD8DySHAwVieKlhvKqE53j/ANRdwtnFr2YXS6idXfX8pVPGKiUBSYdSwDeVmtyv
 vEywxqoqfBVo6UREtzADZb5mAEkURNo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Replace all error paths that jumped to error_reserved_mem: with
error_early: since the manual cleanup label is no longer needed, and
remove the explicit of_reserved_mem_device_release() call in the remove
function.

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4fc7f51..d6dbe52ff0a9 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -306,7 +306,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev, "Failed to init memory region\n");
 		goto error_early;
@@ -327,14 +327,14 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		ret = of_address_to_resource(of_node, 0, &res);
 		if (ret) {
 			dev_err(dev, "Failed to get resource from address\n");
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		base = devm_ioremap_resource(dev, &res);
 		if (IS_ERR(base)) {
 			dev_err(dev, "Failed to map I/O base\n");
 			ret = PTR_ERR(base);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		logicvc_drm_regmap_config.max_register = resource_size(&res) -
@@ -345,21 +345,21 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "Failed to create regmap for I/O\n");
 			ret = PTR_ERR(regmap);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENODEV;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc = devm_drm_dev_alloc(dev, &logicvc_drm_driver,
 				     struct logicvc_drm, drm_dev);
 	if (IS_ERR(logicvc)) {
 		ret = PTR_ERR(logicvc);
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	platform_set_drvdata(pdev, logicvc);
@@ -371,7 +371,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	caps = logicvc_drm_caps_match(logicvc);
 	if (!caps) {
 		ret = -EINVAL;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc->caps = caps;
@@ -382,7 +382,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	ret = logicvc_clocks_prepare(logicvc);
 	if (ret) {
 		drm_err(drm_dev, "Failed to prepare clocks\n");
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
@@ -450,9 +450,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 error_clocks:
 	logicvc_clocks_unprepare(logicvc);
 
-error_reserved_mem:
-	of_reserved_mem_device_release(dev);
-
 error_early:
 	return ret;
 }
@@ -469,8 +466,6 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	logicvc_mode_fini(logicvc);
 
 	logicvc_clocks_unprepare(logicvc);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static void logicvc_drm_shutdown(struct platform_device *pdev)
-- 
2.55.0

