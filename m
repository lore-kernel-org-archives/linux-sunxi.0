Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996864F4754
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784278; cv=pass; b=pyb4GqTghg2qG9Vd4MRhfKQ7qg7zgMPaBI5ykoQ9nCnCpib0HL8PizjoSZoIWX34sColPgX2z/7uUJd4u+wH/nXjulrRXzEaljG+MNLSTlrd/sjRbDhuLcElaqxQkC0Qf9hYoYTarCdsZIDui16sgp9M2XYIAlNV8MooBH9lonU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784278; c=relaxed/simple;
	bh=n9fFaAGplQpnkm7Vf05iAz9kVcqoT3sPQRPD8gh+bT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erwIwlvZIoKmdhtRZ8SpI+2CqHgVnGb0PQge5qIPCDrM0flDYyekVnkoUGBruvF/B7BIigTRdqxBoKylxhIiCt8ylbND5l6KGkkAm6fZXofcKljCzcZS8ppZ+64WUxjH8cPsrXi1+QQpylMZ8b6pzzTI4T+/d0jhyAZqvQfNGzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2APh1dR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J82cFt9o; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2APh1dR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J82cFt9o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxlPl3063732
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 16:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=; b=L2APh1dRJOerB4OL
	P1t9c2Y59+gGCoUq2l/4h21nVCaB6uiOsOnQs84z5r2jb5dQA07xYsNnISKluWxn
	7CFAtbAIXKXYSUxMLmfNC7azfgIe7g+Loec7Qk+0fFKu8dqZjJPFQWS4R9Prs2Ar
	W7y8ul3qjh3icyQuf2mIhTzslSdyt9C2IrOvNeK3ShQP7oAccAQojUDmrSmFYkUh
	iIcKFZJjrBKHkqaSn1j2Co2qBk6xUUK6nn6tKiwhEqSZuNSBPS+dQu9DelDXLWj+
	cURjdM0r1AURAAS34VgIi5K6Tr5RQCw6vetpbGX+pRIbWhWMUUsmgJukfZCOm+sI
	Ze7mBw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjkf4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 16:04:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so6687027a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 09:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784272; cv=none;
        d=google.com; s=arc-20260327;
        b=is8iYaH8Z4gB7gVhLLCpTn7tJwYbUhSin2LpRLBEYuVDVEo4G09bSVy62ZMb5VPJrN
         HFHS9T/oiu2s/FfiRzg6M59aRu5U8xY3RTalsWpizvqL1wiQC7J3qaAeKFOuPhitniDv
         9S8RFgTQ88B1AnMVkYjSZAb41W4USZQUJGfOByQDyN+vBBMyLDDuj/lfvkNOAPUzHrYK
         lNNbYUXuidshpnx5vYqtoWNoOpsK4LgkwbppsGJsrJUZy9sz3Y5GIJ2zS7w46kpjRCS7
         /pj6IRC/y068Ezx6yVSw2uyxy3fC8risJOjOkcj38YsHtiPpdVrobpFrtLgQtIFjbuuu
         jVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        fh=pmTh5qZ96pYweDU3K7LsCvhlwCBR6r6b6sjjsICda5E=;
        b=ldcTieEIj2OWxpwVrEXJCxsoUfaNQmJcYwKW664TpEPsFjfc2EADCuXP8SH+7Fnn+q
         WW6GuFmrKH54ak2xYSZdxY8wVMht2Ieg7L5FDtR1g2X6LG1W+7H7Huj/HlTIU3iie3Df
         j1pc2BSkmotv5eVmAY0T7a/j0+0dFYex+b0sBizq0e2+ZpWJu/FFW2hwpDvIkP48a2y6
         lnsR4Z56bufsyMgn/cO8YwgAJaMrzd8A7s29oKyQ8Kvh1UsBEzcyg+1ectvPhzCkfZSL
         4GNrAWrTJWaA27F4HfBlAblGC+Ge8yBGNyerl+MBvJAvK8iRc6M0DO1BBqOox+xUDBwT
         9IOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784272; x=1791389072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        b=J82cFt9ob94vBRnZT8cw4+ap3TAbjkf8zE+12SryNQtTxUzVkBXxQckwZ32xLDIFzb
         6NbiT44KYwk34JVYzTNOZ8U7tdvqOoZDmFp4mJOXgXQjwSlZgrIL4bVxqaO2HPrcDa4u
         TpeUNB4y7Zd3aJJfI5PZl6M8ck22BUr1e1GhWnmZo25tUjuWgBVwJEmz5ovnb3x5YaZz
         1cfJdSmA9ybKt/Jq63TEIKox0/rp0mJ9loRhmP8d2+3TOKaJ/pZSzqcWEDMGRKTwcNzs
         MlcWz7NUBfbk+Z9j+lDnNdXLIh7FdLAv0dJRMtirHA4gRXkqSbAYg1POOtXHjDP4l4M6
         8s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784272; x=1791389072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        b=SaovJzkmVUElcVorVxptn024kevE5T4BbHcwPAveVPhTyfM5Cr1JjN7E0Gvl6afpzo
         22DyMnSD+8LSxmZQTmdO9yH5X1w7isbe77dBA2AX0zlAi/gaJW5uRfkd2FFV3kLu04jP
         9/9A6RWL+jQORdCIyX85uOLkJbba+YrF3QpGLqsMA+LSJJYelQOWIYaW5nUwBSgYiVJ7
         sW3tUIMGVZmZ9BUXDsLz6hy5K64sX3XlRsPWDEdw0LyE8tkybTbdI4MIGzinEL5FJci/
         i7LJJ3wCuGQKM0cjUutMr0ReKq5RUBIPBslHZsuIeM6KQcv6pldDX4Jwj7PdIk8RuQAY
         9IGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdtSSyDbu3ryvy5e5LtRxoTLU/QF0lvyvR1768IxeUE3DDP+u0C3lzoFUeIBz48lhW3f6yDRuZf/j94g==@lists.linux.dev
X-Gm-Message-State: AFuF++kM7blmBO2Tk/eijzw0lGWKyTrRqUhpf45LWYqMXFOY0RM1SW1e
	ePFKWbeq7pkCWnQdOb9Wv9BW5euSjtexxxDC6AR4CNADNS11lTq6Vn22KAUw1amxIrKEkpVU2La
	vUg5gRbWYoqxQP1HwkRham0UKVjgxO0IMOEUmrr+WYpG4DRc6ESBqQk58lfChXXly89Eo28ZNCg
	l1/Y89ZAbFngAqqtROkWBwoJD6XXtN4Z47IZzLoytm
X-Gm-Gg: AYBFou3p/ooAGsQeHAcTkaf9+k8F5MglEwKmBnmFz7IMldI7XIbYphcSJnI/AvDsZRS
	4gP1HFjMTapCVRRNrs+bKzUmOpB0hkkK/XcH0JeAYZfc2Izh/5es9owMQSfkl6fsJ4b+AM5ugpj
	JZfLf4u4NL69cNCT1ZcowQf5fA5O/yg3QTCFFmKkWKcoBI+w/e4vqCGnNT+w==
X-Received: by 2002:a05:6a21:4cca:b0:3dd:a197:edea with SMTP id adf61e73a8af0-3de9e8b7c77mr1829499637.57.1790784272534;
        Wed, 30 Sep 2026 09:04:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:3dd:a197:edea with SMTP id
 adf61e73a8af0-3de9e8b7c77mr1829465637.57.1790784272140; Wed, 30 Sep 2026
 09:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-9-pmazzini@gmail.com>
In-Reply-To: <20260927151016.186493-9-pmazzini@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:04:19 +0200
X-Gm-Features: AclHuK9W8iKpxeLaY0dvpEbGt-kGPjsZMSlSCjzDyfjFsqRteSj3h5zChvT9XB4
Message-ID: <CAPx+jO9aML0ABRF=j36s1HfPu405L18X6VyzppyQv_N10JPf1A@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX9AEe+t5zkNm7
 utWGgvGq+uoe9fiWMtShahRWA2686tlLJRKyVyRPtgJW4HXPEhLBo3HDfBaUOOcD3xoXCVrypun
 asXUg24EpmVpDszNxaRsV/4vnz9kDUk=
X-Proofpoint-GUID: X9NBgHhZ1D6cnfGvNByeSDGMyooW3m8y
X-Proofpoint-ORIG-GUID: X9NBgHhZ1D6cnfGvNByeSDGMyooW3m8y
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd3311 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=kqsBenvbzo-VylAG1WUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX6q3qc5ZTK5Jt
 KapgpKB//OtjkedSaL9/sH54NEQetGM+V0eR6ce51JrX6LICkS/RmOhCbd2SNLiZViQdQaW3bX6
 8IQzYl8LaeYO3JZFUws0quQQCHiMMGjE6M85t8J2yFrkpLpdacrJ84kEnyQZ8QiJPVS3pOyRSWk
 HOsGF4impgcZqKQORst8LxJ82o4uKHtSnLEh/EZjguV5Qb90U3MW6ESRlFISpbGeYEWZ9L0fcil
 0p09/Ae+zI9mHVhNrWnC5tf6SpVKyYFfuoeUxKKzcdlfqj6NAf20yyvMHq7PDRqwmqREpZ8wjKn
 3A0ffI2uGGDRwLNU953vWrdniJwE+VvCbyGdROL6QEKVCfK08z8pFSou+Uwevi5CUmzRkVh1pbl
 IB8ZMadK3EnshUm5Ve7Ex2xvTegJLQ87/U39oZLgVBvwb6ZkvSbSVKy9do06BOtFP2Hb1yRSWBf
 vtA5DGyV7T0q7XG2/xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

On Sun, Sep 27, 2026 at 5:12=E2=80=AFPM Pablo Mazzini <pmazzini@gmail.com> =
wrote:
>
> Add the MMC and eMMC compatibles.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mm=
c.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 9e9610bb1eda..c2ec7151dccf 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -32,10 +32,12 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun8i-a83t-mmc
> +              - allwinner,sun8i-b288-mmc
>                - allwinner,suniv-f1c100s-mmc
>            - const: allwinner,sun7i-a20-mmc
>        - items:
>            - enum:
> +              - allwinner,sun8i-b288-emmc
>                - allwinner,sun8i-r40-emmc
>                - allwinner,sun50i-h5-emmc
>                - allwinner,sun50i-h6-emmc
> --
> 2.53.0
>
