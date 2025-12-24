Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205C226FDBF
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538248; cv=none; b=e1k1Rnb94EfRIMIzdCB8JmWDdAjDt7N6eb+yny/5pJYREMIIIYxeoO6wbcC33I1SLKG8ZO6r4e0nL5VW71lF4Fzw+NVCU9w2McpXCbncygoekB9TiF3cMQRnL2aUz4qBgp2DTKzkGkGWs0LfsogK8cW51oFkYSEWoYPR/mu86qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538248; c=relaxed/simple;
	bh=e83riHemz7jmVSC1s86WzW2uTf0LnBtD9CtSbMUNt3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjEAA9DxhfIeofRRLBxiW4bXX+b4nBBcFBTObh5xV8tH/wD77yE+mS0xwPSu5smu/Fen2Wu2a+cLkFkmdswN3ENpIb7Kf2wavkZg2FGBFdURhcDH/c0zCHf80M/8eQvW/HQeaO/iIfG8Q/O3+c62bRxoUy5jH7njQuX+A0jdTC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlqhWfoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTAabbC/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlqhWfoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTAabbC/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGerip2747598
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=; b=jlqhWfoSus3AvDYQ
	rNg9bNMgYw3zocQdvrdxXy5zd9+nVPnYik3umQeq7Mmy5TnJxJsd+oTkcbSg02YL
	tJRoDy8grzJPGgruw6Maxu+YfHm6coLBuXuwydQGMU91gsjihn+disnYvNpaiYxJ
	ykGhPxjB8pKv76xpOyCwQX9Jwr5wSrHlYaXtQRIGxIyXo3f7NLyRqyhx4oI+pjR+
	k7YNcJdVZdT/hUIB2ZMPZ0Tj1SbWVvQ677CmJNXRRGCrosb8XlOFzSxJs4jjCygl
	uLcRnnKQV0wPWFIkJtQoSnI3IhTy89qHQ5TuDEMuzVZsBV+ghOHxSGDhxLmU5Uk2
	wzPqvQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5cv1jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:04:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88fcbe2e351so63412826d6.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 17:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538244; x=1767143044; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=;
        b=hTAabbC/r4NGF/rXNC9nf8QOEakX28NZtMpk4K0C9yEwts2uC2cA/LWr8k6XdnoO4J
         3gNUjvbiVUC8NABjGJL+pFSaSRdq99A0ahGxTCQ09XNV5XmTicNtt5X7Tz8GhBFnDwEu
         kz5/LVm0nQg2zHYOvgHv99vpwkXQBaa7PmPJkPos/k9/wrkXC3GNhklQxTH54IZ+yIah
         2pr3eeQHIQH7V2vZ8CefseehloyA5yk2e/5sj7ZdB4q2Keyc7l4l15h+hjOLpHBCIJK7
         1+9MvLaMxP2iAP8SlQ3jSvnNjZVdDmO5bRchixpRgRcX3OMCCOmzMHwRh0bJskfnT5FK
         82OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538244; x=1767143044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=;
        b=UCIdrgIU8jAsTZjmA27H2xp4u3ZBHjbgrhXRwMlfza9UBP31oSErsLnlVz1VF/AX5L
         j9v3Y/IzRWi2ERhK9/gpSY/EItwf968AK18WtdZqUzyzicSm9VF1zzmfM3oopkRiGyTL
         rBjCk5f+3W/8N+4WweF+0Ltn8F2LpXx9Y7bZrPRNAScmh+k3HrQZPWR9AdV9WoS/nsa3
         pBnmbtapq/guhW5ARzdyxRTxtCchFloHX/uEgQqomxfkCGBtrJsn7cc42GgIuh/k/AbN
         eJ6whhSwsPUJubRSrYw8fT1KqluF61O0R85/TlT93fLCvGk3YDkeEdEJx1PtR/RgemMC
         gCgg==
X-Forwarded-Encrypted: i=1; AJvYcCVnU0Ay3DM3BWBxDJq7apNJ9rc0o7vbBMbhlyyI3Ev03n2ywyj0P3IAsnm5BCZEGYt+QFp0UbMd0Teu6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEtkzLRmYWhYH/rBssO+Pl9LJLlo1lqS+heRgfbsEQSlz2f62/
	z003sTjce6LXPUeNhqs5tlX1i8LunSMQopzQth2UdPZMwOGy4/omVkjEH24HkuoAmn0iRJMklvQ
	nPxycS3WxojN92746sA8XAoWZ8w8fOlZ7Joyt2tA9M+Z5fCJX/EUeC7MniQgPtyaurQ==
X-Gm-Gg: AY/fxX4162E8lzBJbWjZEgNJ0y8YsEPyDqzmhxQ+1TueYDfjnWRAeQaW6lUbkj1x9Dv
	r/CZRe7EBs3bUWLeTvQkpZyBjcTDOCkqZJHM/rXOUOL6KFioERGtDW9AcZjp4MwgWJD6xOW83bP
	9IBnKH721Xjxg0NfnHPhJg8hhP1KpBmxJfAfFi+TY3Nsu5w20N3/1/brWuU064exoH+4+HU2HCe
	BSFdi6FlgspOKyF6Xz8TG88BedGVYR/3Wtg+zU7wwqwATmTkUj+mUuXFEelxiQzqg6YDRj66ovI
	Gp39BNQFcEAjX4qFvczCrGNh/Tcld1053QLWNbshkdnl4fFgdL1PRHiccnZiVcJBP5qkzckIBjc
	/ZtuJanCALCaJWkBO7RNF11b9NCsCqa0zyeAjAdg9zyee6FLON0TyApyQeXOcH6pa1mvPZHATLR
	3QrWYekcgWJTtdATJQceV10wA=
X-Received: by 2002:ad4:4e8f:0:b0:888:7d61:b218 with SMTP id 6a1803df08f44-88d81d47b5fmr175846636d6.11.1766538244305;
        Tue, 23 Dec 2025 17:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu7+HH145K//WnhennzRUAZ/qC4YMZkCHH5OOgkflOfdjzzhnjIk8vQXkFQam/FvXO84smjQ==
X-Received: by 2002:ad4:4e8f:0:b0:888:7d61:b218 with SMTP id 6a1803df08f44-88d81d47b5fmr175846286d6.11.1766538243819;
        Tue, 23 Dec 2025 17:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:04:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:59 +0200
Subject: [PATCH v3 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-10-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e83riHemz7jmVSC1s86WzW2uTf0LnBtD9CtSbMUNt3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvaPmw40jATyUWTrYBTNEusZxIc+obHstv5S
 b4iElplUN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72gAKCRCLPIo+Aiko
 1di3B/95raEOH5VDkaGoqgK45/yZh46TpjSkI0p4xAQ5QWmsMaaCn7Newqpeo25B8E3VpDS52aa
 up3rolkowr24CN+AOTFNP4qaLU+wQ5ufsLePmUId4/Sf7f/3uLCmTjU2bAAc7WkBJDBOUgESVoE
 VPOds3GCRBLX3X0qEONZ6Q6pJmz9433H5cMK5o5GZz3dTS0dZZqphPcLWyxJSLEmmZrEn2G8Wyx
 MZQXEWNaui7oT4aHMyYoZX0z2RTqrLwJAAmkkLQISa4jHnSF5bBJb4YQauizaBu+BJqV1TOmbVf
 WZtZHkfsakdCoN6Xjk8QGpdcOMYzMgS1IQv2DEwSOdtfE7Y8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX2qIfSRyYLqHJ
 PH4tWLOedlhJUidiHMU9HUd6SbMy0GiC+jN1Z8PIbxu+TgsfKf5abi8VOCSig0AjRVS2qjwFBWg
 /cVN3gpd4KrTXpJlx634xcehho+BWtUx65UFIxApmMHDhxAz7y54SKNrQULvjekojJ09kBxVc8Q
 V4+r/aL2NSt1POBenVK2p7sI4cByKgzf7ZHdMPzgaLwRV13GfqlZGD5OnZtrUs8toZ39gBDMd7W
 5O8vgZ4e8IDchnLsuIVg3XqqGPc9+VrfxLN5it0n/Da4CP06GiOrMzKwdVjq3wyZUAXk+2WjzQF
 sgyR1Cy7Oh1xLlaF4+WjofiT3dNLKv7uyWsnvin1LRHT7ctoD9dZ93ZlLZ1/rXqZlMdKzEDltMK
 qc0RYxlYiR5fDZjAnx7gKXjCgcH3mnOpz18k/aNO3tuDSsGN5X6uG6mXIdb5+NIaudABFzhLKPk
 Rj3EXU+DO29zvtzQgOQ==
X-Proofpoint-ORIG-GUID: KkAERIUZaxYkLiuHbe5PiWEuo6KpDG2E
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694b3c05 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: KkAERIUZaxYkLiuHbe5PiWEuo6KpDG2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007

Having debugfs files for the InfoFrames that are not supported by the
driver is confusing, stop registering those in the debugfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529f..ae1c6126c2c5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -672,6 +672,10 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
 {
 	struct dentry *file;
 
+	if (!connector->hdmi.funcs ||
+	    !connector->hdmi.funcs->audio.write_infoframe)
+		return 0;
+
 	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
 	if (IS_ERR(file))
 		return PTR_ERR(file);
@@ -726,6 +730,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
 { \
 	struct dentry *file; \
 	\
+	if (!connector->hdmi.funcs || \
+	    !connector->hdmi.funcs->_f.write_infoframe) \
+		return 0; \
 	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
 	if (IS_ERR(file)) \
 		return PTR_ERR(file); \

-- 
2.47.3

