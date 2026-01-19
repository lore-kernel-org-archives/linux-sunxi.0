Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7242B286417
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821874; cv=none; b=NveFkfF2OhvnPowZnrpG10qtCConmB1hd7SGoyo6Yw3S/W4lhMrHuTKtyzw1924sLAhmnA6vxzavj+FamLtz3VneWWlwwgsd8JbP1GxZs+3X+eY3wM6r3HHJZZI2L0QxWUuPMv7LlLNLHvwAw8b30jqtkeL0QQDhUZhlcIG6zpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821874; c=relaxed/simple;
	bh=AFl8FfeWyQuM11ZNIUeJzzcHcsoUvkod/1Gt2osLgvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4F6HQJ60I3QnRPX38MSneoFUOX+CtX/VcS2sj31/uRyRvhFdA6DUZUvw73GzPSwHjNV0iMwuv+hbezPVFhCub9dujyWL592ibAzx3W9eHDfD6ZLxmlrGep2qLZKil+HufOk+LTmy9o05dXYRx+O9fI64JE2X6tr5SDQTARaoIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lP4RYpxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGbaFPCa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lP4RYpxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGbaFPCa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91JZF748427
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=; b=lP4RYpxktNZWtH0q
	cczG7KgpgT8mhMgot0FCfT/iPmEgjUJ8hI2Na734lgGTU16RJ42ob1StxS2t5JwI
	z5GjAZDFI31SC+APbxWAjKVWJ++/4tsROZ1Rdz+mJfTn2OBg3D/tOmBKNFAe5cqe
	GylGiQw3AYCDStqghOIBxXD/j3kxoDl3tbDQhl8b9nbKYbc8rJjKqtOiDHo/XwXA
	b0TGaefzFeBiUew/1zuFeSW4Q14XZsvIgqprTePPqTL+wWPnhOq9D7cKqpCLRzvS
	L6bD6KLXH7pDQRZYJ1s7FduXAHlQ/cKZTu+oS3N4VDKep4jMvpqbeberhWnoWCIc
	o1GfZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74umf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:24:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f07fbd0so234855885a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 03:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768821870; x=1769426670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=;
        b=SGbaFPCaLDXunh7E89BtZsxuzy5u38Snz/Fs4J8tXysmsawDBE5nl1UvQsS3P6O6CR
         XQa9gALVCxmgYwClT7YRii4IDIuEc0wor50WIuI9gTlZxB3hL4AaMxLga4aVGtnR7LeE
         icJoD6ybvQdZvQp1auqYgPT6LGkZI/xiJ56DDuDrhw2PdG/zYWGu4bdfmRJL1x63aRcp
         KQXj/1+y0ajKt43JRAXizV013OeCDLqetQ7EH+DkJ4Magrxl2tur36UfS0oSKedPR6fd
         9ZVnf7RXlg1wGxg9I26zNXAE15E43N6viVhFiwyfFDQcZ3xwx1NoIvUkPksNnQkKgsZD
         qggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768821870; x=1769426670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=;
        b=I8iyEX9ufqvh/QgIbFr7YL4rh9bdf/DEPK+I9LLzlJECxFDm8rJO8DI7GBdHxZSBRv
         viSK8mf9Eq1GAFe3a5xAP4uD5yRipil5bz3k6+/8SIsAEU9up5v+SQZPNN9/vomR/exl
         DuYq43YsSXQRXrSQll/2ZGQWRzou83kXrKdxRfl+lESbOyIaiNb9fNxaHgrA4KVxlUHz
         J95AynPxCP0SnTCuDuDFivsKElXO7IQ0t7UGTOQQSkNEx4QqAOv3N8jjuKHTcPHn6vx8
         kVSHZW6ZfXWK+S7IlVfmDcYr/Rn4T3LNuEyTLLIyYXMjjuP7Ayuuj2Eu9Bik8EP60jup
         MUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYQPLI+FwidgsGE2q99wRKJ5vwTraLXByXk3rAMF5KXWg8GpICogmk7PsAN2HR/CXBaODczroaAqocbA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0zDIvEA2ZQZ3Sf/NrtUeVF5MtJBXJfrnjVhRUHMFTkmsxOulM
	06NOenHytZhDmcX2QgdHHnObK1f6Zh+DPa0ZW/7ybN1bDtDYG3wuOfsCxHdxbJv5NLXBtv/DXA8
	3kZUsGRAmWVoeQ11tDtPiXOGfIDVldqQ8vLsQ51TfwMU2m7U/F3PjHVKYj4Z8eYpeWw==
X-Gm-Gg: AY/fxX6kXmJB7bssRADKdnbnTy+Xpesk76WXynxtBPcJev50xH71Bsku8M3F9oBXLCk
	uTLMgIr1k3gG9FI4iTNeT7qnODoZP1xRRGTwDVccGmg8L+B+/yFMf2JH5+7+GolUIk85xIOddcN
	iO6hbkKeHT+v0bIHahPk6Ue/xAzjVZ7Cbesfip1Yg946JdqyYhu23KPtDB4HNOglZkOtL6VnlPV
	Jp7s/dVtispSAT1765ZA78kpRZR15ZDlvxL9ZuZDwwQVMxn7I68dlaY+6rFUxU6w2rD3jBoj6Rt
	eF+yqguse5npYZMYFjTAeYtKgg96cO2grhmGvXCN3JiY438mckOOFdFvJ0dIhADhuc6ZH8m9/Mz
	SSMch7Oi+FvXyLYWnh915nmVQlXVNrHf2ylJGh8m6ZNvz5/o9XSjWNcjWo6olHy14AVh8Hh/6gU
	4Y3rU8dqJb9EpMHiELC87Bh+4=
X-Received: by 2002:a05:620a:40d3:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c6a696323bmr1545282085a.90.1768821870222;
        Mon, 19 Jan 2026 03:24:30 -0800 (PST)
X-Received: by 2002:a05:620a:40d3:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c6a696323bmr1545277285a.90.1768821869747;
        Mon, 19 Jan 2026 03:24:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb9ab8sm32747931fa.48.2026.01.19.03.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:24:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
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
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 00/10] drm/connector: hdmi: limit infoframes per driver capabilities, second approach
Date: Mon, 19 Jan 2026 13:24:27 +0200
Message-ID: <176882185857.86521.18172781461760523152.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e146f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dLs8YEEMlrLrhmPZdm0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: U3DESx-e69V4-JaKJOgB9qNoI-FFmT57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX2Fj63bSwDQkw
 klCc4ZrjiW+ItL4Kqzj9HHwxUrRr0kDTeeoaxJJLZDkD0rOELLzSFyoUDn9hxvSy4QoHT5V2NfR
 1RgCOX1FKQUyJmf2MrBEWPGPzDZFlTdcUq3+cMP6vCCwMPUJJQjuNqu5ni9RVKnL2aw5hl9H/3K
 XBcmyPnJLYsD7QyX0Wh2q/KgJ+n+rYqQJ5jJzRtMLlmZ1A61VJhytUUxLKRh9EdNbAbEv5WhIUw
 CR//KsB7shFb3QNxyvzL3t/I0wnxD2MoLuEZ7aArsOh22LKcQrHqoK95fUG9K9ncjxWrY/Li5GO
 LTJqJLHYepxm+kMqXY8a5R7m5+Eqr2h1+tesxKU+8CfgrG6Ex9YUTqj2ybQ5Hjsn6aSOr2dKKYA
 jy99MM2K5B5pBn9sX3RKvzW8mFOw0LXpOVpp5Ib2UKwq0W6yCEMit8H+i92EMMmF+hcJyArluuo
 kq8SC8CCSLxzSNkV3VQ==
X-Proofpoint-GUID: U3DESx-e69V4-JaKJOgB9qNoI-FFmT57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094

On Wed, 07 Jan 2026 20:14:57 +0200, Dmitry Baryshkov wrote:
> It's not uncommon for the particular device to support only a subset of
> HDMI InfoFrames. Currently it's mostly ignored by the framework: it
> calls write_infoframe() / clear_infoframe() callbacks for all frames and
> expects them to return success even if the InfoFrame is not supported.
> 
> Sort that out, making sure that all interfaces are consistent:
> - split function interfaces, having a pair of callbacks per each
>   InfoFrame type.
> - write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
>   for unsupported InfoFrames.
> - don't create and enable unsupported InfoFrames.
> - limit debugfs to provide supported InfoFrames only.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/tests: hdmi: check the infoframes behaviour
        commit: 7436a87db99d57196c49d10de35f41531993d5f1
[02/10] drm/vc4: hdmi: implement clear_infoframe
        commit: 3a4ceb89a9723088615ea1c960fc589f87caddb7
[03/10] drm/sun4i: hdmi_enc: implement clear_infoframe stub
        commit: 638409979c5f7d3155afcded67532003e07a7d0e
[04/10] drm/connector: make clear_infoframe callback mandatory for HDMI connectors
        commit: afc399f7a5ea7bf405b2ef85c7470529b1a9e47c
[05/10] drm/bridge: refactor HDMI InfoFrame callbacks
        commit: b626b1a1c9ccadd8861870a2a450f02e0c61ab88
[06/10] drm/display: hdmi_state_helper: split InfoFrame functions per type
        commit: e802c783be94bf71541a7e2ac8b1b5486aad10db
[07/10] drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
        commit: 1d8847f457648ed4932019dcd3081bc27bcea936
[08/10] drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
        commit: 4fc30c2c5c61db88e3d6644bd3dd2032ec4bee06
[09/10] drm/display: bridge_connector: dynamically generate HDMI callbacks
        commit: ae219fdc952c315182b471f5aa71b379584b70ca
[10/10] drm/debug: don't register files for unsupported HDMI InfoFrames
        commit: 5a4e4e30f6dc4d2a68eec08257128906572f3346

Best regards,
-- 
With best wishes
Dmitry

