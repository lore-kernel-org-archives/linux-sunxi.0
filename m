Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8F72C0293
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Dec 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138208; cv=none; b=epVmLx9PcgnvTHVMBrkrCWP7JlFKifP/Mz2hr+9ZL6PmLffwdi6lktSgSueTRiRHKLVboOGsucRzijKc830v2MbFIUx7CwtN1kCmytf1Avfq23zBfB9ndsFqqtzD4q4dheZxl3aO/FMSverlNQn0uKy6wV7nRXoeBysa7FRzAW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138208; c=relaxed/simple;
	bh=Ch5vWbJXT0wvLq1bmYQqIQOK+E4BgmbMDjNOWeVfoyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7uijFiCKhzt5hs9Ws25EpFvrCwuQQ9IccvvMRQ9KPbkH4MJgSqKU82RQL9QdTmQ7xuZ9LbYvmyOYdEEn2P9RY9i9SOBKQqp0ds3ymDy3HsZDIKc32Y4HLRLLO/D8W1bbiVryQ623r5V11yWr7/j7Bb9m9S2KHvmQyG1Grmf62g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBvM2Wno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUA8dP4f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBvM2Wno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUA8dP4f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c5kT3939280
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Dec 2025 09:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=; b=mBvM2WnoXkzYN/kC
	SJGG65cEd1jX1y37nhMNwPXoYap3kWJQ87NpviuiG/9EpW6RY1R2+65CQo0TacQK
	sg5g261EgUkzpSZNRyIQ5Tbq94grrpgA54RJf6dw7RiPrt9VvtizQFAgaUOcEl8M
	GWgnCmPqSj0yr1tNRU87wP08XWkpyiLLJXDEohVRQEIe6jqZ3UEAy9xpKoaXIU/+
	ForMEEIzdxlOZtKRPSjpS3PmCX2Ly5oARuhQGWCswtUnUjrxx7VjBJaXw4Eu3pbN
	YXSBkcSKxsz957JQmEVhedqMLHHF9ABw3MrRhNod1hp64Yv1Ut2wd6spRjrh8MHF
	YF2vfA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c277k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Dec 2025 09:56:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a360b8086so36267476d6.3
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Dec 2025 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138205; x=1766743005; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=;
        b=VUA8dP4f+axuFcY9w9P418PPpgegSlVKhU0NOhoczyYIrWMCSSbSer+0d+quZHVWTe
         3lPaTu2sB0QxnRYA/20APu+dlaEDWSL5m8hFT+nqHL76sxkI/Ko+b0dMkdPx+fjofNm7
         tq1v2xRiCPNuNkjcwHOWybd8LfTu4s4wctmCpAbJ5KjVBqdiXhFFRpmG4KLfNc76B/0J
         pxdv7DR0cETaBwosQOOA5Aht9jloycYZ1VQ1iHTuhiabE6YRLK+zHN9c2ME9GAmhEk8e
         Bj4ytvtUJO6IAJvzLTJRWZoIWDXZsu3ePIpeMQSKDeQsRTB3rUDij8eubL8enKk+/lUF
         UtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138205; x=1766743005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=;
        b=ojkiaNsJvy+1loidEKKrR7hT/FXSH5E2iVgh96kk3b5ID/rNyYiqwjU7TlZjgzHR0N
         E31fRXg33t8FGQrmRKzYZrMzYnZYjaNQzpkc6U9d4gKIecpdLBm+re1cG1Ta97SngLrp
         GNO22gAv3kcv/Gc6JBYtyikZ2oEQpiDM1rV7iuJ01BkPBFvJTJ4bAfWqRod4x/s+eKgI
         kAeb4tSpxAoK2jlEbqTt9qeCr7kbuX8PPVPD/4XSWiyckiOp7P/UhRACe1R9mZVCaJdt
         hETlNHbq70KGjksJ/N/nk18/3YHiRwVZ09GARkoAKXP+yYt1u467KaWfUVHMeOfGBZnV
         qmcg==
X-Forwarded-Encrypted: i=1; AJvYcCXPf/h8wenxfFtyujuDR9Q28GR0KiaG6K5IgzP4HuB2F9FKNeZmHgbivqyyFJJo4ZSUF6MRJ8L3Pga4qg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3MXUEhJdJYoGK6qUauMIguHCqFdsXVwCNIMbTIDhSQutpUMjI
	617LNeDutvajHqMZOQh5l4u7y3S6l3fs+GDQVe2OCaBCvsmJHAzqW4kKK25XI0Qz3EULTlr/7QT
	6rIIUOMFMu3CwSiLwj+kDRaRAxwkleN1QZBPgCn90duJQluOpQ4gcMbBddcS58URhAg==
X-Gm-Gg: AY/fxX6zuX2pNP+/cD4I4bttbUm55Jo3mnZoyY5BrMBIAhzx568WMVdiUzMtkR6Z8y9
	0wZiFfQ7v2Jcx92rx5MqsjDtTC9BE80BZQ9XN15GI6W0rJnsJo6RmeA8G/DqtnPUvcOoZDjyV0z
	3W7UeD2HW7HaizH//PkhCyt123OvtU4gsPC5Uac3g97fxaThFqjyk00g3jl6wVEAx9q1dZUHtcJ
	NcnKr/iamzJL7PDz8KOBhH9QQ+Y3twvNaa4hDlacP+6BzJvSTTzUeDm0o/1as5nQohyMIUa1fJ9
	N55cb/T4pj5B8QMm579d4SWRpJIENoCU2JOVZoL85gf9OldZxfoW942DwD1B4dic40er7iQLd0f
	CpJhdjwvq8U/a64/MLJ9EwK4Tu/21TYXBwIUU0Hik535ZAOWQqZO/XquA5vEn+UiuWLTn
X-Received: by 2002:a05:6214:1c4a:b0:880:4ed1:ce32 with SMTP id 6a1803df08f44-88d833b580bmr40114536d6.45.1766138205404;
        Fri, 19 Dec 2025 01:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmL/9SGkWyvSpj/ayO4oxzYHHhXmjwsfj/l32rWMsHt4VSUg1NRyyPchBsCrruiDNCaZinHA==
X-Received: by 2002:a05:6214:1c4a:b0:880:4ed1:ce32 with SMTP id 6a1803df08f44-88d833b580bmr40114456d6.45.1766138204950;
        Fri, 19 Dec 2025 01:56:44 -0800 (PST)
Received: from [10.193.196.209] (82-128-196-119.bb.dnainternet.fi. [82.128.196.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186f957asm542852e87.28.2025.12.19.01.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:56:44 -0800 (PST)
Message-ID: <a0acccc3-00d9-4235-9b4a-f4498b2896ac@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver
 capabilities
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
 <20251201-enlightened-zebu-from-asgard-5a20be@houat>
 <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>
 <20251219-honest-slim-crab-02e932@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251219-honest-slim-crab-02e932@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MYkdp9dn5yt9oaUJia49zsAZA4sqceHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MSBTYWx0ZWRfXxGCTwZw1ZTKl
 cS3hGHgUGWidzjAv0+bkUGKjihjIrX2F6sy7XjzBE3ZsRr/bzER1L+5XtZwPijnh/nLxz27a4Yc
 vC3/dJ2JmlKt0ne+pmqH0LV25C8EPOmnukV5dg4m6irIENfpr4Ibw51smJWVNcIlMA0vvSqqN0V
 7PUvVMs8q3n8snKSVTqkSPgRb7of/hRb8JUWkI+a056m+1K+EWZEDUKHoRaz9YvkGR3jOokJvej
 QAaItXuMPN7z3yIGWx3DPlxNDtFIner1vZNq12qOkSuBYIIm2i+ldcF/Z/ytlZEVffl8VLeAFl6
 spsu8MJwZRhF1oEjfn6NSdOFo359LAbtfSFfX9Xxc5lGjrxSOgw+J0zH5HseIOEZZnoYglxksE9
 VHUGRxwvSJlkA8OZn2FLUf0C+3jlJgN/1yF6aD5O7URvD3+DR5RuqgGZAmvNYXaYB/AHBTZWWnt
 GiJ4DuXReePax6/Oonw==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=6945215e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=UP4AmmvVc3sGQHJQO2VA4Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wWkPZpA8QBIs0yCpxSwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: MYkdp9dn5yt9oaUJia49zsAZA4sqceHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190081

On 19/12/2025 11:54, Maxime Ripard wrote:
> On Sat, Dec 06, 2025 at 01:28:14PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Dec 01, 2025 at 06:01:56PM +0100, Maxime Ripard wrote:
>>> On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
>>>>> So it's not really impossible, you just need some hardware and a day's
>>>>> worth of work.
>>>>>
>>>>> There's no reason these should get a pass, it's breaking the spec for no
>>>>> reason.
>>>>>
>>>>>>> For SPD, It's really not clear to me why atomic_check should do that in
>>>>>>> the first place. Your initial concern was about exposing infoframes in
>>>>>>> debugfs that wouldn't be used by the driver.
>>>>>>>
>>>>>>> If the driver doesn't register a debugfs file for SPD, and ignores
>>>>>>> whatever is in the atomic state, what's should we force drivers to do
>>>>>>> that?
>>>>>>
>>>>>> I really don't think that drivers should mess up with debugfs on their
>>>>>> own. Making atomic_check() disable the unsupported InfoFrames makes the
>>>>>> picture perfect: the DRM no longer tries to program them to the
>>>>>> hardware, DebugFS files stay empty, so the whole state becomes
>>>>>> consistent.
>>>>>
>>>>> In the "bridge has no access to infoframes" case, there's really no
>>>>> infoframe. An empty file is "the infoframe can be there but isn't used",
>>>>> not "we don't have access to it and can't report them". Only drivers
>>>>> have those infos.
>>>>>
>>>>> If we do split up write_infoframe into multiple functions though, I
>>>>> guess we could create the debugfs file only if the function pointer is
>>>>> set, which removes drivers' involvement if you don't like that.
>>>>
>>>> I'm fine with not using HDMI connector framework for lt9611uxc.
>>>> Likewise, I think, it's fine to have empty files for the infoframes
>>>> which are not being sent over the wire for any reason (hw not supporting
>>>> it is one of the reasons).
>>>
>>> I can't think of any other example in the kernel where an empty file
>>> means that the driver doesn't support something.
>>
>> Okay. So we need to sort out implementing the split write_infoframes in
>> drm_bridge_connector. Any suggestions there? I'm asking, because I don't
>> want to end up exploding it.
> 
> I guess it's only really a problem if we want to make it const, but we
> don't have to? We could just as well allocate the structure directly at
> probe with a drmm helper and fill it as we need to.


Yes, I wanted to keep it const, as we usually do for all function 
tables. I will use drmm_alloc for it.


-- 
With best wishes
Dmitry
