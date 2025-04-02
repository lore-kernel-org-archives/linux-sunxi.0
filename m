Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C1923643E
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Apr 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603550; cv=none; b=a9vWVGDtftz78XzuOPIKV1R3SBrJEH+NSxV55v3+Ap2oWPi6PvUSXmzJ9eG9fEmre6xK8AOW+jxB/mfUjZblrVFPO2rwpskl1xA8B5sGMwx94j0g6wjB6Suw4NuK6Mh2IKP7G1svJLWT7IIBPXuO/EJ6zt8uRUwQDsyTra82wvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603550; c=relaxed/simple;
	bh=Iv9KIspycsPpFIrjdjpQH7rMBYKoABLZDBLXX8Pi1m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdPaOHZUFZtnUtM8hgR+cVWc+gbDSliYaMg8hNn2TQu5VDQYsz+wUDNayO2DDNaz3msdPx5F+XIDJz3+mJIzKapDNMTpjwpHXoZHizvS7N87Cm+Qzqj10CB2e8APaMeGpglRnlzNbknQO4RpkR5Ps5fN2XThdqvzHTu5/XAEYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzKwPnSk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzKwPnSk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532AgeT7023639
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Apr 2025 14:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lg2SSIflWKzsNjHH0yMEoyV
	MVATrSnMyc3UcY37Ync=; b=XzKwPnSkuXaN5BjDpe29/7huBfGAIzL5jrqN9ObG
	JcWeZk9TIDjV292XawvH0RYQ4w1vIxpg0YWqOem2bdtQdwFpvxeZiU3fgvMU061I
	p3zlMFVgwVhhMnluu2Yq4UgcFHqYBWWp10mZcJtAf27niaS1RpV9wvCfwsK6szVH
	K9HIst9aDXcJGWPo76GkLtcN1G9nEes6HWGlEs1zjEpa4U2gR3F+fWr7BhKqpW33
	PP0EQBvdUQs5MnUREI12S78fodeBZZaQeZnE4Nd+dZsr8BZNPicIAYbXjSJdiTgL
	7FI3uJZNLI6xRzn03bExIrFF4c9EUA+rz7PhwNa0DNsYwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadsyrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Apr 2025 14:19:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c548e16909so629476685a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Apr 2025 07:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603547; x=1744208347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lg2SSIflWKzsNjHH0yMEoyVMVATrSnMyc3UcY37Ync=;
        b=swswfaUbS+DEVGsCtt0WqQT8fSQn0e/eACTsTTNQF+lE1y94TPkshEdOgCFvksFzxE
         MEqp0Vbpf0wdyPN1oDbw9a0rdy49N5uRGxB1IbZc3GaSAR10M8HvQADd8KvduNsMS4AB
         2fscFZMNQ/KFeBEJPQ0UtfSM9UkN4wjveO/r/q6p9YoO2/dMeybd0hwzRTllUK6NG055
         Xku6ARVF46ag4oeaOmiiI9c3jDq+3W/yIuWgcf9Bo9R6TdoVRnQ+YWuEcBUwDdbtWOY8
         wEEtYfeOkzHHBHYAd849X5y0u9y4TWlBsb3stKMnWP7s8x5zcqhmzsIDg91AGSSLdaK1
         OoOg==
X-Forwarded-Encrypted: i=1; AJvYcCXNaQ3p+O6zVKCx4fffUfI4Kt5pQTI4eo+nnRIJ2IjCXMSqnwVv+SIjkwV6aJevuttFAJ01eLpb6r/olQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YziN8npcSC0ssd6bBeKg0TEFWP43BGJhFaxSrPJOiotjVylxuvY
	sTUa4EPRHTtT4KqyuZVNkVwmN2Bqto0OeYEyPGmjXRxKCgRDNLN+IIS2oXsWbMOeQytVrZ4BsUS
	xUaCDK+QvKTFTYEEfl65J7cIzpkDW3nj/6quqE1tEYeVGVRwdx0CPHQB72+cHsw==
X-Gm-Gg: ASbGncviRhgmI7KycZ8i68lPAqu82cBNB6LgCJMF/KmS8/0ldkWeYS34VyfHF2wwunJ
	JCuOX1Ad2Aow632bINov/ITJlEv4XbuVghJ/Ig38A3trEohIfq6W1OamXs4jwrPFPotGHQHbISk
	LjP702sciQojKMB7/O1qC40IBceqrMucKlR5Vwv9LCDmw4bbs/ZTd5Cuy1PPnUJbPYJIWw4iXfb
	HiZmEEfnUY2xtJciMVQuu11mQpqxWbu8ZmyaokRh3yaN4oLxvSLDwr8fWM8pokepiJ9igJ9Y9us
	uaeo/tLIOiQogH0G8qkt483m1v48XVX001ic+RxsMBJ/FkXhiH3bvnDE7+XvpVRJoeq17e+l/UF
	Gt0E=
X-Received: by 2002:a05:620a:2494:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c67d22bee3mr2076319085a.0.1743603546821;
        Wed, 02 Apr 2025 07:19:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGf8XoxRo6CiED/IRIBY/zHf/t+XSXGEYpSCXW0hOzZD/FhK/1SyGdm2DXSeef2sMqiG/5kQ==
X-Received: by 2002:a05:620a:2494:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c67d22bee3mr2076314785a.0.1743603546418;
        Wed, 02 Apr 2025 07:19:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0e951a1fsm1428704e87.245.2025.04.02.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:19:05 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:19:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: shao.mingyin@zte.com.cn
Cc: vkoul@kernel.org, robert.marko@sartura.hr, kishon@kernel.org,
        wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
        zhang.enpei@zte.com.cn, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, luka.perkov@sartura.hr,
        linux-arm-msm@vger.kernel.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org, yang.yang29@zte.com.cn,
        xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn
Subject: Re: [PATCH linux-next 3/5] phy: qualcomm: =?utf-8?Q?phy-qcom-ipq4?=
 =?utf-8?B?MDE5LXVzYjogVXNlwqBkZXZfZXJyX3Byb2JlKCk=?=
Message-ID: <2s6gmwdlv5i6uqqrkxve6wiug7g3u54aqpycjftwbpars5poz4@nkb62c4yc522>
References: <20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn>
 <20250402194357404aoSxd3G74tojxA7uCZXiy@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402194357404aoSxd3G74tojxA7uCZXiy@zte.com.cn>
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ed475c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=5KLPUuaC_9wA:10 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=qROKWDKVmaoWvDy_uEsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: U0hyw0J_In4JwwCWv5kCBpwpcgJ3SCV4
X-Proofpoint-GUID: U0hyw0J_In4JwwCWv5kCBpwpcgJ3SCV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=787 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020090

On Wed, Apr 02, 2025 at 07:43:57PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
