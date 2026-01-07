Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A163612D3
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jan 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809727; cv=none; b=PKyUNJ6KcGJg6SrEJW2ZS1oR9XPx//JpCmC+tKyD1NKETbkqJMhqNO82afZLw7g/BTB+DhQgRL8dccruqdWZ1IE3K/ijqJvl0+aKXcbKxrZUajsi4yC8jI+rhqTLGo5DlX2yc/aiuczuDvSsGxpNbHRLUcNSccw+SL9QR/taTE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809727; c=relaxed/simple;
	bh=Fqja7nqMdmSMtGtKfnnZaHovKcc+8jCwgpdYFW7dJBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVSsz+10GJAoeHx1cpoMDbGS6CZoZZoZeDrD+RmnfIiT4vKqkF4BYGKSnc5EwYotorsudX0/sp3Sx2OO0PleCJ9wraFWuTnF1uW3pnC4HJ4wEd1rdBp1wgwLoAVTu+8cSwKIaBxPgOcAjtpPiSzP/v7FkhgBPu5D7olWcKNyqi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbCTIULR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrheGqmf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbCTIULR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrheGqmf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H3R662453883
	for <linux-sunxi@lists.linux.dev>; Wed, 7 Jan 2026 18:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=KbCTIULR+UQD/OAh
	U1rI7/tfl1/ayoTyuMELUcglhFt/QcCGv9YR7isr79DbYNFS++Nm24Mu8T+F/ns5
	Nb46watlWR+VJAYBlUKos9mkuWeL6NeBUNVZUj98sMVDYn2GjcOiUdMMpXb5ieYU
	GiBSz7AdGoLuCVNMugOoQB39e48Zo0tN0w05xOS1T9zXpjBM7thGm9bfybGIuNeB
	xcjjgL2nWqLLasPKHDHVkvqInzjqR3T9K6aYC3POkBBlzly+8qYDAHlsSxywEQ+O
	taP/Fnm6reneRix/8aOooj18dqvaHgLUcSXdljAPsXO95mEpzCjvaJPHJ2mTKXoA
	UVL9rQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbhpvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 18:15:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so776661185a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 10:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809724; x=1768414524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
        b=VrheGqmfkP8zlZqF7gP1/HF3Xtx93fBOMbOsvAbJAwGnzPoHN0Kqc6e0nvozzpArTd
         ClJBKaeXYUm9DC0JBIndQutJuSD/u7ApkBZodamno0QQ0P2SR7eKJXxAWMz51BrK576n
         f1pL2/B7WV0T91cwfADYzVrH1OaSnaj3ONxRoZcebmp8UmH0+4kwczGKA2dUbehIWT0J
         DV5caX3enKc3m33SlbfEmB92ROCukyT8/aXoDxLH93BKcJpFmNIcKHIuqZU8FMwAh3w0
         rvNQiKqxjNgwUnpFPt0jogT87vqhnps7urKB56f9D7DjByuYaSjyTapmZENl5Nqh5M0s
         ZOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809724; x=1768414524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
        b=tkMSIr9aZJBUp9PeNVV2UuyfGZVt/BQhytqkhiSFaV0WcR0cRY74rvmcZjezmDcb+D
         +gisM0px7qaL3IjEY7tQJ07Bvh1eefmanr9BUbfydfRdoRKbQrERr34fuVZhdnDDsvw3
         tJ2NrqmlFOv207THI3W4Qc37m76ptI1O80/i5wNDWeglF/bMGvYw5CUCXvz5nrlvdgHq
         nOqCJUrRRkMxMuU00YcvKlHRyv55AO/le/28N6ajXZmjU0UR/4FasTrDugL3TTpdEL+K
         H7rnQZlTf8NU+hloMYN5slnUNlBgt+M5R2TJ67SX/Kdun29qEDTGo77M59VD67agnlN9
         fSsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlT7vhPnxuAIUfGBx6BMtiL1L6wZsKbwadJkRk9Z3nEnzLd6HZTOtEtkWslCM9fEeMrdbhQb9KwKk4+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdF+15VQHoRUQ5WqTa1SRo0CLYon/SqesV6QyXhdk/7JvbAVj0
	v46u2cr1J6pFkcmEUULANUYrXlkhVSpzFTspVQ1HJ7Q52A8qppIAm/8CA4Dw+73rHtvAmvpsSSz
	3Ov1HNYLvc5yV+mnote+Mj46sriYEmIae+7fJlb7SZov1qfe++IU+UNIC1yuSOK+gUw==
X-Gm-Gg: AY/fxX4uI3txLh5k3Nxu4U4jGVoDyezG+vn1y4msCUmn6j6hyM8rkKqn02sTkjm9znO
	k73HIAZ7Pbkf8dU7HsSwNsYp9Q22fQrXNmHY+/i/JHpwXZF/tRy6b3YAP+JoUacG+vHR0ykXbNR
	WsPvBb+12kq3kEcufu8OfLwtiE5Cu7qM7sh3wsKybS+9TXjDGnxGMh8I6FTTYMH8jdtdedK6Ue1
	iIALFIHyJsR6NfDLqxD5NxeMqgF4FoFHLl/vBm32LZw8hSVaTMz2qBLE61OFcLx6+TZkWy7n0ZP
	X0mrCkkgq+ZNOgu09+T+FwPif8OTx6DeOYR9DhRMTY0n9S+MiTrRPQfEG6uanWVeQ99TTJQ+Dud
	7/8XMt0sP0gx6SLPBLM8Tnct7filGfXf/pq/2ZTYZCGUdoo6Pl0YCGP0//68Nckyd4EKmsRT8Ao
	YsVL1hDwX7IY2J/ZNVuScN5I4=
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id af79cd13be357-8c38940bc70mr456798785a.67.1767809721977;
        Wed, 07 Jan 2026 10:15:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDhZprVBsv7NrDl4r7/stHLp9ske0/9w25bokRbHgFqXeEm1zUot0CQkb+02Aes2IA+aZv+g==
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id af79cd13be357-8c38940bc70mr456790785a.67.1767809721391;
        Wed, 07 Jan 2026 10:15:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:07 +0200
Subject: [PATCH v4 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-10-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fqja7nqMdmSMtGtKfnnZaHovKcc+8jCwgpdYFW7dJBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKldBKXXeIUEl9VKknThFajiJ4bv/Z+Y6zlU
 AwqJpH32O6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1SajB/4k5q4SEw24CrrWC3HEsLlY/uKXgpKUIWzeXnMMyXHDWo7v5tevjX/ai/KZzmbo1NC5fGU
 jhVIocLd7kwuiCUjpW/yVaQGBTAKyovOJsTbYp+V9wBPDqh8cp3VXyONhN+s/zhRGG9gAF2YEzG
 cgchTc/+0JVBdAMG16Sxc4mMOkZGU+Lxks7qJlyhN6XsUcj8iRQG+d9hUkNlBAgdTcMJpMEn0kd
 dkJOKbe+FFOrO2OOH4BNawMbMIU0982lxSIPgb5Q/RKX8LhTdWcg7s3XNn8GfdQLMft8fGlKdXt
 B1XWOTyoPib7k0/IiAyVFTJ9DpbDTMyzhznF9TrmGgOPszSr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX4m1ke8tL9uHZ
 L19aCKzaleRh+emkd5JDXrMb8Yfy+Wxb92/YdjP+rtKzoWsIRLxY+0dXF3FFL+AKuf+2PxabkNO
 dL+Vbx35TdsFpZHM79lBoMCGZyErTso9GgmAqFvH6zp2u0i137RoulbdR85Jq1RrT0PVttu6YW9
 McCrfSQdTiQ/tcBuLLCJOlnMZCVO7RJFOuQgeH6UMtBR5I8DDrfQxpzr6RYmncPwEjufC2OGTpM
 ktVQQEKU0AXkM+OPlBzd6CMpSQ9W0lnSl1Gj+BVg9fRWAk2yU+GWtv2KgmLr7RpHeo1Kz9LYeWn
 O1zcf2j+jjRpVHykpBMdwa8ktr0AYM1sL2cGcQmpTbZkk4LotsFofLLYqF4V5CU46zZy28uuKoD
 5OVlWKRMwPdS/GAG/cF7Z/OHrg6PG5pOLj/nNGLG2YRb/UTqsNPWrYDaCFV6NA668F7WDsAsbTH
 x3oTjomq4aq3Fw2eJDA==
X-Proofpoint-GUID: WnkHisj2JRXYQ-ohh0RG4WEAET4XcYYJ
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695ea2bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WnkHisj2JRXYQ-ohh0RG4WEAET4XcYYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

Having debugfs files for the InfoFrames that are not supported by the
driver is confusing, stop registering those in the debugfs.

Acked-by: Maxime Ripard <mripard@kernel.org>
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

