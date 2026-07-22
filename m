Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480EC33EAF9
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706510; cv=none; b=J5QOFsObMeT2eRocZDJEfLQZfirbw4A8GDuo37ZuSl6W6nSC5IYiwAN6iGhAm942vnPQIC0d9KrOhA/GhwUTEzAHJYqVokQiMQulKEC5IWrOsjiaF6fGTFJFN2o2LY0c1Js/EGzv7xiEkHNS6h93H9aZ0JeBLsDFaWtm0XhgBoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706510; c=relaxed/simple;
	bh=ofpSgJ3KOeg7d7y4u1Pc1/jrpCmRpUKIKFaYVMH0fa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsxRDM9c+OVE9O7oCk/1kPuo38OgJXwNQDsTiqGlyDXP+o0y5yIjsuWtyPfEkUV6+9J2Pf5TDvw+cCFeUAwimWfddnZiInVeNCl6AL965r3lNr5lNrJQSFDL3yLugCY9hnMBaUJfzaBCAN/wMSn2d1sJLZ/qe0xGb2Gl5Y9t8Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyiAT1D8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVftOKko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyiAT1D8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVftOKko"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53iTC4045186
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 07:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vleywJjGQkVO0x510PGIAoh5
	WqM/nmE+oyHx2voXORI=; b=kyiAT1D8s6vwKDeBtT+U+vIjL16dCKJ1WUr8HNGy
	S13OLvv/kphwJgtrfaBooHWRW67+M13EudLaKKn1yKG25JTPjBmI3U9u6OSARjcp
	Knt5FuBXlkKa4M+1RLrS8KsnrCYtfwjaAjgQ9cS3RFl27Nwiz9z6gpVhrPF5fTTx
	wW8SNi47Ojw2Dv+Zi1q5ehlUCOW5uldWy4smVL/AHxOuOxbEgh30aJuRJU+OwUB6
	BJmEaaJYvTyhbSdo40mMsT/8s8OilhJlRWamSKnZqWxwH6BkoAQc/XBkqAySx3s6
	3dDm532rp59N6bcvVnuUDQ0P1Q8TNxh4WaULc3V1p5QBAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6day8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 07:48:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8c689b5fso240273481cf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 00:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784706507; x=1785311307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vleywJjGQkVO0x510PGIAoh5WqM/nmE+oyHx2voXORI=;
        b=MVftOKkoIIsb+0EK9Pb8ywf+BZLUwQltF5npAL1RXIwg44E1fmtVXVoj6JXlMaV+G/
         WVHVtiDLrEJD2vmNE9DILi/1CQXUFPFtcb7XDmrSimpHaT2w4zix4FdWQ0vkxU5Nuo7D
         t35y665HxYLFGUjEoskDJGhT2bxxw9tuwiUPwN/mAgh7DMSPxdYn9f7CRukhf6WTD3Sw
         zFtwyfxrAGAN+bZjS6dS0rlYXeLeBalQUqa7YEfQHn1Z3NJ6OxnKNdksZLoqKR0WYN4S
         0gLuqii4fMheoMp3A2HvJjIO25Go+9thj9kIN43rCtm3RZLV+rPhQY29cYq1YbMsbmIV
         o+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706507; x=1785311307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vleywJjGQkVO0x510PGIAoh5WqM/nmE+oyHx2voXORI=;
        b=Qi+sQIY/zxjw//fTVTTBOY6rFaGT/T7SktxOSqfs3Iwb5pOpA71SQ0/ILU8/ITMHPL
         rRZf+fqUcPS/Hzw04fyvzdc1u7ww0NU0SpdrLWDHXuKbO1npBaum7N6PzxMqR25EixJS
         bubvkpkgxIdJ2q+e3QweCJpgF+bYAbh2dpdhjxqGh5KXwn2iird7UGozXBl0sUvoJTB0
         XaxLzpK2eW1FWVL5k6kZ1+g6hwI1A2/Q4g0pZMHvfKHgSEtZkJMndeZyOoF2D8D+cE2O
         DjRt7SK4usAq0JrE/WvHyLERQBvdqHDlSVyK52N77Qscth/S057jLiycpxxJMN51PHTQ
         RaXw==
X-Forwarded-Encrypted: i=1; AHgh+RrnsjUqjXLFLu7cb9EPiG9ATOYdsPFXGm8Aaxzq9mdptgP8Se0qNwMGQ4blsAAolKrvntINXjSBnMcx/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrLt1IujBgmF3BPnFNxrVXk3aYOkTyziJzxKtM7cDrOqUp3xQ7
	hF3E4VotjvvxD7NaADM2N5MSpapb+JK/ETPae1L//JvYh7RxRouYwWTjHqj4+Mv7zyMLan/ahcP
	lNaTbsOje965V5ldAyS5SYgo46gOr9eDsuJfjho/PVwgKD/l1jQu5brBz+TJ7/8FwvA==
X-Gm-Gg: AR+sD10p6LjySWofkRzez3TpkomeuHldgGycTJUFsqMIAliqMchiiZMVwdmcAr63QbN
	RIw2tLCiQFARTkthgnny12I8DUD9/pJANDvy8i4vX2Oq5n5gXLGaY+AYECQ3GN5iQShhJv0xQpP
	D4o3dxyJ1DJG4rIVWizAfw9Vwi/X5cuD0n8nK252Gvq3LBjby9mlikI0hqRQ11NWQMjhViXs9KH
	wgv7VOJXdmNYRLU8t+xni1z6FRJ2dRP/EtJTcB02bqRXanXffHpfLbxW+WEUmCmKTVBLbz3v6iK
	LDFNiyl58hsY2M+F+kBDgEFvf3HUiOQi4XnC/7qNz4qITRlbPxWoWkhy50ERlvPyfKqLBMmoES/
	vpdOhBxXtNQFS5IzFa7FEN1GH4WTK5Q0f+i0DlUcugRGix9p6JVZuxSmo5M7cUvPAq+xmFrYc9s
	IwmY1b3gm01JWwvA==
X-Received: by 2002:a05:622a:2309:b0:517:580c:bcd3 with SMTP id d75a77b69052e-5213c5f3e3cmr196654391cf.19.1784706506961;
        Wed, 22 Jul 2026 00:48:26 -0700 (PDT)
X-Received: by 2002:a05:622a:2309:b0:517:580c:bcd3 with SMTP id d75a77b69052e-5213c5f3e3cmr196653991cf.19.1784706506484;
        Wed, 22 Jul 2026 00:48:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6886b50sm3142311fa.6.2026.07.22.00.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:48:25 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:48:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 4/5] drm/debugfs: Move HDMI debugfs registration to
 state helper
Message-ID: <6mdvpbcozxkm6m4psgz63lja4i5l2cgz6six3aas4rurgiqh2v@r247m6paaaiq>
References: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
 <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3MSBTYWx0ZWRfX/QLsJoKiYRdk
 4dHnLAFV2Fc8We76mXIeDSKOK6PU5U1gVJ7KI0AjiWh/mZUQXFrMDgssu80G5Sq32cnJ/KJblkE
 VzaY+svZXMC6+jA6sFuXhcK9s3AYG0E=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a6075cb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VQDRRO-cRQiftV9tIq4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3MSBTYWx0ZWRfX55LAvsfwCAQR
 vzrPSfaEcjMzYHFLXIW5u69KVyYQgLpsQHKpC2zr5bubxax0/27grSxZknOWq0T5dG1hGnBBkao
 ORDS83IO2H6A6Se4gdbDWYVwJdj8hESQ5iaDVGDYR1LYUxfwE6wCOIaYTRSuTm4puojruRT+QQU
 MIn85qhxkJEbheK7nz9J4Of6OnNyJ4+FBhiUnQzHAUfyzyOPEGGR5KCChhkxQYDcThznbgbg2oG
 nc2Q/E8ilgKvGu9LGfDBie14F0/sQ9r3vGPMOEb4iXBaWatFdl+7AnhItAf7XFXy4feV/rVuLAq
 PvaAuuICIUwCS4dClYzF3n7/2K6mVX1K++Ujuqct8vZq5EcltZOuH6QwS589B2F/F3P3OHbMB32
 2cT7wThjylxkwZp/VueQr201TZziFPu3vcX0/Hg4Sotw/urppZs3H9iOcn31VnJsP00r1g8tkV5
 nHrgJr0lH1f2FwKGbkQ==
X-Proofpoint-GUID: 6BPqKid7DEO66hlgXApyZzq5XAM9Fv8m
X-Proofpoint-ORIG-GUID: 6BPqKid7DEO66hlgXApyZzq5XAM9Fv8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220071

On Tue, Jul 21, 2026 at 10:59:00AM +0200, Nicolas Frattaroli wrote:
> The HDMI debugfs files are only useful for connectors that already make
> use of the HDMI state helpers. In addition, relying on HDMI-specific
> functions in drm_debugfs.c can lead to circular linking problems later
> down the line.
> 
> Move hdmi_debugfs_add() and friends to a new helper in
> drm_hdmi_state_helper.c, and make all current users (vc4, sun4i, bridge)
> either use it as a debugfs_init func, or call it directly in its
> debugfs_init func.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c  |   3 +
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 154 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_debugfs.c                   | 157 ------------------------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          |   1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c                  |   1 +
>  include/drm/display/drm_hdmi_state_helper.h     |   3 +
>  6 files changed, 162 insertions(+), 157 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
