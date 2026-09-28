Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26504339847
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Sep 2026 06:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575410; cv=none; b=ILVGg6/+sRdyX6tiSpGypNiOq875YbkLudPZBoINg3Iakz52zruXegwSn27LPeproYYIT8Djpl1ZGIUJ0CLzGX638IzS4YKrJ9QomIlqupj+f2i7T2RYBaua6KIfIxFf+grpWkAzazge3oE91oW9PlbvLXwtiEuU0njZzWIkg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575410; c=relaxed/simple;
	bh=jtBGmV+G6RZCfWl0qfmB7ipeAzBeiwJeiJ/xug/77Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Js88miZ/Ydd2Ej9cvqV3/FxaV0lFLKguywE4Oylh68x08RoIji+lYK8NmTFFHf6xdJ2OQ+g+4uumHatd7eR8e5byFdtrQEgQ0NikVcGpcP6G+l24J39L9WR41JvEEyd45djnW+rNvG5Lju6UPJjW6SUXhc0QhBFuWHhGwZvubt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwXyitkk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6eiHqST; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwXyitkk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6eiHqST"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RH5hER3731552
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Sep 2026 06:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=; b=MwXyitkkxn0o88VW
	l9uaPIO/lY4hQjuEshUjTOfxwQkdFJNbJIC0x2nXV8IPoAATJPp+VfKXE/zzGZUq
	7AxOj80knHjC2avsCthYU1qqiucB8vcecCMW8FTfVZPvqrVtD2iTPnvPG+TZmnKz
	OA4LQ38+62mzKc1gkv6N5ot1OWCQUX1AGVvGbSNXdMTBqiBH6SIw9/EapQtuzpjC
	tpYcvEvzYJupGnDV+Kro/VYrNwrYGwr2Plc0/uKe3+V/wEIVJ2w4ZP9tGBWV4ang
	+l6dk1hIOOc1RBADy/vhUFthXpbi6SCtw647X+H+yFZI0nVr+ioHqSZn4D580mPZ
	SoAkoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e84nks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Sep 2026 06:03:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d86d40acso66527471cf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575407; x=1791180207; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=;
        b=R6eiHqSTq98qSpJB2rm3Js7Cl+DS7LlcEID7CRq4tCLSxcXstKfWnB83HwfDgw1JQo
         2dmlEs28QD5cnNuZBenEqRG16HC++RdvpSb9q8Nyp8kbisVzvi1Ol0AVlugDboh9Mae3
         lPvpV07QPomNcO1gUNOP3xpoUYsjCGg5+YXFF5GmivaeyuCEiYxoNpcjWGdOz9Hm8lj6
         vsQeZkOmEYDWyPK2K9TNVBpMX+38N0aCpMse/iokJGSwZNPhUUNQ/HO3EInfojkyPeFd
         WTOIIseMjCwhJ/HJC9GxivTWAew6jBv6Mag22I9d+qdppze5B1AOhn/P/g0grrVunCQT
         BApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575407; x=1791180207;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=;
        b=W0Y+xVCCw1igPRTrWZX7FRVE1E8ha2DBn8s+K12MaYecbnk/aEJ8gLHHj+BH1xDusT
         cDu4lrw5KBsuIFiOs2PDh3GyM/flzZBvTnOmcJlswi4sTkygqYlAIEcXK9RCHdCVFlvN
         W1QvxD3f04wsp5v54QJ6bazMaJL/MW0qZdYx7t9kucJeskU/Z3kZhpOUYVKZLJanBCnY
         79Wu+Jgy47mbemDZp2/V9hblpK0JTqdhqDt8Cjn7XjtFIuHmj5Pev4tPTz6QBUJG0OO7
         SysP8FfzL55BNEdLSPls2j6n1rt2hylADRdCzXE6BZqOnoVFeZ0NQqzB0yXvhstOK2u6
         0+dg==
X-Forwarded-Encrypted: i=1; AKwUvBzcltEXaHT6TUjUibMBJi7ebTpNf488AK/Ry0vcZh/wxXb5dDMI5ehWk64G2e4/AT5THxEzwseOnN9ytA==@lists.linux.dev
X-Gm-Message-State: AFuF++n5rOaXPKiJ9HmJtPbvwXAVEwqGT5+VGyyIZzmAEV6Re31snoHh
	r7ypW9hfax8jux2oHSJl42KjRih8UNrGBaqJB0bmLLqcDyq+t1KareaCF0zIfpr0+wDoj7roXy6
	8Vw877h1dtpf9kHurXsUpvW12a5uLf1lwF5GCO7tqPhty++P/iQuOQo5dYbZZly4hLg==
X-Gm-Gg: AYBFou0R+eIVyIzFe5wAitXVz1oDnULJdD2geOEDT0MW8Dx/GClAHlnB2Z/kPdRw6dZ
	uPmC6HW8Bld0GuC6W3oLvjlmmyF74Lb91mkMvFl2aXf8ybmcG8yC6lKC/A1crhESy/r3eAJctWR
	GdUXl4W1Yeg3RFqxLNgqhPdtAHm5iIYlg8git5vvD3QD9ExYn4oa4dj2ZkqCIcyIjvCWO9OGY4b
	GJh4JqEFLfyorhPQOjBkw2gePXjujXfwx+hYwObeCuttwNl7TLyha0UGcijcvnaK31H+Qs3Gxsx
	1uAc5JZa9/5SmIVP8I7deaolbxuqoPhNHsWzBGvpsU7QFDPefepAn9NBCv0uAqYPEHWTvu2jdqm
	GxSlXpJifxEfQoznaIbapRafKsI0p
X-Received: by 2002:a05:622a:580a:b0:530:8853:1be5 with SMTP id d75a77b69052e-5330dbe7652mr183346341cf.10.1790575407292;
        Sun, 27 Sep 2026 23:03:27 -0700 (PDT)
X-Received: by 2002:a05:622a:580a:b0:530:8853:1be5 with SMTP id d75a77b69052e-5330dbe7652mr183345631cf.10.1790575406762;
        Sun, 27 Sep 2026 23:03:26 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017816efsm113080805e9.9.2026.09.27.23.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:03:24 -0700 (PDT)
Message-ID: <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 08:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai
 <wens@kernel.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec
 <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini
 <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179057359762.92994.13773102514654073802.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rZA05fSIhh6AUxtcz6kpDuqOMYoupOFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfXw2MPD00L6i4i
 xQSQUo9pTf2Awiu4awwuvNsxURL/WoILLUaDxMpLOWy5GTXLM+/reIOknvp5Cr1tNR9Z5zNHGxR
 Q/xWl00YNn6ztZhluxlqNNgwZTfqIZd/IUCZT7mZGspb2ihaXBfPU1++FuVrm1xi/sndftcP+0n
 T9dbv9OPBHndc95IE3vucU8nTdfZkDTvo9NcCNheoRAUqdrnydAzV8YFIxR+PX+lBJYqD2omImX
 bJU928DZwpTzp9ef9AlMTCbeqlvScPtmspE2bgBQIYNbHcmH7MW8orXqp8+qLHtb5x2zEX5ojjY
 nllziXjJiojCM6Wd3HpZAsn4tO7JNGK1Q4yy2anUiLB0O66uxkrGA8OIyMaA+IGyysSE5Rskvls
 bB9bLOt8vE7o61liTe3QPfej9k7UU+GVDsYWOf+5wVlkSYVIBnZmdiftX4UC0Y+MPgGRVzJXhIt
 k+TduO/Aa4qdj6BxpEg==
X-Proofpoint-ORIG-GUID: rZA05fSIhh6AUxtcz6kpDuqOMYoupOFm
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6aba032f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfX3I6rlYydfPuP
 PTqbehfMPDtZ7P4Tdp+7rUa0mHDujQN73kr5aNsl1+mwzeD+95iRU+AKAucQxki2l482+G0KXos
 LsNk3urJwVyvhOD4XzGv4BsfKdyfhwE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280023

On 28/09/2026 07:33, Luca Ceresoli wrote:
> 
> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: display: Use consistent indentation in the example
>       commit: 370c5d9004f8b754351981d59fc26851bf943e93

Thanks, but I expected no one will pick it up, so I asked Rob to take
it, thus it is already queued.

Best regards,
Krzysztof
