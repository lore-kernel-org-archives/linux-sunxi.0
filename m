Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922519995E
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238942; cv=none; b=In4AAYaSlG4FIVu7jSWFhfLFhOnOp8mzOo65NXnCZfTpmXjfplxH/hbkt0WTEtReuRyqzCWe6ZrA3qxLXSGfS9fwPE5PW2twPzMJnpyOm5RBuVe3xVsTZ1oQF23z1vANMTKaWTz99ja82zpHcmreLRmsM9legrMg4eAtrvrKvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238942; c=relaxed/simple;
	bh=bQ1asKoE4Nl3HQtKrM+Wd7rC2yqIZ6PztZoLEGmDYBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzEHo0MMgPx9OOGBi3ChX+pTkfCZzaJDD67xd60lblC5iRkWyJpz9ipe99OUbja3W396FAwSts6Dsgoqxg5frgMv0+rA3KoVLQy3CJcbOVybdJhaATYBiqMQC83Vx3BOKZ5++IJZgj2SohaaqY/fmn+Uj3bSrztdkYmLRX8OfsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJM5pA+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mgiiu4jg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJM5pA+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mgiiu4jg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLrjSn1001396
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mLU7+MItDUu5Kth0lmGo6bE
	IH05p2nnnuPD4hW7xVo=; b=PJM5pA+8Rt+CP033st/WkGLskaoVd4kJ2BweO5Sh
	6RXUql+pqIyx8wo7KPHvogwy6ApWsQP1j0BPMjHgC1FBuyJnWnDgW2r2qI7TsUqi
	lqzMi6Ml1Ye0E10VE5n9jF9747H3vVQdENdPz5e1lV/gR0rao9xzqK82jWN3s8zY
	C+68PvP7iz/GbY1epbq9ej2RUlYmh+SJRFqMpVgU56cyWBwYsxkWmqfOrwhwjY3i
	yPCb5/wgJW3JLgpswMvct5EcWgxjtBFZLI9fRkVcdwy034NKz7D/cgD+XC6BYRHz
	bujwB1nCbXbN7gV/TlGRRsS6Fwg4gNHT1Tg+H3k8z7G3yA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbp7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:09:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd767c51efso410383385a.2
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238939; x=1774843739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=;
        b=Mgiiu4jgesZE4MF8w3b1VMGI0ew+Se0iWpSvtykMytNAD2TqSsPm6FFaxmTIaRHLob
         J0RoPZ0MgiTa0Utwt19DzQAy9p6Rwsr+dv+WrXx96qvOoFea1sGOKlhpeKLd+0Oh/Ac7
         7ah4wM9z0V84TrEpcp7danClzYGaOJwqUfNI0zlQHjW7L8fxGA7AUfl4aWbxrw8z18iB
         RJGijORn07tz9tKK679BzCHdw9J1268gdz/rXr/pSoEskhtXphpgVDKRkvUF9hur8VWJ
         Epws+4b13VB+bOdbkL7DHvB2j0oDDle4wqkS+FOc7YRrCVVftbVBeQe8YGADuKPrdrrE
         9ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238939; x=1774843739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=;
        b=aNz/nVcOIQ83caY/gWpBC4zCyms+nKxTNoBoyK2uJk5jlqMY0dC6q94Qgxhhlmfavz
         9cSAMZ1qmVfgmOzjapXTFxH3g1Rexk0nERDH1MEcpX+EMyp5xS1vqMWu2kzrO4QTaV+L
         4e1RE8lPyOsX/IZPy3r4iIkWlw3noe9W52uwQNZECrx093xTzUJbyTDPLWugjmFRGbUF
         2yW0Z6TfDFpmu/erTGF5fwjKMddEjvdYx4e1kWdtX0OX9GASiWD4JV34Vt6hKE8GO+3m
         EuJgSnAU9WpCI089LDlT3gM/JBPD0E2Is/TXE3RrcERV21I91pA7Fgl6wNdW8hxZgTXn
         1Aew==
X-Forwarded-Encrypted: i=1; AJvYcCX+Vfx4nA3OB/vJurvJZVXSaXwPhv9SUqvkzwk6o4V/tveG4XToTj3Yt4+5yIvrk25tarJT5ynZHeszYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIbQIsXtCgFbhynZgBuYlq5ORKkYhnry+XHoiNa27OdPE9zFE3
	T+HJLY22gGT8dnr/I8LJhcajumGlD0z3qQCBZeki0L6XaK8lqWTEGbu1D3auyYUKmQsu3JpLJKm
	OuEnobuBnIhQ3tVgdfVmwDlrYOfGTUCy1dC2CeV0MiD3zxdQ87P8ItOSD6JF+zB/B5w==
X-Gm-Gg: ATEYQzwFCrCLUxj2ObQvl7qqR5Js1S1b4wqSOVYH7PCH4L7wRFUBPKz4FjkzLxmy4pI
	wYzCva+Ody54v1plSAtb1er6Agh53pCDVWqWmLXvYUt+mrOScj709z8e87+aR5v609F5vKs4JQP
	lk/p8xEwldhrpv13YC4H8aZopwqijQ+2NambNFDuIwPl9IpP7yxx/AsJL6Un5CZNkwTzhe3CYbm
	JcGowxws52eHoYltyE7P0oTRQKf1xGsiI6ST286hzUlSEsgwKUHxdWNIMlfBQlIqDpWjS/JnMN9
	3gykddcyyI8PyqvnP7+ImqusVr/czrUHz5W3vIUHRsfQljw5/EuU29eXhLXI962bdP+ctu6w+O4
	10zckMWGxoqemSIUbY3jGg2rHiBIpigfUEB0OuuWX+4f17SiTLDS2w924sYquFIbGUgLRnqYyAR
	KdApCBzaAnU3Zvqo5ChoArb2lgTitvAyt9QAc=
X-Received: by 2002:a05:622a:2288:b0:50b:55fb:1c87 with SMTP id d75a77b69052e-50b55fb20admr59358671cf.5.1774238939257;
        Sun, 22 Mar 2026 21:08:59 -0700 (PDT)
X-Received: by 2002:a05:622a:2288:b0:50b:55fb:1c87 with SMTP id d75a77b69052e-50b55fb20admr59358441cf.5.1774238938791;
        Sun, 22 Mar 2026 21:08:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a288268a0bsm1994449e87.14.2026.03.22.21.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:57 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
Message-ID: <lfq2myl6gnzog33md2madm3qky2x4sasbrqkthhvdvgtfigrjf@dc5ccj7iq444>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: l8N3ONEjrvIb9f53bZdxOJyj64TvrIFq
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0bcdc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z8SGupnk27XsGNPOeu8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX5215mv6EjFZQ
 R7K0dvyEU2PIxWY17FOB+tqdDMYE5im8Ki3XrBkHHlJG10YEKg6IkgQz63gI0nlIkVdZCO/dEsE
 dVDuWk99oH8KQly44XYENIn0b+UT2LF872+MaitJCcSCBwjQ5nPYGVPpzDqx/KtcfyPx2CO6b6r
 AExM5NN6jfpPz9lLv8qgjVNbsMi+RjIXxT7x5INIFqCHoPwez++M/5L6LvHOe9dE1u9RS4f2+3U
 FWQeEljYhBWWX1lb2m6Ekk3Wr/C/IHzKmk5bswbLrQoGsh2ER4s1nIQGL6oxU70FfjtfeepKT0U
 0T1kRxHBIb4cL/0avDBbFiDuqvUTB4fBPtSvQ80pK+3h0HRtyB+/GkzY5H7U61P3HwBtXP9Xuq3
 fu3KN9V7BdMwVAZgUJ/balvSHilt29qe4CZn0wqBl6HPn6X3ZEL5796FF+6ke9n5waoiuvR/yyM
 7ijMIZl0+M5GT1ftF5g==
X-Proofpoint-GUID: l8N3ONEjrvIb9f53bZdxOJyj64TvrIFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:05:05AM +0100, Maxime Ripard wrote:
> Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
> the new enum, we can get rid of those defines.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
