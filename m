Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C2E47AF57
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jul 2026 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519926; cv=none; b=FlwZYFtk2llTolg2Mh4mYz4kVIcZq2W3W2qQq3b6k1P7nC6tswxA2u6947BVENSpAps2qHNlQNCAdECV5Rfk5Un29mjuhNo4xOG5yQHH4GH50GFqTlyYDM0lFOm++PPf4t1fgs938+aX9KqknKUnyD/jYLgu/7PMOfrZBA94ouQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519926; c=relaxed/simple;
	bh=0vJYZK5vPVo2/RXqS8keEXFurIYoDpA6OVUOBaeexG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTx4K9/9fXo4ImpRFAyJYkEwGjlheeAQyaUvjbLObvR0tSp5bOuB7LtZnjt33OVmXMSptzPONkBfw/nw4b3U5N0P3bM/oLQG67q7Wsz/79fnlKXleWg7ySfmQfpGSCYqO49+ks8kYK5M/cWwQpurpHurRI0PxuvSy6F9BfrZoz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXTLac9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksmk4GpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXTLac9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksmk4GpJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3hrJ2580093
	for <linux-sunxi@lists.linux.dev>; Wed, 8 Jul 2026 14:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQSUkQFLaxvlcc8RZA7/n7JM0m7BFdTCUNhiufZcHuA=; b=YXTLac9YvfDngvya
	j6WfSfxyWvA20J098KPI88zaXozwUIFqTL3FcUNEt+QbnrQSfudSAwNwIcPGbNOh
	9a3NuPzGu94NT+FvRA7LRTqBwx/Nh6I7bX3dA2ue459TXOrV5W/kHBwdvxsjHCeR
	wsMXvTGmSmo4ny1u2tzLkrWFPQYjH9lX4RM9JtEPaA4ycDf807ZC9Ctz6gJdYJwW
	T958Xjee47h4A5OTL6w07VX+9JZpUuN6V3LeZBcRETmnOB1k2yjYbjFnBlPc1bmu
	wVRO/NDtqRIuEeP+QSR7BXcMYPW2WNYhAk3VdpAUZ6svz4XKEJV6EIvWaxqU87UU
	O0IKeA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gb3rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 08 Jul 2026 14:12:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef81cc115cso17961246d6.0
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Jul 2026 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783519923; x=1784124723; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQSUkQFLaxvlcc8RZA7/n7JM0m7BFdTCUNhiufZcHuA=;
        b=ksmk4GpJNKffw99OkiMjajXBCg7Zhuhd9PZiJBHR6J2qmlI7lgAbIej74wlVZknScq
         cqj48n031ajxKzxxqQUF7FoMcODz6W/dnYFl97mntIfRP99Sywy+/zOp0M8h+KZOagYp
         uUM/oCGcdg6QqBmKAQLP92gK0WKlgdYFQjubwHmBNXUOPoMo1QcRS0EYcVFVg0ptMSpV
         7M918eyAKGgNZID7fhsJ1VZaEdr1yO4acRqUmseWNHkL9hDWe+mMWN/Fa4UaiIb4x1aD
         cXZ22PvEhd6sC9ODrAbnAkoD/XYbSzYtp/ESZd2GSneoISJz1d0uItF9wO90wRMezGql
         LQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519923; x=1784124723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQSUkQFLaxvlcc8RZA7/n7JM0m7BFdTCUNhiufZcHuA=;
        b=BmxgKEKIB+ejPA8UBdqLu361hxsmpJpRj/BwHLrWvbtf8zRFs9ccMpJxvJ8Z9vSkwN
         JJ+EYe/mcYtNB2ItvZokzn+ZJobZfZUwpKUUEnX8q4EET2QuaXsiFYXa0BKSN2Q88/uo
         3HbM/9tf0ubQTsZwT+f1RUzRRje9dHS9WmCguzE7NhDlm0MxqAIBWmdW3yvuoEkKKXs8
         1FRebeQ0mYjWfDOakeb9JNTiYPHMlyVV/YtBt5msSFdb39IPZvchrx5mXlGEv2HTh+2O
         CYNUMPUqNpNs5I2toT3yAWzWkDCcP3AQMY0V0CHMghEwRkLgsQyDnnLjJVnZRWeKswyM
         iSDg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2N1KFrm8S8HFEPfGblQ7Jf4/4XMSjIA9oHZ5eznYUCBQOJv2c/15vTqoegwuaCSeRetZGnMuwyzwGPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz7gLiAtuTdqurqCGi5cq86TxOXBGTVb//Pp3Mv+CIkTQ6vY73
	nGYOaqEeoMX+8Ja0DdqKnZ4hySwc18jzW+u1kdPDKnpx0we/qEDxnZi6kSC2T6wJ5f7mHwdoItC
	Wtna3BFN01fVWx214l5jN/eZP15/CKLW7TDy2zj8O6/htpEYbrBbiL1EEzcYxYi13Tw==
X-Gm-Gg: AfdE7cnC8KQg1fdyoIuzrPZXaKjbZXW7NgPb3oze8yKGmnhMHHTucsKnl8+pWpJGcfp
	HXpKNpdMceOpccQCMECKWipEbLiHpXFcAgsf8kin9O6LcsgsHp0F8dI2lXFF34Wo80FEidsIzEF
	xmk/mMR//jcw8QcSfqNznsvQteriCH7oWrR7sbgMrXgOFAs6cNUwXVCeLA3fcy0P9jkhq2UObDi
	Dv1Q/N+BldeZiq/ZH4i527Oaw/EuMeUXs97HZVsujDZWCZJx4DGtS6IpcAMzgobhtXr276aYQd9
	16FbmQdBl8k1RYSxzd4+dlXJegfWVJNq93vdlL6oe8FxdryNFQ6csu/7lD+ab+sJwBZqNkBNtIB
	TCr0O57amq3gCHsqCXcE8MaWmOUGj9DjpszEj6PGEIdypmfOO9KvCFrHzZ/phgJXaas+WFBaGsQ
	==
X-Received: by 2002:a05:622a:53c5:b0:517:91e5:1086 with SMTP id d75a77b69052e-51c7a78ffefmr78633511cf.38.1783519923445;
        Wed, 08 Jul 2026 07:12:03 -0700 (PDT)
X-Received: by 2002:a05:622a:53c5:b0:517:91e5:1086 with SMTP id d75a77b69052e-51c7a78ffefmr78626721cf.38.1783519918016;
        Wed, 08 Jul 2026 07:11:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2110:e352:d7b8:8bf2? ([2a05:6e02:1041:c10:2110:e352:d7b8:8bf2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm43780774f8f.26.2026.07.08.07.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:11:57 -0700 (PDT)
Message-ID: <53b7b25d-bd24-4231-a43d-6740dfd84162@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:11:56 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: remove unneeded 'fast_io' parameter in
 regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20260705164311.2273-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260705164311.2273-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzOSBTYWx0ZWRfX9gou3mU+x53t
 oqKhdvDIARSep3N7h4wY1mBpycaRXW7AgjxOx9M665FQOQw946zk//iL6N0r9vCAey3hKtic3gW
 41hUEwKeQzX8YsCauTRZEatsXcCnLkI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzOSBTYWx0ZWRfX/lywiMIKkD6E
 HcvEQMBInuWfLgUWDt3QWZ0Lbw2qXUWJDMibgLKQGWhD78YwI/p2L3l6sx+S1Olx5ijLv7XOovG
 8HqT0Z5HaGIwTwk10xGTKFaga1Vmyn4pK2VXu9mbK58hOktKmCVgCIVExjcgArq7jGGNlLzjDd3
 YWOBUnIVBCrJSHtC6DbU704wsDoRrj/fmP66/K67LIMGmwRNeAZbO0i5zIF7LdmBQIrTulH+atG
 DUjntXEZtCgh4v72dvF9Wn6lBmM0Nw/4M0ZTzM++KlHmlZYw8dlSeLzQ7AUnbk6gGeW3Qmzppli
 8Jndk5rI6fGNntcsXvFON4gSlr9psqCr1+AB4OyxJZvTD20CiClYEFsmVdDI2j2xGpTM1Igj8gD
 cZmuluUtnleVQ7mv3SQyURCpvVWIJp6xKpp2+WrsP47vN69lZZwq6NWQkBeKVI6B0N0Dj80SdRZ
 0mYgTtM6L/eNKW4yEVg==
X-Proofpoint-ORIG-GUID: Id7CD7nwkvye8koVSxeDUV9LOHlsIIPC
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e5ab3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=LDBv8-xUAAAA:8
 a=5uWOEY44YF13KFjEAh8A:9 a=QEXdDO2ut3YA:10 a=xtd0hNyKXt8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: Id7CD7nwkvye8koVSxeDUV9LOHlsIIPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080139

On 7/5/26 18:43, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied, thanks
