Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4074741A4FE
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528569; cv=none; b=no+PfYzV72rdRoYcFuuV57YqGM80cQvBW+UvhEI2UonidmWCHKh0J8dlzcU7qrgfzfGi3VGvZypaV8ec3sAjwNQN+0uHRENglSf4YPgMCUAmdJ4OCmTQYu4bylAxfzmfuYzwHUoaJjaPoPWAzDeJB8vk+oOyWQbFugdepqDXTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528569; c=relaxed/simple;
	bh=lkPZHNFB+JX81a7WBFz+06jUjfSYmZvJ8gPyG4FR/B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKKtlIM8aSJjVBCoR07IAnOSdfR8yZBfh38NrkdiKWkkR2254Va1Q3aFIofJZbUZMqMaX9uS2TKz/6IhIR/N0P5CTvie2UeyIoulX0KKXd1DWFR7P/e31oejIbNxdqy7i6fx+hTyho9cHq6/aW/N7D85fJaxr3xLWPDB/5cE4nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8wjMlFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAmmRtOn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8wjMlFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAmmRtOn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9ftlb3436403
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCd9UxFQ7jF3xu2xuD2dcMcaUMiKIU7nK5JH+i/EVZU=; b=S8wjMlFaihmzZ87a
	e9URMNP7k5RkNQjBuNAlJcmyLUV7Yri2pCtPOSNvM+6vQY5QP3dqjzisuF/uTHFA
	fvG3KtG02t3m2fsb+OzTc0iEFHDK+8KliX9NtRMeg9zBTU7HWPPj27i/NkbgI577
	ZfvSJYTASFY+XvZX+2sEnLGxAWAGo0ukE4yu2u9TTZGbboGo98CChv8zthvawQTm
	7CC7iiyXWOeL18ov1zOLwE+mME6eYIdQmIhV1vDItRSPa5I0CLqT9Rmm3T9h8f4N
	4l50OfCr4/uoT+BOfyHYVUeTe4oXSkwUpirXiow9rFJ3d4cNH8LSH1daALE2btR/
	jXgW2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2s8v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 09:56:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-904ee4473a8so7530236d6.2
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786528565; x=1787133365; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCd9UxFQ7jF3xu2xuD2dcMcaUMiKIU7nK5JH+i/EVZU=;
        b=dAmmRtOnzY3/90bITbNu9Wd1JuCLpS/1RK+HNWOP5vwy7X7l68rq8yX+jBHFHVR5pJ
         1aH1mRFVHNZONVZFNEHtewZA16R97V0wJyr0ni95/2pgG12IosjAWzIdarXPq5J4XmUR
         yMPVu1Fv8HsYEw+zRA/b8P2JIFiM7vxscpZ73gQ+F2P9MRpmNI6LtzjIjaZw6CDqe3Pb
         JSlSXLgTQbsPvpeVIDSFOYhOSJ3LYa2sLovIMWSOoLUCt6z8E/F9SRqEL126BLRnvZSO
         Knxs6+OHCvo4JbFC1PoCcVVK1gFWBcCG42cBfyJRHOnozvhuDdE8k+bWDG2SONxVKd1z
         XgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528565; x=1787133365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCd9UxFQ7jF3xu2xuD2dcMcaUMiKIU7nK5JH+i/EVZU=;
        b=Xw7EvoM739HdfP7MArEiyNzjPGo9rR4SLq1Nj6vn3TCgNKnMgXRVRVK8EoU8a/nDag
         wxeZyTLmov3HB1bHfCWoumOtkbzplgQV3rPxc+NcbxLd36KPq0zn9EGYD9O1z+WpmpeT
         E6PZSiXhjwIgwG+/m07d6iP/ACZ+/okZSLxpw+USID+15+S3Rp5uZfx8DeSP0zRRjw7o
         UlCDtH6DugxdXmL0ZUAEdO5JF77qJWui8d8YAZeEH1+juNaKDmG26qGHViDlQ22Afq8d
         oyaFNwUo+M9WEAzfMJ44pnTiRCk5LUw3/iQzmdQk/yuMXjYbUkhC+9t5UN19iMCZ6l4z
         dFTw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5uiTe3mo74h5fL4cpcZyZc+h/pFGwCsQCd1Qx/cSHHWE5vD8VqobRxxSeY61BJjEYiyVWNLJCPC0Dtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlJsFDnIRPkPdfazyYBV13uvEVysS4KxIkdv4FBhJqMeF79DkC
	OvqZvvRkduozE982rLjQR06knSfTkTsgTc6mzKDrD5j78apxiInxYO2n1ibjrmBgK7YyOQOJjGa
	78jJHwEF91p/+M2LfJJVS+93C4RxTrboKm2+fcFqeH8oa+5EopxrEBuxd8GtdYY48Gw==
X-Gm-Gg: AR+sD105FA+WmtmVZdrpuDQpodTOnSWawLL9qHFxuej/mLmi05nk3hxg7p4G3WIlhNp
	zt2eh9U3gC6S4lMGRgeoF1cHOIV11Mn3HbJD2hV0Y1E0V4GHAPnwy23TwDjxeYK8UgQLbgIho22
	t3xgpX/vfC0htEWYNkeAKgzwnECeyI51xg0M5CQD8ETMCQwon9KeM/T/nmPAHRObazkMF3szVT9
	0C6KTjxKPuM8fXkC2kVgSU3ElM777zRvhZAJGmKbVAkU03MfsCc2YMQPTVfl8NbEiciZFCiLzUF
	FqUYbNjimSGwr9iXgJdPPsVV2KSN0iDn/etmbvXMjzSser9LH4cMY2EUMu2hU86FA6AT1SKAZcR
	jbnTpyTRb0hWgmzxySPD7L2Q3vIC4khDeXiVAwQNgAlp6xjl+rKXPc1uErXuEFDw=
X-Received: by 2002:ac8:5a84:0:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52d6471a403mr29798301cf.12.1786528565416;
        Wed, 12 Aug 2026 02:56:05 -0700 (PDT)
X-Received: by 2002:ac8:5a84:0:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52d6471a403mr29798061cf.12.1786528564956;
        Wed, 12 Aug 2026 02:56:04 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d71e:6d83:9df1:6316? ([2a05:6e02:1041:c10:d71e:6d83:9df1:6316])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150bf5f1csm6564893f8f.8.2026.08.12.02.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:56:04 -0700 (PDT)
Message-ID: <9e9003b7-0331-4b37-9b06-5e9de887199e@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:56:03 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/sun4i: Wait for pending reload before
 CTRL write
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
References: <20260725113341.2250687-1-megi@xff.cz>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260725113341.2250687-1-megi@xff.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c4336 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=okeiRmupSayk4YNt53QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: F-8IqIlUv3uOVR5IHCQVLS9vP0ZCmFif
X-Proofpoint-GUID: F-8IqIlUv3uOVR5IHCQVLS9vP0ZCmFif
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3OSBTYWx0ZWRfX1R3O9YNhgusG
 yiTYE926d71codIeljcwZlRryGo2C9SV7gyRHhyj+O+SZeBx1qgZo30h+wnjdzWIEx4de/2kiaS
 s1xvPqIV5JzesphE5NhIt3Qfw75gIbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3OSBTYWx0ZWRfXxe8V5Xrrxmq5
 fpKVFb2G1bp4vKE6p74Y0RpcvkGdMD2UWqwwbWfI8ZbCgp2JF3yUYogysv7SVvLvQVhms6XHlnm
 QMmffBQEXO/nxgLcSftHmIzriKRjlkLvkHf8CKlrxQFtJvn0syQ2joKnu4NnS8RNSgTMJrDIipe
 cvFEBjDulGVNIkQydvgHCQrr8tpH5g4FSSIa5JdyymlhnJxFFyotk+kHNugTZxL0+guB0yhBm5z
 mxAG/+sFEb0AVGeP3x95M04f4oB/oJ9XL08ukF6LMEF9/l/Sx0ed9BFIWnDsg4IQ6j4LO39UxIK
 Ueo504ZajBJ/RXOjymNahI9gPPEKVJcS5ApKwd32v2IKdpsoP4mCswu3u1iMrJ2eaxbRO/3boXa
 MSFtgyU8DOHaaxhBtGhMU2Kaf4fAelgSeKS6wpEi41KxFS2qrC7tik98IgFwbBHzLzHnxkyAFCB
 jm7FfZRstXn7+fRSwpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120079

On 7/25/26 13:33, Ondřej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> The A13 manual says of TMR0_RELOAD: "After the bit is set, it can not be
> written again before it's cleared automatically."  Both time_stop() and
> time_start() read-modify-write the control register, so a reload still in
> flight gets rewritten and the write can be dropped, leaving the timer
> unarmed.  In oneshot mode this happens on every tick, and the tick
> eventually stops for good.
> 
> Wait for the reload to clear first.  All control register updates go
> through sun4i_clkevt_time_stop().
> 
> Without this my Allwinner A13 based Pocketbook Touch Lux 3 stops
> scheduling processes during boot or within a few seconds of executing
> userspace. Only sysrq+t over serial port works at this stage, which is
> how I discovered the root cause.
> 
> Fixes: 7e14183469d8 ("clocksource: sun4i: Fix bug when switching from periodic to oneshot modes")
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
> BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
> device that would exercise it. And it's possible that this triggers more easily
> with CONFIG_HZ=1000 which I use.
> 
>   drivers/clocksource/timer-sun4i.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
> index 7bdcc60ad43c..2e7457f671c4 100644
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -39,6 +39,9 @@
>   
>   #define TIMER_SYNC_TICKS	3
>   
> +/* The reload bit clears a couple of source clock cycles after it is set. */
> +#define TIMER_RELOAD_MAX_POLL	100
> +
>   /*
>    * When we disable a timer, we need to wait at least for 2 cycles of
>    * the timer source clock. We will use for that the clocksource timer
> @@ -53,9 +56,30 @@ static void sun4i_clkevt_sync(void __iomem *base)
>   		cpu_relax();
>   }
>   
> +/*
> + * The control register must not be written while a reload is still in
> + * flight, or the write can be dropped.
> + */
> +static int sun4i_clkevt_wait_reload(void __iomem *base, u8 timer)
> +{
> +	int i;
> +
> +	for (i = 0; i < TIMER_RELOAD_MAX_POLL; i++) {
> +		if (!(readl(base + TIMER_CTL_REG(timer)) & TIMER_CTL_RELOAD))
> +			return 0;
> +		cpu_relax();
> +	}

The loop looks correct but I'm wondering why not use the helper:

ret = readl_poll_timeout_atomic(base + TIMER_CTL_REG(timer), val,
				!(val & TIMER_CTL_RELOAD), 0, timeout);


> +	return -ETIME;
> +}
> +
>   static void sun4i_clkevt_time_stop(void __iomem *base, u8 timer)
>   {
> -	u32 val = readl(base + TIMER_CTL_REG(timer));
> +	u32 val;
> +
> +	sun4i_clkevt_wait_reload(base, timer);

If it fails ?

> +
> +	val = readl(base + TIMER_CTL_REG(timer));
>   	writel(val & ~TIMER_CTL_ENABLE, base + TIMER_CTL_REG(timer));
>   	sun4i_clkevt_sync(base);
>   }

