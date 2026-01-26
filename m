Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE061349B1F
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jan 2026 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449499; cv=none; b=pLCx3+WCGcz6NITqnw9BKXAU23+G1rGtxRC2DpKoL3FA5R0Fiew7BRhm9UxIcibS1TcVSMqaqRyQy8UxPiYDv7KOyd9JZwl0xH6dJwb/zQzpHNTiL5nJ9ypKGYCOo/p49NrHfN3PTgQNDOF5VwqDX57VRPdm0oNzOJxNRJPusYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449499; c=relaxed/simple;
	bh=PEqYRvVN14GX0vOGPVhiyUMqxaF6YhgQfvJNl7p3p40=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=pBmO41wvgYtPQ8EGE+QCLF6jQgzMtXcAXnKrztN9koqtV6XiNjOa21uEl13lsnD6UiDKcrOZh/BA5TtsDYLapq8t/IyJvoiYRlQMabs6U9w7fOpbq9T9Pd+B/vqyUlbxHjAO5OoRLHH8/9nBfE2l0lnKKxjZlo1uXMvjZ9yW3zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EcUJtwIv; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EcUJtwIv"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260126174455euoutp02672a86f4aa950dcb6186a3c4ea3e9c49~OWPEJIrBp1456614566euoutp023;
	Mon, 26 Jan 2026 17:44:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260126174455euoutp02672a86f4aa950dcb6186a3c4ea3e9c49~OWPEJIrBp1456614566euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769449495;
	bh=ViZnPApGmUm2J4gBM2q37ZW/xc0HmDYJ2pAdJ6BXznM=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=EcUJtwIvikdAG2aaXvnIrEnVxjxp6sqj+eN+ReWnmhAZcoZTykDAYnBGn45TjgV9j
	 6IydmTmfZcw7aIGKkxgoTwMd/FiRl51Qw8mUSbmfRj6dgT0++ll3wq8V+YBs81C+BN
	 XVtyFbTgY9a2qQn8fxHgi1EnWme/xadUYtn7+BUU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260126174455eucas1p1f219202580a1033d3e881adc4f37f206~OWPDiMXHA2201722017eucas1p1L;
	Mon, 26 Jan 2026 17:44:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260126174453eusmtip1343282648a6e7de9c928b52e4daf95d0~OWPBrT1zi0390203902eusmtip1Q;
	Mon, 26 Jan 2026 17:44:53 +0000 (GMT)
Message-ID: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
Date: Mon, 26 Jan 2026 18:44:52 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
	Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
	Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
In-Reply-To: <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-EPHeader: CA
X-CMS-RootMailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
	<20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
	<5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
	<CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>

On 26.01.2026 18:42, Marek Szyprowski wrote:
> On 07.01.2026 19:14, Dmitry Baryshkov wrote:
>> Implement the clear_infoframe callback, disabling corresponding
>> InfoFrame type.
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> This patch landed recently in linux-next as commit 3a4ceb89a972 
> ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> it causes the following regression on Qualcomm RB5 board:
>
Please ignore my report, it looks that automated bisecting got a bit 
confused.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

