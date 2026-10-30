Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358030;
	b=oBqFm85YLT6iT/xx0SZqTrON72NBpsRZ7YEghEFJ05RKwwN8WPOJ5wmaKwOEsRlaf97E
	 ySZ7C9gNjoDi4knxEGx8miMtoIf0tXFGZDYUu105x99W/NRT1XX8HjAhHo622BbUKCs+w
	 8XmPtUuv+0qERpoGJEFQv2bpqGcgNXyCwOmS4LcaCmqt94af2x5MGDuspCV60otdv3PT9
	 g4rqx/KTtdBHkuNwluxwdRkexeipM2TFtfqJ4uR4qCfE/8U+9nxJy0aBsgtn0LI6EpIB2
	 gWyImXEZbZU/KuLAPy4hKGwWVMDVlwtgutVKzsHnrCg2Jr9ELkrUhVpjKjMyp10mhfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
	b=LOCpK1L1f0fIY2zZpWhAFXNjU0m1wJl7MJw0gudm8Y+4IAm0iHuBvcbuNMQj6lEn7hu7
	 m/tMJnZGC8DnFfFW6XDvYMHe+e+Ih0TawtmxFlm5NY2g4ksG2I/m0RDRVso3UCGI9qteZ
	 EEzYiBVCNL+DSExeGi4abNtM5IpYO2qCL33TPbQY4o8NVBnQ2gMsQLXcbcJjOVSvC6qkF
	 Tq0yIS5w+To7h2Ry+O1+u5uPyEckXZ+a/ORPFXHPQddV2IKNyRcCYMoFiF8bNghsvVQ5Z
	 evc/ME9HrpBe+YLaGTW16TXq1mFI3aXDRl8owEuyI6reNjpPPe3ho0zlzBKEryqD2SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HmIUtBvE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qmpcedeh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1F606B960
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 11:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C1F606B960
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HmIUtBvE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qmpcedeh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FhXp3312061
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 11:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=; b=HmIUtBvER/Y2SW+i
	q5qyGmDoHSPZdndt97PH0rykbu1/4QX7YiVLErRJi6rCe7850+rpnwajQdu5VUxp
	pIAPcjEXNDjPn+uQ1AtxgikcP/JNvGpX0H0YUVLl4OKVGBD86MAxL7/TcGsHBfjF
	VVCq697DkSz3vVq5I8JzA+m7+1xqRzrV2tEhmavl7NPBoWKP5n3xz0tuRm/66EsW
	CvFuCc81VYGmkzj51FYXmakxs7M5Qp/mtS32JBEoDxcFPhzbqqcvRxTakgGf/DU/
	nJWhukWUiGKGSNCZ7dqHeO6JbFzq1igI/QrfoxM1gpX35sZBWPP9eq/mcO/KKPJn
	emqnOQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qtjqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 11:00:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so514239b3a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 04:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358027; cv=none;
        d=google.com; s=arc-20260327;
        b=I4WYPj9FUQt4c7bp+TzPk4Rfsy0TY+bC1YI4l/HRGWdTleeKi1ajqt5bth3BciGvEi
         WEFmgFWaJIwE36qQTa8HpURWXSeOH4GnmaBWWBRGG+MVybZAdgualO2/Y0fTaAagN8c5
         HErPitE8nMI1VuOJKtLc1Ep+PxqlYdtoTkBUWGi31uX9x4Bj58gLsjIdj8BDcENY6zNB
         5RwJzSY/9hOyBbs6nl00vEg4/6eqqM53NNc7fZcQ7kvymyHnZJSjkXvnnWK/rEt1TlkZ
         mGXLU6t2NI2EZX+8mqNRlmOeHHfpqxsepsin39QFKASu50LLkhmFbBqcL20xh428E9gq
         wTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        fh=Ea5lixnh4tUGjOmdAMzgdn0Te+RIpVEthgtJSIRx4Mo=;
        b=qf+VdTO6tRU4lkbcDfMBuvHmVVjSdMDxqWbhgluMbOV/cvMbkqF7aHafe4jZCh9hRc
         d6Ygjgmnp87TsJw7imesAmgCyH6UizE9zQjLzInYCvBGr0f/J9qOmYt7kj+dTl2DQc6Z
         QeL3+NPdDPyHiDByHTCKwO7eWr8TAkCRdXwTAw59G5WxO9bVjJreQGbbdxg0jP0QQ5PK
         uminNJxTuDX5EFc9qVEexdZFfKLixqXj841gugQi5ffKT48ZidtIQteg0Xq4kCb2RTan
         ZatkYWxcJMuRfBztcxHvUaNtXuQckhvcjUW2+0a7DhHlGppZ9StWThlEJEn/b96arzoY
         1/WA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358027; x=1793962827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        b=Qmpcedeh1EkTxXwTiAQZ5dlgnFi0B6YhVY+7TNJ1C+3Ym5dzDtvdyhlOzxPkZ6EqhZ
         +0jvdmLJKYPeqVRI3xChndd68S7ZjiBzbB+2A8O0LEGMpwih0PfkAmUXz7CbH/SNDsPu
         bzy30cKHJJN0keaU1ONWxuKX4xQpaD0lj4YsahHyirn8P/7qIdrBR0J3BUl0WiYYX9zz
         /ARWKM4gY/0yfFLXA2NaUJPK6iSRfFFZb3V7C0Q0cTN6+Zxae0Cfrm4Mkxu6UXPBckL+
         E/jwiloJ03eAOEy7mUqK3zEc3dCkm4GDlsI4XPk+J3Jhw4GM6kUtWPtM9NXLc6IwvV2d
         JzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358027; x=1793962827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        b=AOI0al7yx53fOyD8HvOrCCwca6rxMCYWu4aymoIRrrfZeu76eUxsVV+8ZZwHZqKLNx
         ih/Nn4uPlBDChDuiOIX6UtiYDrNYK4rIyhfePwaKcnEUSWNGm+f+e3+QkWECZLYPG85t
         vgufIddNwIa4w5jbn8y6QU7ZCuPG91gMJ6SFSTuBCZowvgNlb/gIXG22yzl1TiN7NRNC
         ygeFCmklHmhylnC8mbHspqBMR7VLp4BBM/rSqp38gVNnCdtoxSEhXKRZjAtRWADcuwfu
         jSNlAchX9XX7PHDZrhe8zfNsuuzJK0Pr6Z85T103e0xu6YN9UUg0CHQzmP4mFc3R+ssV
         HgZQ==
X-Forwarded-Encrypted: i=1; AKwUvBw60DOQ0u5T4P5HqqWxhHVGZO/Cxf8I9saPkJHBEa/6XEdnGs+uMJL/pcH952d5VRcIPRIdqIIhPdmqYQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKpM8YTWOvZU3v5GP6kels6M3UyOqvpETd5ARUu8CBtb1YAnBv5
	o4NUmKl+HnQxafUxzOJksuQnihh/Hoc7GsTfRcNcuZy/MY9VDqD7bxXEXgDDt7WSqvI8DPGAlJQ
	/u4X+5gFmGbE71H1oTxpNnNiraCcFYs5yu0t1nsiZhiNkE2nnP2aq33jlGYDxlskzBMhqg7XmvE
	XwoPmhzj23RQ75EgjglxiYVotbsmv25WBkYeUJDaXw
X-Gm-Gg: AYBFou0cvkRmRWGA+p/yQ/S58OWL+J6tUXs2z+bj3ge5AgqpDgqTbAJKck24ag0qVeR
	+Cd8jGw2MpRbh/cVU3YbJ65oeC0BIcNw6++ubNKiKdd8pgBZgM3pvITkCYhHFQA34JfD+yzMC3N
	YQOYijKAcAGBFNu3dR146NJU8e1drGsP55EhwQVpFypax+ejc+4u9IE771Rw==
X-Received: by 2002:a05:6a00:4b52:b0:89e:7bfa:f880 with SMTP id d2e1a72fcca58-8a9be4912efmr1664014b3a.11.1793358026764;
        Fri, 30 Oct 2026 04:00:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b52:b0:89e:7bfa:f880 with SMTP id
 d2e1a72fcca58-8a9be4912efmr1663980b3a.11.1793358026227; Fri, 30 Oct 2026
 04:00:26 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261020220140.31752-1-anferneemelokc5@gmail.com>
In-Reply-To: <20261020220140.31752-1-anferneemelokc5@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:14 +0100
X-Gm-Features: AclHuK9cDn85gWrusMMP-W9L41_UYwMzVXdFFjFJTDQP7QMovH4WYgXI-UJFkXY
Message-ID: <CAPx+jO8ZmctKiQntoYrrYW61zwFXkT0_jR8Uqgup8iB1m0C8mQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi: fix clock and runtime PM leaks on probe failure
To: Anfernee Cao <anferneemelokc5@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: YTGiXfJHp2VQrluSdnx31ijrQMH3NlNv
X-Proofpoint-ORIG-GUID: YTGiXfJHp2VQrluSdnx31ijrQMH3NlNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX2m6wiy89IxqI
 kAjTZVMWZAz90UQ9hGOpjHMUmRATLbmEFLv0dy6Oo0INfDOFzo0/7tgkuqPCiPv2zQHvGrzacsR
 JXohZnQzr9Vc3I3YcnjRdyhsWZ0Cgfg4NCkULh7HF4YFH9jXx/mekkUQaF1yVScKBq/hOURFQqm
 pl7ZFZ/jt8wrOLgQGZcQowDy5RIKl7fjmKp0+pcb3H7sImdm1O1/4pK1E4Zr7OyO6WPiw07zyQo
 dghT6Zxp3q+339aQh5a7Y9sX4r/jGGF3JbxqTt0nptUbZjk7m1AVb7jM5w9qKbKlrt98wvb/E0P
 FcX9lhHxU5SY4IhjW4hNhB66x9S/HXLnCMv4p+8ghljpLGuwQQ84/qZjTPV1V2pnh7hBdUsWO6N
 nOwI0lpMXNBiFu8W+bIxvjOT86IOYZDI1nmzIA9aJp29B1n+2uEjZycVjYEK86QeBkqDhwxrMmt
 ifSiTmH/w4X9HP1HUQQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae478cc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=BnDUjJD_-KrmPbzgTPgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX+GAuRia/7mnC
 pHX8PZCv3mWFq7DsQH0Shu14oAfQEem7sKZG29PatL0S2o/Um7vjLqYIfrwJvjJnST2rd6h3jl0
 9nlZLOu101BzMmKgbbLOfTEpHpfvIQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043

On Tue, Oct 20, 2026 at 4:01=E2=80=AFPM Anfernee Cao <anferneemelokc5@gmail=
.com> wrote:
>
> sunxi_mmc_resource_request() enables the bus, card, output and sample
> clocks before returning. Several failure paths later in
> sunxi_mmc_probe() leave them running:
>
>  - If devm_request_threaded_irq() fails, the clocks enabled by
>    sunxi_mmc_enable() are never disabled.
>  - If dma_alloc_coherent(), mmc_of_parse() or sunxi_mmc_init_host()
>    fails, probe only frees the DMA buffer and the mmc_host.
>  - If mmc_add_host() fails, runtime PM has already been enabled, but
>    pm_runtime_disable() is never called.
>
> Besides leaking the clocks, this leaves the clock enable counts
> unbalanced, so a reprobe (for example after -EPROBE_DEFER) calls
> clk_prepare_enable() on the same clocks again.
>
> Disable the IRQ and the clocks in the probe error path, and disable
> runtime PM on the mmc_add_host() failure path. Also handle a failure of
> devm_request_threaded_irq() in sunxi_mmc_resource_request().
>
> Tested with QEMU's orangepi-pc machine: with forced sunxi_mmc_init_host()
> and mmc_add_host() failures the MMC clocks stay disabled in clk_summary,
> and a normal probe with an emulated SD card still works.
>
> This issue was found by manual code inspection.
>
> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Al=
lwinner sunxi SoCs")
> Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
> Cc: stable@vger.kernel.org # v4.18+
> Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sunxi-mmc.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index fe4c0f6d73f3..437fdadb5950 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1354,8 +1354,13 @@ static int sunxi_mmc_resource_request(struct sunxi=
_mmc_host *host,
>                 goto error_disable_mmc;
>         }
>
> -       return devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mmc=
_irq,
> -                       sunxi_mmc_handle_manual_stop, 0, "sunxi-mmc", hos=
t);
> +       ret =3D devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mm=
c_irq,
> +                                       sunxi_mmc_handle_manual_stop, 0,
> +                                       "sunxi-mmc", host);
> +       if (ret)
> +               goto error_disable_mmc;
> +
> +       return 0;
>
>  error_disable_mmc:
>         sunxi_mmc_disable(host);
> @@ -1385,9 +1390,11 @@ static int sunxi_mmc_probe(struct platform_device =
*pdev)
>
>         host->sg_cpu =3D dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
>                                           &host->sg_dma, GFP_KERNEL);
> -       if (!host->sg_cpu)
> -               return dev_err_probe(&pdev->dev, -ENOMEM,
> -                                    "Failed to allocate DMA descriptor m=
em\n");
> +       if (!host->sg_cpu) {
> +               ret =3D dev_err_probe(&pdev->dev, -ENOMEM,
> +                                   "Failed to allocate DMA descriptor me=
m\n");
> +               goto error_disable_mmc;
> +       }
>
>         if (host->cfg->ccu_has_timings_switch) {
>                 /*
> @@ -1467,7 +1474,7 @@ static int sunxi_mmc_probe(struct platform_device *=
pdev)
>
>         ret =3D mmc_add_host(mmc);
>         if (ret)
> -               goto error_free_dma;
> +               goto error_disable_rpm;
>
>         dev_info(&pdev->dev, "initialized, max. request size: %u KB%s\n",
>                  mmc->max_req_size >> 10,
> @@ -1475,8 +1482,13 @@ static int sunxi_mmc_probe(struct platform_device =
*pdev)
>
>         return 0;
>
> +error_disable_rpm:
> +       pm_runtime_disable(&pdev->dev);
>  error_free_dma:
>         dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_d=
ma);
> +error_disable_mmc:
> +       disable_irq(host->irq);
> +       sunxi_mmc_disable(host);
>         return ret;
>  }
>
> --
> 2.54.0.windows.1
>
>
