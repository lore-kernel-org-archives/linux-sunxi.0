Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D03451A9
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787185; cv=none; b=nEkMOiIqalMpgCh0dzoFnivZBD65VQ3ZQimQH9vpfEfNCag4k0WySdFOTCcQy5fG0E+1BPTSD8hRq+0bULz19Kq9eI+gu0MO7WBmA4XzBY3cm8VF7p+Lto8tzs/+14iLXGHdzF48oCkuOvNhGTUuD6/hxlrRViiV+dX9V5LrgOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787185; c=relaxed/simple;
	bh=xq1DWaWJ8J6cY+rY0xaqvpa3PGUx4ZgFXvOBlxB0GpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjSCSIH2ChROefjfEqVkrQ60WnxevRPIP3g5fW4hgkj6vuKB4ab6FbTc2t4R9Np+wR105yOy8ztimNiZ/FEi3QF/FQgZL/DlbDDM2lKGwLUwetxqDoDN2GekOmSgcupkYma23ItaZcVekSk946f2ZbedfC1/T6/8RBv4a6tfSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blC0KCuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSvprnw1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blC0KCuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSvprnw1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LBkbDk1014378
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qTGT9dVHn9ZD4VlzKf8b4LWl
	wJ6q97WIUZp+d0WZsqE=; b=blC0KCuSqm9wlc6YuJb5fJBNdXfodybBI8mwiIpG
	cu6otodaBirp60rUNTgROxukDQUGZiL6De3HJPM03wiuePdz0xSeBsYSBoirf4PT
	qoLPdE+pPdkw5yTbWy+PGdRwzUBM1+HV++fY4+Q+ZbgP0RdOMBRXxnbSIjPoBKgc
	hF5Uyg91dwehoFyGu0H2aXCfOynF8KmbWq8KKtVGWSE5p7KJpLFXx+76GAYxak9D
	p94Xm6IMiIlV3m9FMlfL1EKhpkJ0NfmkV80pk1th44BQ7+TPFCpqlNJMiPj9eL6T
	se3Lg0BuYQoLayAbgATtnlnbdQjBs4NA+YoK2kDwBPuY7g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt903wp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:59:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95862466f3cso1548307241.2
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787182; x=1777391982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qTGT9dVHn9ZD4VlzKf8b4LWlwJ6q97WIUZp+d0WZsqE=;
        b=HSvprnw1rOSDbCxG6Y1X0hnwHtXQhIcfdjz6CaWJrX+bLJtyql/ab3oBPRBWjoQcVD
         v0sdpua39ZYnD8+1McWwPq8Bc2as0CTjSJnPJqK0SKbg7YhIOAmJSxUzKQVeu5U2zPNQ
         kAai5iP0l77upF0+6wKSN6uNHLyJy9fLSp96dviAOqZr8jYwFL6jhZHgy3D1nMh2MVoK
         AATzKG4TtNSlFbDVT+wDEsEOdoopYbNKwj9CpdAUejzcQGiaZo1QgcNaythdhYKeYxYt
         wh7XQSyk6cAdntt3hiey94mKMUpVdHjj3kE9HXVWyg1G8Ci8VCXEsVLax75vRaE7qtgS
         achg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787182; x=1777391982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTGT9dVHn9ZD4VlzKf8b4LWlwJ6q97WIUZp+d0WZsqE=;
        b=ITzir4GnqjaIIAyAf6jd9TkAlcYPuQBOthQWAOpU3qh6tnYonURuBBHL8eB4GNsBM1
         BYibTy0laNyJdG2oOKpu75d/7Rb6hqNTRFu0Es2I25rhAouiBS6IOM/dFvLrKcuZm/uP
         fdf5H17/TTfUbiKeCOLyIO3gwgHNPyYZDlGOc9ZLaWzGP5rFLlKRu7BMzYfDmp69L766
         NL0338iER/Qjn1JkxF+P/3svDHAm4c/Qe658cu19o/x9mgm2rGcWjGthknPlErPtkDwy
         OByS1lsYXIzalhU0Knns0pvC54j8+58rd9vvK5UKqMfUddL5baExwcCs5cayjcg2bS94
         x4bA==
X-Forwarded-Encrypted: i=1; AFNElJ+saFT73rjLlfGnNdoRa4ZHFqvNTrsqidIN6NprlFkyGhZa1/XcekQ/mcDgsV4NycwR4hYRe3hXddhqhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyX/MPLDwHqZ9ppYgPiXQp3XlQqlk7FBFGezROwt2jevArAf0sx
	ghPslWrYUFgIWvMxpBGfPyKyoEwfLu2EQIHCe6Lk6PPxRI0YQ1/x8UJa/+BqXclC4jK/LP/ebvh
	YbIBEtWUT++TLNNEzvaMtWheT26ra4Uv2Yx3T5U78YQUDwt5ijydcpssJcTyHO2vFqg==
X-Gm-Gg: AeBDieuK7sLzlzRfFYXjIzq2t1L+kUKJwFShf8DUgQhq78KKO74D2ymXhSvTr7U2ZkW
	Wr4/LP0Cng46jMAQiAR0vhJv9EckM2/kgCpMK6CF00tXgG/XYwU8hboRpEWtK1sWlWRwHi9XxaT
	w0oynLaI608ErQwsQTiO248wqZbObnBZoeEmXIBlRwGNstH9Gu8IxLTLKiNSYONJ//CFl0uO8Y7
	fic9JcymSl6HqjlWba4dpPtODKLC1iYCej+Ag41UthHjNKkuc/7NMkYIg0dpvrmoxm8MJIsvOB7
	81BCyEh4F5IK5Hc/zFLHIHiRCP4CgSaTscrL1oeprQebm6eKvjM/KP/L4M5W8gjKym07mRXit2m
	sBKwesaGgY5Jky6HNPl2Y5A0psQODjmK2gJGyAjB64xwIGOHpvghtkni9dVbn41JBv1SWWfg3no
	etiNog9AyxrulMixEiDhuNuW8yYcCeBdtKQK9s8hAqN5AcYA==
X-Received: by 2002:a05:6102:6052:b0:602:8c16:b24c with SMTP id ada2fe7eead31-616f806992emr7568541137.19.1776787182082;
        Tue, 21 Apr 2026 08:59:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6052:b0:602:8c16:b24c with SMTP id ada2fe7eead31-616f806992emr7568495137.19.1776787181651;
        Tue, 21 Apr 2026 08:59:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm31472081fa.26.2026.04.21.08.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:59:40 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:59:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Alex Hung <alex.hung@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 16/20] drm/atomic: Drop private obj state allocation
Message-ID: <6fp5keyrgfic7x6rsopxpqdqfrbotkofv3vzni4bstphxwbc4l@5nlu63kpuwas>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-16-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-16-c63f1134e76c@kernel.org>
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e79eef cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CGuZyk7pIeUWItkfYpsA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: jLvcjSX6kvBPfDcHtguPImaFMKB7LuXa
X-Proofpoint-GUID: jLvcjSX6kvBPfDcHtguPImaFMKB7LuXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfXyfIhtwkKridM
 i6o3bbmmE/Xca2GzrSQfy/2gyxXZYmhenzwaMtfSaqFYZNchPVih5hsk1bWl6c358RJ/N+DLHhN
 wrKw0U2i8rCHN/ZmKcHooQRVG4Ee8zTTPS0Ez0IoBGt+SeEUGkunowrqCuo7M9qaphjI3x0wZbz
 vHbuDHglHp8eemcf4qJq9LqdEtHxIn2uHhF72/U77j/ILKScUbwgsNKxwiMefbNqNELg0qYLLKf
 0WJX6JUC6x8lsQIi+I6wSYYw+XU+mCDSdJH7aizfjB+j8Ux6W9F8zdXXZdfsxf2jtsuIF3mHTup
 HE2kqp0OhLJGcgWrVtMMvHRlpUEwsjj4VV1U9UPSon3am4grxINBsXwyPBZ2M6l7i5jpdd/iueo
 meFbShrAJwntqwQvEBKT/EZQ2num9V4T7qJbbQujszGscRAhOIomd2BT7YHhIBoFOsmXKFDzP00
 VvLmxx91Mh2zEbIhO/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Fri, Mar 20, 2026 at 05:27:23PM +0100, Maxime Ripard wrote:
> Now that drm_dev_register() calls drm_mode_config_create_state() for
> every modeset driver, the private obj states will be initialized at
> driver registration automatically if they haven't already.
> 
> Thus, the explicit initial allocation we have in
> drm_atomic_private_obj_init() is now redundant, and we can remove it.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 7 -------
>  1 file changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
