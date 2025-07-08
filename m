Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C12DEA73
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980143; cv=none; b=k+a3aQbUXv5BEjlW6sePweVedlmRyiK6Uej4XSaoQcyzCr/iEYXASOowrorYnC3L55UId3zkJassuJv2mMSSGVJTaaMFFeZIXLGsVAjrPJYl8T7MHHT8LNTtWKqZhMqDG3/X8xyN7qKjl2pYZbsdQGk7JlsqEBcu7+yRgaiE9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980143; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kz9oBneu3rBIZMU5HTHVdANJeVWOdwTQUzKq/l8JZBOOupU+ZmzXfWvCafICuaReP2tnH4x8jCynrcw3DpUFscyy70woeKhvGAYhfatdtJv3mAeXEfBfMBYclEEzaE5xZJf6MAtnx47sx4hknn+pNJnS9ztdUIB+HfWxPWRJLXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pupCTEsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pupCTEsZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AANg5030306
	for <linux-sunxi@lists.linux.dev>; Tue, 8 Jul 2025 13:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=pupCTEsZWKvwVFaj
	Fq6QywPPikTVuTb2opn7tBRmUSEnJJECoHJ01EtmgUVbLxLOaD075yS3vjJbXjIy
	eDLtOVvY9EXDf1XlS1m4glK1whQVre5XUxKqevxPd1z2Am0ltKXyNEGJV5M8HJ6I
	rDuNQ2aB0zc14xIOvLdnKnsree6PHxThRxB6eVgnlNPXkPZCGPZ8dUBWQl8EkfI9
	zcEglYLLg3fwOL5LnZwz46mYp2T91EJWAs41WEDy9VwMEDxaNFJu8vg2w+/WWyft
	yGYHLU8xAXjoy2eXqbmsHAa3tr2SnaAFG3+pmv5hbErRZVMbrPx90pAPYxlxbENu
	BRMTYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0u58h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 13:09:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so68892585a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980139; x=1752584939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=Sne0mCQEAoXgxxBFf+fGt4+JXt/CW3e8G1CXLWn4X2JztFjFGd7hbSkop8LI6wAHLT
         sq2SECTWfz+U2UV4GKkAhmJYOQXtIrvlGxBAgbdkklixq3YUYyyUSTmVA3E0Sq1KGIkO
         RAHrjeQ0Bx0DjxLmS53MZ+ugWJ8WytwhdGfoNd1V+QpjKl38s1soZUA3OFV1eu9bPxhT
         uWzAb/6PC8q2HXXvqdhr5i9uPJmr5S7TxOVQx2njLyx0UzZ0Etr93FwapSJ/j2ujt3v4
         hfDwsvnkvmrYhjFRNY//q2DszmRwDiAJKNawMzQXRy5DkRN0r237FcK4jBUObit0tCa+
         gcvg==
X-Forwarded-Encrypted: i=1; AJvYcCXLkKmF1wRzFM8tcEjkoQkH/r4ZeJ3ayT1G+/9Ft19v0nhvRrROkSL5BvO7SjfWOvd/nd7XNXTpnEXdrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzplSmkVBfGyWKeZAQQl1HYotgKY0a1CwOuqMHULbTTcC6xQvwH
	/dlDkhUOgDS5NIsQ4a5gMh8DM+cJq16y92/hiYvk7qWy52F6uCHGbmFnBNNBJ+gAitWCCLzPLxo
	nbP5aYLCNI3l4JjNVEuZADPLrXa7tgJJJV914ih+jX90fvsmQN8aEn5oSoV66z6ePAAlweIZvgQ
	==
X-Gm-Gg: ASbGncuLBQ+O73LyRstZVlaX8KrMDmfLdooFnael0iFYHZmGCwVElwpXaPh+F42tVz5
	raPcrdFUIyJKXaDRm5Dae7MDv8X7AzUGna0SiF3PBxtSpsoE5VMMIl36OOPelFXEZhypI3IJdvD
	iLRFAQ2fZMoEJrQxsSLY8bAQ020c9xwgQ7qkgODVHR/R6LK4cWrdP9z6nM9sTCeoEVXupOZ9Tff
	D6ujlsqjiQmwmJNj+4eWwKND3fsBjblU/H64WPFnJqFle/IOObX9GD66cBuWYfN4m/YQ8KHzPaA
	vWuJ0RGihMEHXCmevJwstEZh1zCFQZG4MIXtUHUZGwWBHD1Mm0cM81vDUVRxDxHAXlczCxczVpw
	kmOk=
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr765450085a.11.1751980139184;
        Tue, 08 Jul 2025 06:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSTsfzmJAfztbrESgmPdNkncNaz4K8G5/fia2Gnn0NF2orxJ57CWlxeDI3ewmnGQ+XWEqAMA==
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr765448285a.11.1751980138638;
        Tue, 08 Jul 2025 06:08:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb726csm906327766b.179.2025.07.08.06.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:57 -0700 (PDT)
Message-ID: <3cdef7db-4835-4e67-8125-9406a0532394@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] clk: qcom: smd-rpm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d186c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX0AjROh4qlL5V
 vOoHfxBhD8vzaT9WFT+AnjCtdAn0XzMGVbYCrW753n19XCGZ958cYigRyIAf41Wz5zxEBANpykf
 8t1kIKiZsMG0ePKzdaIdG1MVIizr9gfvkJ1bXbrkvldUX0Xz2i1IkiJRpSQZJdBMsPEDFvq1ik8
 MdmLyqAv6LLY64drmg+yUNh8h89vq9M/qd+ZwypSvfFB/UwxufTCJ81EF4C+oM9uV4NlUjIgLUI
 oohR+xVQx3o4EgIYTUu3WP4+FFhEsJbEtOFOgJex/FqccjS7tzCSDOR7Rl8WuTpyr5tRH9VEMcC
 65Ch3jF/CwLVeX/cRYj5iX08T2BOTuVffiKF9LtLv9BuLJlGoVnL+r0zQuZqRquOHLNFuBxuI8a
 KjWsRQ8aoBFj2wywgfSbNUV2aEOnMaPAXdoBHwMTLOlJLNPKJGrhcoM13Uk7yy48WUXL+oEz
X-Proofpoint-GUID: vvHfat0_GWb_A9WU4V76FrXW_4pD_Sma
X-Proofpoint-ORIG-GUID: vvHfat0_GWb_A9WU4V76FrXW_4pD_Sma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=841 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080109

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
