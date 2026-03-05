Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20597376BF2
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701900; cv=none; b=dGbNYKLsQKNq9yGuOl+4zQjIVUlCWGUHfyTttTdIMXvcB1EVjMAE2/uw+R3diZwcv4oNjWsq2dKyupgzG0NNteM0GeoIO3GYJQKD052b5c4beMZqNG92yehKnv2qdjXavFKolQeKztFJOpY2jlJhNwodkkbI8r5y5ovXuey2OX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701900; c=relaxed/simple;
	bh=FD+sJlAHc/TYMCXoO9DaI4EA/KLKpeTcc4suUXKQBTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf+dvvwbylt37ZrnNoxJzmBACrpOdvF3UHV16K37M/MRfFccGTgV9zkNcqgrsJCMEJX+oVOn/pOaQXhjc5MdupO21RVjuYAAJSXUI08i07sx+SUZP7hNLkBlxU5opxa9JbYptmGBqagIFxZnbz9lq2BzYi6FDfMPdmPFd9UWPgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0Hi5Pu+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZtn62f5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0Hi5Pu+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZtn62f5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62593rd83665351
	for <linux-sunxi@lists.linux.dev>; Thu, 5 Mar 2026 09:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=; b=W0Hi5Pu+/Kx9rub3
	1LuwoztTEiyin65jy0AFa9w9CeQosyQeKJh8uCqng/kW+AvyBzw620uEIw8ElxxS
	p7DgJXpyHxlQCgU7ZnXWh1fDC2kEZgsF+bNRtHfjWvvQQP20fzVlblnrbJN5YtJj
	cuXRnfwIw9A1WDVd75f5iR90V/hmIMXMAApDkJvz92wPoO8C6Cah4UDdFm28qxbm
	JkVKYxCSPSIeuDpcvHiSq5co1WnUKQ63+OjUFG3+cpPsRMO9kCFdRbA5AXYlIq+/
	D3NF4cr175vifDznzJXmfwFBgZlGYxgAmz/Vae9OYLQmqMJp28j53fTOD1MekVJb
	WfF0KQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u1cmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Thu, 05 Mar 2026 09:11:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso579141085a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Mar 2026 01:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701897; x=1773306697; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
        b=LZtn62f5wiZ19YKdKgN0fgC+Fk8TtBNw3jurB295Tt1VM+FknTvWuh2l7fUnlnI6NK
         wEAv1FwdV0+ySWfNNVAdf0Ub4eb/vJLQoura2eDA/HKkjn76x46cxd3tKC7XXPFVIy/9
         FPOyy/5H8/jYf7N+PUjLOp51mC6eCF8s+tYgzBi7O0XPMtBrgTtXzOvRV4ICuMOTL1Tf
         hlS9pKPegWcbkIWHE6OjI9d9BMXcXWxX2AxhuclgUoMYVaYp4H8Xa5hvVcFBoGOLzF41
         KUXObiUYF2Xo4Aa9a8m9pBuReFAuhCm50OwRlcsXCc7iV2SV7jXqRx7eGXXVn8Xjpd6t
         8C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701897; x=1773306697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
        b=hxMZWrKKsuTGtFzm9daxNmkDpvUz3R27QFTLXK/jQUcCSWNae1HR7AYuFK+hbVyMYc
         RxmfpnekuRaJfDiTU9X4Pj7fZGraJ4FxKa2ajhDNiQ4n4cuE/LqyafooDhcnpJAwnSRR
         faOzpPpSx7qGMnyujrqdYVa+m8vra4xq0itN8zRd1pe2cr9N70ASAkPe3bsEtnS7Qdqk
         8yrMO6WSgeoj1hmpftVfp6YW/CVN9/vUdDN56KXe/fgMwSU2rGS/VZVB/6aCZk+DsVWB
         gNBKYqhZn0Gq76364spw2M/1+jpGd2k+pBmbvZRC+4fOM73tiVI/OGIbrxCyreyNrJJ/
         0bZg==
X-Forwarded-Encrypted: i=1; AJvYcCV3XOTdZHRPBIRVRIhI7c6RhJS6zdhctPn9RDtUIWiFK2jt9SKjUdMHDDS7Ttmn3KDBfqD/leEM3IWBQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy18YKz5Wt4jxiZ4AW1hjhZX8s3fwCeKlWQ1sTlhV7maEK9ezF2
	rMbwc5poiSOLoC0YAEJqvQq6u2CWcOiyikKlMBA2el7EhVxwCtois+grznnSC/HEHJzBIKIhaxq
	AB1bDRc3phhcE9rXiojVpG2mUE+RWqKgn9ALlMisCyQH6+LQ8JbSfxZkhcKAXdJzDIw==
X-Gm-Gg: ATEYQzxTAdKvjtdPIQQQZmtKqOzbqN4XmgbCwNaFDBG46pH/8V7q+3MdG0B7wk6ZN5g
	rzcfIYKxuKTZmuA2jme5TuOSW1ne1+Wvv504rcK6Q92xNb9sk/e6kGACYonOjPDrNyQwAxQAZB8
	YeIcLi1RUeDiJGi011/E/QD7nWkFkfEso88vz9YxGuLy6PGf0J2duS7gy3lnjjeiZX6hAr8f8Jt
	/00Bw7Eocxi4+yn2Jo85bWjsmyvuvvNAXh7KBNRx7AKg6+cfwsKTxiM/0OBADcGA+zS7UhkkFDG
	MDpWUxtdryNqU2x1t/SKKnTkkJ53F295MJGCxeWlakFTmGmqZqDLzSQbH3nvyazigPKpP1/sAE3
	crHrIUCmvTN/9smI8GKA0FE1pLCyfVeQelUYBEHGFpu6n8Z8ecI8HDyiAipJvvnCnp1YjFtS1mx
	50CHM=
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr487946485a.7.1772701897191;
        Thu, 05 Mar 2026 01:11:37 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr487942685a.7.1772701896576;
        Thu, 05 Mar 2026 01:11:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm2589351a12.17.2026.03.05.01.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:11:35 -0800 (PST)
Message-ID: <ebee2fcf-9069-4a9f-ae72-86f4471cd4f3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:11:32 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pz_StU5Cma7NyRvWigQMtA6RpwbWccAB
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a948ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UIR2zDuwlqQ-mzEo0xkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Pz_StU5Cma7NyRvWigQMtA6RpwbWccAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX99XiKELGlZXO
 hrCRerjRllj3QhxYCdrkcpRkW9uDK6eDQA7Qk0AG/lpDcgzqczsjRzTKbwXmj0NFW0GT9sslri+
 KVaRJmXgrfMUFncZbKCdCm19Vv0WUr4JW6VDOOCeBvcQ5aNH1Iv/Wl4/0QPBwGePzDtmU8wqii0
 HXmCw0b1fhNQKqj8Yk3wo3V7djOZ2bed/+88onMA4BUX4OPvTTfyzYPHI7C4mbdCXrsP0nKoR9J
 GdcChdQIvR+SAocWan2Pr3cD3Yl7aYZo1TQpLILEIKSfClk0HA3ScpEn3Nj+5kfSwSJdH05mC+k
 DyEETinWG6lcbOtwgkYzR49Sacz0zMGdHlTpHY7gzSq73oE3UdwoyYslJUI1RKNHV+h7c8LQEuk
 05qm9GcdkcoEUI62STUhKyzN1nuaakMeH+yndwzUaCmX5oW/pHD9u7SqbS2WJy6jmL8PMB6yRjq
 c8XQnGuGrdy6yNX6mEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073

On 3/5/26 9:51 AM, Vladimir Oltean wrote:
> Hello Konrad,
> 
> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 55af015174a5..bdfa47d9c774 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
>>>  F:   drivers/phy/
>>>  F:   include/dt-bindings/phy/
>>>  F:   include/linux/phy/
>>> +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
>>
>> Would looking for the devm/of_phy_ prefix followed by an open parentheses
>> not suffice for the 'has function call' case, instead of listing all
>> currently present exported functions?
> 
> This would maybe work when you run ./scripts/get_maintainer.pl on a file.
> But I would like it to have good coverage on individual patches too. And
> since the devm/of_phy prefix only matches when you "get" the PHY, not
> "use" it, my fear is we would still be missing out on the most important
> part of the patches.

But that's just '(devm_)?(of_)?phy_[a-z]+\(|includes.h'?

Konrad
