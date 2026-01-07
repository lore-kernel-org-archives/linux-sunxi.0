Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45B357A22
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jan 2026 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809718; cv=none; b=qIR3XNSq1O16kdB1XALBxQZ1xKyFgnUk+FW3hePKh2IEVeytB7BGJNVztjyNypeiduEPRq5bGgmfloQMC3lapHODI42g2xge0aC1fXqYqGW6ixsJKjiS0CMMSte7tFNo4aWJ/tEoq1iwETUjH9CbnRgeyTbzXh5zKu53adfVgnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809718; c=relaxed/simple;
	bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xb2O98DG9TjJ9n//aMFndlgGA4cx+VHXYbVmHnWO9QA93aaas12vf/Vn9y08z1h+P3dZddwL785HgNLvaID4zID00bVsv6mx2PH62Yrc2Y1NC7t0mkybFuq+OaqjYeZMDpN+2jWP3O7rXGTptw3zRIjYHPhZsYAYjMZJOJMf1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyrngcOK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nz88VhsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyrngcOK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nz88VhsJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HVORP3890482
	for <linux-sunxi@lists.linux.dev>; Wed, 7 Jan 2026 18:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=KyrngcOKBiSTWSSY
	izNCCazNvrE8uikK72XmK+Vv0T/Usx1TJnGEi7FoeFr+BCAWxFn5GM7sB7rkw2+R
	xnkxDU2giwWfYxFgRXZm77sSilAwW+XQfLEnbHeNL5YkgC2bF8pOS/2zY6D1p8zU
	ibMfQnY8buGFHBKi37HBa7fzog69JpxFX/4NuXpuhM5+I5jdzJdUKlQP3QuW94x3
	bA1Uys7tKjWqj4sgvnKSkAfyCHp53cZhkuDxbTa5PCwLUHtNBOuNyxLNwnzd34Ed
	j7PZBZxB2W5SxkdUVH/o8ptaf5HAjEgqZZJHE5EDaujMhMdI9SLzwqRb2mU52Aea
	CfoW6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy704s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 18:15:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb6a7fea4dso572334685a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809715; x=1768414515; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=Nz88VhsJMnewEbR104L0iD+VPQ8E6XqutadTfUFKMRV4wfrQaU1zedKzbsPq64SSIm
         AUuza9UwcIM/it3Var4lVCdkQupKTkH0U2YRpW7aibbVkCTdyzA/xmZxzJ89LRvI1Z34
         6fjbEo1FpmZk0GfXaF9QNHO6E67nL2soW3GjDXAvlu6YZjUoDu38nmFYZg6eJcVx86/X
         RDNY2+TjjwxMuoOlIYnzAMLH1adumUkqK0YzZL+2Jobf3F9z46jKv53yVTvfSDv904ui
         LJi6BvJRaATM4dp0q7/ol8fBWxrhOGTm9/2tToKjwSkLT5b0Bt9BtkQ6C2f+GCiWmWVb
         Af/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809715; x=1768414515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=RK0Jrd0OKaVLR46igPx6azZCOZBeMVsG9KKpLeM8kVsH5LzfalcngQWPWQ7JJIER05
         ViS266j3/6TQ1fcvTg4zdEh1nqswsi5gmEU3sXbi3imu/M5JfW8IK4S0ATZSS/le/5pM
         h/+zEHT+yvVTCC4NsvceadjUSIcDznVCA9Mji3s5S6Gxq3nJwsE8q0VGo2HjpVZtfIQj
         H5hBAnhXlbGi5IMCs5NkHo63LILYvOrYmrJXqHG9gY2+Eecb/Zdz91vnDjvqNX69m8rH
         kZaN7BbRjNSU67BCtVcgCG6SEO7mmtMB55S9CKF4Cf5fyPsDmmMswI84RA5KihWz2FOn
         2zyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2sX+4PWlKlJHu8xYdSsYJcdj8pQ+cGNK7GWRzGLu8dj4+VR5+JF3vu5gkGtqtHqNlwmKjnt8C8USsyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRo5PTf075TZJPjacnzF0PcJNQRqwC2Jw0a/E4LxdCB+yxaIN+
	Lk20liY2V6g7qa2WdzKzHvyhqecqM5VK4297t9Snak6omQ9/Arphn0febjND7bSFCnvjWtiA3V9
	0oIgoAlFbiUVQjafp39bfJ/0QUPOhh76Dzduw4kll8JpnulTzC+vUd8wezA7HcESH0Q==
X-Gm-Gg: AY/fxX6MINNpGyvT66pew4wtlF7HI8eAa7tC+giknZAxdojdcx6GuApqXBj1VYtXRsD
	3Q27jNiVa2CTD1vvbe7zWZaUVk/dS/UIO7eICt6Eu0rjxEHd7r1mxp2RuimCYkXAz7crZat2gvu
	NjHC2jy0bC1rIU5ZJ9jhbqJph0CGmd4Ekm/i9H31R2WaiyaDPkV8RJZLt68/JmpUn64HVOgX1ob
	mYZ2Chr+rIv5uIgJe1fhvsAaV+es2PT1CYw89+S89fqemTbAPPfVA6EzN1hSwuHRjw5j5IFufKL
	cJhU/HZGfvYsU03rMXTdLNIh7H21cNhsEnUJwvV6XcgJWSXJXDe9KJq7Ey2P5ZhPfO40GrvBNfL
	jhMN6hcD7Y5DpdakwZr5omQwoveC7epLEexA4hs94bHEzNeFBaFEmpUFT0JzeFUknQNCmWLShvn
	dCfN3s0kpDwtshb4c2qsgvDRg=
X-Received: by 2002:a05:620a:3941:b0:8b2:ed01:b65b with SMTP id af79cd13be357-8c38940dd0dmr456873185a.83.1767809714600;
        Wed, 07 Jan 2026 10:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+D5mrG5EJMb00tLGXnGg/5a3iMwygbvY5+APGv4MWQpPpWnlnvrx9Hf8phdL6F9vP8GwsHw==
X-Received: by 2002:a05:620a:3941:b0:8b2:ed01:b65b with SMTP id af79cd13be357-8c38940dd0dmr456865885a.83.1767809713987;
        Wed, 07 Jan 2026 10:15:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:04 +0200
Subject: [PATCH v4 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-7-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bcoqVOypf3nnz7ysbV1SEu2HFL4awvN5mTrKSPbj51+
 +HNQtvQTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMZFMHB8MEnRhDz5j7S+s7
 33/wuCq3e4f0x0ZX/s8/n15gMap103T9tH1VXsdtoTyjK0HrN38MWXF5zjXm73UHjVK8GY/M2v3
 SSqTuxuMI+9iXSq+6WG7sOSCfWmNi1tjVpBC7Sa7Atcb1jx7rMa1jP9dN6+f1uO6p0F7NLHKs7X
 vYqkff23seqZc1hh1t9rINOs58UiHnRuAviVCTrfz7b1QtiT5vyfh3Et+uU3On8c8PKMyJ6V1Wl
 Mzvy3zdzdrznXCNGIfM95Jm3xs73nrUaDuLFp77wabg8FSVhyN77+u9LzM4bD6zrSxoyyi2in6V
 c7dLMv/d453GTG+Kbj738GAInXdKPufnrbyYBYbuh6TUAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: S7H4qlvYqBiCPGaYFs9wJkSzMSNerZEQ
X-Proofpoint-GUID: S7H4qlvYqBiCPGaYFs9wJkSzMSNerZEQ
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695ea2b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfXwy6vnwQuGwSH
 +NgwPWGfu/Doj6hkr94OElyjJb4aFUbzdyTIqi/n0GtRiZL8Kx3XshsyrVWO4UKMnsNaGsH2s9v
 EM63UwpsMQKuzngCANDmASlhmyDOXW1W7IvdCbdIEtLRE6cAEUkjosU20hI99W0TuGuoPjx3PeZ
 3QdcCqdR69I2PMoWYb8Z3Nry2svGIUJzzV+by/nqrRY75bfym1FFtF2rtSbWj+9zIXvbjyz6BGa
 zGWSfRbTiEtijvD5LEB5f6dv9OhADgfaF1Qu0l+N5rayb0x4+9gSvmzBtgXDveRFiUfKJd2p61n
 CFYXtK720WR5ltYwdfwtQLH4BdA7PC+knDK5dpz5ryYPU5aoKpEGPjpxzbXg1yWMvwH78W9sCNx
 1gQk9N9wOsKEXxRIDgtvJc9Yf7JkU8LE8noz7McVk1R7njMXkIgXAdNriNdhtaGRiOPQ/rt1B6T
 l6caWtPRKUZmQUDRs/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

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

