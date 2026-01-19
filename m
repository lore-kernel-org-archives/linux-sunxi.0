Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1822BDC03
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821831; cv=none; b=hRjrXJ0UqMbHWuPJFCBs+qYuyhWLtzLgU3FffllUczo/KbHLL7P80EEHVOVc+RVAEZpu1alfPgLZ8P78pe6fgnK6hBhY3cYCrTTlqt5fmi5p5a3bC06xKl+SBKk/E0L6frIV8zPuc/jvZQXTXLHV2MrCMTujQfDa99Rw4Z8fH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821831; c=relaxed/simple;
	bh=1MfjcyjEorRmsekS27aI2ZLCbB3LRVzyCMRcbwN2Q/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNYFFrY7Zbb0nJm+hOznpFA2yjvD3dOVcTljTACyMW3f7oy2w/UqCSs4KRKAkL4jaQbVvR3QrLLFWIfHB5dPixfvA1NaXjjABg88QKK0MBDMgM7pG5HfKPvOeM1e9Alrh6XhA0qz4adc/2eHfYJX112mAM3nVy9024wp9SEl12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cK9FqWXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaRxmj9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK9FqWXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaRxmj9Z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90gLk227781
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Og2bNnMCiD+Qnx/yVwl7sa8q
	3E6jkBERvqpmHJS/OCs=; b=cK9FqWXf4YEzqdLtmjNxnI+ZOiB0a/BMinmgC5Nz
	A0AbGvNu5UOyKvZ0hNbB+39/iqnS/I12vuN96XYXVwIRHGFUFOuz/rWprlsueylL
	PQWRBkbUldWASFJjRUr39tMwOY6OkL4gvkdkJtFpDllq8yg0kJyY59jU+eUPomoF
	lXiiuN9bladCJM/XLOmMXcieoD/v13fH0X+G5EAgaeXu2Ig7SlYnwaj1rC/tYYEn
	iJJ4BhxhpRJA6mc7SDHc3fhCK2n6XbbZhTYUYz77Pc8cFSPmycdxwd+vaToy5vuV
	hgOJrzotIgsyd/6Qa1l7mqlNyzpXFhycJmPvnVadcv2aOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8r6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:23:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a2ef071dso1260437385a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 03:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768821829; x=1769426629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
        b=ZaRxmj9Z0rM4lc9wlgpLXaFFlie13BU9s9P2yWcsCvLEOQEEzUpNIViqIiYL2vN9Au
         62BGGDhSetPJ7hTHmzGj/f9nst1sp0NZtctoRi7sYdFVtxHFjPEQJC98IpqH8r+B4EQC
         pwKfZTlFewFr8RPC+6IOrGQgbMJmG7JVXYbp4vkD4/7LCcLMEmpsLMo12t2UTDwhzH5Q
         PhfHxlRAmQVPdysI6UrYjFKJLMqNrsMXHOtXODL3tMj15sCR6iJwSW2+nJlRMwqdhf/2
         2wy5fW+C2dMZKVF07FuFCd/eprvB60tnA40kEs3Lyg0f87ZKEKioszP2oiNGDYu+WusO
         lvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768821829; x=1769426629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
        b=Jxx5wwEFzRwD2hDeqQbRp0mM+SFXbOCKE+IHXK2icAZAdY/EuWe5kckkGWvHuoJrHw
         dZpL9L279/mN0o8hhKav2cnjjeKOKuSgNLQhQjgBXyM87yv9TE0HjcwJ6F+jkebxia3m
         HXbCofd7d+Ao9xAjf9d62UMPn/alkII3xyUSne4Ll+SQ42+LleUQJkKP54F1y2i58T5g
         k0Z0FPXgBpts4mXujXGp7mKbET0+Sak9eNXl0TuRvna/wNRnaItHDeiF94GEoMYK20tl
         iEvHkAzSyrdpG3ZiAeJED/dGTC0x/g9v/6q3WuPrW15C4ejH553XKhg236In6TNozYkT
         c6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO9RRCpnLg5vECAeWX6pOWcPwmqJm8bveBLbnEoRDruoH8aJzAxr78+5DjXrIMk8x4pMcMQVN58Tlg5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrmLjShX+VD4huEB7fhOGbVmzQcWQxXbnfLt0yId1uny/TPHL6
	4V8ZJ6xcaATD9rKthMBm+k+9aXQSWXVrHAcmctnsOdt+XuBcGE5LFZouyFXQpSNYpnAnpARoYp1
	QCJqc9/EsNin1HYgWzZEKq+TvqSLASiKq2/fqkkDXuxWf4MeRADy4CQ1hP+pJL9/uWg==
X-Gm-Gg: AY/fxX7NF1C8/CAOHl3ulnq8U9OYczYBmG3jxQHe5+S63P3atsvAYTAQtbLTktMwJfO
	LiRAecgcOsrRuawsq2bxH3F97YPn+MCM1aiLqwbq5ikFurRDqFjlLsJRJItKYePOfnJDK3JyCTn
	tRhmxOK47Ne2g8XDB4DSocj3DWMChtM5VWdJvsgA8f4G6HRC+ZGNEK/2+xJ35u58AaalMmoXCh0
	mpOVDPiKGvsPT+/GeXhWFulxlQIK1dB2M7n+JkpVMn5OoUiSyTyzQN8o5T2k5IUFqfAANAPpd/W
	kj9ZxECgCfijnGqtjL99tT7PEDsPxmNozq5Mas3z0o3rg+bKl7xBD0nP3F1Lgy3XMBGSrRLQOP0
	HP+yPPc0ZEELMOloZdSye8Tc95qU7VmD62z/yOrIr0hfJMJQrNIjLjRrNcmGvJc06LWD81IyVXE
	yWtDWl7Hx3h0WOtos3ZNqypxg=
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c6af595e6amr1169567585a.18.1768821828923;
        Mon, 19 Jan 2026 03:23:48 -0800 (PST)
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c6af595e6amr1169563785a.18.1768821828488;
        Mon, 19 Jan 2026 03:23:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8d5dcsm30685941fa.15.2026.01.19.03.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:23:47 -0800 (PST)
Date: Mon, 19 Jan 2026 13:23:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Liu Ying <victor.liu@nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
X-Proofpoint-ORIG-GUID: OUYuhNnbYr4mrwl6Zof722svww80UWcU
X-Proofpoint-GUID: OUYuhNnbYr4mrwl6Zof722svww80UWcU
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e1445 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VxRmli0-OQd2mcn04XsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX4ugv3cmBpY/c
 4NFXqzTGvQWTCu/a8/NA2O7RwoCip/LhigYFnPcVBZSndR4X/qGk1NJf0L15d810ol91VYrI0Xa
 1PB5TRqds1kwEKN3fauB81L+4lblqVqylhmN8OUL0BkMiJvFa3meJGzzctBfBbCn5KL03tE5r0i
 h12wGx0Ii7a4tk9If5+vQE+t1f5lmhZXCwEnW7wMM8Hjeo3j5meqVRWBndOEbbNDVMV9HTl2EjI
 qq0QRdN2gvvDc3DXUcOXNYZPcE7is3wU9X7UnEtgN9Ulvb2kSleQbRspcrLjc63v8MZxLNhfzHB
 S329f2CjzmD0785o6Is/6qgaHY1DwIk7bTYIY59FIqNxr/SksbRy8BkdUWdxueNBW5BXvKPYACn
 CRfyiVNirpZnTelsmvHUDQ26C7wO+UDjG8tJ3osfM4Mpmu31DxxSUB4w9TTXOY2NiO9LqkdOM5H
 ECnvfjWo8J4vaOav80g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094

On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> > unsupported doesn't result in a commit error. Also check that HDR and
> > Audio InfoFrames are not triggered if corresponding features are not
> > enabled.
> > 
> > 
> > [ ... ]
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for all the discussions and the reviews!

-- 
With best wishes
Dmitry
