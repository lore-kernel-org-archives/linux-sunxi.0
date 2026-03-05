Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD03372ED1
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699983; cv=none; b=iHP9FslaN3wwg04LRbDwW8fHevcrPDBk49MUu9IKOlNqYNxlHUyhi+1PxYFbzN3RM3Jslo6JC8FYhWWRAvTkOCXggBX1NQVgzhyETujWtuDgCR7SVt4lJi+1PuBFJjsgTe7/x04wH3cjRi280TdzuGJfSG+x9pa4uMA7hrBLe8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699983; c=relaxed/simple;
	bh=6xaS693NEPvMsmPDTvB8J6q5UsLGM4wm4qipY7xfOGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgTe0q7m7j1NKTtYNv139E66TgtaQLNyzLwI9EWXMHh2i5HZdkNqFBlpffJraGOur7YSh4NPQRfTikfPvWH32TQv/zeoihfDPPODDJrfiZG6/btGPrNkNkrqkz8gGd/0k5FZcdnAjuyWiuWvd1v9QAz4bQiJZnNdF7OXpFi3NnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zhs1szgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1GG1EWk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zhs1szgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1GG1EWk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253B6p5866516
	for <linux-sunxi@lists.linux.dev>; Thu, 5 Mar 2026 08:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=Zhs1szgRs6PvG6yC
	/K6l0Og7co3C6ED8icQT7ngtsI9G5Zp17IaIYa/MOFJSyTxAUHo39qtMLOBGQhpj
	JO9fE/F/E4F4LvhAKnAlFKn+fH9sEpkGqfNT9M43WTCJkjqaFeUzfOGpTrDAGNtC
	tA5poP4iW9oFEFa2er9A5XyBDJ8CedmbmCYM1jjJmOXgrD4UqsM96/EbUTiVA/x+
	+Hq4ib0d4uJFejDRNFTAYPM9OxAzG41cfjw0IJBJVDWkmbFbGS1eLwFkvUDxUI+x
	i9yGzbk3U3z2KxBfUGbK5GoyOmpZPSUHhrYGJ9ek999ywA1Q/YTR3XTo5MWWFrPw
	1lqwYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk0yck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Thu, 05 Mar 2026 08:39:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50fb0abdso615772985a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Mar 2026 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699980; x=1773304780; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=C1GG1EWksO5mERdVlz+46cjoqgS4GdG43oGTJuhCppaUrrvMay036GTrro/dKKAmHi
         v2ptEtsUqxBf4ZLYAiEP6Xgmc5Eq3lNhDOkjPzwHn0wrzNVXzFDZEBmmuS8VJUV95Pnd
         26vZhZ9l0kB2puhm/v8wtIg48BW5DcgwOzXjfP3r9lqLhRbhN65edUljFLtYf+yLanOh
         GdlbOGcdOB7j9Tk86us4Yn8jrF0hgFCnjDrxB4lYEm8NS4NHFZnfSaQ3X2ykVTqGB2oW
         Y6RGdtLvZJRTUasIIS5KfayouZgYCkh7RTn5rNGGTVxiu8+dFo1O5Txd0grHkHKoESsM
         NdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699980; x=1773304780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=G5hWX7YHq1BEAVN98uMUy2cU6IR+I0tmyAmRA/dNJZ7CJvDxyBadxa8OFu+MG4NIaY
         YZRJUytZTKegsgU6O7T24gImMn8vC8Oqr3eGV/9VT0PZ564cxCjZNnrxUnrs8bQXvoxu
         qdoLTbzEv7qPeEXiZccoRPQto2V2dTC64fkZXMc/qpWI3f+qSNoCM1C4Od5aSbpOlYCF
         65GrrtCqtrrzpBfxPK2V4cpAl7ny1LW96dvsMib035L4x4/aVFe03u0V+Ch9FgYutuN/
         i+t8Ir3qbjqRE/5gNudxGDwmcVdVbP+EB/xU5omUL+b0gQIbtQYtb61QFtEQd8JTpnmE
         SYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjMXmHNOABSAjHaAo3ncmhLGJxc6nn9ENz3cF6MwBe9ZmlPDnDo4lN6FdCq9CZO3b3pfdFa1J7e5foFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdjwgVign/AUdQOBvqlq4SMuBinF4LTwGKuhanW/+iMNyUCACx
	LEToDBBnzoPNkW6fzT3VI2Xgiy75mZEkVKvu1M4QdE1Xz0PLSKukdUyoiS8rjefsOLox2iCgjLR
	f3OYG0Bcmw7tNQ27vEDV85lPLgRj0A/Y6gIr32OwQy99XqZrifHcp8SsTAPHnBZarrQ==
X-Gm-Gg: ATEYQzwc76FzfGSAKo3P3KM87NZkHcjFN8fkO3Cqb8hhQR9Ag5iMcp+TlSUopjuliRC
	EFl4toUmeoVrR+xdMGxbSs2M6I06lemt8bBuGBU2sOlkmOBtakF0OFHeCQfFn8zuwD+zJYgbDwz
	y5TRK4q2+D+FrWJtYnBJXxIuhnTO6pb3RcA5LaL/sRsk68iko0wiKrJ9D7/zbw72zhGKKc/ubQ1
	h7NrM0vrn1bA+hrCXyktdQO49cy0PypjA+8N+/HhmqLuLTXL9hrSBZWI8090tROfmgYpPx1Wx57
	Ao/pXAQdgh2NYhXOaTfCExqzkSAi5OII5+GMq55RIu23pSCCAKH/ugNpF0Ko8nJLq98FuInSbx7
	22bCOigJFbW305EcO/bEemQP4DjUXWbF3XkuJKQwesCQjhzyRrNEKlw4kAl951oQ2DN6DVMVSWl
	wiyLk=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452360085a.9.1772699980155;
        Thu, 05 Mar 2026 00:39:40 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452356985a.9.1772699979710;
        Thu, 05 Mar 2026 00:39:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e3fasm6657504a12.25.2026.03.05.00.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:39:38 -0800 (PST)
Message-ID: <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:39:35 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z8TWs174C924YSwvg6kgRXDHd4ylITkT
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9414c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8AirrxEcAAAA:8 a=GJStlgXwfe-SXQdWLvAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: Z8TWs174C924YSwvg6kgRXDHd4ylITkT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX2tLNmt57Bocd
 m1QNYtFORiojlu6klVV1fYRE1i5XdXOAUEtrFjbpQh6jf+vveu5ANpjR1uHdAXeSTSc95TMwJzS
 /avs8zTFU+z6EAHxFoOYOICTnQEOeqPeHDdNTdk3Ut2fP+wAEDsbkkFyvhx5cdY8mOvasAJ4Mud
 R+hZ/MyIUxzlia96MpDIYub5QaWuT2b0aoUUGVwUs7SPeHV58rQ/wrYgFNZEGjNqZApJll+rcvl
 yU/iDmt9C4chRcbhkKsx2pXUDTUigKhdpqxaA+QlT2cf9FyQFbdZCScrK/nbGR7FjZXRKdwAh+x
 jAHaC5GqoV+HgnhM7/vBIrGab+NrpeBT2r/gznptSjaKmDQEnplgt6z1pGf9bH9mafj8DQ3GI5Q
 k8D9P+9MiCsJsB28fPiZ/QHdpZcLaGIz+3djWeZh6wjK5ztXNHjQTOfPcZ2yhrbRJdd9rPrZNJK
 TtysbPy8gdcwSh3H7bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068

On 3/4/26 6:57 PM, Vladimir Oltean wrote:
> Some pragmatic shortcuts are being taken by PHY consumer driver authors,
> which put a burden on the framework. A lot of these can be caught during
> review.
> 
> Make sure the linux-phy list is copied on as many keywords that a regex
> can reasonably catch.
> 
> For simplicity sake this is not perfect (devm_ and of_ are not valid
> prefixes for all function names), but I tried to pay attention on
> avoiding false matches on things like:
> - drivers/net/vendor/device/phy.h
> - include/linux/phy.h - network PHY, not generic PHY
> 
> So I used \b to try to match on actual word boundaries and be explicit
> about what is matched on.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..bdfa47d9c774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
>  F:	drivers/phy/
>  F:	include/dt-bindings/phy/
>  F:	include/linux/phy/
> +K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h

Would looking for the devm/of_phy_ prefix followed by an open parentheses
not suffice for the 'has function call' case, instead of listing all
currently present exported functions?

My worry is that this approach is overbuilt and absolutely no one will
remember to update it

Konrad
