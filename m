Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311023A5433
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421724; cv=none; b=Jbbnc576WIxv/Sv82a7crjD2yBNAcZwH3xSDQs0TKtq7qErFNlQwo2alOJ9K7wctMVefjbBWu6NxLCjulC0kPgNyCauvm8Mgwu6cSQilC6mej0iUFs71EZrRH7jfOOuzRdywed4Cb45VT+Mqu4/fpW8df/uafcRS5782HfNAqiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421724; c=relaxed/simple;
	bh=WSbNeuUiv3870zRz2xs+S/Of+1W7RIQcNLLx/vym5lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFHHfX5Se5hPIQqZsbLHwWLNdq9+aceYTEz5kIK10h2zAusaloPvj+XQJ5f3jxHyanRNcRCED6Rp0fPncoyZrm9ZHF2+CFD3aAimX5mBmEply9CNBwDJIFHw4hPeElcW5230ZPFRxvAfSclKvYzNkasiiTOZwMp/+UT2uECFazg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2YalGhS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6gqVHbf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2YalGhS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6gqVHbf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE29kn2203535
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TeJATUx7ljVkLhlZlRGhQEAK
	TzXhPv+shwk0WDPgUfI=; b=C2YalGhSDICS4YRAXU2U+L8xwNORatJmUHoMwofp
	qqN7zufjbU8P37qCC9v/oSfnJTFw335fRWqFZRwWTwZvPjssYqUAJH1YqlvTybdY
	RaMXj8bmjYW1YnKlr2SmwhSDNWQAqe9hTkQ1ouKGjAlvZ1ILcJ6Oaw7hjjgJARMB
	RNA3nYnnNLijiCCoufJFiKBoc9YGo/+ghAfKIv7Eb3T53vJGWPAhiLUHIdEH1D/V
	fmyI8Sb4jwi5K2KRQlg1QS3hDE2hrTc7hC9bRyN5teYGXrmbUtmS6i/lRRXXP3vC
	OqsELm+b+ksxIjy1qcgPuEKkXGtiVd2YIRTyzOiKKt4uGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr816847t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:28:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso7657011cf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421721; x=1786026521; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeJATUx7ljVkLhlZlRGhQEAKTzXhPv+shwk0WDPgUfI=;
        b=H6gqVHbfRQHVGvXZp+cpb4dGXhw3TFnfzwpOmQxhne4zphU0kBDziAun3+UnL8pmer
         cTPOvCUAqCQ/u5Rn/KFb3WaYq8EL0kIm27/k0nQyg6PyfaEg8Td+9JrySaO4TINXHJLR
         hYkjiNt67BiPxW5O7/IMTvAMkzGscoeTRJR5u2OV6ueb8Oh3aonL6N/sr2ZQyIfq7U7a
         K78m0Vs8r/IhdDjYxzzfon0TKEq+rAUR1zw/oiji9Q3AuSRPwfYgQ+zOwHYlyQA2aTie
         Q6FhAxPBgWCm4ElYkxckXkAa1o9zIllHtOMMZ2UVnR5Axu+AqanLrVMQZ700uKlAVioZ
         3HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421721; x=1786026521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeJATUx7ljVkLhlZlRGhQEAKTzXhPv+shwk0WDPgUfI=;
        b=A0piJ53USipXON7uUe5bOUNLdNp5FGrTxfjttK132+lxkLpmKrztWZYF2hyyzxJTig
         eMzkJWdn3+ZCiufRrJTJTHki6RFB+OMOwcjzrcLPEPedlIB08/TSGm7lcB/HtKcAutNE
         g4gzwa2e1Cope9Jp/ENV+LoCL52hL2unPeiFcOB79jDX+zh4FNQnuzdHsjHsY+D9swt7
         QHRc6SH76rSzcwER0JEuHl82B59OBJMJbfXisZEwbu/17LMoqJzfYCnvRVt6NMu8gDUl
         F2lisRRzTMk/K2JZ/CUW9HvXtFKFnZ/5uHB6eD4aCug4WvW/rvlPIthr2C53p1KIq7SB
         oECg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/ib/lnjaT2fK8AOq1piPqjq5ZuW+9Qx5x3PTfJNbh/7c27wJQ+4BN+LtBiWvAABxmsZTNWHqtRBvTdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKXNPukRjmSKyrAg/9l1MTxFuwLJJm+PsZ5V504N6t5yYLrsU6
	EyPdZf7bjQ5FyXtOC2Nn1xK0+0rARssAYkYeECnWAE/diCPshYLEw2XG8TdE0o0vpqcZCRFNvRI
	fQvHv+GIDqUfyHg5NaEl62cc41klj2bedanedzKt+E7ZdEuYRdkEVMBUDExpPDVWKUA==
X-Gm-Gg: AR+sD1090cGv7tQ1P8LNqdqnUr+2Io0H6At4kIdjsPmwP8np8Wa8nuV3D6UdJP0YYvd
	HwkFHBL+kVeK9890U1Pvs7/+owtyOi2xueYF/qKKK5G70Bbc5GpDxC6JhwJXSRs3wR0WD+E0J8d
	1Aa0xVJPwKtl6puXfiFv9BBoEm9+yV49iyBciFyAgo0bfLRYaWcBYTqiwar1ig7g4hecb89g7UK
	409cagpn8EWEypbjSVfwDKza3Zp539J1cfo3FC0mKpUY1+G6ePamJ67DeP6YG+tvexX9QP/UAQ+
	ckxOBoSQmhCZ9eCwu8+qIq6u8k/MibM9GdACEwJnRxTAC1Illt9rq7nuNt3fN2RnVwpKnC7IrnS
	QBJq2RfJp/c3nUy9yIyyTxarYSWPmXQgi8qtj5zrpGGzBZdYv5v4MQZzybZ+Snfd7qZvAph1skw
	Y+hiyLvm/0lE2QqA==
X-Received: by 2002:a05:622a:a10:b0:517:9407:5c38 with SMTP id d75a77b69052e-52b425c7cfbmr6250371cf.24.1785421721214;
        Thu, 30 Jul 2026 07:28:41 -0700 (PDT)
X-Received: by 2002:a05:622a:a10:b0:517:9407:5c38 with SMTP id d75a77b69052e-52b425c7cfbmr6249781cf.24.1785421720708;
        Thu, 30 Jul 2026 07:28:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9c518bsm369768e87.59.2026.07.30.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:28:39 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:28:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Algea Cao <algea.cao@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>,
        Phong LE <ple@baylibre.com>, kernel@collabora.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v9 06/61] drm/display: scdc-helper: Add macro for
 connector-prefixed debug messages
Message-ID: <y5776gxmfby42d25sp4zxpevhuj5s7zs5sd2i4d5xe2dodlbwh@ovrkyvgakd3i>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-6-4fb12ea22ac9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-6-4fb12ea22ac9@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMCBTYWx0ZWRfX0K3GNRjhOLYK
 UDvHbVtD3aX0tn6gxWybuHm7q63MfBkHMKs1U7fVlQGZbGtzmOOMjn7lswkkHo67qs3aRu0AqdJ
 IAfHC7gtXmizLv2TUrhp634OCWIZRbCFVOVtdjs+nzr02bKZe1FIcED/wxswmnAq7R/AlN4ERgv
 KjvFuE2fzEVDnh5LRq6cJUK3qedVZDh+bN9KMUk24D5sp51Y/gjyUHZuveRUz3wnFVHkUYJhNAO
 8Xl4Tz/lYbe0Myq8h95lOQRtn6E2BMSf9GvfdiV3ybJDlJcjnrG+cLieAa0S7skzwpSG3I3A+6X
 0E5NT8YEtIO2LVNQzM2AZ/KePUjYkcLkzroemKbnbGyEG8jr3yFDTy5XAUVVlQ6z3EIaHGmZln2
 XGYKNTrKBWa9ia0ef7OzIN8Fli1bdUfo8oPHMGXLi4rCUNFKwDDGnc46kv5DpuPG0jYVom/I28X
 Z1qdmhqtBWWtwIqgC4A==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b5f9a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=69EAbJreAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=1j1XXGRfLVQr3Hd9viAA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 5HEOGosqbwkdv--VjWUHsTCoBKMVN7Bb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMCBTYWx0ZWRfX1BJPLZ5ga0NQ
 NlBgB5SoTa15gJnf0whpB8eu7CzOdapkfSWzj5gaqbcNNVzkZIhtsrSEwdn0JkWRt1Z3NnVeaZA
 mDgqRlZJFkRPlZiLW4KaanD1MQVWy3s=
X-Proofpoint-GUID: 5HEOGosqbwkdv--VjWUHsTCoBKMVN7Bb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300110

On Thu, Jul 23, 2026 at 04:34:55AM +0300, Cristian Ciocaltea wrote:
> Introduce the drm_scdc_dbg() wrapper over drm_dbg_kms() to help getting
> rid of the boilerplate around prefixing the debug messages with the
> connector information.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_scdc_helper.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
