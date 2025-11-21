Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93F28C864
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Nov 2025 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741291; cv=none; b=r0STMQrN5vmr/V1jzxg19asbWKS1PSVCjiXAiSI3O6fmlslSI2UOcC/brd9p4uh1YIPp7ilNrxu/qT8QAPuVOWQj41+fRhVgL+yTiqeT5L+1rgF34BzYqlBT8bWhv6AGTI6JsbUeMxG/cv4khsEElzRLN1LLBfnwev/VtTqsNEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741291; c=relaxed/simple;
	bh=zTGCikSwl1HVduTQn/LyAeDLC8y2tPasfgfZ85I33ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/s8qQfQepViiHe37kHyFe4qcMV14m3RR0KMrQmBeTQAVrNlyLgOehhNLuWA9Qf8w9nXANzheI5VBFjhSphxmgSNxum4vqxH8TnMxDWOWACUIvU1y3oIODTMyzRsU0xJw2jwnSlQhiIYd6OTGK8sfflxeOOMsbuY2J3dg4BCtVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIXXKixN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH4eminq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIXXKixN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH4eminq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB4BQ83911371
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Nov 2025 16:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ufeoh7bUM/nJ4GaNvnQRw4cW
	bujDEIpSOeuZ5ieZIV8=; b=hIXXKixNU13SiX+lrJVmgBdkops/RLgPt5jtIm4X
	3ThhrPw9dH+49IIbUKhVU4Js8MKRhBc2fBU3eAoW80ztIiCFqJOo83GqCO47/vQb
	RrSSCCNObh7mXJCtGW+ytCRWJk5bfoMUcP9iyVFBTpw3uKJPmoER9ELDoA+X66zM
	NGJfo5NCYxOAUGtAaANZT7yEDz9ARwRWiwFKaHLToKMZjPk3pqQ2AvXBosWYSeQB
	bIhATxwCxXvQUsgvLYSIWE7v1Y+AKFeOcZdwPAxmunfjq2cFVQsdVXUOPWoV1WLf
	lKoOrYhjobYngek4mmU0vi4PpcLVf0MM2JCRThLtgWJETA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsgwwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Nov 2025 16:08:07 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55b2b3ef606so3788498e0c.1
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Nov 2025 08:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763741287; x=1764346087; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ufeoh7bUM/nJ4GaNvnQRw4cWbujDEIpSOeuZ5ieZIV8=;
        b=TH4eminq2E+r/stwKOlmYdPSIvWm1sLtHNYxkYVi0TBxiryV3e5OTnEbZleJI12obo
         CL4X4828TehePs+JroZNnLFFc1hWL7Ttdawds+C4cAXSkvdNwPfuz2bzHj+UwJsh1OEC
         8/O4XZCo33+tshNhduoKYXhB6yz/CrRueE1iRIYzt0X7tdObsYptqUvjc0ISj3zVH3Sd
         mr67R9OwjQxAK+5JsYcMVez0rFhm3DmFHt/rbwopWGCoCa/nLuCNlscX+9FV1nW63/PQ
         Reuyv0ii2f2Qpe+Q81n/PaCXfKgOKkTn6YPOk5yjBZwri9Gs3DtcvqXKn8Q3b9kWeydO
         fbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741287; x=1764346087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ufeoh7bUM/nJ4GaNvnQRw4cWbujDEIpSOeuZ5ieZIV8=;
        b=Zf37wSAJ8BTfNo7aCqYJ3YgKY+EsT4SPFDApMA3Opd5hea7nqmzqnpWOzdPF5DU11x
         IKOckMYIiLHARRtiz3F6tPg9M5OyPsP+NpIItKroR7eUUympmxdyZcAe2DubqgOZdBI3
         4ikBhI68JiSOBVvmJbj05qp76vJDSYCFmqPeKpRxga5IUaNwde9LYhW6maorsLPDH+0H
         87Hwq89bk083jU+hNNAiOWezt3AEdp4AZHeSbH8m2TSWkZi01AY4VfgrsNPFLaNynJQr
         vyHmDWJThzr8G+0/80tEwcbaCslgNALNddCWz7eWmj8gfxc8750EIMzCzmv2+S4X/uEg
         WZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCUWqIc03rIhCOHHYgFQ+4UZSj5RzMDIA/DwwekCEykDzW5DAmfjuJnpZBfflFu/Lr0J5cLY23KiwzouSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFO3cTZ1PYp95bPLihST0lH9Ydlbtqm10uKzVKIYXp4BraatGr
	K0bN9TU8Icw4y9TVXbWA5EwBuA/YSA+fM/rxprWv3lJRA8lY6TnFstXSZZt4WLOckMufOIV51Sz
	vKOVTqB00XF+4zVp1lyv57C8QBOYZFBizbMatWGzK+QlOjG/x05cPMMZyHvHejNUS6Q==
X-Gm-Gg: ASbGncun7/fMN+J1uaimy3/rw5Q6cAyJBmTkasWVc2Zq8gUHyCc3PJg4eSamCnQwYA2
	L939OzUUON4zipfJ8bJsQjFrazmLp4l9nKc4C0x68LaAuFNRxp4Lq749pVt0AHres7+NNIDvq/o
	g1yBXaSOTC2CI6qITib5IWE6XQ6+S4iomDrpZgMuUt3FUQMR+n7P25ZGnJJxEpZiV5U8xuFB3Y7
	iq6LEF1LqUHaEyccLIf1hEjU5pMepLuqOS+0gApBhPnh3Su/nkx/MiwrEMAzo6x9MvXT54YWKzj
	wf2FI3OKMIm7SyxZCbDtUgg/cI9QN6AwL5rKGr2JLPLLWEEJG6DRXw4adX+jSDAfM+Z+aZ7l24+
	1MrCgecqyJox1sTo0Zudb0FbsPwvmppVDYNx/i+lBbJOmUpvbeKdmp2wUYF/+fvgKKBpi2++01g
	YgDasQJH3fz7nm69W2YAZ2v7Y=
X-Received: by 2002:a05:6122:2c07:b0:559:83e9:290 with SMTP id 71dfb90a1353d-55b81923b82mr2151488e0c.1.1763741287282;
        Fri, 21 Nov 2025 08:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVq7cAAt3X3C7SUO92wc6199AKDzCdd4I14oiTzCPYWOFGE06Zbz1JGXbXRXaOPE1XR2OH2Q==
X-Received: by 2002:a05:6122:2c07:b0:559:83e9:290 with SMTP id 71dfb90a1353d-55b81923b82mr2151424e0c.1.1763741286683;
        Fri, 21 Nov 2025 08:08:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbeea7sm1718367e87.65.2025.11.21.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:05 -0800 (PST)
Date: Fri, 21 Nov 2025 18:08:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <5qncx5sww7feugjmtkskvoussd376rgxtcx3fqqgmgatjrdamx@iio4gxk2ildp>
References: <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
 <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
 <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
 <ez6y7q4lgbwt7kpnlpausjpznckr3yyejrwtxm7o6qw6wlhqoj@6iypzdhfthzy>
 <eiaxss57hauegv64ek4ddi3ib5x4t4g4xwiqvuaj43b52wpctb@p63ewh6tqblk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eiaxss57hauegv64ek4ddi3ib5x4t4g4xwiqvuaj43b52wpctb@p63ewh6tqblk>
X-Proofpoint-GUID: c9vh4OBv8bjvZP4-rrR7bTPpvpO_cEID
X-Proofpoint-ORIG-GUID: c9vh4OBv8bjvZP4-rrR7bTPpvpO_cEID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfXwVClQ3r+vZ3s
 PF7NXQk6KHT32dZFk8jzx4ROP+bPiHCveAQE8u+h9u5pvB5JL47ptbdu+wLewwA8z9qNaq3TOx4
 JNNYQtqSk1E+lchyvo58+fpGWm9c9CTcuf7hs8F7OPFTv5NvAyhZMt8gTS29NZ7vOIU/zk7jjSs
 /wxLEgEO/u8l0dAVqmI9YCwdHb9G6WyUUhtY6oPKvXPQXMRauu3n06fzDWxdU6fkSyhrAEmbRCp
 jODIUkQlb7+Cvq9Yi6YYOGPFuIddGevEsr3pL8yWTP3YUBxD1RqL8+ARmwL+KH4E/4l2s07LNwX
 XnlslmkrzuycLgpvvUWoVcT7SQpOB13ZkJvWkUQCPB1+PegUa5HDzQ+MaFwb0Th5LX2VxNDrPPU
 NLHHAKGQQ4leH7NGo1wOkzV6wW8WQw==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=69208e68 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=siajl1OzrqvGOPi-8wUA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119

On Fri, Nov 21, 2025 at 04:48:02PM +0100, Maxime Ripard wrote:
> On Tue, Oct 14, 2025 at 07:02:03PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 02:43:58PM +0200, Maxime Ripard wrote:
> > > On Fri, Oct 03, 2025 at 06:41:58PM +0300, Dmitry Baryshkov wrote:
> > > > On 03/10/2025 17:23, Maxime Ripard wrote:
> > > > > On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > As we will be getting more and more features, some of the InfoFrames
> > > > > > > > or data packets will be 'good to have, but not required'.
> > > > > > > 
> > > > > > > And drivers would be free to ignore those.
> > > > > > > 
> > > > > > > > > So, no, sorry. That's still a no for me. Please stop sending that patch
> > > > > > > > 
> > > > > > > > Oops :-)
> > > > > > > > 
> > > > > > > > > unless we have a discussion about it and you convince me that it's
> > > > > > > > > actually something that we'd need.
> > > > > > > > 
> > > > > > > > My main concern is that the drivers should not opt-out of the features.
> > > > > > > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> > > > > > > > (yes, stupid examples), it should not be required to go through all the
> > > > > > > > drivers, making sure that they disable those. Instead the DRM framework
> > > > > > > > should be able to make decisions like:
> > > > > > > > 
> > > > > > > > - The driver supports SPD and the VSDB defines SPD, enable this
> > > > > > > >    InfoFrame (BTW, this needs to be done anyway, we should not be sending
> > > > > > > >    SPD if it's not defined in VSDB, if I read it correctly).
> > > > > > > > 
> > > > > > > > - The driver hints that the pixel data has only 10 meaninful bits of
> > > > > > > >    data per component (e.g. out of 12 for DeepColor 36), the Sink has
> > > > > > > >    HF-VSDB, send HF-VSIF.
> > > > > > > > 
> > > > > > > > - The driver has enabled 3D stereo mode, but it doesn't declare support
> > > > > > > >    for HF-VSIF. Send only H14b-VSIF.
> > > > > > > > 
> > > > > > > > Similarly (no, I don't have these on my TODO list, these are just
> > > > > > > > examples):
> > > > > > > > - The driver defines support for NTSC VBI, register a VBI device.
> > > > > > > > 
> > > > > > > > - The driver defines support for ISRC packets, register ISRC-related
> > > > > > > >    properties.
> > > > > > > > 
> > > > > > > > - The driver defines support for MPEG Source InfoFrame, provide a way
> > > > > > > >    for media players to report frame type and bit rate.
> > > > > > > > 
> > > > > > > > - The driver provides limited support for Extended HDR DM InfoFrames,
> > > > > > > >    select the correct frame type according to driver capabilities.
> > > > > > > > 
> > > > > > > > Without the 'supported' information we should change atomic_check()
> > > > > > > > functions to set infoframe->set to false for all unsupported InfoFrames
> > > > > > > > _and_ go through all the drivers again each time we add support for a
> > > > > > > > feature (e.g. after adding HF-VSIF support).
> > > > > > > 
> > > > > > >  From what you described here, I think we share a similar goal and have
> > > > > > > somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> > > > > > > we just disagree on the trade-offs and ideal solution :)
> > > > > > > 
> > > > > > > I agree that we need to sanity check the drivers, and I don't want to go
> > > > > > > back to the situation we had before where drivers could just ignore
> > > > > > > infoframes and take the easy way out.
> > > > > > > 
> > > > > > > It should be hard, and easy to catch during review.
> > > > > > > 
> > > > > > > I don't think bitflag are a solution because, to me, it kind of fails
> > > > > > > both.
> > > > > > > 
> > > > > > > What if, just like the debugfs discussion, we split write_infoframe into
> > > > > > > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > > > > > > write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> > > > > > > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> > > > > > > 
> > > > > > > How does that sound?
> > > > > > 
> > > > > > I'd say, I really like the single function to be called for writing the
> > > > > > infoframes. It makes it much harder for drivers to misbehave or to skip
> > > > > > something.
> > > > > 
> > > > >  From a driver PoV, I believe we should still have that single function
> > > > > indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> > > > > job to fan out and call the multiple callbacks, not the drivers.
> > > > 
> > > > I like this idea, however it stops at the drm_bridge_connector abstraction.
> > > > The only way to handle this I can foresee is to make individual bridges
> > > > provide struct drm_connector_hdmi_funcs implementation (which I'm fine with)
> > > > and store void *data or struct drm_bridge *hdmi_bridge somewhere inside
> > > > struct drm_connector_hdmi in order to let bridge drivers find their data.
> > > 
> > > Does it change anything? The last HDMI bridge should implement all the
> > > infoframes it supports. I don't think we should take care of one bridge
> > > with one infoframe type and some other with another?
> > 
> > Note: I wrote about the _data_. So far the connector's write_infoframe /
> > clear_infoframe callbacks get drm_connector as an arg. The fact that
> > there is a drm_bridge which implements a callback is hidden well inside
> > drm_bridge_connector (and only it knows the bridge_hdmi pointer).
> > Otherwise, the bridge, trying to implement drm_connector_hdmi_funcs has
> > no way to go from drm_connector to drm_bridge.
> > 
> > The only possible solution would be to introduce something like
> > drm_connector_hdmi::data (either void* or drm_bridge*) and use it
> > internally. But for me this looks like a bit loose abstraction. Though,
> > if it looks good from your POV, I agree, it would solve enough of
> > issues.
> 
> I'm not sure I understand, sorry.
> 
> What prevents us from adding ~4 functions to bridge->funcs that take the
> bridge, and drm_bridge_connector would get the connector, retrieve the
> bridge instance from it, and pass it to the bridge actually implementing
> it? Like we do currently for write_infoframe and clear_infoframe
> already?

Well, we discussed that having the write_foo_infoframe in the
drm_connector_hdmi_funcs means that the connector supports that
infoframe (and it can be used to e.g. report errors). However with
drm_bridge_container, we need to set all callbacks in
drm_connector_hdmi_funcs, even if the underlying bridge reports them as
unsupported.

Am I missing something?

-- 
With best wishes
Dmitry
