Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CCE265CDD
	for <linux-sunxi@lists.linux.dev>; Wed,  6 May 2026 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080557; cv=none; b=TYZgu2MX0rdUR7gxSsEYs5MdhhLvk1cs7Rm3srO7tfR/5mjsZJK6+13h2sefbyxIDoNJqSi8tLrkSuTY87f6Vo//qWxYxXolGsAdslXxe561wJL8gcBkNFfBTuh+DK7bcxeJecPQuXfNLSSvVanbWq1+jLiLhrXPLFxIGBZ+uPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080557; c=relaxed/simple;
	bh=xiDExUEeFbv36DiZHJNh/oOKhizp9m847cbIdiQQT2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsdXr9XKmWZnu36i7kh1R/6N07uozm1cVE5uXvuSE0ftCoZigM63gC6N3SZZIR+GGPcaf/36Y/tNu0VvLFyKyUInBoXvY1vdILe6wTJ+NBlcLvx0WeMSEiGV0OHwlPqZRkG7f+YGRdx8a5p4CxO++VDO8Nz6SgKKAu1SZjNl4fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dwz5rLWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8PKh9yb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dwz5rLWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8PKh9yb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646Cxc1K529417
	for <linux-sunxi@lists.linux.dev>; Wed, 6 May 2026 15:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=; b=Dwz5rLWY775+4mgi
	Q22wMTS63ov5b6rPvTLceOc2RsuzxNkoSpkHl4HRGIuTiLJVY7PwmSxRgW/1LVDJ
	3yo020QHI8nN9zmje/+G/2eIhYHf1X+BWc7KssqN3GeISkjKqTtJ+MEepv04tYxi
	1LbBnw8Td4S6MPW+mWOJyPnYp8ZCtKg7jmU5MrnrJU3dd4l+FFj4Rd5ABDaPslMZ
	Y08y7c8NKBjBgfp0989Bhlcw0uOUpKb0WH/wvZ8SLcTHhzZ/gS66uAiCiKnq4SSi
	QNDWvlHCK79TRakYoXRci/GuzM7eS6Ore80vsYQYG2uw3dz5JfiAO9LjmmWehm3b
	zLhlUQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e015x9w17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 06 May 2026 15:15:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56fb91588deso7265046e0c.0
        for <linux-sunxi@lists.linux.dev>; Wed, 06 May 2026 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778080552; x=1778685352; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=;
        b=U8PKh9yblijAQEPGHoKVflW7BTnmAtBPDYcaPj1iSwrE/2Gw9PnN3n6jTFyEBhRqmY
         Q8nkIrEAFleHKiBs36uPefuUEX6bR4znP+OWEaPuWAE7f7K4DK+4nzde/AiAVmVMhgid
         MGpDMYAa7AI2XsUMO50uSAsVi0umpgKYKkI/JN1HTXzpljEd2ByEBNuBPtF2FdM6HeoG
         AUFoIAF6AOfVw14klQQYUgL8nqtWg6igfgqpwmg0YMsb+OhypSFrINldrJHN8g5OPWuq
         Q3dTs82wke61Y45RfoU++JHDnL0agacBbql3Z8AtDzTa46Ow9EEHCnRD24hqxUcIWALN
         vB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080552; x=1778685352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=;
        b=oBW5797yoGad2PBoUN4owb6KtXERB19qPTZ4CC+ZbNGbnRauN4IPqa6opjlhg0AR/C
         TJbtpvOHNhC56KMLyTzjTVugY5QyQd4wXCNXxeN8pLL4K8DZ35I2XoCc3Nxa6S553bGw
         sOsOQGxpatMxq8054alNxRSpy0snupWn00bBPHk7K4STOmp9DcziIPdDW3YOrsqFm/8e
         eV63jXVa6+ko12jTWoFyl7Y8Jq47HorEnBSNK9di2MicWxFvuVwCue7h9UTayv4j+jVU
         2VsMqXhprMCtCpm0ffiZZFCWAMg6JZUc4e5wBmCSiXYBlLmc3r7ARQ+c1ZgDETCP1KzY
         h3vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8C305SCrKAoVCr4l5bK5PNzd3aJdJxsPJPR0ZhOpgwZu7y6W3hfnaxe7mEcsf3vcUBXjLZr4UpwK/5NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCYl5Z6uRyu03E96rIlFaRBUX8tcbxddzeJPxEu838M6WSE6OA
	62dFs95qMJIIvVQY5QPyZNVA2+FAfLOaf0Q3ghaJlAFwN/OTTe6EWoe3yBK5U6/4aYyH4YLX7fJ
	cj484/8Ur96IrmqmfOCnzgzAZWGsIcRRH/Iov+CZ7nfuhi3GMgbcBilAWRJ8vqTExvQ==
X-Gm-Gg: AeBDiet6I3K8NO2PT0z/KeSUD47mcVmurcyF4w2aV97U4WJtQu8RhFfdkIwNt8rHUFb
	fl7fGk2/CGwlheiy04is//O3eobnkfsYQ3SBlpo1bNC0iG3CF7WdMIoJIZ0rku/v9YNFAcTUGQN
	ZDyTa23RDmyNfyAAVrx5zAVu6O/KjVf5qBb7OhNqxfH1KFH6sES8GlUCKxDYHo+lj8jQAzwOJFT
	CPbnSAXS/l+LL9QsqZqV5r6rhlCkL+4X//kVU2SS4bSjz+6OWlKhPpOHoiTpPJ6PwvfOrdFMg7R
	JAfHjjEE9lh13LHFMLp7H/R1vlupdJMMuS3aBmeLVbNPuYwUIoS2F30BE2Tw/fSVcNXH4q0giF7
	Sdi/O+XcT2sIPX6m65CrKSp+jhb4czXOc8z+DA0Oiq2wUJSuIJiHyM5vga4p/gZoAIeV6Of/MmE
	Z/Ph08N6xP4BSbFLp5l4M=
X-Received: by 2002:a05:6122:243:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-57559544547mr2328153e0c.1.1778080552309;
        Wed, 06 May 2026 08:15:52 -0700 (PDT)
X-Received: by 2002:a05:6122:243:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-57559544547mr2328082e0c.1.1778080551814;
        Wed, 06 May 2026 08:15:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312daf8sm19383045e9.20.2026.05.06.08.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:15:50 -0700 (PDT)
Message-ID: <c10e73df-4850-4507-8c8c-5e1b5e24f99b@oss.qualcomm.com>
Date: Wed, 6 May 2026 17:15:49 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
 <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
 <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Os1/DS/t c=1 sm=1 tr=0 ts=69fb5b29 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=1akvWiwmLSqBbBFyMusA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 3-7kar0TIpk1UIXkEgwDj_2ok84BqpiP
X-Proofpoint-ORIG-GUID: 3-7kar0TIpk1UIXkEgwDj_2ok84BqpiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1MCBTYWx0ZWRfX6pIffnVkgIZn
 XjyXwkoCQIo37K+ITtwJMjaH0xVU1B/Jl8fsTiRnfCBRc2g1UMQ7qaO5K39JslUzYnXHdN8CSjz
 mchoDJ0QUfWDdjtikfs4A05lar6UqWhmC/oCMNPMnuoWq+R3iPMZPPAv7x3Qyis6+7v8M3A85rn
 DGENPrHJKqJYIUInbL6RGt8p7GDOSnrsQuMl5j6S0oUrpEPNa/bX62JvRMYdCmuAShEy+FDww81
 qRtjNKfz7X5h1+aae8eFyB5pfjDdu0z0Q1j45LIVmCi3h1i1pSKLbfX9smjIgxNQLPGwURQBcPl
 MbmAYcZzeZfDGaouEuOsbved4GO41N8852cSISnyDXl3uWrwNFmUVygMUftEvzejEMegJGX+Y2h
 KnMIqdFguARye+9b8oDxncJwh1HyzR94v8yGd8CHwCjuebbfR1gBK4HDPCRbEG1aGTwvNEs5Bxb
 deQP0PG8Osa2E6NFcEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060150

On 5/6/26 16:41, Michal Piekos wrote:
> On Wed, May 06, 2026 at 01:28:22PM +0200, Daniel Lezcano wrote:
>> On 4/28/26 18:26, Michal Piekos wrote:
>>> Add support for Allwinner D1 high speed timer in sun5i hstimer driver
>>> and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
>>>
>>> D1 and H616 uses same model as existing driver except register shift
>>> compared to older variants.
>>>
>>> Added register layout abstraction in the driver, extended the binding
>>> with new compatibles and wired up dts nodes for T113-S3 and H616 which
>>> uses D1 as fallback compatible.
>>>
>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>> ---
>>
>> Applied patches 1 and 2
>>
>> Thanks
> 
> Thank you.
> I will spin shortly next version with suggested correction for patch 3.

So patch 1 and 2 are unchanged in v4 ? (missing reviewed-by: Chen-Yu BTW)
