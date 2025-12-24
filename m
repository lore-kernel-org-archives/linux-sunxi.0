Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ACE21C175
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538225; cv=none; b=OhsHo8bDGa69rnhbPZHzE+ca8sF/CAPDt9FJWTqUwX/PyS5HXVHTJyVUF0Nz/02nF8rk07k/X4hF8jz14j9/2xC8+OyYQXeK56NvxjsQ/C+lvDcKMArzw1ybCEKmiyTNTn8Af5/mKsyc7fkpd/pS7o17NANtr0JWje30/k5ibV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538225; c=relaxed/simple;
	bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPq+kXHAF6Vr8eKJnoNGOJoK06wPfz4TxRpUFhJvFnqvOu4TWu9zRL/HYjH6buA3JIKyuGqdiQrGwtznizn3LXJk+MUM05vk9oMNJud0970oaV++JhnikgPgA+jPKCiv4MwZDS26CngngTLZYQb+60FLD4332TBN4n4v5w/3DBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bl0jOJV2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZR5MWs5z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl0jOJV2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZR5MWs5z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGOTjd1018504
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=Bl0jOJV24JiFPMET
	xHzSY4DSukQHLXYvaS+j8AC2V1B7oTwCX/V4HE3eWFTq5cS6OcPRyrAqVDY+qCpe
	qrFYm27AFt8KkxgawPYL/Fe0FaD7KkT9u3yDdi2AmiHPp++bl3E8ECzsLRIu88Jo
	PvaOMF1dSP4/LJTXL81dgO0Pa9pdcH+1O6q1pRDc4tlgrNHbr87ywG+rGaofvEBZ
	XzUlymhYYoz5ryyo4G9IluagRkMxMBkjTodNRJQv/iSAW66J69otOk5hjpFyATm+
	s9XUpm9Lf9XcyKMP9SFUa7aIWGdeBNgNefrwznwxC+Mhh+cGxaMqYAk14PEYEr89
	IcsumQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9ahh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88883a2cabbso188834776d6.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 17:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538219; x=1767143019; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=ZR5MWs5zhO0L69mKwI3aBF114AzJ5RfAD4gVTqV5h0dSvDdGNYvzd9lsnFs+zTS6RV
         EfmI+8YoqBt+zYp7x/PtyhB26Uxh/juojWQrwenZWD0RK7ksfKfgMUKo+qeOn8fgApdX
         /4Gv1Nu1EvTy7aLlEXw5lD+V9ZiupfFCE8uCnvWcXYawLm4I/ILYHpP65Le91wjMPO6N
         OaKMDVxxfs78ByRxhI3c4cOgHyu5+4ju2ZDN4NZabH9tnkNQ3mr7Mok6HKzQq/o8oTwt
         O0T3IfCk6AH27whhcWb/mLgLD2ByBuCjgrOcogIBt5oHATXbQAlmVTX515WajAtu/W1q
         i/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538219; x=1767143019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=iiVL2V067o/CZ2Dotzl5WOqvkNm5Gy5QxgsKt+i5e5FMNRp0QpBRCgUZPT33Wd8Hfs
         CplwQq1mlimeKUlubC2G/7UbFE4jlHSU2m8VcEiCvWK69IbkrJ2YAxMN1i9NZvG69OKt
         99DnOJphM55jCxU+83WSldCUfG5hH3CEdAe4U4IeEkR229vAnBJ98i6ZReqxNU3ui45l
         a3vWw9M3Qo7Nc7hzbs2ipICP39iz/g0FhbdODoyTWDW0Kcitwx82qchgW+WM3BdgjlFR
         XDzFy89SOiRVGI+lW54ySCrjJ6jrsmL4Vch+jiBrncTKDRHOZSEnxBanD6VsjJkr9V4q
         Qb9w==
X-Forwarded-Encrypted: i=1; AJvYcCXSlJka57DXy4oj4a9NlJu3KmWH6BaENTX5CxBz+ibzgchpIl/PaXVu6hyQOGhiZx2MVCiSzMQoos6iHg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yypk61pnfDhygTClugN7hmU4Upzsnz7A27mP1GQ5dgMjvKBtrPQ
	D2o9Arm7Kb0yTc37ecO983C8WbLMTpYa66o/rhGRPHN0wNhXbNNnokCj7c+iaUTAuAKolufNd92
	aSqJ6YKYzA5BApygb+iayRS7gTT/B/O8VjTJ324bnG+59Xrm0wDkLfTrbE2zMxUMEBQ==
X-Gm-Gg: AY/fxX6JMPI1cgMpY1UrnAzrvjjKy/bZ3qdAgmoiqkaoXL77Pvx4cLCCm7nrhgZJyMW
	iDBnm9N3n+U4hUhK/8MyKc9PfhBAtJkCeA3t+LefiME4Vtx9urkqC3IZscyVaOQ86OFEYUhJsMl
	tazpzgV+Gj9GdJy8KjAF754qkqiFhzURu2wMQxJ1aOqwkbH0vLrS1HtmsLmu0t+jmDVQJum88Bv
	Xel712E1fq70vzvj0/nd04pWvp6E1RZpw/usIFBil/AFo2aZI1sNjfWxWLGEKdeHI0pBEOK9zRV
	FLRjsZoLVnOdVijLe7+7xiIa0iu7ynB9x7eBSob/oTb2t7OGHuADthaw93tU2yKxGGovoBNG5po
	F+T2r2ONKO+3pUz2WvYjUetojk72rRKTYg8TxVyPauHtCWuVetDHclLGv6zAMY27nbAgS+Xgvd2
	dSX6GihQs7gA+oKFL1Ul5rtbA=
X-Received: by 2002:a05:622a:5983:b0:4ed:aa7b:e1a6 with SMTP id d75a77b69052e-4f4abdca79fmr229406091cf.81.1766538219493;
        Tue, 23 Dec 2025 17:03:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwvXGbOT6oW55CWvGFCaGI9Z8vq9+dFl2bwrw/ngJaHdkAtC4PTePtFImzvZoy9oibBhKF7A==
X-Received: by 2002:a05:622a:5983:b0:4ed:aa7b:e1a6 with SMTP id d75a77b69052e-4f4abdca79fmr229405351cf.81.1766538218943;
        Tue, 23 Dec 2025 17:03:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:52 +0200
Subject: [PATCH v3 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe
 stub
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-3-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvY+d+DN6B8oFFIbxWN6Mv+qvpFGNgFj0Zg9
 429cFCSW4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72AAKCRCLPIo+Aiko
 1U0DB/9O5L3yXk2jLLqOmN8V6q8wWbokThIMSYo9wxIHSgy0M5PT1YvNv+IkCrajuHc7rLm0/Wy
 cAHvtRKaeF+QVunb5Ui4hiZx4SEbTrbizizbDcBXrW4jWiZ1w4OIEFSo9Ca2FBA/eLbTNfYILzi
 HQCpFhDfzos5m2svcelBiHZqryy14l9P2FF1hFVv73xKqoG79GEfcN56cxOyCxeLVVkSb5izUXV
 /Qi7gDaaGNrZhhP1D1d2VscJWoEi/L1VJ1MTZPr1mxGEaDugo8tx8aKiQtr2Q++hnZkOcfFfbZ7
 adTRg5h65Vh9hNP2Kvva0EBQb2XULPOZjxhcE0hxDNYLkX4A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX9ETqbWazowea
 cAHm9T3t1b9hQci42bSKOLkQlIdd6q7Zb7TBQAGmGeTUCLFenZQLS2dQbpG51KXlKYPdYWS68QC
 m6qVS8YxbQIrp49bywu/GNmWT6RcW6Ak1QDlTzWjCi42pvDgvwXHJrss1ezL74l11+FpbCcZ+//
 eLhh7oIRroYsLKavyWrW2fKM/MMV1W7mb7SFpzzlbB6SAXRbijt65kxoiMXN5PNGtXXZDlWZZXy
 OPqhRYgpZtS/8Bo6IIQYW68T6NKcc0rnPgE8WxPQiZjFwWnW4o4JDvnUQLZZebyRW7VEYkgldiu
 0cuGvKFtvwGV4V78vlWtYTDnOz8bg9xkiaa++HGqGR8VYTMIoVuwE/XjpH7xpTz+kGO2thHMQOb
 JvaO3qvYl9xIHYif6D9YX2Z0E0ED91A1m6CT6BT0ie2jyKVqjibLdMdqmkFutHEy4OwQ31vWU+T
 oD50ycDhbolT4mqC0bw==
X-Proofpoint-ORIG-GUID: zug4ybBIv1YDyrABXng60mmAEjaeKhNR
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3bec cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8re_t9gDAGCMx8MSDUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zug4ybBIv1YDyrABXng60mmAEjaeKhNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

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

