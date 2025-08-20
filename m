Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF452E4272
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755688525; cv=none; b=PQ0r3nWV8rVBi2aN6BpK6hYuSlq83Kqz+4yquRoEMPyFgsquhr6+ZH8JYVO6ECHmBSdHhFfFOZzgkirP53hY5oKFoFa9VPP1BZi3wvA3//V0z+XMEV9V4oO2DPChsaOb1TRPsaMlEmSGWHZyMQfOmbL6brwolMMlfgyiqb0cJYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755688525; c=relaxed/simple;
	bh=N3jVviVUVIkGA2UsqTc0aDKqppWgjdo0JZeoRGhttoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itT/zyy+o0chu1h2nlLjWEThgjWvpaffM72z0SMpq3Icr0N7sY8ceB5sPqMBGoswWEsgeb42xrFYKtS7aYlOc/7DFcHtZLg7JZuPGSAWqONIx/Q9bWMwHsoZcNlo0Vctf/fLhRjnZpLQLT/jkq2AjQ+l5wfsyTTPM3/7NzQ//xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDBz9s0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDBz9s0P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9fSwe010404
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 11:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qOyFSkF1mdae5iDRyH3LBmMdqCqXxN25f67C6/GSMc=; b=HDBz9s0P0s4Kh+ni
	az8k8TI4qABStThkA0Z8IgzaEkIiqLLaLc+IRdUfQyQku2yvyoxsIqTFMyqs15td
	xcEZYPBY0X/a8SIOmUduYv0Y+VXWdamebto9yAlJkQau3IwMiTx2h0GUJFpDAVGp
	rhPlY4h3VHVsvD8cBsbcp4HGygJ9JTu/V8tOP2KhAf5kWsOAombcYXcP47NDPRZI
	XaPpInAx0kROt9ItCDG/ZaddcQedMrPW/P45zw4O0H1Sl4LAkOCG9wpGByXiOzn/
	Y9a+xebCg7AnpO15RT7LC4NcFfAeclEXTgYopfYmGCr8AHZiofnC+5Lp7V8/7RvL
	DsSRmg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528sg46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 11:15:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88dd0193so142384876d6.0
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 04:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755688522; x=1756293322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qOyFSkF1mdae5iDRyH3LBmMdqCqXxN25f67C6/GSMc=;
        b=eVelJk1s2FLHDbEcRfE0AIgFosBC4fuwG1gnv0mTS7jSKjeWkU5RFZP641Zd1R7Xy0
         Ss3HLtgddp16taCnRAQSu4XvEDmOZpIZhMnGlrxI1SvbjYBvEF1h9r2GKcUB64+2ZGn1
         7Bq/we4sM+jyiu0WdZ117a6iXRxgrzALIWryrwOZhd4EZtc8KTfCbL3xhrFM3FvrTQIo
         LRzmpU9fVeQuq/oJe1kuJtEvZX8h1jzOTAgC/Hkd/jAyHV8vH4oAWadGbRHY7bBP48Ki
         HRiaKN20uMx+bc+yq7vJhhP3daKgwriYeNTal8HOfoFQ33CYFyPOx4D+QhSvZkH3eyBu
         rxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFAVa+cl420lJco5dOeMsLtS5K1ehA6FwYmI0zY7qEdut4OIuypqv8LAVfldilas4Ets6a2HCiyf1Vlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhbCPCCw+VKUSDNjSbfj73eJ6VfExdkNn4z+2L42O3JFu0vTeI
	ujtZfL8wliC2b8XAt3cylBbJkwfijhhpL4V3vijy1xwaXrOsP4jP9uPRjQ1O7QPUvLfEUWUVaIm
	pcIKdnaeH6qCIGjXdzXRq76bGz7gGf0YU4RmjGsksDB28kqovKcnKulkJ2P38V+8exA==
X-Gm-Gg: ASbGncs+5cQ3WrloiGBpuzgz2pkN++hnCaTuNQR968HsqBKMNpoi8B1vdsnE7a6xgIB
	qsnmhfnR/rMU3AfwD0EoaphoOmqBRbMY25SQYukYMz3Ngv8rUMYuurPS4zAnhqbSM7ly/Qx+1jZ
	LA9R0bF+EtBtRWQqVjlHOkKAp1y54AO9QDVndw8f9kalKok2tjOuXpHxSYb/wFW9359WAyWZ/so
	pQgMUaArc3B6NQu0ZFRT+hQVqKzldccVSSYMsE7nwiI8rmV48iUUkhc5cLXsGnOJutxxUjYkM7l
	tCAzptVOo0r8PJEH5pYlsY1r1w+lusZf97LNVS/rAQQT4Cg6HLeppkGmReFBt6/YQsQ2IS+X1ac
	3yDAWiXR9wXbKv5OGsw==
X-Received: by 2002:a05:6214:1c47:b0:709:50b8:cb85 with SMTP id 6a1803df08f44-70d76fb14a1mr20921966d6.20.1755688521415;
        Wed, 20 Aug 2025 04:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH80qwENBGa8LZaS2l/vsPkoG89K8rwgcpZkHUFmG54urW6WuO247zB8LpY8iq/8kq4fh5zOA==
X-Received: by 2002:a05:6214:1c47:b0:709:50b8:cb85 with SMTP id 6a1803df08f44-70d76fb14a1mr20921616d6.20.1755688520930;
        Wed, 20 Aug 2025 04:15:20 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi. [84.253.220.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a489f49sm26715321fa.35.2025.08.20.04.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:15:20 -0700 (PDT)
Message-ID: <db09dded-deff-4233-bacc-90d41346f52d@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:15:18 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/bridge: ite-it6232: declare supported infoframes
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
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
        =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
 <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
 <9e77615a-9d5b-4971-b1db-74d6bed39533@nxp.com>
 <24392da1-02f4-4d57-a145-6285d46d3bad@oss.qualcomm.com>
 <185e3a1f-0d84-460f-a9b3-bc4bdc13e543@nxp.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <185e3a1f-0d84-460f-a9b3-bc4bdc13e543@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a5ae4a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8
 a=5lv965NAfe5egn04DU8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: pAoZvHGjSAMP5fM99NqtScG7vDmNNcpo
X-Proofpoint-ORIG-GUID: pAoZvHGjSAMP5fM99NqtScG7vDmNNcpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyKwWbT3SWfZ5
 U8wIwmek7qQHOi5MzL2fJYNHngZkMUldlWTGc5wY7OVeB3Oi6Wi10bUBZFjMz9A7A37igNtlA6F
 Cu+DbfLJ72QIbl3hvck7WGAi/R7FqZjb1cDpQuata95maE573Bv0R1NHZ8WFborbZDCFFQLqAba
 jt0zf+TQ5EKincMeULJI0kH3ioIdPiEj0eXLPVZAYNuKNoP0B2Od/rvEkcEOo4oPCWlmi4JjfU8
 gxzBJ6kCIZUGCHtoyGEPH+uxShLmDZ+S/IgG+Sgv/7Y0pePK7MLD65mTkGRsZMDR+2HH5/P+Ek9
 YpidB0wjeSojjvL6r14HMgJWAa+AkIg0JiXtxri1saITUq/NzkFhBli7I3qCPLsdEbB3CSuQVBs
 80NBL4UtSbt3azQHRC5X5sYIpaFBhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On 20/08/2025 06:28, Liu Ying wrote:
> On 08/19/2025, Dmitry Baryshkov wrote:
>> On 19/08/2025 12:49, Liu Ying wrote:
>>> Hi Dmitry,
>>>
>>> On 08/16/2025, Dmitry Baryshkov wrote:
>>>> Declare which infoframes are supported via the .hdmi_write_infoframe()
>>>> interface.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/ite-it6263.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>
>>> For subject, s/it6232/it6263.
>>
>> Ack
>>
>>>
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
>>>> index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
>>>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>>>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>>>> @@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
>>>>        it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>>>        it->bridge.vendor = "ITE";
>>>>        it->bridge.product = "IT6263";
>>>> +    it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
>>>
>>> With supported_infoframes set, the two lines setting vendor and product
>>> are dead code.  I think it's worth dropping them and updating kerneldoc
>>> for vendor and product members because they don't have to be required if
>>> DRM_BRIDGE_OP_HDMI is set.  But, this could be done with future patch(not
>>> in this patch series).
>>
>> They are still required by the framework itself, see drmm_connector_hdmi_init().
> 
> Yes.  But it's a bit too strict since SPD infoframe is optional according
> to CTA standard documentation.
> 
>>
>> BTW: I don't have ITE datasheet. Do you know if it really supports only the AVI frame?
> 
> AFAICS, it seems that ITE6263 supports inforframes from 0x81 to 0x85, so
> including SPD inforframe.  Maybe, just keep those dead vendor&product
> settings for now and add SPD inforframe in future.

I don't have necessary hardware (nor programming manual). If you can 
extend support for those frames, a patch would be really appreciated.

> 
>>
>>
>>>
>>> Reviewed-by: Liu Ying <victor.liu@nxp.com>
>>>
>>>>          return devm_drm_bridge_add(dev, &it->bridge);
>>>>    }
>>>>
>>>
>>>
>>
>>
> 
> 


-- 
With best wishes
Dmitry
