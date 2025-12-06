Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283D2F3C28
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Dec 2025 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020503; cv=none; b=uu+qzJSeZKECB1B9BoHJ1Gbr1gr1nC6WspHHQ55/ZBKumxA2FvU4A2JldWLLneHsOn+y8f0ZDoQO/+9Os4K4IRIy00ZJOO62Rf4v6GfrfUD3zNiNm1c1N5Bhdecn+5+8bvJEG2+q+Y6Xtx6I+8L97VTq81qflTI+hsE6E/qAlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020503; c=relaxed/simple;
	bh=sy8LuxttyWBbhy4283Xw5tNBEb9LVJpfl85panOxFVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruujpFFrENOoAmnecuy37xEEhtDqPGGzqMH+UvJ9YgpJC0WAeD7WMt0gOrNOd42bqoMJ3nEe80wdSR7lso/U3h1AezF4Pw4fcaoc7+sMEHLen9WDQqRpAS0g5+FGGJWy79GsyN6RZLSjsVgg4WYu0YVIGLVgr8sJTNkKGnENnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRAMgs9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuBDYUCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRAMgs9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuBDYUCj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B64llda1804932
	for <linux-sunxi@lists.linux.dev>; Sat, 6 Dec 2025 11:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eftNH50iSq+b1pQ7t2A41tuU
	7np/m1Ety8HH1ooE1SM=; b=fRAMgs9mCxazzXMzvY/ljPhA+e7OThl3YLhsj8ag
	E0+PTIudFHWg6pcpyS5dVUKEgLQEZjFp+y6zKUBesZtRUICX+Rn6X4SUtEH4SREF
	0FsGlxPwLVw3mjj7/nScJ1gkLbuxG0waYVBscNDBnvK2xuhSbNJTI0dP3WYXL9+a
	s8CX6KXW6q5TDl2KvW0GrNYKNkdLRUql9XF6eLXmTo4BZ0O2DgtYsXUEwaZI3naq
	7W/jEEsk1epwTBdXUFtdTQd0dXYTtx3yiUwzixFB/3p+Nf2ljpaMz9rvnnj1vZi8
	Ay9uoZglavJpHuWbrN3KSqMbokUI5/kFcN3+xnKj11Psrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avds98h59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 06 Dec 2025 11:28:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51396f3efso508694185a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 06 Dec 2025 03:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765020498; x=1765625298; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eftNH50iSq+b1pQ7t2A41tuU7np/m1Ety8HH1ooE1SM=;
        b=TuBDYUCjS1EzaIpMAJlV9dbr2sLveJmFmnKJo8xTKf6G4/N/E9nPCE4+GdQdWhBT6I
         x14w0OQuMPBw5gijBP3oV9i1Z74ZdeMYC1pw1XBSbjhXPoCA5X7wTPbkR4DLXu0EWfLo
         Ld1ofl9d7c9aT7TxTaeu8H6W20oN/VXoOseeUeTyCRhlVsociuHV7BxuPjEw7u44JCia
         BTnKTOIZAsX+0ptEIMojeWDdFXsNxf0RlFkflmKe+Z90MnHnqDt3kP0yn++uvtV7ONFH
         1n/1oSNLuZ4hLfK3naHBFYUNxaZPMX7+ET1UaSl3zaCK+Qx0ifa07Uzbn+C7wBjz6Yay
         YVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020498; x=1765625298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eftNH50iSq+b1pQ7t2A41tuU7np/m1Ety8HH1ooE1SM=;
        b=Gm6jk1CffUpZigEJkNwPl1/xghFxD13YDILLd/3xQIaRzRHmLsKD+ZPetR+Rgvx/mO
         y+sJ6Wkzssm8KHxUDKcXR0u7KfHLP2QOXbTQUHyrY/aA6kU1vMqa0E4u8vrT8+OV+xhJ
         1Js853oxP44fyUMryiJKGQ4yKQ9kk6AqFl5syz2SA/2bCMR+5LqTvLn/iPjJjNf6HwKs
         weiGOmlg3Hjhfz0Mjh2Ma6NUaQOcmeiefveypYRFGzIXM31+FU3StDrocUXP3pH1p3AP
         3Go1NOCeAOYTkWv/bXf3wD1uudc4/LV3S6u/GbIbjOP7/BjCRhO9iaYt+CmN9iWE86mr
         Ndag==
X-Forwarded-Encrypted: i=1; AJvYcCVbzZJnlYO2e8yHxrqgdD/BNQ2hcjA6y/HTGGbbBNhW2BJPUx1lnjhlaOk7KcKBFC8yeK4lpIZjiYy45w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrzvZPV28uZHYVJoW4AkGRzI+RaFpw92HjKvW2iQZIkFvuSQ2n
	iYXmGXHJisrwXJO/BtUUFT7SQ4BtrKTqjl8M77AgKYy+VsQMyhLMDVXo+G7f4M187sV6ZPQjGGw
	tn9MJhpAqGnGWE76Ni4q1b/f6UAGnscNAu2MP1QjohdBBSp0oRtY7Jd7/mqQoc7ZP3A==
X-Gm-Gg: ASbGnctmPtUpptSJm3hMejXAyj15MBVjPqwqFYgoZ4d93V8iedjV5tRu+5b0DieGkY4
	IIBFj+7NMNEftsF2gmJO6Jnx1K323svQwEVnjezlVCU0+3fyJBDR1pXnEnkta+YhNvKGOQzkGpn
	ibH/18GqMnEvy1Xz9G0PnW+GEkqYK+9lZ3gwbjbYQ+mclcCmuux7J3bwRaw/MppxPuNfrkvDrYF
	r7lcA4EJ3klelIOZjeTBNT9P/9/cSp/t9n/PHgMbuhFxc2mD57vORLyp2A+yReDxoDO42TD1Qea
	9MTRrNX7Lg6My551rVpylg9cwjCdBd0FZn/dNmwiJhYBwVbHri5wT2E2fMfwDM+RRSZ6dxQkXG2
	pT4g+5RVFRp0sHBP+bjzcI7Dwgo/BMnc5Wq1qhc1QxLUiV5DamPu+dijbBdFZ96toN6KPxynfAc
	qMoVHqVtpghH4DHl4FYcEpE5g=
X-Received: by 2002:a05:620a:6cca:b0:8b2:e0ad:eb97 with SMTP id af79cd13be357-8b6a23f9f27mr297014985a.83.1765020498344;
        Sat, 06 Dec 2025 03:28:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJHWqoex+xRiDmmBbNdl3f9VzwXv1wYvWtOWvVciq53luinVftKkSOrV0+ulKIRpu8jICgkw==
X-Received: by 2002:a05:620a:6cca:b0:8b2:e0ad:eb97 with SMTP id af79cd13be357-8b6a23f9f27mr297010485a.83.1765020497870;
        Sat, 06 Dec 2025 03:28:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a5d7sm2399030e87.15.2025.12.06.03.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:28:16 -0800 (PST)
Date: Sat, 6 Dec 2025 13:28:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>
References: <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
 <20251201-enlightened-zebu-from-asgard-5a20be@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-enlightened-zebu-from-asgard-5a20be@houat>
X-Proofpoint-ORIG-GUID: MBvSfwwkLzeA0sS0Nqaem93TZCBwrWAE
X-Authority-Analysis: v=2.4 cv=P+83RyAu c=1 sm=1 tr=0 ts=69341353 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dcO_3dQx6njePB8vrlkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MBvSfwwkLzeA0sS0Nqaem93TZCBwrWAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5MiBTYWx0ZWRfX7hvv+PNG+dl2
 +UybL1FAocbLSzH5FRMIG5gJEZlw2jhAYnzRrrkADwJjy+cJiIUdk+1Eab+8Gtkk7aWXfEZyZ6z
 BDNRC6oOw+Qu641E0qY1LQRS0HdkeJP7uQ4TvXwTuUPONkzPsvtmJ/CGEmwuZuyPDdHh+QRH19u
 kfeb69NMFaRKM3l7vTOmaWeAShmOZO53Yp+hjZns7VW3LvqYoAZs9/LFYX2HQupvVTK31bc4WTu
 xN/7z1MFv1XhaM5nwLjJyCkPiQ4/AdLw+puzKxweWf9nG1vfnDssQzVNZUiIDi/x9agLpPu0u3i
 iwh/b+ac3sQldlzuX6It9jZBBpC4KjY4wdUzsBgKZc/kal5QTmLHz+/6EMdcFlXm7oj1WriLstf
 dvk91tcd190UEBHkogrDrTDMUulqBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060092

On Mon, Dec 01, 2025 at 06:01:56PM +0100, Maxime Ripard wrote:
> On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
> > > So it's not really impossible, you just need some hardware and a day's
> > > worth of work.
> > > 
> > > There's no reason these should get a pass, it's breaking the spec for no
> > > reason.
> > > 
> > > > > For SPD, It's really not clear to me why atomic_check should do that in
> > > > > the first place. Your initial concern was about exposing infoframes in
> > > > > debugfs that wouldn't be used by the driver.
> > > > > 
> > > > > If the driver doesn't register a debugfs file for SPD, and ignores
> > > > > whatever is in the atomic state, what's should we force drivers to do
> > > > > that?
> > > > 
> > > > I really don't think that drivers should mess up with debugfs on their
> > > > own. Making atomic_check() disable the unsupported InfoFrames makes the
> > > > picture perfect: the DRM no longer tries to program them to the
> > > > hardware, DebugFS files stay empty, so the whole state becomes
> > > > consistent.
> > > 
> > > In the "bridge has no access to infoframes" case, there's really no
> > > infoframe. An empty file is "the infoframe can be there but isn't used",
> > > not "we don't have access to it and can't report them". Only drivers
> > > have those infos.
> > > 
> > > If we do split up write_infoframe into multiple functions though, I
> > > guess we could create the debugfs file only if the function pointer is
> > > set, which removes drivers' involvement if you don't like that.
> > 
> > I'm fine with not using HDMI connector framework for lt9611uxc.
> > Likewise, I think, it's fine to have empty files for the infoframes
> > which are not being sent over the wire for any reason (hw not supporting
> > it is one of the reasons).
> 
> I can't think of any other example in the kernel where an empty file
> means that the driver doesn't support something.

Okay. So we need to sort out implementing the split write_infoframes in
drm_bridge_connector. Any suggestions there? I'm asking, because I don't
want to end up exploding it.

-- 
With best wishes
Dmitry
