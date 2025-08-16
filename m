Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F02E2821
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348076; cv=none; b=uQXobFJND09gExwVmEd0B2XwEDiCW171qcWr0VXJBVXEXbRDi1HfOG+WK16CofM74Pwyn4ibxT9uR3bblNiEaEsWMfiCxhrWSko2gzQLExhVKT8bEoBF521u7OUUadlIguLaZbZ+CEPqrL6jh7kG+2duYK7QhZgj0NFGSCmFUPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348076; c=relaxed/simple;
	bh=DmbRKJHk5oRAB/lPzIwmmFkOQ5dwAtGETzJHeLHHKjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmaxCXV9yugoib5HjDKSPRTZHTIvDNDcQjtGAvJ6iJe4l9hR6VisbWd8Ovn39airZ4H8kMUuj8yjSkGH3fYs83Li59O0p0h/zyszAfDvwFQ9qhRLKlqHqYIMP3aqKuyzUkYekx3HI2UxGFFyjT4yPHMkGt8s/h1I/mlbmYStj3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmaFgEny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmaFgEny"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3ZTY3006416
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+DN1RQ5iWFy37PJYH5vMr1yt3EhNBuEfrKEgtBjJ44=; b=XmaFgEnygI3wpB6k
	X8YbBP1SJiQ/xkDQkntP14wZ+7biVKQCkNA8IH0We4vdv2/GfwwPzIpsz6fz6ETB
	+O03PMpJ1aMKPGxyCwCW0rd2V5VSoh0mwxrMU3Es4j/hVkSdmoA6JKzq5akntWR0
	OHQUWL6c6JJDrO0EpkdWcViUAgSfX8seGvV9ymg6B0IsCAPDZPMS8/HMkeIxX4zE
	B/LUL6hW/Axr6Dpc6aVb82/4eDVSEICbiyQYqXw6l1H357E/zV6Z4kX+sCeDg98i
	NNSLf1TCdsLsPVHC0lBmMHrHgpSt0GZFhsy7Ingh/1DSQ2zj/TkAHK5Cp6cwyhbU
	8sgcpg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj740ma2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f55eb56so62135896d6.2
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 05:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348073; x=1755952873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+DN1RQ5iWFy37PJYH5vMr1yt3EhNBuEfrKEgtBjJ44=;
        b=STLfvTtNkW6fQM+cOmY9X4+u5qEjrMrXQRl9iLKnaJCQ/M+OAmoGsiLdAmmlddmyPd
         xfWkQcG9ySOKHM3jQ+OplQ9nZaehrUVzttjMecWbCjHciuTp5JCsISMli/rPj81ezioH
         VNOArpoqCjOnQni2kGqSE/RhtQJ7LdEWf8gchBAKqZqDAw+BkFvdKgOobCbRPL7NqYGO
         PM/d4sUILrXE8iiotvGO3xcLfvSZt6uxqPZS33oDUb1wpdBTYA+ohko8kk/KEGhaZh6a
         OLeaC6UPo7IfHNI+6eRgVZg5AGwyojgmlVMYq9vnJRj9xdEGj7YIzL501lPgT/Y7VE2S
         o/7g==
X-Forwarded-Encrypted: i=1; AJvYcCV8ZlcOFv2KjEaqkL33LFa1wBqpNle2NXKwNhFRtR9WEmDOYAzjA6kTrUqDECUe+jxNxDLYe5IdexnObA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+V80dALSsRbuoW2bkk0D4ftdWNicmVyRJ4NxfrIpIMcP2VxBd
	4Y8NsAa1Wd+FI6u46sr3YdRHnuC0dv7asBr5+toNXkZbMOGTBtHgOlab9biwtTkrDwTyI9++L59
	Y3bpkRyMpyyufr4iNHlR3hfCxKBhmUOzwsV8toliVQxnHl54MD7k9KiMitu8dgyYmFA==
X-Gm-Gg: ASbGnctam5fdaCOH3bl0lCRtCJmjPNEz3wq9iHsFfGQd87RXtR08r375D7CnurBNLsM
	Q6s1C49Bb4Alnemmaoyhfo9POHjP5YDvoMTcF4FY9d4erzwX0tjeQJzVXiOpm8X+lxPif/VmbTW
	IZuDBeo521MJt4mfNxztio1IlgZ1YbjsAQ2Pl9XJBFdGs36dchH8gq2+Mp/UE3ICiBDHhsB0dFZ
	I/rm+BPF8JqdPw09qhg0+hGyOEPHD1xNfb+vBKO4pi8m07uDXaG3kuGbho98iSvfVSPelvQb46m
	nOWoJS26kIYthHT6EoJDE6711/49JyrgOx8fOjAtId+ZI6T0zxM8WwMs7EyQL8joiajkz3lFVAa
	5gcNGvG/h6GZvzMTYXw1T926+bKybvtdHFnI01o9VIemouLG1DwZx
X-Received: by 2002:ad4:5945:0:b0:707:77be:fc76 with SMTP id 6a1803df08f44-70ba7cae369mr76312246d6.51.1755348072689;
        Sat, 16 Aug 2025 05:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAdZSpkUqvcLouYBz/hMv6ITX2aCNjDHlkgL/LzL/FzF+yIDQWC2R9yzAGQtiDF+Yu7M/Svg==
X-Received: by 2002:ad4:5945:0:b0:707:77be:fc76 with SMTP id 6a1803df08f44-70ba7cae369mr76311876d6.51.1755348072153;
        Sat, 16 Aug 2025 05:41:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:03 +0300
Subject: [PATCH 3/7] drm/bridge: ite-it6232: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=830;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DmbRKJHk5oRAB/lPzIwmmFkOQ5dwAtGETzJHeLHHKjI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfulVQQEIFrGQv7TVF5i0bGwohs7DjMO5Bi
 27ClR21i3OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1XCZB/4qvtEP/SQNDva3+3vq4krCw9kSzxLGdjGdVw/tgMeW5/3T6SWI0ZXg5Kzt/5ni4P7yvSm
 EDPaT/urG5eS2xX8/WOivyKKxBeSYQv3VWhHqlDBqoOQJW5OkQLPfMBQbHZtIgKoQ7aJCHwTn9d
 HWLCGARgFjYGvtmShrBjydeV4yWinl2EO2WNM0jpELO52mnDHDl/KzegdqSjmhF3DRoNQy600wy
 5K0K6W6ZUvgE865jSkXskg/ayPbsbVVzkYfiqktz3u+K+JXAD4Xf46u7sWS0OI7QNuwI3m5tySd
 nDDSA+Hy4cpHKnNMgVm/ZTHa+IeV4jqqUxQWFvasdgj3YQju
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: eApQdr78U02qCyF31C-OZN9per3YoMz4
X-Proofpoint-ORIG-GUID: eApQdr78U02qCyF31C-OZN9per3YoMz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX5pg+rW/uA4FZ
 A4lFo36tqEEA7ulsYnDP5wJy6o8V+MK/ugFDeQ9Z6ijXZvUOE7RGzc/+88mOqPxgOVaf+X+jH/y
 Wvj1GYr1UvzmsMQewj+zygv7TQfr+xeNdFShVBzRRJf6JF/GSF499kRpgt9Yi7P7/h2bE54/JsC
 cL/xCqRpy7AyNNhAUFqKVseUhvuMz2A83li3+dMN+8vQ2pwfusU085Csh07MDU7zxUwc53W8iOH
 gA62LN/pJ/MpHzexbLAh8b6uZHQ6UxPHK9ssZYC2i4igqFuOnS4BbFOcpvwlUCPIVFiiEK1ag/A
 hYM9eT/mjIFCvwInqbcsD9M8pln2l3QtK626lAhPhX4BEKxrclvigejXm4tofXdiFRCCDcae6DQ
 sMDzHVaf
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a07c6a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=0nAs0j3DZZh6uBALfPUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.47.2

