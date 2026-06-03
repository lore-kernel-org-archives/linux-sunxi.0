Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A0349CC0
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jun 2026 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481728; cv=pass; b=AsOiwrxBagY7NN+Hv/RzrGaASUmDbHEDz6sRiQ1PDV/acaoX24QVVnAAThW/zkY/lcm8G8k2VGBWiRpdg5+goX0+HMFPzCP09jZ5XPqeGcdQcQDX55Fdc+GTehhG3nKcX16nVXUv612LpIlQEXtKhQn0qCDB874cYJPzyEijpoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481728; c=relaxed/simple;
	bh=No7+C8S9AW4FLnpcoGbXBfC3nW4Kvq/yHClQY6ndrgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McL5E4wMppQNiT2XNi8VcpPZ2pNF6ee0X8TNuKX1PgQCbaezO+Psl4Pga4YYxStOU9o6Ml9BiIs7QWxTZfnUdLI6cz3/KuOLQ/7xSZkNcEYrXK/GltABrJLCkp1nd9bqLXPDmT3MkD/ib8om9bsrtTZ9KsbFNw6xHdz5LgRqnzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmrpaKZi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffH8NVIF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmrpaKZi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffH8NVIF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RSwF1740936
	for <linux-sunxi@lists.linux.dev>; Wed, 3 Jun 2026 10:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=; b=XmrpaKZigwia/7BY
	DCjkUP+LzEvNycdfLoO5/BLfMGABaH18v7DbZ0POu67u3H5IgMW75BXxhwpEeQj/
	PDNoDIf3n+cRt6WlYOt8mb09cJyhMObuWCMx497xl614LZRPIFwMzLrA2IXjW/LT
	rgkZFG12prZa/OJC5QUT3qDit1Z8AZPCJLj4+fl+g27leNvpdFN+yr7MEp5CJVtP
	kfFkuyheLAoVOLJXTFA2MiOGkmqZZUyYdefv3f3qzuUYladbXjT8ikhI02GJJsGz
	QB7o1d9GVv9HABFLI8KWBJEJ6vQ8rNYmLbGTe0CZiWHouz9Z1QdlNkNA4W9foDUM
	KPv7wQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7s9h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 03 Jun 2026 10:15:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cced2dabc1so12061756d6.0
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jun 2026 03:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481725; cv=none;
        d=google.com; s=arc-20240605;
        b=jrJnv5faaQP10wU3YEwOCtOAdJUI02KDkO+ivhzooSCl9oUCRd0IZYkRciX1aN3L7v
         gFOptjgYdSiMgM0m9kpEXoTZYYq9CpQv2MubUfSj2xqJcezVVvIy8KV3wLMvwQSOl+fO
         V0UEbtCsJBAxyBHV1WNtCQtDVgt6VmmWx81/FtZ4oUvPNjnDLHGZuWk0ixj5Z9YkQVt3
         1Ce0ERW3EX+VWPq7u3zWXkRcQ5H2t006mHnPIB+GQQsn/jjn1h1hiLBkOly3XJOMlVC0
         /4hyF/Bop6AbYBxCFVjCBh1n5s1Z5377W4K69cWYYk9K8ZokS9XqzZwAfFDbPkhIol9Y
         A11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=;
        fh=azLe3aZtutYDdWqv0GgxrPfL2I4Px+EizT0JFiowNEU=;
        b=hqA/g8Cpeqbqeaqtx+G7ioanEhffIdLDSaxjRT2UMIOvERj4cxCz87FPfvD6/ojtER
         UmY5zTE3FV4VBbHtyeVW5m9onG7WjXy5o3YgBS03InaSC/wybOCT9BL0+XX/6BZyDHWm
         ehhG3gwKF/UxRrf3nkT7l1wQ2LFFc0lxhr6fqA6ys4JHWricA80UMny8sv0xcH1TsJ+u
         rA8JkjfP8sgN9dnLudeGIePd/Ce8md4c+vfPbUlhKArEDLnRXhrSOQ7ZMbZWofHxTO+D
         ohHu7WaNFUtbZEoGESdvBXElqV/GMwB4GgN8YJh57+0Lpzll4KC8Rajnmq5qviOApOR3
         N4cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481725; x=1781086525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=;
        b=ffH8NVIFPPmx78iqhghnnoPTSUB8ckVrtcMyhlEDA/+poq2+rsxGVGEk06q40inAPS
         1J9ynmYcsL9fHBQCA8/tStdwbmyI3Va9fG1pde88httxMnr1zM0f171NVbVoqtihJWeG
         XW2lieRncsV754xNHamZJS6MvYxTE780+IfAVG17QOF0gS8X2A4VKxzFHUWutv4oT02N
         5qP+yBXXM4Bqon43xd8EoOtTU8oNmiVbZ8b57ryvSmpaW96Xz9blF0qcqqEsYTVMNnqI
         No2GaQiWkcyQcjU8WUHMsWFfcEUb9USWewjRTKX9v6VjfFTWhkXRrlIjUbEvAdhKmO0e
         folg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481725; x=1781086525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=;
        b=riLC1FYnJMlT6Gt9bJpFFwGMtaaT1LtCCcUq8otz4IV76M8FsKeMgnkgoVjQ5q+hfP
         O4Og/yHPTRedXAx6nqBtlxEd8Brm5tkrXPFKDDtaW4jeBYjLk8eyr8TnX81pSUoar+a1
         K548bnSM9cqvfDWx/t97XMao1DwK9iexDs8Oxo0FV5wnEc7Lyo9YpRQ55PP4T2ZRfGGh
         evfKYwiKe26maC9PJcD7aFvefOvOOT0VQvMd0j+aht4+5l2VysZDdkJ8FtthVdBxHCif
         cvQwqblEo4HfhoD0ogTjmiUI6lP+2B1w70PcArvWUzca0GBk4K7lcU860/3YyW61qonL
         xtAg==
X-Forwarded-Encrypted: i=1; AFNElJ8JT9I6zB4O/cei/2b6zcoX0E4d4QwdH5kvqeHfeTRvV6M5TwxVnsqQJzsNeN9mi8tEoZJE2z+RVRzrZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywncu7urzNTYDsGT8SV5bcgeKM+L9vniMsCxLOEgsZQi8Wvvch+
	B/Kbh5kthAY3MhVzTCNlvNQMLmBI0E9gUdpPVafglKTWFg78vPGc3n/vvZ6kl1NOPn/pjUbtToi
	FEnIYkJh3oO3REGprGP6vaLuv+BFLDYPEbcsrujkPtl0/Yc7NTLxQ06ZENrMp9leP3ZSoQMSO+y
	4pfKTkLa0x2rij/znqC9aF9r/GXDslJmzELU6fhRt2
X-Gm-Gg: Acq92OEWK1ddBE5fV1hXAM5c+4LyLH3Z1YJH2v6d3ZvP2qco2K+Cnu74XlQdObvqmdg
	MnPLZ4k4p7N4V7sgJoxk5+cZjBdBNPAEUzi0jc0FlZ6DDP50IgZ3nl/fimrfg8BrNFF4K2Zc4HY
	+R1kfZXtjW06TydNcCY2fp2T8mc42WzU8QG1SWIUd6Y+fHlo/H1LNXKbBv7q5b3iVngDofSxR/v
	uiNbkMLddA/oRoR
X-Received: by 2002:a05:6214:3204:b0:8ca:25e6:e892 with SMTP id 6a1803df08f44-8cecdc15d66mr42033476d6.2.1780481724707;
        Wed, 03 Jun 2026 03:15:24 -0700 (PDT)
X-Received: by 2002:a05:6214:3204:b0:8ca:25e6:e892 with SMTP id
 6a1803df08f44-8cecdc15d66mr42033086d6.2.1780481724247; Wed, 03 Jun 2026
 03:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510-pck600-a733-gpu-v1-1-d6393646d714@gmail.com>
In-Reply-To: <20260510-pck600-a733-gpu-v1-1-d6393646d714@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:12 +0200
X-Gm-Features: AVHnY4K08klW06vk2eW3sXiNnVn0avH1wL4mD1fro5ZcJ4CYf6HKE76f_6zfqQk
Message-ID: <CAPx+jO9GrBPZvBr6pU7GpGdp=+xKQb4YSQut-M1LONEMnwkDxA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: sunxi: support power domain flags for pck600
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
        Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX8j1DPoHLnQX7
 GJdyLSGEOYvh1ApgC5uOZVqFBuJd3lQaROFxLon4XJyPs/HtVhPiS70nLf1qclACBS7ZFfKxY/6
 IqOxVTIenGvL+68zkjHeOzKLlYycQ+9P4d17+iS6AHI/wdn4hUgB32x5Sj1FWZzrNAo0PHm3BzM
 UjUDCcglp3k+GKXZN3aKLWtJtEbFwv+LFxlGRzgGCFzKJQptbtTxxvUao6/5WoQ5uJm1zg2oJPl
 bRgFAK3xH4bDeX1t77MgxdLb+701n2fNYcsJzwD9iaj9AlHu5nVFrN2Z9BKgqXg853VXzGxEUno
 mBN3af2Nqu3I7T3nNpRGKE3cjbmebmy7uAluiTTVR/o6DTroxdA9gMU0Vqlx5jccO1m4Nh+5vNI
 3v7zQpzwxvZf2KubmlOTR+KTDfCK7eUjV8almS28lesI6NNyv2XA8Qx/Q8Q2a8zkxG+2arymNXG
 eVgXZjQSH0y9wDes00Q==
X-Proofpoint-ORIG-GUID: Yw5CcOUjnnax7GQMI9QcYhSpY4Ka1g2u
X-Proofpoint-GUID: Yw5CcOUjnnax7GQMI9QcYhSpY4Ka1g2u
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a1ffebd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=gYkhY3VTAAAA:20 a=pGLkceISAAAA:8
 a=fAHllOzSo_MIxufCVBsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

On Sun, May 10, 2026 at 7:25=E2=80=AFAM Yuanshen Cao <alex.caoys@gmail.com>=
 wrote:
>
> Hi everyone,
>
> This patch refactors the sunxi pck600 power domain implementation to
> support individual power domain flags.
>
> While bringing up the PowerVR GPU on the A733 (Radxa Cubie A7Z), we
> found that one of the GPU power domains must be configured as "always
> on." While the Radxa BSP device tree leaves the GPU power domain nodes
> commented out, the GPU driver code contains traces indicating an "always
> on" requirement [1].
>
> Currently, sunxi_pck600_desc only supports specifying pd_names. This
> patch introduces sunxi_pck600_pd_desc, which stores both the name and
> its associated flags. This also (more or less) aligns the implementation
> with the existing sun50i PPU handling of always-on domains.
>
> With this change, individual power domains can now be configured more
> granularly. In particular, the GPU_CORE domain in sun60i_a733_pck600_pds
> can now be explicitly marked with GENPD_FLAG_ALWAYS_ON.
>
> The patch was tested on the Radxa Cubie A7Z, where the GPU now functions
> as expected.
>
> Thanks to Icenowy for her support and expertise on sunxi and PowerVR,
> and thanks to Mikhail for identifying this exact cause of the GPU
> bring-up issue.
>
> [1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.6/modules=
/gpu/img-bxm/linux/rogue_km/services/system/rogue/rgx_sunxi/sunxi_platform.=
c#L62
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/sunxi/sun55i-pck600.c | 31 ++++++++++++++++++++--------=
---
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/su=
nxi/sun55i-pck600.c
> index 1d47bbd35ced..8a37d11b65a2 100644
> --- a/drivers/pmdomain/sunxi/sun55i-pck600.c
> +++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
> @@ -41,8 +41,13 @@
>
>  #define PPU_REG_SIZE   0x1000
>
> +struct sunxi_pck600_pd_desc {
> +       const char *name;
> +       unsigned int flags;
> +};
> +
>  struct sunxi_pck600_desc {
> -       const char * const *pd_names;
> +       const struct sunxi_pck600_pd_desc *pd_descs;
>         unsigned int num_domains;
>         u32 logic_power_switch0_delay_offset;
>         u32 logic_power_switch1_delay_offset;
> @@ -164,10 +169,12 @@ static int sunxi_pck600_probe(struct platform_devic=
e *pdev)
>
>         for (i =3D 0; i < desc->num_domains; i++) {
>                 struct sunxi_pck600_pd *pd =3D &pck->pds[i];
> +               const struct sunxi_pck600_pd_desc *pd_desc =3D &desc->pd_=
descs[i];
>
> -               pd->genpd.name =3D desc->pd_names[i];
> +               pd->genpd.name =3D pd_desc->name;
>                 pd->genpd.power_off =3D sunxi_pck600_power_off;
>                 pd->genpd.power_on =3D sunxi_pck600_power_on;
> +               pd->genpd.flags =3D pd_desc->flags;
>                 pd->base =3D base + PPU_REG_SIZE * i;
>
>                 sunxi_pck600_pd_setup(pd, desc);
> @@ -195,13 +202,14 @@ static int sunxi_pck600_probe(struct platform_devic=
e *pdev)
>         return ret;
>  }
>
> -static const char * const sun55i_a523_pck600_pd_names[] =3D {
> -       "VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
> +static const struct sunxi_pck600_pd_desc sun55i_a523_pck600_pds[] =3D {
> +       { "VE", }, { "GPU", }, { "VI", }, { "VO0", }, { "VO1", },
> +       { "DE", }, { "NAND", }, { "PCIE", },
>  };
>
>  static const struct sunxi_pck600_desc sun55i_a523_pck600_desc =3D {
> -       .pd_names =3D sun55i_a523_pck600_pd_names,
> -       .num_domains =3D ARRAY_SIZE(sun55i_a523_pck600_pd_names),
> +       .pd_descs =3D sun55i_a523_pck600_pds,
> +       .num_domains =3D ARRAY_SIZE(sun55i_a523_pck600_pds),
>         .logic_power_switch0_delay_offset =3D 0xc00,
>         .logic_power_switch1_delay_offset =3D 0xc04,
>         .off2on_delay_offset =3D 0xc10,
> @@ -213,14 +221,15 @@ static const struct sunxi_pck600_desc sun55i_a523_p=
ck600_desc =3D {
>         .has_rst_clk =3D true,
>  };
>
> -static const char * const sun60i_a733_pck600_pd_names[] =3D {
> -       "VI", "DE_SYS", "VE_DEC", "VE_ENC", "NPU",
> -       "GPU_TOP", "GPU_CORE", "PCIE", "USB2", "VO", "VO1"
> +static const struct sunxi_pck600_pd_desc sun60i_a733_pck600_pds[] =3D {
> +       { "VI", }, { "DE_SYS", }, { "VE_DEC", }, { "VE_ENC", }, { "NPU", =
},
> +       { "GPU_TOP", }, { "GPU_CORE", GENPD_FLAG_ALWAYS_ON },
> +       { "PCIE", }, { "USB2", }, { "VO", }, { "VO1", },
>  };
>
>  static const struct sunxi_pck600_desc sun60i_a733_pck600_desc =3D {
> -       .pd_names =3D sun60i_a733_pck600_pd_names,
> -       .num_domains =3D ARRAY_SIZE(sun60i_a733_pck600_pd_names),
> +       .pd_descs =3D sun60i_a733_pck600_pds,
> +       .num_domains =3D ARRAY_SIZE(sun60i_a733_pck600_pds),
>         .logic_power_switch0_delay_offset =3D 0xc00,
>         .logic_power_switch1_delay_offset =3D 0xc04,
>         .off2on_delay_offset =3D 0xc10,
>
> ---
> base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
> change-id: 20260510-pck600-a733-gpu-dcbfc0c7ce99
>
> Best regards,
> --
> Yuanshen Cao <alex.caoys@gmail.com>
