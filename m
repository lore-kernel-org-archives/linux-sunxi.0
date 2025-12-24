Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FE826A1B9
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538239; cv=none; b=AnhzRn/2Q/VGApGf1RkzTaBVpT0cnbr6SrnX1ugp/tTYg+tnHnBVrMTSAr6p8U3pYYBitO3rxOeEBJO3PSEw+Xaw2POMq+KR62K+hd8Na+iGItm1PJK/ZXs55kXIeo16oW4mILJ/uUdUbs2oqNdQSPJUblXVVtUh9YLdxKvyPmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538239; c=relaxed/simple;
	bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsGZZ00RTIHUOcN3bzT4Non2pz4fj2RHhhHLC9br4jzeL/GXLdABZ9eK2si+eyIIUsgRdax/ooc13mqYAgvlTjhOvYc5VM2BRVRZILjLr2BojGx1A2wlw08s8AMnlG/+vLCfO+nFkAXSyD2+YcEjECbSccMmDSGqFv/o6Tb4BFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfH2Ljc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Awe4mlkT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfH2Ljc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Awe4mlkT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGO72p1018073
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=XfH2Ljc+dZzYTrzi
	pD5ysYGQfEwkhPa6D1pi8C2qbcfBhGuJdEE5Tm7axPuo9cDSGursj22LOxEqHeP5
	R9uBpaJ+4/sOsdjt2aULzxdHjQc0CHLodncP7N+ebgW+QzIgym8Fu/RIkEVIq0Jj
	jRDxvdSZXrLN5ge3caHHbALSV00mhM5U92CRhkAtigwUmz2f0w29lkiq9FqPE05j
	iEFxVpGxxc9A96yD8kdKzBFG2/urw5k637d0CrkxbijK0WRFw1tIvf767zHurFAJ
	1U1WFXX9uBnoE3GI5zyeTch4vmOF0P//3srIopPnVaZrtxW8W5okZ4R2ipkZ+bcV
	//Fs7g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9ajy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2cc5b548so143847526d6.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 17:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538236; x=1767143036; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=Awe4mlkTDx/zH472Ml06qNm4EJpARy3R4C7JMJ9SYMVjhxIisd65oQt+Q/g+htmpXC
         jkuIwZhf3vYgRi2jkiewqSf2D1FfQleJ/+XVjuSkbzgMqvzYoN1b7dEpU1/zFUKtE7wq
         iewmw4mRsJvxD53wFEzOXHiQBBguBIBp00trmb/zFHTvbcftjV/jHWP9P/4YQOb9Ix3q
         pPY+t/n7OITfhqEQ1G7T9hCYbxdHWK4/whruWLfSaygEX7cIOjyN7pkYXQ8BGXpXGzQi
         JUVUPDB3kVu0PPfba96Y29EnCX0VI8XGZd/q71Sdc2YvT/RRYTT5a/oxomaa+QazbF8j
         vwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538236; x=1767143036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=E5vRSKy6AugNf5xNrmuM8Pv8o8hQpWO1uTOWKfQBBOrldcBIkoctRf3Tr4OrYZWK8t
         WkD9vwZ1rVFzIG4r35fBc77ZaDiBPDemSJC7sLP9UY0yxEf+LSfWBKZEj53jFttJty5k
         ReYQT9Eu5/b4/8Za9gmPTj7TVHSB/zMpqAhokIvsX+hTmFNKQ+PgJyaF6hf8kEZ4PVFe
         Qu2Ii7nOG/eLilvBxFSgtAkoWDCb8ld46828JH7EA2Wg7lZIu173+ZE863ajbVlvNqz8
         UpEQlclTAoeTsueLFzhTSDp6fqc2fhvejhCPVN3oZ7qFX8Bz1k7FiFqbyKXKj6PP8kAW
         BRwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQlimn3G68EfDUIDuhCbKJNv0qx0t6e5NTTeISt7gA2bmle2RmVAoxA3KpsKGY1LOtfUE6zJk9NAsiHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRqRah/vCFoqybM+LV2l0KbuRZqYhyAGdZDcP2TfmTS+4OVFA8
	uEolIJtONmL10c4PD1ZU+XY2rlP5yRIs9IQM4MMvkR5/IZ16yyrUIwyO++GD4AHakzOEhTk1Vja
	eQ9zJIL9Ws5BrYm20i/R39mG+As8jfteggC7myDR6OQgR8OxSHZkFr0j4cQi728ybdA==
X-Gm-Gg: AY/fxX62EbY+upuvl6byuXH7a/YehF0l4vrXb1LxD5QXOZtlZ9gyn/6JoL+QsRjW4YP
	AQQ9jzbuy1aVk5+KUrXGClxlUPQuCE+6p8ig4nC1VoAlX9U/IpI5kGBnz27KNN97duP3RMQAcP9
	XikuGneD3CTDX8q5u/r+aoEONxuHHdJLbPUv/iVL8fVpNk97X8tZ5fIiiZe3spQ5xYFPeUlwU2z
	pdACH7r8XWEc3ORMt7EbcVqGS2xImBK9G180/LL3NHtgQlEGCb1rywrpsmxwRVGzyJzZPzMRJaF
	RO3hiIdj6EZGXDsfNdh7RLeCLec2wGlK5f7tc+hW/Joi1lwZjUs2CVBfA7Tr+yNGR7zYyGJF6UR
	P2940FyIUo4Y/o3OpuwWOfP4BCiKVLndxbJoSdtTrJf1KZ5TCxiYzf35Kf4DalCJUzDe4bkKdP9
	sD1Amsy+WwviI42B9NXYHytlY=
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id 6a1803df08f44-88d83c64e72mr214392786d6.25.1766538235605;
        Tue, 23 Dec 2025 17:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaK542l9xmzYYsxqdNmih3a3J+cADi7DGuEWQ94lgYPMK9IxHSj3e3msfodcDCfxK5YjzPVA==
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id 6a1803df08f44-88d83c64e72mr214392216d6.25.1766538235179;
        Tue, 23 Dec 2025 17:03:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:56 +0200
Subject: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZGVPsohAMKCXOdz12kIPkrJMlkOnHo6hb3
 HWobYyhg7WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1QKNCACqcQqgJBRBcg7CRb0dfX/GGsMyAFAip0dgaqJtDLf7ApFonc0Vo0fA+NhcV5j0Nx8Ti9U
 I3ZV4TYzf23eOcnZCdm7rXhqmyxWKpftkt+8hIkJizIcSP+w7WDLeC2a6QEPQiGVuMei4kWHGnm
 o85bmygfh11FQZkX2pCCQNJlyfTByGtP4Y8JpLUrRBIvBMTYNUGhePLY9wL2DAFLPPW6ccgE1wi
 X82GoCEVaLpslRdu4Y6qY0DXtzUr9H7AOhKf8Hucv3GM83Xm/DL5TfDXh/a3uK8yiLTMpc8RB1r
 OJlOJIJ4Pu0i+HpaBnRzjUWikC+VvVcYf/m/QP/ndRhcoX39
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXzfC0/bvLHERA
 gimX4N+V+LOwqMFQhQSUnXyirFkegMwF+xDaLdy45ayJdB9Pei+IXbZKlnnycIVrvT+q7zjU6Lp
 GsUBsI9POH/h/6/0EUIo+9EA/vrLlwFHEMpjhG5rasLR+qPx+7/bXh7nijsLsSDiccaCy8tTlY/
 p1wDsoetlJwZ28WB3ln/P2FEL8AAoZ0EtIcgWmhSjPv1VYjEqwgI4wjnoTA2ZHCMrwVC/KgDN9d
 xexSN4/kMttQAszuQ4qpahZoTToLdPv1L1oD0ptYU2EyhlruzjRLjNxmPr/NqocXs50f8Se2PzD
 +oi3diOcCtQxA2CnxXct15oy+06Pv00EDJk4OwmSUyI9dGr3UC+34gC/hj37l1dSoJNt2BhBdJK
 yCaZFkYtZlT36VqOSCHZe0OHrM+le1FtS9AuqLB6nX4UDAqHdVgo4QEbfHebgmNNDPuQXaJ6fRv
 2EaYQyqrswYIiQOYpbQ==
X-Proofpoint-ORIG-GUID: s6z_xwZtUlZZJ6SsFM9nuGUIyNdFRGf2
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3bfc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: s6z_xwZtUlZZJ6SsFM9nuGUIyNdFRGf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

Updating the InfoFrame if it can not be sent over the wire makes no
sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
an error if Audio InfoFrame callbacks are not implemented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 5a3817271d91..e8556bf9e1da 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1061,7 +1061,7 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}
@@ -1102,7 +1102,7 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}

-- 
2.47.3

