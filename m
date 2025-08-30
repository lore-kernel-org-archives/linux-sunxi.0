Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45812CDBE
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513404; cv=none; b=dd0UZ4aPrbux5Cp4Z7PWs7Ne7dWecVoKpw0Njacf1CK2bmQwlXV9THVSRIiTPglww8LjCf5poJlrJQPWqJMwX6hb0BzQCdlZiL4DUJmsrbV1yTcB6NVMMFxESiqtjdb2FIpbN1+mK5SHObgoHD5K3yOUcGqtoyHUYZA6013pp58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513404; c=relaxed/simple;
	bh=TXVbDyYy47gcECct8bi3FdzY5XC0C+uBNPghEtpGc6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAD5AjeOkLkaYT4sWuNYkA5t8eQ72x6eUDBLGxjf1SKp0LQqyEYHctucsFpXN3X1bRyEN/SrkyEbTat2hXntWX+RXiWoCSv6v1pPgsdKeZ2+4/nGpd+eC8MiMcSBEUr5HzctHzjUfNWlNZmKzZ0ncZNoA1P9lCJuQTU7y5pRe2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTwPRJSr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTwPRJSr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TNt071003230
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+gLmc6QIq1Gqbex22CG8o5k/mKnyADqk7w+J2c1oKo=; b=gTwPRJSrfbEm9ova
	UWH2HD2Kunhls692qcidzYuT+0FPL1Hut7Izk4SNYhYxkwYj+GAHqbn/DMOk6rHY
	K2ZaKRaLERT6IcpHP34r8q0BbJw8klmUbV9uoO1L1ZZQEgBQFIfFHz/AlF6S3Ljn
	O6kLlLkctUIDiz4vNXtDCk3LwN/z7sEDlkuRByJK2ty+F57Ab2me3DuDjoj4M47b
	3bFE8n63VRAjlacoruEGPR8gp4J42cRdkxk5f42RZXTBG/Y4PT+f6D7Tlr82DGlZ
	pOn/CG7TpV2vmKKK9PREYNtSi+ng+KFlag5FB2GhgKaJwBh+RxiljE10+FXiTSmE
	Z6mMtA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgpvm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dfcc58976so35919476d6.2
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Aug 2025 17:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513400; x=1757118200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+gLmc6QIq1Gqbex22CG8o5k/mKnyADqk7w+J2c1oKo=;
        b=OUM7izt9rDWkX5bAcriW2ftsp+jvCXLZ5wRJgumMsCRGHH1efwTgFcdoORObLMc2wa
         0sZhoiQm1ONaYPgZ94dTX/p8ECWvUbrEWK9WXHsIBMSPf4vT/B6fE61skfMgkGUWpcyX
         H8MucsRaidbZQycHdtBrfj092NQVdw0FpmnB83RigKzLqWrzunl9jvmGUB1TckN9t4MO
         xRJwKzttcztorNbYlBHYTmsFKAJ1jV/h1NpAWrVh09TXAMwRGlc9MFNqM237oqRM1gMp
         pcVmD5GvwK03UOUD3wf3x7JU9aOmlM3Sm1MBn6pEj0mZk1VhsCdz0r1IPyTuBLNrOlnL
         fVyw==
X-Forwarded-Encrypted: i=1; AJvYcCUF+DQ98P3hQxb+GLX/lMSth3EUtLK6ebTPfllb6Z/rTHs3nPFS4uFH1Bxx1iSvwhlvJxaJhIaNXlzWbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJvaW4lKuL8CBp6XHIylv2WJTiPmPQuaC/v4kOhT3zTVfrAtO7
	GVjdpPIc4Hugfs4TAvLr/bCZsWuT4tNT9mrnH5PorV9G+Rl14H3G/y42McKA3m2jimeYiQaeUtV
	L8Akpz/o3MnqmZ9HYmcMoCWjyK/3MaVSjT3g2LJqmd65OOsd3AlRqXLW5cVYTU81xQA==
X-Gm-Gg: ASbGncsXplFgGz4kYG2YCAkmnXNFfCpcnf4jVtKE8djEYJYFqaN4VN6lBsKAXBktiGX
	+78xl8y9aaIHoizl1sosiPbX8DVQ7CnVkQheGwAtIBhT6uVsuzWfCZYuQh9WNATtkVv1jIYnke6
	jgUiAZ7V5bAMZF4tKAFxkgU3vf2+2wZyWjKANK8mNRzJhjp6OE3UY7L+x1oGlCM2Y0dLv53uDtK
	wMsPWQHBldjnRsHlRZx5pLdqWMge6CallkyQvR91e9QATG4Oh4z4xqx8glBuq0tIiINpEIkaYu4
	ZRlcdpuAnoT+f3PPEPvvohmKpuBWj+IK7YRCurZ2U9U15Ok/n814z4OBXAWRKJJ2S/i71VsguvO
	1wi2q2OuezASFhRK2tB34dhfspdVhDBtg7bWFBfbXOfutnboErLZq
X-Received: by 2002:a05:622a:98b:b0:4b2:8ac5:2588 with SMTP id d75a77b69052e-4b31dceda5fmr5331971cf.79.1756513400286;
        Fri, 29 Aug 2025 17:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiRVPCy1ZyvNRY0SxkmPtK5TdJ45H/D+mdd/nazOG8FE/zTJi/BBm8Fy800I1NQMGrZsr0qA==
X-Received: by 2002:a05:622a:98b:b0:4b2:8ac5:2588 with SMTP id d75a77b69052e-4b31dceda5fmr5331431cf.79.1756513399780;
        Fri, 29 Aug 2025 17:23:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:05 +0300
Subject: [PATCH v3 09/11] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TXVbDyYy47gcECct8bi3FdzY5XC0C+uBNPghEtpGc6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRkOHE4fVow7vDWOUvmc/2iUcbcfIOqvZ6C2
 Dchv4veASeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1YnWB/9HjDIWWBFOTM8HXaStc63uIk6SmVdJldXZsyniEFqPA35U6pxTvz22fY4ZqbvckumzrhR
 VzHrK4EaLNdvGVvpvzCqVg+lao3Ze8t/g8dHlSQUGz4uDNF9caS3kvpyqdRe/6MHFM1r3HC0Du+
 GKwPnh9RgBqznt7b/zoa44AB9KtgP/9LMftD22mQowgMWto5XI1N0Y4cPb6TL3PBmJkmQSvi63B
 fiTBoU6l5res5/vH2RuIug1cMVng+2t8eompix5jbFUnr3t9cm2f4SNOuTUVo6JZpap7J265oE5
 IBWsjZfpSptNolCOsELssC0lCC2aPYXd5tjx6jp63ntEd2vd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: a_jh7EcqYdNYUSr4VTaFm2uGMMMoO3Vc
X-Proofpoint-ORIG-GUID: a_jh7EcqYdNYUSr4VTaFm2uGMMMoO3Vc
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b24479 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NnPSNIktjdB4Ge1gQTIA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX3K3azx02DK/1
 +yzzsIJtqSXFpqOWG7E+31qVgiQBWGN81SQvqBzJhssTXBEksbSCHRsZ+/Fsfm6UIgih3Cb2rjJ
 tj7OLpp8nWJV5oUHgIgSawcqAe7XxqAAGzN9in1wbUmIfQdGRv0JcImKUWsS6ysPwQbcTlOQ3y2
 EEUSw3ZjeaZRcI5y5t2eAr25qRPo1g7UEegjAvpjoh9FnyuN/iXqvcj0gvJrSnXTViqt9X8S9zL
 Xe4wlBZ3RjJi7wz0qNbHLb9uC/KL8dXmBuAj2Sk9KlcOL8Sh8gKwCYumxAev4R/ussQUTjF09jA
 JD2kklFMyxiQKAEE1tHOWD3NKNP5n4Ka5zpheZXGw0QaNVBv2ZGO9zMxg9Mld33SMnYKe1V7xzK
 60kjhsOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

Check that connector initialized by drmm_connector_hdmi_init() supports
AVI InfoFrames and warn if it doesn't support Vendor-Specific
InfofRames (HDMI InfoFrames are more or less required).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f031e8f8df57da15bb0f8fe21fd62f02a1576ebe..12ee06bad364183ad56a20b2bf9860491913a295 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -582,6 +582,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     unsigned long autogenerated_infoframes,
 			     unsigned int max_bpc)
 {
+	unsigned long supported_infoframes;
 	int ret;
 
 	if (!vendor || !product)
@@ -604,6 +605,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	supported_infoframes = software_infoframes | autogenerated_infoframes;
+
+	/* AVI is required */
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
+		return -EINVAL;
+
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
+		drm_info(dev, "HDMI conneector with no support for Vendor-Specific InfoFrame\n");
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;

-- 
2.47.2

