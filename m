Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696137;
	b=SqNv/DPLPJgxSmlDH1newQqhdU/N4cwgHNL2PbZrLLrdo8AAoYxPOpRZCPQLGuLWn6Ch
	 xgA6oRuq+akGmpFlOMzlf+IWyPFJaD3icafNtbaEyuaksGe1QBR460p5lLNYmxNS7VO+f
	 GA6gltr7LFzs9Mq1kDQJSGr1ck53ybOD6wAZnl9PJz/6t8DJleXlsMZrZXmDWKX7RV/yb
	 TCSz5aPEnQoloUqoRJwTevwtArPCqJfjARoHVEijAU9FM87+d1/KhLzgIyGq73zDj0lsD
	 FHcAFb41P8B3dhzvg007KPXdNrdbB2w9zvOuCwvm/o6LQYD6Q6MPLHbqbx4aLbAzeIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
	b=FXaeW5iVxCj7whRMwwt5DmVHX3gaA1WD90HaSuZVcjO24bL1oxYT0bSRPWcjr9SBvKPq
	 h31M1bZqfQ8QYSTz0c96cdVegvF/eyflyZpZ4l9JQ/0EOzA7qU0qvAMOves8JzKKD9P39
	 /Y/hIuj5Vi/bNkS4fLSDuCAfPIDbyRkrMQPPC/BQ2+P6LfYYiDi/yHkISoUqlRe0UCo9X
	 DZ7a49ijOai/Oi7zlMyxPSnc7pAeimX4sXb430pvSXw4nGElaXtcmk1vAeBhVcW3AZsMy
	 LUA9hQ0BUvTUZMRL8G2dZleTwVgpL6goLnOvyv6mbyXTLv7LgVcAnnjNOPmcEdUJLMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DjiSXVS2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D2606A338
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 08:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0D2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DjiSXVS2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A33eeXw2715393
	for <linux-sunxi@lists.linux.dev>; Tue, 3 Nov 2026 08:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=; b=OWmJBZ9gc8nkZerz
	b1HG3TUo8MIzBBrnc4dE088yesRqksaRibt7o2ejR7EMPKLM7Sd+wr+prPDIZVwl
	Pv49uXdDmq2HLJMXKLwIKsL+mhOo8lJkCv4lGoLBRzEmzEeUP581zuX9q0KUlZD2
	zo+oKNv1sqaLORWJq1VbGjXIHmE0UTS4R5/AsES2rA4KftwMi6NcmdQUyurgGFaA
	2S8lf/Gz0dBh9bpxXBZbI/0Z+PTYEbDOvuEeu0QNPDDmxmfyp6lVSyXRCQd6+QMi
	cYe5cxo52UItq7Yv/2hPxg3PiCga9BvqtFeDnqs7EUGIkRbi6O9tX/WQvKQYPeS5
	CNW8/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d993r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 08:55:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c70349f65so82332076d6.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 00:55:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696134; cv=none;
        d=google.com; s=arc-20260327;
        b=K1KQlH7UGNpdHj7D1ExW1Io6wLcIa3fzjRYtBIPdHzzibrYkxSoTm45UR7E+W9PiDU
         mCqnFMyXjqZuk3/IVeBOV4Ycv7PUJuIMhcmx1ZHrY2naxkCbP0SZwVlMe2u6XqV++rra
         JO8Rm2FMkSV/zDy2nVz7vLZ9BojIMln+vC7pQpsJ+yeUYRz3x8AWfciUiQkcn9SdFpp5
         49zTi+bpy33mIOQihziS0Q/55s/5eKafBXpINaAQg6YPj490SzXHnMm7qyalxW/DBsPk
         bKfNtSZ7EGKuN7SHvD+sOKA2FtODjvXK4EIiMmLdmX8lL8Fx4mK4otkqHS9d1PzDwqra
         ZDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        fh=SAjKEDIOLX9QFdVRBFxxFjs/4kjTqyHEESL6wK/5rGs=;
        b=IaEMKUyiQf+PbJZiPV6L3m+o7XQ14qPb0i3Hs6ftZpQQXMPusNK7zNTO7t/oEysnz2
         iEI6P0SzpLKpl9gSZNgo4SAXrWCLebRLZOJz7GWiz09Ug7io6vYeAFnqm7lDXfuPe+ee
         un3R75PSVwXjXwihri7AKatqdR2lIiq9x7Ofl55RQjckuqWKFzwj7y0dZpSB/4IxKd1u
         2lVHGghRAMfm2UI/hZYTQw1Ou+QLUMSIjrXkgoDHTomKzpLzBUeYnaTLMzr1U4GtU8MK
         p2K3WVp/u2XlQc0MemfUmc9PPIT7wtZ8+9SMvYiB9iGO29mazvPESeq4txdD0PvE0CkT
         AedA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696134; x=1794300934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=DjiSXVS2Ozb8vqxq4+SYMsEOVnQZKRaT6hrVVfXnDoI4lcXwCNgT+cvrc+bfostZJf
         j+g8Cxz1ik+d+BvwJM7iCbJndRZCgq9tJqR449QRnpV9gMWIiFTxyBEffKLNBLUeyxGV
         INr1U+DwWP6O2oeEd6m8ir4J4G71WnH0Vs/QF16BOtebUSHJjmYf9pfzIg97iST/1y+r
         pTGsU4ju/nGCygxNRnPrxvK9AdvFO8fwA4FrMggCzRATOZhQeMjk8K9J2A7C4Rm8zG0i
         Zj0+QwMjCopvOO5RYmlYurBRZl7dXLk/2PLrK5jVJ7L03pFs2ePmTiTYMop/7uFKc3ph
         QB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696134; x=1794300934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=yYW6Qo12vd2iuD8JaFqioHHpuSQopLmIrtEcGVpf68bpKJwJdgXtITriQozuIs3tRi
         zNm9usdwpmU0Ppw1AzJRBW5OkymZWLHeR7rHSynEFFfzZHyJKFdzJ/6UeeUNypiXzFwJ
         Hg/8TeUL5r5eOmU0dGsz9SyJ3rRah24hrMDv/mnwOIRaj06fbh11+WGKAkkncpEXyZaO
         TAXz9c/b10d+ypHvN5T2m+eWOVD9gpyhWNTSe4Ol+xulDg0XI2gYkvEDMUsBJXsSPZ32
         5WI2m0gQXjQt3bRRM1PGOenQFbtxKqZ/OrrUb4IwR0JotGRe7Kpj2ZoQsJ2AbKac+WBf
         rP1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwX61qi/HCM4K6AJeUm1Gc7lmhK12hkcbUSjW0zzi/pgllntiqeFELo2o3BAJXWMWhILKO23dtj4mi94w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+y3nJJWoooWHkBJ94BKbxJfntt/a+Vcwk82CIuUSfe5Rf7MY+9
	jmCCi0nxTodd3kiK7hjc4UIGu2gIRKsmKaYum2ZQxnMuDiNGt3wb/3mOs7oXSEYUMYZfIkcdEHd
	W/DpL8j4Wu5FcNl8MLf+dD3+NqTX/zBEtqGV4NQk66pRsjy6jyXZiIRjULpbVx3KZ/ZX6BxdJRF
	7sAzYYthTgrWAAZ5oVKu8PGlWL+L4PWtZ3NB7D9ru6
X-Gm-Gg: AYBFou0/OzSnRRi79WUQ4KJX/yEg9vnNwEG50MRIkFBdgDE5cXfT3eo/BfvbtrixIIg
	qhGKBccEDso6Yio4fpAM0Q2fKjJl1Ps0e2WJ4aADNgEzEspp2GQ972OymgYhbW3SCxoR7MaTHs5
	reEvV7YjzpG3zRviVL1tOXvEQpzpuSG8NGx8ejfnQCGKs8fJeVmGsmnnrv4EDwneJju74YfPBxi
	AI0nBA8tm2ptwJ9lsOBtenNEbbtrXIMHJHc3odwruHrYhsFdGblrdfsp/tfAoSqu/9d6gXAt/g=
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2157956885a.28.1793696134221;
        Tue, 03 Nov 2026 00:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id
 af79cd13be357-944216b1af2mr2157954685a.28.1793696133721; Tue, 03 Nov 2026
 00:55:33 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:55:22 +0100
X-Gm-Features: AclHuK8MJq-s56wdtunEmLoEql-aTRrOrw2wQVU5g0yE5nW0xqWZNoiPrAFZCeY
Message-ID: <CAFEp6-0CkkoT_xP+zvJ-ffVQnn2E-9AuiC0=cer-Cm1_s1dZ4A@mail.gmail.com>
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, Frank Li <Frank.Li@nxp.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Li Youhong <liyouhong@kylinos.cn>, Joe Damato <joe@dama.to>,
        Arnd Bergmann <arnd@arndb.de>, bui duc phuc <phucduc.bui@gmail.com>,
        Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
        "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        imx@lists.linux.dev, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9a187 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=OV43vvX7PjCfZyRFssgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfXwkNktsGwu45r
 Y5U3T2HxHUacBy/BT0BKQ3RfSuEFitk7BiXoNh09Qadg/by6Qss3CU1H5sybJxR2aOdMnJ8CpHW
 +dnqwtZf3xgp5eN5b3maeO1rDnWD4QA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfXwqgKBhhYUSUR
 si9EK4e5d79lFuy70m6lIEEOhMElVrdE5lKiuDdNDLyRQWShLthyQw8BxPIaH0r2L7XQ8inHf6H
 uXCklFO60b8fiFKNY2xy4beH4oseWhIDgbVpEwKhVxu3OardOv+/CPTInPFj9PjDaq44OrqFz3H
 4KjaEf+MkTHlznRRC3M6gFPJ0L6obEcIXVv0LxlO8rhvjmw2vIQHm/ztAzSCj5loPJ7/PXEFovg
 NZJHbSslVX3aak6/15IOQiFklP52r1mwd73eFS5sOBZvVmd6FAAuS+wM3seO0i94EfjWTGaTCDw
 ZJcBcwXcvWoBW6zbX4zV4myjQCZn4sS42ZGwOotsX8XyIFLE++yNnC9u80j66gd3c0tBSy5DPaL
 Zsy3435vVvPqxlfyAUc2S/EYnDskCxJe2EzfMm2d+j/s3ot+QXOUqy8MvdFtjQBdzmU1iAeAHo2
 tEO2FzSIsAZU485N96A==
X-Proofpoint-GUID: lzoI8DejPVXK8imtG-PTBux2LwwwVcxT
X-Proofpoint-ORIG-GUID: lzoI8DejPVXK8imtG-PTBux2LwwwVcxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030035

On Mon, Nov 2, 2026 at 8:19=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 09b2abdfc9e84..d7ee42b2c1976 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -303,8 +303,7 @@ static int emac_dma_inblk_32bit(struct emac_board_inf=
o *db,
>                 goto prepare_err;
>         }
>
> -       desc->callback_param =3D req;
> -       desc->callback =3D emac_dma_done_callback;
> +       dmaengine_desc_set_callback(desc, emac_dma_done_callback, NULL, r=
eq);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/net/ethernet/micrel/ks8842.c b/drivers/net/ethernet/=
micrel/ks8842.c
> index f0d6bfc6025ca..c68abd4643e72 100644
> --- a/drivers/net/ethernet/micrel/ks8842.c
> +++ b/drivers/net/ethernet/micrel/ks8842.c
> @@ -453,8 +453,7 @@ static int ks8842_tx_frame_dma(struct sk_buff *skb, s=
truct net_device *netdev)
>         if (!ctl->adesc)
>                 return NETDEV_TX_BUSY;
>
> -       ctl->adesc->callback_param =3D netdev;
> -       ctl->adesc->callback =3D ks8842_dma_tx_cb;
> +       dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_tx_cb, NULL, n=
etdev);
>         dmaengine_submit(ctl->adesc);
>
>         netdev->stats.tx_bytes +=3D skb->len;
> @@ -567,8 +566,7 @@ static int __ks8842_start_new_rx_dma(struct net_devic=
e *netdev)
>                         goto out;
>                 }
>
> -               ctl->adesc->callback_param =3D netdev;
> -               ctl->adesc->callback =3D ks8842_dma_rx_cb;
> +               dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_rx_cb,=
 NULL, netdev);
>                 dmaengine_submit(ctl->adesc);
>         } else {
>                 err =3D -ENOMEM;
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 8a50cad1c104f..7e83c4b5f1931 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1014,8 +1014,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, s=
truct net_device *ndev)
>
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->sg_len =3D sg_len;
> -       dma_tx_desc->callback_param =3D lp;
> -       dma_tx_desc->callback_result =3D axienet_dma_tx_cb;
> +       dmaengine_desc_set_callback(dma_tx_desc, NULL, axienet_dma_tx_cb,=
 lp);
>         /* Claim the ring slot only after the steps above that can fail. =
 The
>          * completion callback can't run before dmaengine_submit().
>          */
> @@ -1565,8 +1564,7 @@ static void axienet_rx_submit_desc(struct net_devic=
e *ndev)
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->dma_address =3D sg_dma_address(skbuf_dma->sgl);
>         skbuf_dma->desc =3D dma_rx_desc;
> -       dma_rx_desc->callback_param =3D lp;
> -       dma_rx_desc->callback_result =3D axienet_dma_rx_cb;
> +       dmaengine_desc_set_callback(dma_rx_desc, NULL, axienet_dma_rx_cb,=
 lp);
>         lp->rx_ring_head++;
>         dmaengine_submit(dma_rx_desc);
>
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_tx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_rx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> --
> 2.43.0
>
