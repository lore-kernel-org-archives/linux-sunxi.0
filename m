Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B273DEAF6
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 19:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652949; cv=none; b=jO4YZSkfhnjdY/T2Yssqrr4KhVpfrkjdj38y46LyQpviZtu2l/ZsUv/mgqFBzgdrgp6K5pYCT4DOy+hzsMcy08njm1BCRQA+kq5fZRBJQPoNSF4oamv3grJvcZS6yH3iNExLR2ORnYDX+tFzussdLoUiJ/kgXBNv7a76YqwLOOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652949; c=relaxed/simple;
	bh=lbIDZrp7+cxynSUHaoYLzZS7n3SGEL/qayDgycMJJBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqFbJGy7oJr6a2sub7QQ9udebbTOs3TCH85AeAFK49YKPGgnUCxNXLmK/oWVYrW1Tg78FeF2d7ZWS6UDaSQwPd6A54LFfMr00EwsLA6jL4wOb+i68+pnmOGVPjmZnfW+dH1yUhBfPfuNXL/c/TZC11k22ViTumEgU2wM6pt1108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOJlf8bF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iG68ZUGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOJlf8bF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iG68ZUGA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CxewZ1203427
	for <linux-sunxi@lists.linux.dev>; Wed, 4 Mar 2026 19:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cg8b3VUqbaKdYh3k3ySRyeTG
	Ml5pXbzZIMHk7oalclY=; b=DOJlf8bFM8TYi6OThYvb2YpxJNA+K58Yjly+IUEW
	KrQBzOeKex2sPl5vu4eX4RVQh1dFZ+SutH2eQP/cuhUmTqRccE3zRtId/VoRjhsP
	9zrErhdZ4u3H6vT47W18kQJoveg9SkflkJamDykk/Nzwtldm8LV0wTYJ8Psy7TeS
	nS05bVd9MoAJhHcKJpSfN8gGwW/bhL1Bu4M7GF7rFl3w/gMzDc0tni/xgYPY04UJ
	YBT50rjYc8CLxfE4TVSsoD1VSMqWJXZnSd2lNaGpQtgiuDXlqPwrJHLtjiMa84V+
	OapDA6JPicDEvHIXcdfNcIr7RCMLabM8Py8UYx7VMuEBsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c2kf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 19:35:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ed6c849so1158858485a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 11:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772652945; x=1773257745; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg8b3VUqbaKdYh3k3ySRyeTGMl5pXbzZIMHk7oalclY=;
        b=iG68ZUGAOqc3a5JObKAiI8FkU6O3ilB7d+M9QEQ/Upv0HBd1w14SpGLa6v3S1qZgFY
         meVRZ89VLf2JkAE7ecZwYHym+M3BcTzLhMQq8zi0BMFotKMTMFjyYfTBrRJY5CU1iJbb
         hW960HPwv+Zx+HuuIKKKNQURN0SfNx2gdjo2+EHh3pT3UWzUpEFegGOkyn3e19ZTYgD4
         2C/bGMKz/cfebz08Ixoei47SN1lvH/lBXPWizVZDfF9iBEuKtRd5ueXdXUPQFrk08c5a
         4zppHezic3dJEIKy4MiJnbHyJ7SvhSJY3oM6LF1pny+zg9MO5u0wjw6oPpdFpdK68+V1
         xGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652945; x=1773257745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cg8b3VUqbaKdYh3k3ySRyeTGMl5pXbzZIMHk7oalclY=;
        b=X6DB2tJOJPZWvvkmKycykOaEMPmOnteddtQjYYPKr5hTv7vDUKuMJugo37EK0RcEdW
         qu+Hxg1s6lLoIpuvnQfBv1n1bKSGl/9QR8DHCOGShU3h+1bA8D+4JrPUtKINUeG4BQL0
         eKwfTmf6fz5kIFIwDWH2K69FOWwo8XPJO05tJkpbL/F7Hr1h8uq/gZsbpX8hqpqshRVU
         rgM/jfwF35wWPkgeds32ZIkmFAoCDv9/LL42fWLUCd60Oq3RSUtHVDnzWbQx/z4pPIyV
         X5L6cXzh0irIphXTzoC4R4UanC2/BmjpXo6ax3TG4/7TAciR4HTmNCWgwX3oO79IDZhe
         BBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYvhDY2g8gFoJprOfxLo0SxyaDwCXpQAeCr58szQFcsDOk+uAILQW7lQ/YcvbNRUNi7PpinJrZ90s5TQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjC+o8hOaLH8Tu0c7QxxqOpM+lPsSbLqg15LAqe0M3sRObB8Ka
	x6GapECF78hdThwxnjP5drANlEMa7t7tmOe+ts9FohTjMX+d9oQNG1hq8LkaVl/1+22xUnAKGgN
	TlWiIEYwPVfSTIJYPIac6S5BlhjTekKuLZuqE19Rkf8/Ev5Fu6eqArmX8jbb9Wr6rMA==
X-Gm-Gg: ATEYQzwzk4FPMme4xrIVc65q6rj5Nesj8kIrl95t/I2U+uieuAyqgPwnLQewa23Y5Ar
	gpq7g4wjt0bNTh+uRGvNgCFNsXuNWcPdSdJQ6o86Fd9tM4ybuT4Z9no6eA+oIg9HDB/Oocf2drE
	y5WY/ctfjpyQFQHF+lACMkCTWzG+4m/86uFRmZsOEE3H/IEJsY3B0TtaB14x/w0kCVFUx1Db5cC
	kqREqIJFk34poTbXPxmPjuKjw2DcA2i6mR03jK/FIn8HTNFXbfInsfEjkgvcKYQqs4MKqtL/ZoG
	G0KtvFIAioQa7nAfBSus6+aiKLvVgxwWnA+LrHYZPsYu072ebWiwpWt5Bb3NnOU4TuLNOKhePJi
	Qnt20l4pw3BBXAHfb5T2Sbw2P9HkL
X-Received: by 2002:a05:620a:d8d:b0:8c6:abc5:f15e with SMTP id af79cd13be357-8cd5afaaee4mr381210385a.67.1772652945383;
        Wed, 04 Mar 2026 11:35:45 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8c6:abc5:f15e with SMTP id af79cd13be357-8cd5afaaee4mr381207385a.67.1772652944927;
        Wed, 04 Mar 2026 11:35:44 -0800 (PST)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:ee0b:246c:2dae:77b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884225asm71621215e9.6.2026.03.04.11.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:35:44 -0800 (PST)
Date: Wed, 4 Mar 2026 20:35:42 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, wens@kernel.org,
        jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
        mripard@kernel.org, mans@mansr.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clocksource/drivers/sun5i: Handle error returns from
 devm_reset_control_get_optional_exclusive()
Message-ID: <aaiJjrtVDJyFrpfw@mai.linaro.org>
References: <20260205084037.3661261-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205084037.3661261-1-nichen@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE2MCBTYWx0ZWRfX15mOGHuGNTVK
 hRQ3ITajsgheAVd2hTtUgFa8ey1KZ6jrZb0FaJOw2zXWSI3XxosFtQP6uOFEZwQvcr6u82Guiut
 O4p0SaHZz4IByzKFVrE4DrMIwGx/U4J+fO9EA6ep3w3bi5iJ94Le6AB0dOnpqMTz81THF1coYHv
 K64JvI9fJWbqrdhcc4tcw15e08mUpeP6vUF1VcDVjSebSBsevsrB0X5i4Xaf6ntrbvZuqDqTZ/I
 VZdiE06lXYy6CfK7uRmiggPVE50CneeQXCkHvyH4d0FTVBf+8GpSHfypM0z86fzXRiN4t4Ng7Hi
 KoGTH29I9tTSpuuAXyEyZtAoa2RvunVTfDyHCJkv4NKSyBWGyobElxgKLkmfn5/YoWtKKfaUBa2
 yojUAdtiWEb6OfkYP4YpGAWdAnP1Jb6KqnRgl+GjamVKiPh7oQw/eJD/EreQC3xrq5Nz+kiioRu
 bgd1jFtX6jpp3kiGuqg==
X-Proofpoint-GUID: vCta9Aa6H9Owvwgvcob1me6yWwL1ihac
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a88992 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=7EzGa34QA7hzBqsRmqMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vCta9Aa6H9Owvwgvcob1me6yWwL1ihac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040160

On Thu, Feb 05, 2026 at 04:40:37PM +0800, Chen Ni wrote:
> The devm_reset_control_get_optional_exclusive() function may return an
> ERR_PTR in case of genuine reset control acquisition errors, not just
> NULL which indicates the legitimate absence of an optional reset.
> 
> Add an IS_ERR() check after the call in sun5i_timer_probe(). On error,
> return the error code to ensure proper failure handling rather than
> proceeding with invalid pointers.
> 
> Fixes: 7e5bac610d2f ("clocksource/drivers/sun5i: Convert to platform device driver")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Applied, thanks
