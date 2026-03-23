Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B9B78F2B
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238867; cv=none; b=Pt2mS4yGPjq9NsujpnQ7UGpLoHlaO+rGEnnoI446tqE62ADDdPphKnoZJ969HBxJxNVbzUelTsPhPEHcgWTIqznDtx6MgwkE/T0ybb6H1A/DWNv3EGAzwSbghS1zT2coj2UAswRKqQwyxqjQ5MVSIlIAPWLElrnXi5sVSTXyW6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238867; c=relaxed/simple;
	bh=wHBzXaBxGAdzGz27Bin7Oz7TA+VS/e3+t1f7dTH0Hxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGTAXh1CcBp1vo4Hhicek+W0D+clf2aIqYuE+kGPowoiqxunZrcjT+a2WisNLprtKOHauwtCF8v+aD0hfrjcPzgtJHKzToQMlSRDGDJEnqzjWA1w0iYoyWkPluahTTuEHh4XNsQjHqWDOsfDO4mJTkULPvOZs6F7GuwqFPnVWs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwKTM3sZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAym+ekU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwKTM3sZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAym+ekU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MAvOp74069665
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BxISgP/fl36GplI+JqnlrwsE
	hA6Bu39iBYyi3QEp08k=; b=YwKTM3sZOJdgT3TAFMPt9LNyf5/D4M6suM8CSNMz
	BYaBOWI6dfGkap/oTUuKXyHdTV76LQO+9/j0vAZQ0jswoAyN+MEvvvLrMyl0BQ34
	rnzQUQ8L9DpbxmTPRdcUV/2nWH5zyvxSxuM9D/36mwIzddifH1wH3axnG8ak2HiZ
	1hagwh+eOOrVVoWluYEbH9ssQiyUwKI2Y4YQ7gjbNiieW1uFcgjBv2EKwnC8zZIC
	NWDuxi4fdO4w/70RMll+U0fRHhJrl3n+AwdViEiCZjbssrUd2kLXTXBxf//VrTXY
	1Nlif3WY1gBVNQgZnuiCrQznq6IuNnSYjdYCxjR8ySPuCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5un03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso75717181cf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238864; x=1774843664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BxISgP/fl36GplI+JqnlrwsEhA6Bu39iBYyi3QEp08k=;
        b=QAym+ekUwhWBy4aOH8lsLyJo7WbWikOjCiORoi2omrlFpGnETJUas9pbzX7hChhWzd
         ugW8b1nWay8eeVx1ptqv7cB/e7s+42NY2wDruS4LhIdEpRSxxHcfTQS8PsNbxWezQeLz
         cRpnNcnYwXer+xU8Ryse8KE92ILixPUl4oHxqvWGbaYxaFBhIjeHSzmzLzjjHehMGitN
         947p9FwGOH6eYVk2z/SWSto2lErkGB/gAL4k/zCfW6WfOLydXoBzdRuI/CDTsoid9Wk1
         3l69+29Xcfo+PTYJZ2Mm+YWTHX4nILDXvhtxBEd60m0lPos9Y23FsRQW11YvYWBqWJFp
         FPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238864; x=1774843664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxISgP/fl36GplI+JqnlrwsEhA6Bu39iBYyi3QEp08k=;
        b=k6QC8C4HugeqzlXPuh6HACTlad+6fdEkT/NZ1et7UMohZYpDn5/byO43FdVEanVoTy
         mFU6ZsTbMhy39borch5AuGZMYMa/7q71KfN9zxswdCKBxj5Fx+7EAfNP8fD2A7R87x6Q
         k1PV4j58cPNBViTk8bOAEJIbfnxtYJX5ZhDkCNvfH3lCHOZjHteVNNsmUkTToFMV/n/9
         oQrAViz4k654OBy2ssWyYwLT2S+lOymPXteqp77O3JwO7R3/X3Xha6A1gn7SZJm0hLsl
         V84eZVhNLWFaEvqHHytB2mRlJA2LleLk1Gz8srMJJRGKNidOz8E+6uhADmNgIW2qWvCa
         +QHw==
X-Forwarded-Encrypted: i=1; AJvYcCUcmEIpjiFIxSQNYq0uPPj4B53TTYaWQBCZl95QozPL4Lz6SEg4uolPnzS7fqvZ3zqGNKz2IS3M2+18/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCBzenVzT/TU4fD23t3jaujY0YorkeXQLcaJK0Tq723t2B1GR1
	qDC6CxiJBKLLR6LFDYk7S0GE4/HYffLY606ouWn6UrTaLiYGiNDpM95YXIKnHi0mo8Nxu2AwbP6
	Z2UQZ9uPZtfVUxEPDy6Mc/EJZCQ1ZcjVYZNL0TTMStsuPdAIRKwOjVCt0ojqf5ksXtA==
X-Gm-Gg: ATEYQzyj2riCLRV552l+OiUJl68J8mUfG9Ma9QBwgBjV9E+I+0+/AvGR+EwODQltn85
	GfrmIqou3gQWpgIBDMUSo6sx9xJEC6EMQAqnhnVleI8VF31hNbOZh76i51baR48mFhu8ND9n21V
	U7uLGUFQOav2PzmiEwhkYBFV9Ozbn1Y8+mIFJJ5EYFMtCMytA1J0tM8pXG4r/brGpYJy7F02vPa
	G0b7TUTNxDNeBOP8rlm63ye+IgQhMHjmTPNYDCLjvCjTQ/MBnKY+5YOBJTuP/9VbVEffU8MLgF4
	v5mJT67ys0YemaS5a0xjJWdCFD9KROcZIcCmfLLNmd27gN34+4jJWxJDjIHbmrC/Q/KIzwCeoJ7
	CYi9qfu2nSx1rHohaixZINZ1zWkAZb6Wp+mvGR/bkcS71tgP83zV0V0zYzqAtI8h6xIuYzcheLT
	QdJDuBTnhD1EW8pHB2APYhMLZ2PoYEpvNX39I=
X-Received: by 2002:ac8:7f0c:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50b48e34b2amr101886911cf.18.1774238864358;
        Sun, 22 Mar 2026 21:07:44 -0700 (PDT)
X-Received: by 2002:ac8:7f0c:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50b48e34b2amr101886631cf.18.1774238863896;
        Sun, 22 Mar 2026 21:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm2204203e87.54.2026.03.22.21.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:42 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:39 +0200
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
Subject: Re: [PATCH v3 03/14] drm/display: hdmi: Convert to
 drm_output_color_format
Message-ID: <7duzhocpjyhpvoiw4xy2wlxmrld3sj74rqhozbnlpv2magmbta@c4rlwitio7p6>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-3-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-3-f3935f6db579@kernel.org>
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c0bc90 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f-rPyQLBH6VTMeScU9cA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX9vmiPs6hIAEh
 133fn3rqtvZW2hGROQt6v/dnabPL/ibygoqvw8fzGebY6/ArHBnuRbNWvfcb2kK24FkVIMghZBP
 idwDT0n+U1eg5FyPQ6zVcI0skwXiZc+4N2ws83PBMTYf12IdCKeMT5DBjqHofYOUiz28lDoQ1pu
 W6WU4NnjG193JKyQ1B0gA2didKI/ha9gJaN0O1fnifOVvWKLxXUxziF7o/DukI13CukqOWuiZYo
 ow0TeSkBG7e98qRsPT6K6WvNcXoQJopjLIi+5ERoENStwuhU3nSxwih4bl5HndW2yUldpdus83K
 e+Wgr3vnaO7NdJMfcCuz6PRtda98JI2mV40lYIXZX+Jka986kelr7EF4xl+sXJFBpGxvuUgJzQB
 ffFbebeYeKWr+rgnAB/EDJeg0Xega1aR8yf+UOIAXJrmSfXfqLgXHNOMk/s9rOPxYuM7ninhvPO
 r0upunTz+rUgpAFM6oQ==
X-Proofpoint-ORIG-GUID: oc7LU_6hL9PkbMOpDkYsLdYwG1flLBmx
X-Proofpoint-GUID: oc7LU_6hL9PkbMOpDkYsLdYwG1flLBmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:04:55AM +0100, Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
