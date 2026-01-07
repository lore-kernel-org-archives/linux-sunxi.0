Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA58354AF6
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jan 2026 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809711; cv=none; b=d5VoYx7vCjP0UaUk9s22othCcXI0/VlM1+UxcGgKqac0wKwrTXNTAkAERViEkHpHBg+jQ7uyXKTYWFl8jNXDuRcGvdStdzkrgW7TCASFxUnExeOcDKTO7H3p/OwXCT37a9kiMNDEm/v25RSV8a4gW4lvqFq1LvCHliuFy5SPTrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809711; c=relaxed/simple;
	bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1R5BvMLJa4Cu4kbwXrEO/XEjDqYgTW1Cp+ddAmtwRTheKYrqGJR8GHlhboeFqmU/QJQkNU3xKzqs1L56gYpN38i2gBHUzYTjWrbPxRVdPlpRgJ37IMs19F/IGxvguKW4iroWIqwBX6ecOdJVQu3qe7e5l1+eUOrY5RjWcK1bYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTI+JdNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jasvV9ll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTI+JdNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jasvV9ll"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607CsRDH2239380
	for <linux-sunxi@lists.linux.dev>; Wed, 7 Jan 2026 18:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=VTI+JdNAvshkdlek
	Yfh5hok2VL+Ruv93fw7t3nX3JTZAOcnt9yVVeRWzxIrMrpZlkehYKArntaZh4Dhs
	py6Lp/1rh389bEb6TO0Y+qlxVSCg2M/0T8nIrcc9kP8/orpoqquwDZOkto1AWxb/
	cEICWw743ZtkcFMhW8qvlQ9DH1/Cd1MfDCaYRGvFcInihEn1//0v7/KskZESWGo3
	Y69JP2reux4mxVQZ3r0Lqk9ULcvavssUs4wagaNQHwAX5YaN1Dx+U04imhGQi0iP
	4UE/I2Koa/YNC1rzxkWL1UO7K1dW95kL0fNUN/pRltO3ShXQHw2WkytmT//QMryO
	taMxNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg12jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 18:15:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e2342803so615479085a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809708; x=1768414508; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=jasvV9lll005TRM9cd1rxGtaLCKY2kwEPJ7t0syKpAZ8cB9kWU+dFO0xJSn/dbFUXZ
         HYa9JzzwmrdR/ljimDHwmLkM/b5dQqfN4KpQYjNKtQmxbVprgRpq3AA8lnX7etgVFxnq
         EQAEeSgrdfuCKr40eH5f2334wafcOPvclkrDxrYv1zD1Rae2yxdE4CwdNvB2AJ2G/FhT
         M6EROEW7bIkeP9HE3MLvOamXqTS7HE7ffmhu02lN4Ex5Z/AAO3EknTZBa3XmCiTfy5Iu
         ArSoDdLHxeVU4SqAK4j56nMWo2dFLynIRnM4fVTmbfxzvTp2JPZseMamNODuMjoLHDcU
         buZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809708; x=1768414508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=p/vxyv08klHa8hfRXJTbAc1itbHKY66yspSpQllIPA+/37k3w8X3ZFmRQ6sNmBqxp5
         YCgeZ2wHdPvgsayIYuS/KdUmcq53za+C82cUVfCw2BgnSL/qPKxNXc7z2cyX/lQijyjJ
         BXRF1VuTVg0EmLkFnKvsLes+gOHz/o+lo7LRkx1VmPTfXMk5W3qQvZ6Ombf3LQRyUfN2
         ys3RpkbyFcJbn9nYFUkuudKcTuZooGlN8g8bcOA9LMWjywGZej2VK90fYge9GfjaNu3t
         elXpHFLZUwHm5inQvxz09zBp/nqXwygTxmFshzdAgVFMp7J71Dvv46oBuWoe85Fd6SxJ
         052w==
X-Forwarded-Encrypted: i=1; AJvYcCXp9uap/C6l0fpSQY5swxL+ufKNtksv349bhOoeM3MSMzaqneW+5COKi7wUlIloUFrxKY+VO3Q4QfhzZg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy4ARY5GDYA8eJNnK+hnT2O+6P8o36wGz6iZ+35CC5KTuWTaed
	ch/DgGnLWrfW75kjrspfua9qU/bCJNeO+ZwyRyxq62KBNXMtSmYg3xThzIkDh+NNK+8M0Dvo9GK
	uKAb0wMTPkHsALjq810qfYpo6jrgwbV+w82XMqsEiAalDxXn1K3ogZqpVFS2NRD+KwQ==
X-Gm-Gg: AY/fxX57mb5PY3P25Yc1PxVmxmNGBXBs2EM5B5W8/rBvLA/bW/cIZ8vRpM53lgr48YQ
	hvdtpU6Ar3L7YOqIJdqfibj0hiU1L8iTL+4rTkV1nXHzoKUnY0Exh8JD203gABdnS2/isVZgWTl
	pWVHBQbQ/fsEHTWKnyUESPnN8nQh/nxXdTiZCUKcFhsjHORp9s7uVgdVzdaA1845Pb6GOlekTpo
	q5X4ZkW2qvVANbufqVRwy3X+1sKUxaplLXNutN7QcUHcbtJgjAYbmbXPeqPiJEztBf1A/5NI8dc
	nwahIFRK8NV6y0VFpMK0OiWgTuUHUepKQXr/W70dpRl88QRu4CEmZRVvgHWaCCBXedrFYW8K263
	uR+POrsUM0QC4cX6w1sjzWz81sCI7PcEgSyK6XyqKc62hQoatcx6mMxXg+bktRIvpWTGznOrktF
	kwSDJiCZJiVEM9KRlxcqRu5sM=
X-Received: by 2002:a05:620a:bcd:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c3893f7d8cmr453746785a.61.1767809707644;
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQiBI0nmEwHGDiwmCMtLl/jayFaEU1m0Axo7cKoiE+2HfeOqOTLbx0TrveKVWGZFW8ipORjw==
X-Received: by 2002:a05:620a:bcd:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c3893f7d8cmr453739285a.61.1767809707118;
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:00 +0200
Subject: [PATCH v4 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe
 stub
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-3-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bcoiW5J9/tWb3J4tHugrKAs3JeyiZt4rWpsWICpksuC
 jCtyXnbyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJiH5k/1/oclnK/Zz/ja8L
 v6t7HOL18cg1yeBbaeqq8pOvrnf+XBOj/s8szY+lzvBERUkLGakuejhjjs20u3oewa9eNacmbZf
 ZErVva/T+iCPe/yKqIoU+z/jzp+2KV28zo9cVjnoraUd13pIVM4oiTrkH6U3OTdOSsJwVt8L5h/
 /T3zkX1/bOvsVXv8vj+1+jxyrXD8c0ec7+2mYVenlOTuTBvsSSQqvGuY38Xj3Tv9TeX6BzUVOlc
 4rNlrpcI3a1MhGFq3s68l8oMFjf+RBpdHu3yN9MrYxg6YlHexbMklnWv1mXiTVGP2Lax/1P8qs4
 j9ptzHJSW9Jgcn/7ST4zM4W/whffsC+fsnRj8rbPKZ+zAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fdknZFftc1tkGG75mWIpoG1tw5ohxQ4R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX0ib4UUfkM7tJ
 vRN+aXtieZSl5zDMFJ9GM/XVdNAKi4L6vb4lZ9s4PX9owxPYCdS0+lLCQTizpN1LZz9xlgYzQbr
 dntEDYQ+0H3FBnizJJfwDjP/smvARNm5AelN/Nic7ZYpZvqKoV2YTCSHNcEuq6htyLDOTtk26I8
 wBBYCzpUPKwV61bxeaO1/pmyW3Btuyg2zdjQmJggNhTLEa13Pmt7wJCquR12iR9USN3MlY2X2mz
 yKjUezfZwcr1qEqJJn3wxtAUEzlYemuopCqGjdI7gad4tWqr89RSWb4seVD8Ld8YFDDxUtKIpQi
 CpE4LTlNYARXWS6kGAJu7ZQOTAUysHZpqtcvFIQHGncVMYju9BfVQSXnEWyOrc8D3kNMxCio79c
 CaUBmMOBwaXYn1PFjFVHSWtK6FZympMQeaTNiIblyWhcE5hkSZRx/EAl1RWMojt26FrV7tnYfsF
 be9x6WUP33ctdHNsQ+g==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695ea2ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8re_t9gDAGCMx8MSDUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fdknZFftc1tkGG75mWIpoG1tw5ohxQ4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

In preparation to making clear_infoframes callbacks required, add a stub
to the sun4i driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7..6263ee15880a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,6 +40,14 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
+
+	return 0;
+}
+
 static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 				      enum hdmi_infoframe_type type,
 				      const u8 *buffer, size_t len)
@@ -236,6 +244,7 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
 };
 

-- 
2.47.3

