Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823713AFCF4
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 04:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313760; cv=none; b=rJSnRp/3fWTn2RILq7ppok2CEl9MnChng5pHWl5HQ5IIuy3mX+lIVRUqZUDQK6sGAH5S7oC8Ec+sLCWWRSSmXPEEcaTf4KDW8BUKvc7CIwGYBPR/VC+lilwsRqG4B1wjjbEy/GGOrcc26ncpT6cSL3qp9MRDThRx3WUwTjTM2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313760; c=relaxed/simple;
	bh=YmgsfoXmP3wicea3p38VOglMuty4QAN7Ko28KEOX1Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoEyRWl3rrL2Jt8ApxbIE71BtFW3i7NFNvOgErUJ21Rzh6eXqQwa1igojY/PfwfMc/Oc8rtBqoOMO8TgHlF+ZCXAtJFp/MaoHkie7R3gFDIYD+RtfR66CO/oaaUTLap+ya816GFDS0fhD5/Rv8RDjpChDyyLgMAXpIuIGhdpdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtuYZphI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgYcjuBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtuYZphI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgYcjuBE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TgR3539257
	for <linux-sunxi@lists.linux.dev>; Mon, 6 Jul 2026 04:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnmqay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so2292809a91.0
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313756; x=1783918556; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=XgYcjuBEj2gxyfNwdnRvrpMcrNz1Rns6022PEgk7sP3EmYpFPHjNdaDI6ESuxrZPK5
         9BgF5XXOZxdS+3nBfl5ocxU1FWCPLP/acXrj43JLJrDEiR32Vg6tClBhSwovvz797xpy
         LCLlmTYpKZtX5mcOvEMDD+XxqxoUp1eKi4zD7lhhlsxcsGLDM8egdzbBsqkp+zoZE19m
         6LnnXV/8hGVKzoWOpfHIAKqJxqUPlRajEUdq2vCZ5/R8X3nasJR5czvQ07g3j8grF77g
         sDTN4QrYi+j5qoxzBUJiInGIsaXwhygieoZ3I3fc+GxH8CrkdyXtarTtkR1qDbbWuNo+
         YCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313756; x=1783918556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=OhxfduN/SCFzXGRFVqcYaKLxTcdk/eb4ehPv8snD/Z8kyEoGbTTWOIjp3sMWkjcwWy
         TtJMSYZd5y5cpq5d6y5Wk80mMqNNAXc94bk5dsVemaMm1aayZZS82efWVTx+Ns7Fhnlp
         JcRD9eilBO56EoUsMJwLUk+R8/+KNeE9luVd1UP4KcVVvJvh2ZCmfwjKgBEt4VJ0uMLX
         QipFIlo5dappL857aoDav+mJ+tDdPWBZsOMkSU7G/njHQvtDcmJidxwsEjTt/3c+rS97
         NJYS0ZXYjFIIcdRJbUPPSlwlV8k5eHAMmZ1lDRzuQRmcoBKGABBJ73bjau7gCbwwTL6F
         Ku7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq1QVFwbgDztLVoa3/T3XjzeC78s/xzrBqe7XV/QA1eN1rKBMu4iFVzfnu3Gxkvn3PWuBwiMu2R+a3hLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsuUzI1se4xx4goYKz1YWId7I2xdgsDj9GgyFcpDlwTA5CecGN
	ajF2Y65pGlHtEjToavV9zui1eIjvZ7LREsgpYda1asBV62Hu7uFs+pb59bGzUI7zszOZE53Qbad
	yRo21r14o0qJ4wlZZaFUqH3Q6Th8KQCcIOl10OwWtoV8KQPyF10v/Kc5lPCcvRl07Rg==
X-Gm-Gg: AfdE7ck7huQUqcbgoUgWptCq8odgMTehEGLUtO+X+bEl1q1hBtuZrTANO8qtHHa6GW8
	5pX7SNylM5ACZSYrtu8tY97lr9+thGRKpimcGSYHNxM/L9oKWjCfZ1TMNg65+0N3hn6T0dfdvXD
	PQM3U4SrGA+/sNEhChJd2PfUu3RhsIK1UA5p7lDaPMrC9vKyvdHZ4Y8JLx7Z85GYLgjmoZdT8UA
	Pt3Psg3Vq2HTyf+eI7ZbcTZQXcNm2xrj5pq+YI4woz4K1Q4tRTP8zBiFv/ZpuZVIjAnsp5RiCyT
	aRz2I5fdKlDS1/LZ4WbqSGm/zwx6RgMVnL0SbQs/ro2GT7ppjBPTvvpBm1omej4F2ACTEjwL3up
	+AAsXpGXV9w4DdwrUBP+1QzmO1dPKO/FnCYjMboal
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328710a91.4.1783313756485;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfXz3V9Ol8pMhsO
 ggKwrDQq6gHEp206tXQDoLo7RU2EuUxXhfdY2mwlwFwstlObutIOqEf/DFZRpYplU3LdpyDQca9
 ZfITTAPfr/4fO3b/nskiEiDEr1ZjkmA=
X-Proofpoint-ORIG-GUID: wGs_M3kFn2vSb2yki_dKBrTW8XZQ6TgD
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX+uVG9yxDh0b0
 iFz6Vr1qpdgaAoVT7zswLsXYbB6QNtLmXPOQpU+EX55YVwX6lDTfkdtEEUUt916k8DOc+AWWylC
 q6G5BIbJT6nikZRO8S3/BQGcJg8u4/oDxLN9xastyMGWWLANifK26yQFANK2iLhT8SeXBFePdaE
 5IewOVfl2T72eoAjpffW1bCN5f/uD+fLO3S4k3oBQpPhIROzz8e28gBe1SnPeMXib3Ok16/BFc7
 S5UcRLUPOATWkAwjRhEP90WEP2Mf5c7nqwiFyogrIuazKdLo1FSbbUk9s36WbIHLSGcVAqFfqq3
 Bkg5XMbSnzffAbF7s7+HhzJEnf3kbIea6u7wJ2F5gWBZBIreGr9bRgmKwm/5wuzormWoOJNQOCZ
 A+Q9a2p6+kNiA98TJA18p4J5ld9oJNZPxxY8NSKiwXl900mvaYi+nGOFYAwXxUqMlkCevo2TwwE
 3RoKUKToU4ZzXAABmPw==
X-Proofpoint-GUID: wGs_M3kFn2vSb2yki_dKBrTW8XZQ6TgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,

