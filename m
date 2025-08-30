Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186E21C163
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 22:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756592961; cv=none; b=WsAnuHPbgMJNJHdkGQWbELgZzjvwFi3dAzVT7mWrmhiYUMpYH1zvw+96P31v0kpkDL/OZWSxBVcxEtApQBClNNbHcHFGqHkUw+41FkqH/eZpVzAw+f4AcN6Nt49U1JmoDto9hglRYfYPP1aKakdFe7y1QuGaK4rM7e+canc4eUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756592961; c=relaxed/simple;
	bh=yIyAp386I3Prc3FkKEid6JF6HPgnBsg602KONjAF4go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLenR6gOMONUYAfdDXBzFSJlEm+8njJWSPCCBeyewZQZG3BF9cuggKe01HwXLPjv/AuZTq3VABOgQIkZYlehB6Q/QbEhhADojKtcaOeRuXpFDfHJwb7PqAlOYiSRTV6jmusPMKljTO+nMWGYOV80rf365bE84+/In9vcv4EHXnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3GnX8W6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3GnX8W6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57UMFK2Q017747
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 22:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GNi6qlMhUO/dlDLKPCpe1Eoh
	MUP/BhLmz8wF/QSm9/A=; b=i3GnX8W6MzF7/jJqLQfusJdMEK+lmRXnmxPfHHY1
	JPvU271NEVX0/v6y7ODjamnq+H35oviI2R0naUJNBJpMjQ372GejEdRgYAaVwriD
	UuP6g6EZHnfjp6jRkib7fwem4DSzBXnuwGFWs8Bx/dKken7qgT+Q47BDBEnHD/fW
	AOjVS77HhoxWByxt9zCkSoPxghyGfIfk80XXJk/y483CHjFMaGP4kjQ/AcYT6ciI
	i0qD3LFPO0B/sa8mnRCx5iomQnAJyXkhrVP00urFpwzbtyFGPxJgQ03tWBSnsQAX
	T1fqATL+5HD27JlCxMLfLyKmM7EZNQWozZhMbvA9sqGkOQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8ha79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 22:29:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f55eb56so59987766d6.2
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 15:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756592958; x=1757197758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNi6qlMhUO/dlDLKPCpe1EohMUP/BhLmz8wF/QSm9/A=;
        b=MvuFx2cf6gT351AyhtwHCDZb6Aipd3uuA1pRZKk66wqCeBPnEEJszvOQqxz691o5X+
         Y1pSsaW2FFUOuPfdI/GuYadXBltvDv4ni5KeEREXunAp3WHlnb1aPUbGe08andUjRk/u
         wq6WfC5TJ9H6cm9iqSnTdHIE4Fxm3dKuRiAbWYHwqzI9FTRibNYiYVCA1c6oB2nycCCk
         Z1VJGQJlcfG+wU4PxIiRKShXxn00HI/QLSx7voax/WHsVnQ+gD2fWFfALWs+VSHMRsxf
         Am3tr9vTqr7zNRYagCLuW7UNqWMZX8YD1tyPCwV9VrpBtKnn3PqQ+k7FvSqzyOckWsek
         m5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUe3TqTpI+UZbfloNDyXyMwkFLo468Yxg4xbRkSGoX7Pc6IVYVLUfAEuV5wK0CcDsvZ27ToW74x8wXFHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuVEwWseN6fBqiODcE4Y6VdMD7CIR0n6dKtRZzN7xE86r7Zx+U
	mz6cByxSkHHZCrXM9DosxujqrBTbyzadj3YwsTkhR+0zM2B6hAeGJdGVQcnbreYetNPyiG8Ik6l
	m533ymUZIxDjHmUODqfPM/dYpyHMB8oEHv5V2xP4ZwVU8oCMGdNiE14DE7p/soROkwg==
X-Gm-Gg: ASbGncvgGpxLm8gi3BVQnM0z97KTLwd3uqU4vFijHDBT6+i4sJ2rpzQNFsd5m4b/rIn
	plBwb1mt4CdktmIBjkl5oCUSik67JaWcUWLIv5OUtXrdRLBl9AmpQtxO4zC0c+z1zPxRM8ajBcS
	WG1ziiC+NA/9C8szMKMSQYvNR6FZhmVYaba7R7OS1lmutubDXPvWVMrsX6KBBXPuOL7UOtJuFJh
	UvOYt/d5wYRRmvRofpsUbtcgTq57Jku99kgQ2My9Cw9mBz6ld2xbr8h6NXg62DOj8G5FTmFaFYf
	Z1dwI275Vq86Wlc6akecJOMk606GMiJYItHzKgHOk5DFdtlMlZ+6XyUX+IMEZrl74zYo/PO4bkB
	qTet2xQ0CAcUteymiBHgFeYf+Nj6E4JSMH8Nt6LaPfLvWABCX/EmG
X-Received: by 2002:a05:6214:21cb:b0:70d:c6b9:c256 with SMTP id 6a1803df08f44-70fac94115cmr30677806d6.58.1756592957774;
        Sat, 30 Aug 2025 15:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaqdCzqqQwp+xBjOwKvWSPX4p3qiZ0ZzV9L7+TYukjcGa33kntlWRwDlkYGow/owafc/jjnw==
X-Received: by 2002:a05:6214:21cb:b0:70d:c6b9:c256 with SMTP id 6a1803df08f44-70fac94115cmr30677306d6.58.1756592956994;
        Sat, 30 Aug 2025 15:29:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336d0e3f3absm4929391fa.37.2025.08.30.15.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:29:15 -0700 (PDT)
Date: Sun, 31 Aug 2025 01:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: FS3m5sHafQ4LdcuFdmRzvl_CvUBSiyDB
X-Proofpoint-GUID: FS3m5sHafQ4LdcuFdmRzvl_CvUBSiyDB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX7XtU9fc/dOWp
 vLrJ97xSGrnF9ZpywguL8Dd7MRoR0Ejq1s2Z2UmyN+U49Q7JL+C3cWNcMMXLl3Qb+lAIn60RBAS
 SP6tJU58bkHKOHqNFpahRxf0/O4OOmk0tFKJfuQ/0EOOF0vFajgEISYrxI/EVpqeuDVOccZhun+
 N3FDIF/GG9AQDuPcsAMngnsyOjoYW9pM4KmJP6KmBE5w1DlSgzE4lZ0+UmHAegZLYtVNIcz772H
 pFn9QbY/OXKbokptMVCEMjF0h2XPMIxIOJ7oTAJPk00vQc62St1ww1S1MzhHinAZg1kMnsSNLQ1
 O0moA6cPFul/+Ra9XtOtaH8XECgqzCfE8+WnhZOYeZIVWDFEcU5KfSFwJAzx0e+/T7TPNimXWMw
 vL7PQSNg
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b37b3e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eLVs-IFDZWC_gK9YM6cA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> Hi Dmitry,
> 
> On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > It's not uncommon for the particular device to support only a subset of
> > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > a model of ignoring the unsupported Infoframes, but it's a bigger
> > problem for the userspace: we end up having files in debugfs which do
> > mot match what is being sent on the wire.
> >
> > Sort that out, making sure that all interfaces are consistent.
> 
> Thanks for the series, it's a really good cleanup.
> 
> I know that dw-hdmi-qp can support _any_ infoframe, by manually
> packing it into the two GHDMI banks. So the supported set there is
> 'all of the currently well-known ones, plus any two others, but only
> two and not more'. I wonder if that has any effect on the interface
> you were thinking about for userspace?

I was mostly concerned with the existing debugfs interface (as it is
also used e.g. for edid-decode, etc).

It seems "everything + 2 spare" is more or less common (ADV7511, MSM
HDMI also have those. I don't have at hand the proper datasheet for
LT9611 (non-UXC one), but I think its InfoFrames are also more or less
generic).  Maybe we should change debugfs integration to register the
file when the frame is being enabled and removing it when it gets unset.

Then in the long run we can add 'slots' and allocate some of the frames
to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
salvaged as another generic one)). MSM HDMI would get 'software AVI',
'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
want to use). Then the framework might be able to prioritize whether to
use generic slots for important data (as DRM HDR, HDMI) or less important
(SPD).

-- 
With best wishes
Dmitry
