Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60433D47D9
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406749; cv=none; b=e4MkuB7jjM/ngv+vgd6rfwgIDduImO2AyjBfU9XwNEKGbYvWY2303PTKE4P90YvE4jU/9o4a/wIL28Mg+Dfizkn2pvKQu9UdTvcHQ8yQ24fvCooT2DvFjvysQEobeIPbeMNpXGIvFdPHV50XyrvqcryjEOwHW4bi9ZH5RgEiJuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406749; c=relaxed/simple;
	bh=Tn7t5jxGrWrTDZ5FWs65zFahjQJ4IKGASBS+IKuom9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlncXD53m59I6qJFmBLPed2hnmBwKineFeEnOORFKM4yn2DNxR9/o8FSYSOxFokNwvVi1SZjYV0VH2bN2gjQmoeQ/LM0ncNAtBpIy8bFXcVEMuA29/J37ikrZZ6ybZxrBVzpaIhl0dQBTGaM3dD7dO09VNkjppge+KJhoY6H1bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZLJLlXl/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZLJLlXl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785406744;
	bh=Tn7t5jxGrWrTDZ5FWs65zFahjQJ4IKGASBS+IKuom9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZLJLlXl/SQ03XxUMbNbK5A+kU+fYVaJEO/4d8jO8gOgVEvevQgFGFKbNX0r1lpg63
	 6f4OKrTbtw9uKGiRSahSf1IImDoAETjAqNy5rjL1y9G7ewYTLDd1Jw3xYsDpEjqKf8
	 IyrabVG1pARYE5we6LHYdSW3BA7sbSbLFLz5zbupwunSAHBvRVI+gFVozms1sAf5VE
	 +ayh4GSATHzIc9apkAd5cxA/Etjfewu5mjKUqhOQlKlTRER+2FZ1+lByuKNe/ehIBG
	 wubNcFagvOYXpPFI9QSK894hL+RDeVk4FPcEiGVtesVeRvJ80RlxXUfE64fIQk4LYK
	 0wzwK9RRYFsIA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A82B17E0254;
	Thu, 30 Jul 2026 12:19:03 +0200 (CEST)
Message-ID: <48c1b5d7-97fd-4ba0-896b-0485eda395f6@collabora.com>
Date: Thu, 30 Jul 2026 13:19:03 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/61] Add HDMI 2.0 support to DW HDMI QP TX
To: Diederik de Haas <diederik@cknow-tech.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maud Spierings <maud_spierings@hotmail.com>, Sashiko <sashiko-bot@kernel.org>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <DKBTALC5PUJ3.2KU1C4MRVBQNT@cknow-tech.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DKBTALC5PUJ3.2KU1C4MRVBQNT@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Diederik,

On 7/30/26 12:52 PM, Diederik de Haas wrote:
> Hi Cristian,
> 
> On Thu Jul 23, 2026 at 3:34 AM CEST, Cristian Ciocaltea wrote:
>> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) on the Synopsys DW HDMI QP
>> TX controller, as found in Rockchip RK3576 & RK3588 SoCs, by adding SCDC
>> management for high TMDS clock ratio and scrambling.  Since SCDC state
>> is lost on sink disconnects, the bridge driver needs to trigger a CRTC
>> reset during connector detection.
> 
> I tested the v1 series when it consisted of a 'bit' less patches, so I
> figured I'd test it again with v9.

Sadly, this is still growing - I added a few more patches to address some of the
Sashiko findings and will probably send v10 later today.

> So feel free to add/update to the Rockchip related patches
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B

Thanks for (re)testing!

Regards,
Cristian
