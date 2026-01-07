Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC12B31AAA3
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jan 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792108; cv=none; b=e9Ithu1aZMlW6UVl/EbWBEUJxq4aJhYW9pltDBU+/P7B01yRyp4qAY4IlCUMhr2DdgRaUexOgvT8iZeBeAL+pnvLNeUeAAUohIYBA/fVqQBfQLx7KCNuYPaAm67sQGjKKqKETLTwZE2ASdvA0GCMcC2a7cBV/WQJN1XmzEd2TUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792108; c=relaxed/simple;
	bh=4bqClnwejNRr2RjR96oVIn3k16CgqSCqqMFStdfbhtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nX4QLUoQLOtiSXnwdYgaQLSVhFi9onuRBxfW+v93XCt/9/PEzor0EYhGbVrBOfDnKry7RMl9H1N/1lLJO2/HpF52gxbt+J4BnARqve1z8VFxuq066AQFcJRLJSXPyvRvJ9tVQpDWQj8ElDXqDqGEzEA2fiak7WJO3xc3yL7Mht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kG3/1cJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVn9cvCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG3/1cJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVn9cvCN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079q5hQ218402
	for <linux-sunxi@lists.linux.dev>; Wed, 7 Jan 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=js9vOdGwDOtrz/HNGFuhKMtQ
	9O5QjU14j2FRmChcdtk=; b=kG3/1cJ1P7ELpcYi4U9ELqLxZVjt72LrO+o8b368
	fi93VpPDiEfi+45Q2CtKwzWuPFKqWY+Mh2EiPw5vd8Vpm2XRAuWkxK31fv+YNbrk
	OSJ4rpTVpu9hHJ7SkXwiYFRpfkTeY9luQTuQ2KYP2RGa+UHizmcikgcC/Zs/WuwF
	kfShAdfmGYD4ImRzKeBScibWpKKQLsGDz07GG52n2IAAbm5UrKb3Ois9v/A5PYBF
	mcHPsICzCwQTnNNr+3AxzepT3h5cb29NlRt3Z5jjNDBDNULEmobYyiKrsOtWKWt+
	IOpcqT84fcn771H2LtNgspTmUV0Pw4g90RXS66kMNU24Dg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn808js0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 13:21:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93f648b3f60so2767126241.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767792105; x=1768396905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
        b=HVn9cvCNLlF9n8XDwdnyqsNjgnoGKm86vkgQYZRpnt14E2m4RjHPniuSzk7aIhudeu
         ss/weqlxtaEwerqe0QEEsw+ONPCMNJNJRkpnELC+O/V+yPHOgKex4CLDq9aRhCjL5b9j
         5AY0x59AYIcq+36BekQxoT4UHpLfOwvaeOwXw+EYL1uM3vve+OYz8wYifQesmPOlAZUR
         VhsAROf9puWHcq8QT4cUAdVYtHbY0/a1xriWq2EEsZYKKeDRGPMt5WHO1fit+sPH8c57
         5Cc1ksBn8UbzeI1TEgP6yEeUNMDJMpD7SvHvUZpQaiPG/O6aIs6jDg4PMUWKAnA8h91r
         NLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767792105; x=1768396905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
        b=TuqTKEgS/aDg43BkG52T41CnzGYd9dr1tRi287lOKp98OObc7Iq60dDAhF70XRf0J+
         m5Gb23D3P0KX8u87WwT92E7jM+8iSJ+Bm4Rgr8b4gxtym+O/pnlko80N+Dxvqd+MXWke
         zK27S9cUm2eT9ictg4oD5H/S5KKFzhtusDOhCr/CrrIk1iKaYj5qP1k3PQ5zAtX7Dp8t
         B0R2O/6Y7G2GyrzOzR46dbDGbNPzFI8c3zFnWEXh5yV6qOrftRHX0sYCSWg1ghVuFWRt
         Rs1pGq/IpLTjS1FHWobsN5M0PoFbC9mWNB7erMkw7HgomMtjEhcFCokee/4xt5UE6EM1
         rzvw==
X-Forwarded-Encrypted: i=1; AJvYcCXj/jR8KD2wZFA9eUqW/T5NunpM9qbB18P94B70Da0GqrNDXfEaKQZw7VAyK5xUtW5dAPqsujva638NUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7itTPuLGkdHtSLIudwta+UGTfSAEPSC4ExqBnetFgTTL0Gzso
	3iVHyoes1bAJSXQ5Av4t33b2mV/rVozYklj7FauW8EJ/ZgaP7t6dQTmo/8U6VqkOGmZRjgLHco6
	yhXSI3ten41OWYPSkE6nlublIXnveAkIAaQdTwNtDfoPBxLoeJsp9hDupUFFb5OPlHw==
X-Gm-Gg: AY/fxX5qbRWPG25UhRJVygiVppQL6BWXCg0/7m65Eur2Joft95f+OQXaYGOtVrSAoLN
	9NMkScbweEGce+E5QRUdg8yZDoDAZ4b3Dr+Z+CtMeEw4J75VLhtfAznynD7+0jgauOrzYXJrSoO
	dqR2htrGne7t91Z1ENf+sKZjKkATms80XSZQCaqZtAe4bg1dMvqgD+E5/izxrNX+CN27eIWlMda
	v09S4KgqASVD8R24gNDsbCtg8S0VIYsjChLNYT3LTVJWRVI7KV8eR4AC2fxvd5mfklKaD8uSQWx
	QHtV3HdmF+TTK4d4J3SuKvkHRGcZduHCEDO88pHBze4dZ0Be90hjIfpwHjX+gbnCoXVNQ+oZszj
	BCeox8t1i4q3qfZQFNWHjm0PRrHAYsAfsC35sKG3cY76oy40jBTjY7ZKozEfBIETbHQeeFsJICa
	4lPuuSz40mRqCeFU6PVQyGAIU=
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id ada2fe7eead31-5ec752dbfd5mr2097433137.0.1767792104902;
        Wed, 07 Jan 2026 05:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2NXBDg7wVXP/zTsrowEn5NsyiVqeMK7cDHudpgAqGMWRN5e4UR1GPSBvYkE7wBgLCTq0Y4g==
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id ada2fe7eead31-5ec752dbfd5mr2097376137.0.1767792102812;
        Wed, 07 Jan 2026 05:21:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadd1sm10295211fa.34.2026.01.07.05.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:21:40 -0800 (PST)
Date: Wed, 7 Jan 2026 15:21:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Message-ID: <mccxwmemwxp4fcyjiu3zofuydk5ahmhnluqucwau5a6aiw67xr@52gynmrblml3>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
 <20260107-fascinating-boa-of-fertility-1886a0@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-fascinating-boa-of-fertility-1886a0@houat>
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e5dea cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3wq6KaL0rsEoTcXXugkA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 1zmH-SiicvNYXBTzQLhwloqKbTe0NYRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMiBTYWx0ZWRfX6QG0dzZ+rV4o
 g+eSHpAzmkTFBKVBpebl/6ybggb+C9IODiK9ne//zwLo31GsYjszJDSAnxriZSsLVP8JZze2Vqw
 4Ck9MEZB8yAISOoL2XAxhzq0j5KcXye8W3c/Ogq+h8gB7ZfQ+5MwVuWmKa9DzmgtATQrrepV9YQ
 EJ3dAPRBNJhKhJp4aOGkgwEgYGPE9rYOhrqUwrbshx3GL5QhCIg/7FbmxFo1LZ69nSivlVouV1K
 H1H0uF5K246ZHNCiOHo5mBANsaaR/Q6GfT2L4hR95sqWmvgGsg1iMX8YPC/rFQ245aXzzQJzaxB
 ZmjWyI1MtHspAqn4A7uVs+yvttdevzhukFghSJEWMoUl+LFGSy6REAVFsITALRXukojB7xh5PMO
 iYIK+qdTuokeyKp4saBGaoecqDVbtzGYX3fNn8pX5k8IV1clMqhFYpLyhTQtJ7vBWzOj5KAYYy9
 I+XF2/RLUEuTDBgkP/A==
X-Proofpoint-ORIG-GUID: 1zmH-SiicvNYXBTzQLhwloqKbTe0NYRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070102

On Wed, Jan 07, 2026 at 01:50:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Dec 24, 2025 at 03:02:56AM +0200, Dmitry Baryshkov wrote:
> > Updating the InfoFrame if it can not be sent over the wire makes no
> > sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> > and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> > an error if Audio InfoFrame callbacks are not implemented.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> IIRC, audio infoframes are mandatory if you send audio over the cable,
> so maybe we should do like you did for drmm_connector_hdmi_init and
> error in drm_connector_hdmi_audio_init if we don't have the proper
> write_infoframe hook set?

HDMI hosts can be sending Audio InfoFrames in some other way (think
about LT9611UXC, which manages infoframes on its own).

-- 
With best wishes
Dmitry
