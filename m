Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9432F747
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jan 2026 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769545623; cv=none; b=mprvoeGU5351Q51PhaON031LBf9qDdP1dNH1POxQlOCWoHylPZ5UUc9goXXak0ziS76aPfwfMVaAsFW6P2/9N5TU0v2lUU0aVhQTeKzzb6AtGRddDDa1iSL66urxR7eNfVq+LNMvDCkZWOQQcXOdlU4tmJ0z9pcA7viZMCudbdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769545623; c=relaxed/simple;
	bh=kBBwiGdSI/w94i3onB5fy1oZpsbMHQ2208C7jqEO1ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQk230j6wgvE5UYDAi9J619R4Y3kGh/jXnk92dM8fS5GZwwtH9tDWHLObP6+7ZuCySIBHA25+b1wcuUKun9bkL/rpcOFYmmA04HEsenpuoILYG9wqZGn6TgnEcv5KWnV60Ln2Xwi0qs9QAB6evAE7MmhFqSh2HBtCjaE5Ci4zoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlEJLz9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtSN0geT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlEJLz9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtSN0geT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHhcrR1952868
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jan 2026 20:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R7u/+GzEYAjioDYmkQxOY6xs
	Cw+YDBbFVfBMYmE+PTU=; b=OlEJLz9Jts4JCKDA2sUywDbOlEwV13u5StSD37uO
	3jZ2LqLmnkOlj3tENXxxrto0rqSvazhIxACvFa3vg9Lr0LTfmIGoBSKKWVw7oxiA
	Ygi6pAvHAHWzb6RO4xH6d0S62SdvBx5ZYlidlKngSSWsM9rethdRC2pSYUcDiBTF
	T5FQSQLRcDQhV7oEF8GYAH9Gbn9OVoQhUGC0n7DrBSDA+jXZdZ2uyp0KnpDgA8Sm
	dROwvv75q9PROWNOhczfWpFsK3gmh3eR87eCfuCL8Yc6qCOcag0QIWk8bnEMl7E3
	7ZVSIDQJjUzuMcn7KtzSEzu5NNF2rO7f5YkXeibASpI4Sw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by2118hwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jan 2026 20:27:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f178054150so6404285137.2
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Jan 2026 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769545620; x=1770150420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
        b=EtSN0geTZAbJzyRsEcqw8LA048mPPTMU5H8K08ugxI5k9/2muy9Wohkj/wPkvj2bA+
         G4xd+cCv+EejkZvDrqwsFhuAUaNpYTO3m7eHc7ETmTHHIBHAUEiwQi/xjGl1yNrMxBuC
         /Q/nMmrjFjHl2nc2bhSQoMxffuTnZUFOvsACbGAxmncSGHRh176OCUzLaUZuv07CNA32
         0tgUZORSLyP//RRYvRwJ6PftdZM13ZIpaCHSL9GI+uy3uUs9P96bv36I+nQbm/WUnj9k
         Y6DUGcJNlmSeabBAqQG4o8tbowEXFMgYPX1GPFjvGIe7DcTVd7KWoRPDl3Qdpoq2KszX
         ApDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769545620; x=1770150420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
        b=vFDImz06XMGKXDudXTwuNJr3yQgM5wIUMlYQaWlkBMDIoigAD5Z8gQBYp0b9heEUC0
         HBj499c962YnXYn3djUItVu71UhIKgPK0EpH50DJ2i5XXv7nURDQ50aV6jXe3nZdrm6G
         /LsduvnEGtpK9HCAVUtU2+tyWiI/84llAxnQelab0cW3zFf1P7rmfgJUh4Sm4mTvguhI
         Zp9Kml6+QmnHAszdR86KmjIohmv+TzJKtcs/G/+ZFux+KRqACFI6wMoAhdyz7mBUYj0M
         boYAE9C2uFvu1ghYVFUwRvDdgZ56l7bXhRdwLEyWnjfHkGU8YB5XrZBUI5cuqmRchh8S
         Qm3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrHiUcgP6Xzt0T+gJv9HZGwHD/eFeN/tG94SqdicLwVoGqn9Gj8p/sU2GlLNwtlS+SHhL8RrXCjBsGVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDJPyFrOk7jb9M45UhxBsaA1wtGPttL1kIldqYLEb0QzyBMnbp
	aEDAmXa6TJ+TVBHMvvogKnYx1EIMryeLNBxroNWFcpqj2LSd53I+MPkkZkCNMRPAWOdvhIl45Pk
	P8SW/P3KjKUqv01WOaKqtrbQnbHkgFwRUMG11XlSS30lZJb6zHDZk4bFJpIujB7AZZA==
X-Gm-Gg: AZuq6aLeHmzTx6h2vnFR6QR35DgG6cMx56e79EUVSUo8Vzi4r3BFkMxI9JV3mER4HdF
	thbU5rs+/FeSJM5NXwtWi7DnJhRVpaR7e+22cGx6ANEX3E++PF9u7eY9zAOFBJ1HVdPRQgUpfQz
	4KgRxfRAc0ekz3ZfO7IanqhQq0PRa5fnYiLcJvFNEuooiohtSzY3I6bBx0WjnhiIieJOIWs7Od6
	I0Hpyw0TeuCAOBR7VvXf4SCebjPDJUxUzallxRy6ii/2WsGymaKsS46/Sbf/9aZOegrt8bV6oGN
	z17KAjzw2eGdSP/z1Tj9Wqsp6jcV9OI3FMhwl6JXHinlumVZ6w4T8WS7o1nqyv2miMcHOZSyea8
	8wldTGLEhvkETT1SjikmsWkWD17eCBFcZrLpDuKFcSvi+kSVHNwaX3KupTQERdqf4xmBJAXE9eL
	B0dBfuRpfAZoxWxkoA4iyOI7g=
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr962072137.39.1769545619924;
        Tue, 27 Jan 2026 12:26:59 -0800 (PST)
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr962042137.39.1769545619368;
        Tue, 27 Jan 2026 12:26:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm147447e87.11.2026.01.27.12.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:26:58 -0800 (PST)
Date: Tue, 27 Jan 2026 22:26:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
Message-ID: <6p52srrxddazxiwqfqmjpef7k4bbpzojxqiy57zmhqcpqa2bum@gv555pvqrige>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-5-213d0d3bd490@oss.qualcomm.com>
 <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE2NiBTYWx0ZWRfX0ByN1bhLw5t6
 gE1EKN1RVdEsesSq+1+g7g4c9NFeBst0BjyYoeRu2tEVILq5F45eHeuuka9uklAXETrbbs8ezib
 djfp9b8wO7eel0hGovRuy4CmjI/C+o6hm7s4t0sE+6mKk4O8gsDhgTlNwofnOmslsxEOlBw59R1
 DjTyxOAcLhV5mv63KIRmeKbtZeCP/ZEx4PGk2KkXsNzFHR3OW4MRXaeJnve+XfHZg2Ty0WiF45d
 SOECmANJnru4pzQEtKPREueCeQyYHd3hszxep+ZhEyAZSx4MeUs+WtYlCU2URzpwy74rqma8rsF
 EWTttiZd1qOs3Bz7Zyi1sVgA8gP1Nvlc/JWZ006tqKvMpC47jZhHxcyatqI4sbydBd9Ax48xWW9
 SfIsfmfLMGUz7vJnPZ6gKd+QRs+iqeYLqZvy+cTAR0KPAnErxQxCQNZSOGiy0uvDxUtDawJ3/zW
 iQHUjsWc4u9lNYjQ7WQ==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=69791f95 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QCwxOkPKupwELJ-03vgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 6lDMcfIon1N9o5kefkHiI5ziIqDfCwy2
X-Proofpoint-ORIG-GUID: 6lDMcfIon1N9o5kefkHiI5ziIqDfCwy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270166

On Tue, Jan 27, 2026 at 07:50:25PM +0000, Mark Brown wrote:
> On Wed, Jan 07, 2026 at 08:15:02PM +0200, Dmitry Baryshkov wrote:
> > Having only a single set of callbacks, hdmi_clear_infoframe and
> > hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
> > the DRM framework, which InfoFrames are actually supported by the
> > hardware and by the driver and which are not. Also, it makes it
> 
> We're seeing oopses on Qualcomm RB5 platforms in -next which bisect to
> this patch.  Looking at the patch I'm not immediately seeing what it
> might be getting wrong, though I do note that the board uses a LT9611

LT9611UXC, yes. Fixed with [1], fix committed to drm-misc-next-fixes.

[1] https://lore.kernel.org/dri-devel/176945413960.1492466.3261759749688865592.b4-ty@oss.qualcomm.com/T/#t

> which is updated by the patch.
> 

-- 
With best wishes
Dmitry
