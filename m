Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795711904;
	b=BNHNZ+8zkiVcAbrkfHgAv/99j3mMTncmDouJpEmKhnWK1B40d1sB7BWjQT0G5gpCe7Rn
	 riwohvxEX8aGOhZoHK29jRPNeaigGtFFSJLnHR7oQZ9PVPRHmsligJdXvgAV2arlYEdrp
	 qKyFVGEQ5OxrWffEmAvpKWgZpJS23I8bUEdUCu2LnXAdXwSp4xhNzdTYpKnXIC0TF1/6O
	 04rK53w1TD/FRVSueZBGvolNEc5i5cU4qQt/A1NvkZHAShUwYqr4tASoqitKSRr+LBlMg
	 2E1WrJo3QfXeDi/zbKbS/Tfl7t+KxrZDdUbZBQ1EDUlABo5T58trnoANiJi9wFRvgcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
	b=f7Czduj8jT5EuMZaexLJlFekvXPaVzyGAQ3FZvRvisproUn3W1/+qD/qeq9M93dZe5YP
	 ZgSWcXVYRUYN718PLxXUQmakm05BTJoT2jd3eqYf3akEsKsykFDsh/rgq2fUEgyLYaCYx
	 pIOafPYhwLY9Qp/0TASVCekkontXshPlBbUCn1PTBwO4NroeRwBFWEqjc0TdXyplpIM6h
	 2xfN/jK4eIU3ysIniVC03+ZPrLglOImwPlYTs/j8RbqKjvBV2MdQHrypBrbYHcX9eHOnv
	 3xqg/a9rknjk/NI884WuEuSJ/lb+uZEecBWPNEEyYF0DS1RBRyPPWnocYr5Ydx/klfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VUXwsLnE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kc/j3ApD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034A606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 16:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E034A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VUXwsLnE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kc/j3ApD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFvduO1209097
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 16:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=; b=VUXwsLnERin7OHsu
	YlLK/cimg/N6nMwtb/3rFcpTDCS0vg6LajJtxShugWutizcqc4BlTZ7M8Hk+AzA1
	2h0ErmKLGxEdvk/fVu2qs+h+rFQQDjNHaF63+PaWnhJrxh3M9wud0nV2y3SpYSnY
	yrQYkXmANJX6tF26ZAq2Y1Fju3zWRtKvoYUUYnb3oTjQOxEB1vTMEjepS8BcF6C5
	N26j5DjPdfos/ks8jEk2Dph01gCbVcXUhZvjnJZM+I0uXYCIFvAE8KD7sTI0vNpr
	256p1oKqxZX6sennbCWMvGUG6Z63ikwLLWptj3M/2qnhPUBGs8HI86z7FM7XH3K2
	AeMgMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne1wtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 16:51:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so8328712a91.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 08:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795711901; cv=none;
        d=google.com; s=arc-20260327;
        b=HsAFS3Oq57Dvy/GenGHSKi4pUUCQWJJd99hxUKUzcyWE+Kdjvcpy9+eSM0jzh70MOZ
         P9PbqB0f9ofFRFbZxb36qM1wAzJJThpAKRYM+WIYsf9E4XoOHySUN87F4Ps3F8yI9WGg
         Y/+pPE/khkcAiX4FTa2O4Hrwf+dU4nv/I8ZPwkQURRP6x9eU6ViRg/cebF5sEoK+pzAc
         uxuY7bTEFf0j6NVPvCzHGlVYs6/GqQCZiIi/hQndzhcHcaYdGPguS/yM5rovuOVozaVd
         m3i9aylcYBBMR9pkIXruVFB6BQJFUn2+aAFTXhzqvLh+H3yEGMpQfftcy3U8+sZyZIEK
         AAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        fh=B+n18znQffg9GfJhDhCUUHRBI3g2VBpsaQMcWTHNFrI=;
        b=TrxmdNjM2nemveRCCY8yMB/IsPEkTF9RhFQNbLtcJh+uNhob7+JiWMtVy+bgJvWVAJ
         MKmBtb0F7PfWQh/X026q2noPDmVjAnwILjZrxMy02GzeTfwvSn/HlWYHzicNllC9o/+C
         OmYdl1V07uhmi1SrBNjUUESaZalhmRg6z4dvYU9m8PKywlFcdyLzZeuEJ3q2j0Sp/+r1
         7NopGZRY6Yf3AgOHWlyUcFE/2hUKgYoP4RJi9s2NuGMKTbRCSIAVHQA5ihBVsC6CB7wh
         6MtdPvH70SU/khGmAK8OLn3pzyfBnBwzNCugjBbcRaNuATkn6wwxRQiGJKiaM333tPW6
         Vlxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795711901; x=1796316701; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        b=kc/j3ApDd6izK5hiQCpL+re6RHCSLwS7K9BEq95wzRhOStnE17qbqQZx8CqOeopvy5
         6aEVabUUHbdAq/LfmyFZiGkpJLdpM5j+zo8J4IwPd3PwwH8mZPlFkiADhVZp6mswvyCR
         Fpik3irCPJLIBkJ4XldR8+++Zx28eLMSJ0bPnahxaTmLajpVu+XF28O8V+pr2ug16eQ3
         QLekv3WjBIinwYEDmFMXnnvmGDhRjh2kL/DGdqMlF11/9uebxbD9nLuCuHkAwXatawgp
         Y0javSde54ERrcZn0GeLIKxrgqBa2rhxW2ZsCtQfoo04vQNdNX8Q+RBjbzfsKsOBDWvJ
         qpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711901; x=1796316701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        b=MDC1Qad6nhx6xB17n61iYJ+FZpZ1VDQyZD3aO1asYs4ki5LDgY3Lei3Jv24/K130ps
         T4HzC27Mg4EHHF+wCwohjhFbs7w/sH3X5Wd2WGeZoh0JYMqfNH1NvXwm1grmHnx+p7q6
         HaSYVdzLMyiaAdwx28ocT1Uj6dY0jyJw0RnGcLC3TzwtWWRdgcN//+/o7LB3hhM5QmCV
         RHfIC0UzNerlTguMpT5NkxS+7x7ia9a/8aD5qMpNoTgDFEaB9hxU9bAyovHj7ST0iy/r
         M1ZOeTSqLcOnCX5vwuAWCwiA6EJ2Co8LM8T9Y2BwgOfNhRdiLBhdA8OkR7w7kfMEN39C
         1HyA==
X-Forwarded-Encrypted: i=1; AL+hErFFznDAE0lBTXxtpl10zLnNiGLYN5orVfMLOeu0mT/j6xrWL88ZOZfrURPJoDzVJMfZswvLJIxSB6VSuw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8zjiewymc9g3EFlctKj+IHzewjacA9mCvPEIURgCVwx4WXyMeZ
	dWUA+TBo62ezxUSoaKDLyAkBiVt29iJWNpQNsR0NyNlBi/fvXroGvlNlv7FM+V/HqXYrKtU6vSK
	yw/uQLVXaVjERWwDCBFsXIex4Ft+/piQePVUwHHgxvwQ+JTHLclR3S87Qwkj8JigcPkDKOl/1KU
	pkvU9d7YXKRlpHv+gE/gtZORdkjQOmPjJX6lf/3XZ4
X-Gm-Gg: AZFdTZckH4vIuHiTQkelyIrUK36eGuJm2O5tNQbwlp7jDtcKJIM28wMUyPk3jfyJWi/
	b6FzuIsR4vRYl+KVrV0kIE6+5gdJKcc3q0b02NxFV4TDt/nOZR5x+YYgvaCEfFcJcaTP7u8QNEM
	NvuA1f7ViZ0bMauNwTv8DjLM7cOyT42pRIaKvGCUTdZvjx7cd9BAtrm8lNUw==
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b41c9b2d39mr21437075a91.22.1795711901524;
        Thu, 26 Nov 2026 08:51:41 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id
 98e67ed59e1d1-3b41c9b2d39mr21437054a91.22.1795711901047; Thu, 26 Nov 2026
 08:51:41 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:51:29 +0100
X-Gm-Features: Aa3M54rgEbRi4FWdDNfEkN6ZYS8yeQYigoLC6T4hTzlJeEwKiPC6M76vYk98AsQ
Message-ID: <CAPx+jO9=UzwQVnmUfTpOoYxYhjEPv9V9AyMOCWv7iXDw41bZ_Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: sunxi: fixes and preparation for A523 UHS support
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Anfernee Cao <anferneemelokc5@gmail.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b08639e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=8rAQGYXpxwjhbX_W7ZcA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX3CZjEF4uVWrH
 1ERquMQhQfdRDyH0st9MWHQ9ek2LDNk/Y2cwnXX09ixRcKVX6rWWgdwONFqkjNJpH2xL5jF8Szm
 MRh7OyJUjTXcm03q71jEHSA7E1X4ptg4ryPbIo/BtBX0g+Akv9qDN9LNtLQ6FvDt2TSleNAS1Ai
 ut5gSEhTKRbjnWUtS/zhdIkDPBTtrgAqDLZZZO12jm0NHeafPEZkhkn9outs7QARRLPPPMNinHj
 WLySXVbr+X00iX8nvn6+LZS2mWYyn3MSZrqbGPldfioeMlFGxJkPHnhZVBuCe+vApmUwWmEIiP6
 RkXdelVy0fSzF4Hd3/80N/Oz8RKS9/Jncx2von0BpIdQw1u3V8RpdU+aIxdVc5IfL8Uy9gEJJxk
 uSTr2hzumNRG++osHnMo3I00XSx5ddJeb22fOdT3+COongZlnfSsLVd3A9N7AB7MHNPnuVmXcO6
 GhurVi7c/bO0181WSYA==
X-Proofpoint-GUID: B6WoVlnVCeL8crkvNBM5XeUrsAIPWx3y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX9wyLNJucO0HW
 VPQOBSjBgVr8rGpVL0cDsDCyfujJVEzuoZNMLi78OLdbxoJvee9pHxTJ9hD5eDUzAxTx2R6Fy2V
 0cTpa75KmXSy7Na5BcBjBL9x5S6V/MU=
X-Proofpoint-ORIG-GUID: B6WoVlnVCeL8crkvNBM5XeUrsAIPWx3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260066

On Tue, Nov 3, 2026 at 7:31=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> This series fixes a bug in the sunxi-mmc driver and paves the way for
> SD card UHS-I support on the A523, which will follow in a later series
> together with the A523 clock phases, delay-chain tuning and the PF bank
> supply switch.
>
> Patch 1 fixes the manual stop command error reporting: a successful
> manual stop command is still reported as failed, while a failed one
> stores the error in its response instead.
>
> The remaining patches improve the DMA setup and error reporting, which
> the UHS-I work builds upon: a DMA mask matching the shifted IDMA
> addresses, IDMA descriptors built from the mapped DMA segments as the
> DMA API requires, and CRC errors reported as -EILSEQ instead of
> -ETIMEDOUT, so the MMC core can request retuning.
>
> The series is based on mmc next, but depends on commit 5e32202f532d
> ("mmc: sunxi: fix clock and runtime PM leaks on probe failure") from
> mmc fixes, which adds the error_disable_mmc label used by patch 2.
>
> Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
> and OrangePi Plus2E.
>
> Best regards,
> Jernej
>
> Jernej Skrabec (4):
>   mmc: sunxi: Report manual stop errors correctly
>   mmc: sunxi: Set the IDMA DMA mask
>   mmc: sunxi: Build IDMA descriptors from mapped SG list
>   mmc: sunxi: Distinguish CRC and timeout errors
>
>  drivers/mmc/host/sunxi-mmc.c | 122 +++++++++++++++++++++++------------
>  1 file changed, 81 insertions(+), 41 deletions(-)
>
>
> base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
> prerequisite-patch-id: 8d600908a2eb84acfcd034482dd6e345242f1464
> --
> 2.43.0
>

Patch1 applied for fixes, thanks! Patch2 needs a rebase, so please
submit a new version for the remaining pieces in the series.

Kind regards
Uffe
