Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59F71E515
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Oct 2025 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759506124; cv=none; b=MqrbqiBh6Rtos9MdpF7kscfOUX25kfAqldJc8xVm8vsQzfRUNSTvx8uKG5dtcaW2QZBBIatoRveO524ayz6qN/eG9LM/MfFN4kQlQcetO3gZbbp8q+Vq7KLrjkGsh7fwwJGT0RaCQwK9kl4mtrSIU4g1KB9jQE8vEqzbqu6/ybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759506124; c=relaxed/simple;
	bh=f/HYhpOmi5NdJvDfv50xAn7ajor9Ka1AKV//4uuuujI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgH7CJDVi1V8LOxZPvxcLM2ya127RnbX0r0dgZ1onwhOkUfJn5YWj4AeljwmO6A1kNnOkQpngIsJnUr3E5WtB1dTKnxhMxB5pp21FuOHkMnR1vOlBq/HydO/Doqpbe6efecTasyBqW+mPjn4FTy29i8EzqcGWaP/XLj9ZQPDOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHcuaJ8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHcuaJ8q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5939cfC3023421
	for <linux-sunxi@lists.linux.dev>; Fri, 3 Oct 2025 15:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PFJqoBAr+PiZp2WktZc8yF0KtDOJu11/7QZ9DYz4Q4c=; b=KHcuaJ8q50yal7L2
	HUEr1timFjDv2zhX44RHn1HDjLmydEnWi5ygiJscJHYjiqM4ACnXgN9/SwQWY+CM
	PCiayZau2F+ST7KDQn1PP3tdflHcZv+yLwXSClTPNubaih77igQdBVv61PaLvKX+
	jWFRX6OYbGr85vV4nKI+/GgGvl04jWDPbAV3ZCP8xxzjYUMu6Xzf6VQGJmq1jmQy
	/UWtHvLuNSWBfVIMa/Pbn0BSfm1AdpKHLCNgAa+5+U2bgiJVNDEQPr3l6KePfZoH
	jzjtCyHISdZuJAifEviTCkHViKUguzQ0mGhxgRw5Osg0+nybOoJ0ASWHcGw9zCRN
	vIP0zQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e978321m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 03 Oct 2025 15:42:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dfe8dafd18so99896081cf.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Oct 2025 08:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759506121; x=1760110921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PFJqoBAr+PiZp2WktZc8yF0KtDOJu11/7QZ9DYz4Q4c=;
        b=UX6BqAHXLvg63KqBkQqaz+Yx97LOjfVzPvXWpJ2CDiZhXkeBYGMYF+V+epjnlKj+TU
         rSfdunO2bw5AlFNAc5/zuwnToIzi+LGIKeFcPrditOil2WYcpRGiiKwOPhJ86LXs9AGa
         BZmE+hUHkprVktheUouOhSmMxysATBstFBY9CYMzIIQNxKp3U4Jgx3xBLos5PX98reTB
         6j+z5IdvE+LSqckVlXIDOXvVjGVcbVP+wL9SeCXe9q99MeBLppmeflBK1pdOzLp8/Asa
         OcN72B0MTk4Mu1jq8bn9eTtuVbPN4X4w9UiUM7iHalHkFTBrRXhkV+EXIv9OfVRYjP+N
         ZAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT9IvcFhpFtFmdcDPGRDAXLEGeNjGhzG9KQgPREYkGEqOuwV8D9MNL4su5LYI4hxoijCaX2IBi5Nhg5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yycu2AmpikVA5B4nvh3ZT8KUroIWyIHp+bIs+TjfkcqA/51oCL3
	QOne+hUQzIYcMsjjJIrOdMSrd5kxmOeNe4xmerE2iIbZldFWGOdu52djq6yYzuxpQ0MjzOSCbdT
	woIEz4B0vn1jrFlwWK3+ssfpatOiHR1cR7wDNZ1sJiSe6WtA82ghM63DsrkQdcTnWUw==
X-Gm-Gg: ASbGncujLERPteW7L8eKVNN/OAoDVuCvicD/QeAsWVdc9WQinfbjxNXDVO+HbojPwRO
	0CJUfEW4m+DZ2sR8EAbJoInvV1bFySoV3HK3dbvYyFvJPsxBMPnzNA98o9MPIVEFJUfqZa4Tnvc
	ecnFK+/WzBxUbS/d9w0Czb52hOygirjQMEBgYJoHyoIEweWXfM7oWkmXov522d+C7B1c4P5vIsa
	bbBYJSM9IzvucUPvIBp/Uu3F8PYM/tpns1xZCbbkDQ8vRgfLdF4ZRaI+XwUXftp9FFCYgesTMMa
	mEnhgn+bNzuaMkyfITAQMXn5nPFWB8bGXuaEEwt4EGCknxodpXXCffLvFbJSkTKyyapCGJlB4fU
	S0+5TLc26ZpOx1zQQQKTA29bLBQYpciBW
X-Received: by 2002:a05:622a:4886:b0:4e4:d480:ef66 with SMTP id d75a77b69052e-4e576aa6986mr49772831cf.34.1759506120528;
        Fri, 03 Oct 2025 08:42:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/2xpbVmnRYpct93vxxe7SAvfIoNQ8eMa9PfzBd2OW2H+SLCeGQPScFY+dLRkonEp/LIgapw==
X-Received: by 2002:a05:622a:4886:b0:4e4:d480:ef66 with SMTP id d75a77b69052e-4e576aa6986mr49771931cf.34.1759506119677;
        Fri, 03 Oct 2025 08:41:59 -0700 (PDT)
Received: from [192.168.10.38] (91-154-146-251.elisa-laajakaista.fi. [91.154.146.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ece7sm1899180e87.103.2025.10.03.08.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 08:41:58 -0700 (PDT)
Message-ID: <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 18:41:58 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes as
 unsupported
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
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251003-primitive-sepia-griffin-cfca55@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k3zBB6qXXFe5WguQOCDd9duCjgAezttJ
X-Proofpoint-ORIG-GUID: k3zBB6qXXFe5WguQOCDd9duCjgAezttJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXz8HklDRqQaPz
 9C0WARf8oujbyVUEjWDsNStL7cSmsxIlWDvnix1C/HxiTzYhNo1P4iu/AIcL+CdpGHkzVwC+ahA
 +aHiiuTRuLXXHpL6wIlidiyAYFiryshZZPI2uoO/sH+sPsRLbmoM5evz2DPmUc78ARKHbDCOwCp
 t+xAUm1L+Dst9QlVmfCTmxLBN7FfErrZSHhsKAbErQAKTq9rvAN/5Aq9U8M4PkeIh3bNENFrZdx
 tfiEc3LlFEIAE8TYPXfXELXO/1dn/ie+j05Y6tQNoAW4z1TjftrBM48DxP2FetW7gJslWK2UDWy
 bjtQNUZT2z1ONxiEVLuIAcsFYSLtjMr4G9Ndkl3Qm7g89D/nF9kq+7wDaztLqo9HmED/p3KjX4d
 pVLLyFGFeTIlwNBasXqVoNpRBd6Ivw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dfeeca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=GXubj23QK-cXaLjP5W8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On 03/10/2025 17:23, Maxime Ripard wrote:
> On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
>>>> As we will be getting more and more features, some of the InfoFrames
>>>> or data packets will be 'good to have, but not required'.
>>>
>>> And drivers would be free to ignore those.
>>>
>>>>> So, no, sorry. That's still a no for me. Please stop sending that patch
>>>>
>>>> Oops :-)
>>>>
>>>>> unless we have a discussion about it and you convince me that it's
>>>>> actually something that we'd need.
>>>>
>>>> My main concern is that the drivers should not opt-out of the features.
>>>> E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
>>>> (yes, stupid examples), it should not be required to go through all the
>>>> drivers, making sure that they disable those. Instead the DRM framework
>>>> should be able to make decisions like:
>>>>
>>>> - The driver supports SPD and the VSDB defines SPD, enable this
>>>>    InfoFrame (BTW, this needs to be done anyway, we should not be sending
>>>>    SPD if it's not defined in VSDB, if I read it correctly).
>>>>
>>>> - The driver hints that the pixel data has only 10 meaninful bits of
>>>>    data per component (e.g. out of 12 for DeepColor 36), the Sink has
>>>>    HF-VSDB, send HF-VSIF.
>>>>
>>>> - The driver has enabled 3D stereo mode, but it doesn't declare support
>>>>    for HF-VSIF. Send only H14b-VSIF.
>>>>
>>>> Similarly (no, I don't have these on my TODO list, these are just
>>>> examples):
>>>> - The driver defines support for NTSC VBI, register a VBI device.
>>>>
>>>> - The driver defines support for ISRC packets, register ISRC-related
>>>>    properties.
>>>>
>>>> - The driver defines support for MPEG Source InfoFrame, provide a way
>>>>    for media players to report frame type and bit rate.
>>>>
>>>> - The driver provides limited support for Extended HDR DM InfoFrames,
>>>>    select the correct frame type according to driver capabilities.
>>>>
>>>> Without the 'supported' information we should change atomic_check()
>>>> functions to set infoframe->set to false for all unsupported InfoFrames
>>>> _and_ go through all the drivers again each time we add support for a
>>>> feature (e.g. after adding HF-VSIF support).
>>>
>>>  From what you described here, I think we share a similar goal and have
>>> somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
>>> we just disagree on the trade-offs and ideal solution :)
>>>
>>> I agree that we need to sanity check the drivers, and I don't want to go
>>> back to the situation we had before where drivers could just ignore
>>> infoframes and take the easy way out.
>>>
>>> It should be hard, and easy to catch during review.
>>>
>>> I don't think bitflag are a solution because, to me, it kind of fails
>>> both.
>>>
>>> What if, just like the debugfs discussion, we split write_infoframe into
>>> write_avi_infoframe (mandatory), write_spd_infoframe (optional),
>>> write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
>>> write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
>>>
>>> How does that sound?
>>
>> I'd say, I really like the single function to be called for writing the
>> infoframes. It makes it much harder for drivers to misbehave or to skip
>> something.
> 
>  From a driver PoV, I believe we should still have that single function
> indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> job to fan out and call the multiple callbacks, not the drivers.

I like this idea, however it stops at the drm_bridge_connector 
abstraction. The only way to handle this I can foresee is to make 
individual bridges provide struct drm_connector_hdmi_funcs 
implementation (which I'm fine with) and store void *data or struct 
drm_bridge *hdmi_bridge somewhere inside struct drm_connector_hdmi in 
order to let bridge drivers find their data.

-- 
With best wishes
Dmitry
