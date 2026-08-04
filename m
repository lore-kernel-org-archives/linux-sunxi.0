Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED352468C0B
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850995; cv=pass; b=d/xfIOwsm3FNrzo3cJZ5x6pz5FmW34KQR/Ivuc+4nqJoNMkXw62YK4Q/XDi1M50v9P0al2+S1SPDXACeeDZVAiKLvGK9WbjQZXtJAZSVuQIwyjJbKQF9oejcXICU+nTOBMWFua40NrFkD8Pg1Msnwq4I/J309gN0ngfu8+qoRYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850995; c=relaxed/simple;
	bh=I5MvKEGC00NQ4Q/IruORDwBeXJG/s5q7GewPycS9nAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFITFmVPUM6C3/BiumHfdaAl+fFKBX3KNOH7byZXOV54N2graWMTUVV95w7UhkbpLAworRNettMMWM8X5Ce6ai91z4IO+4FzBLwy0a2MRXQ0+zrJN5cjqrOfFuU+KcJqUpVtZECOcQjuBaejZ0votVe/ZnZmlSYmT/OYKeSj8ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dI4ZLN5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gs48Txrx; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dI4ZLN5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gs48Txrx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674D3AfN3693543
	for <linux-sunxi@lists.linux.dev>; Tue, 4 Aug 2026 13:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=; b=dI4ZLN5nAyQ+W8fx
	j0sKvwTO2exEedRbGmGiQorxFmf9S/+d8HSikRwTkd3wOaVj9WRZgT5tEzitjwtD
	83YQcgdGo7wx4vWkYPBGAfE0iLSBjEQBsF5CKaN9yiLse7GFLkHAhbgElT3Q3sbc
	NfRkqQK0c2Dkja+78VIfN79qqjTwECAxdjfz/4FuRiSklY3LyJZbP102yMMXMoxr
	nz0nS1gcohVdrosVtWamhgNn2bXd9gSNRaFsg78BQY0kQaqvAij8HgIpTwGG3BgS
	vIYYdOXo+OjAqtJMZQmRJE4Xxf/kX8RK9ivN/qzyQ4ZA/apONyhF5dvJbPmWp+dM
	zdcWiQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmgg5e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 13:43:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904c1d588bbso13610446d6.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 06:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850992; cv=none;
        d=google.com; s=arc-20260327;
        b=amQwYCTsmVoDM285LhXm25D5mgwG++s2J8oO8c97XtdkwJyzPcst/gSHVXuRdimwiu
         7l7HHvPrEJFQJshtz7+/6W9R48dKal7u5GqGcpzTnZZ5QOran3lIJn1256iyls4lQnGf
         G3fby7wA+wSUDx5t+r2KOnJ5E71jHbdYarosoRiLKjFaRlY3kuhi7kboc5LORypbLXuA
         mdluBdxN5TqwOjh4brmA18Ta2S0sFg6piRd7Gs611eUUfDpih1vuSNJpPOPWRDDWzcJE
         xax5NMcSU3K5XhL7FPhx/nf0kzHJY5K07dJGQtI1gWc30S2MDnmAvBLsYYZtyWBZmGmT
         pLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        fh=4MVbJlEsDzC3Sc1aX/ZDigBZipyZHqzo/ePjsVFgKeA=;
        b=bshnvt1E3nfeu8fkfqC28vi2SnFyHIouPy16QSOkZmNT9+BRnJOrK2FWNqvS98/SQd
         boDK2lcl4NauTttOGEjuMihR/25zi1pnmcd6M8CibWXWfSvAE9Ik0ufvPSBsZSGfLygc
         VVQytlWlKjIwk/NY+mAdAJ366RDBUWZHgYTX3JpymNmkpYpJpYoqTj8tvXdeaQOW2mkX
         e+lIQ3FZoBKC79fGCjQ7Jl13lw6r/1kQ3Hu+n56H/iaCn8sthHerE1pQMMZ6oUYColt1
         /qFcUpEUXguKFiAcBCD+Yg2Wx25KRyWANLxaaPbaHhznGKCseFUnYb5Jgcn2b+Lua3OF
         dzYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850992; x=1786455792; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        b=gs48TxrxRZ1tDRsLoHcnZG8LZNqs4+z1eDXT5zRkb2cjFy+5Ihnx3TB/YcPEfHeHwb
         7d7gk4xl2SLO+5XsjWUybu1REPG2xrJp/JA/KLOgR5JrLENr9exR3Aa2rDKXW/I1iHTJ
         uB95tjk8amvDZ739uJTYEIxtohPmzwiRUD3v3Sxvgee5OoMhQlvBYWz+E9XTAjTtmunG
         PQldRu8AO1fKAxi9LmMUB7SavPuE37mgs+v5T16u+t3RIWLPe399TYrMpFh4yqF4U9we
         vaMxu2SmrVF591w3d2ofl/bePDGklKqPMfdyr1H0TdliUR19zV4/kecB+BkOv7+cdzFh
         nsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850992; x=1786455792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        b=CJ+UEsiDXSaQhEyzJITQrx8N9ovb0qFooiKcuH3dU92PVEbj0irU10XJWzSSMJSfGF
         zk3Nozd4CRXavEncFR6NhPYbAA9fEBidTvwngguvyuvSaBi97atL86TQ+ePyzizFqqUL
         2XFBMElpZwIcNCHzYdiB9YFdA5QhWelq8U3J/vDb3XESznAuYcfQDYM3iNJjXRD2AnKJ
         4bUN0iaUJZIigTo1QESbxTBAk4kF5ejIqOAUqNuv+Q+5HETBk+5XXTvIIn0La6MRW2RH
         SYesBI3D5xE4V020Z4wpP23e8CwNOrnY/cJAxMVZIBKCeouIOQ/xqG9osExkpVL3Xqqj
         MpBA==
X-Forwarded-Encrypted: i=1; AHgh+RpGMrqXVfFH8qQ/TAPsVvH4oOY1xOfRu3+mIy+g0Luu5DmmIuYi+hfVacodHepFoZeWB2JDtsbqJem4WA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw11OMQaPAMtSy6MNzwE7M2UFN54d3Tlt4GiJmXTtRzIKCtz5IK
	5VSn4V8ENEMKSN6vAPvQt6Mfwqqx+dSk+PxD6SsQ4e3ZbVJyR2BrjmKUBTSqM0sBMAR4F2bMNWC
	1q8vDTQGL5/orzy3sHgrjXeeMssnVV6SOCkqJcSZPL01yfNwE5ontasQO9lJEkqeWedsuG2Spt2
	aZ5RPWLJeCkkFesr8c6+bTDaNj/tXnwbtOoYCa8h/V
X-Gm-Gg: AR+sD11LDzWjBtEI/OMB59/xIiqVaZAwjmfojrFUW0Ma4w27BrQ5eXSNsEwe0dUd2BX
	UPwFDxeTRRqqXjbbf6b0N+IMZ7I0LMyULUnbnnaNC55kW2X3u/mnY8lfmTTQLYgmBgGvD7/piTD
	osSCVSWWLulP9qer+YJjsCP0OBRKOZAN+MEOwfZxJ2Y90YhyWZ6IrFhtxC2A==
X-Received: by 2002:a05:6214:5981:b0:908:4249:337f with SMTP id 6a1803df08f44-90872b6c49fmr82414366d6.5.1785850992313;
        Tue, 04 Aug 2026 06:43:12 -0700 (PDT)
X-Received: by 2002:a05:6214:5981:b0:908:4249:337f with SMTP id
 6a1803df08f44-90872b6c49fmr82413736d6.5.1785850991910; Tue, 04 Aug 2026
 06:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
In-Reply-To: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:43:00 +0200
X-Gm-Features: AUfX_mxFXZDTZA_oVlCI23bLtNdk-8qS8d3T_pRa8l2TAPJMQc0QtFw5SglOqh0
Message-ID: <CAPx+jO_Me2qHx8UQF7059Q-W6cyOtnw7ov-CnMhYo5d+9aPKRg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: sunxi: add compatible string for
 Allwinner A733 MMC0/1/2
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfXxDXWmmxstjUe
 spJJB3v4xcKewc8pcjvOGn/sqrcL1djJM7jFMCjIBih8zCUBR8XYpm7pGoEoPIgT1CRRY8NdpKI
 5+j0aZ6+0KgcVM66hVXre+r1DB4ji3nFBLvBLilhts53PZSpxI8WJWMkUXzZghsJVXchDJRQLsF
 dcYnY4uyi2Xpi3+1hmZ5f6kgF8Fxv6e2i6mFGJ4ZhNx+DYdFEFGPvjoY+8YdEI4zrsi66KFKA/x
 YP1nZ7XulUi5hOGRIqFX2j4BykUCL53Mrc/cMuGk1M4Jrs/35IBd6giAsUbcjqxYXpKztKFKH8S
 n+zHNEV59MT1h3SZBgOmixJ+r5UBqxzXYzVZXWKKzj9lEqZiGOCMMqgo+HzVzGNA0P+K2SXTZ+G
 fwbjQoI7BCRfo4860hWxUKNKUxEZi6wjEGo1RFl6OYeA4VZE7Xi4L5nK6GYKElthJwF8f/X0dgN
 bhKL238buk9AIVgSABw==
X-Proofpoint-GUID: xWGMQAHVgcWI99bTRhg25_s62wpCVHws
X-Proofpoint-ORIG-GUID: xWGMQAHVgcWI99bTRhg25_s62wpCVHws
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX+muxw+35Xg3k
 9/H+2RI4IVg5Ld45B0DgZvqfk+ZqODYTEtocpxSg45knrEXcEakzvO7lyXIXldqD6oY9UyUxvrS
 6US2izIpzjKm1tDCGecPuX+44wMhyh4=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a71ec71 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=IpJZQVW2AAAA:8 a=f_oPU6YZfnA6fFRCD1IA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040110

On Fri, Jul 31, 2026 at 6:22=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The A733 MMC0/1/2 controllers are compatible with the D1 ones.
> Add an A733-specific compatible string, with the D1 as fallback.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Like the A523, the A733 3 first MMC controllers share the same IP block.
> The 4th is known to be incompatible with 3 first.
>
> Unlike the A523, the A733 4th controller is not dedicated to eMMC.
> This 4th controller access the memory through a different bus. This is no=
t
> supported (or tested) yet. It will require a different compatible when th=
e
> time comes.
> ---
>  Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 4 +=
++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mm=
c.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 9f3b1edacaa0..9e9610bb1eda 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -56,7 +56,9 @@ properties:
>            - const: allwinner,sun50i-h616-mmc
>            - const: allwinner,sun50i-a100-mmc
>        - items:
> -          - const: allwinner,sun55i-a523-mmc
> +          - enum:
> +              - allwinner,sun55i-a523-mmc
> +              - allwinner,sun60i-a733-mmc
>            - const: allwinner,sun20i-d1-mmc
>
>    reg:
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260731-allwinner-a733-mmc-support-c901bc312eef
>
> Best regards,
> --
> Jerome
>
