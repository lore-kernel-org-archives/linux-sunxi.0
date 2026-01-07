Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5D316912;
	Wed,  7 Jan 2026 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790068; cv=none; b=SdYHAsfVv7E6pcQD907Jv2M3DLBlXTV/Pj2TxAb6ChxZwiIEmG84wl2L+gkaNLOPHcACcVtHxeainYnHR0UmHHnFLK7lqrC6jsIShbFGugaPUmNDTcWn7f2d/+0cM+mBCahGIf1JS7gNQvl7MSuQiMRPYGDVkXs+O4d+GH5fWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790068; c=relaxed/simple;
	bh=187QeaYOCJ9bxj/owdya1F/qotNUlNFLu04+ah4+UhQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ZhnwYDplqAAJPovQPzqqwYjMiuIL/W5KwK4Im1LWsJdU8ATRKp0pZOdQvPzCVI5RtV6MG8m6svYj/tX5mJBkOyV64BUxQTc0dOLOugWlno3gaJBaZ0EWXxovBJPrJhsBudMRLb1lEH5xu8DaQfirDjGaueJp8EJqYjqXk8fyWoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOWbVaP4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOWbVaP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D26C4CEF7;
	Wed,  7 Jan 2026 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767790067;
	bh=187QeaYOCJ9bxj/owdya1F/qotNUlNFLu04+ah4+UhQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=OOWbVaP4Grpkvk8qeJu/gFqhaeXjRRFxPHKu84aFwOgDLJW/sm33qZ4VvDqenf5dr
	 WpKlTlqmt3ddOxc91KUW9clzq/di0sQuAnKbESTGAJRGMGm2acjxzynTEekuxDmE4I
	 71QvDceGfrwauXBlfv/AAx+dxKRshIyq3o8iqcboVDrcWSIClEHZqxH/+x2QRUirpV
	 FeyQkUIi95ml+FwsDw4X0/4gDPTNvdEAdodTmsgEVv066v3rJKDB+DdVqLjhRj0Dx9
	 2F3PMmS07tCcm9KWspeKNPibyk0Hy50fVF8uBeudxl3cl9DyINHHracdJJ17q3zyG4
	 FFLJ/1tRZ89gw==
Message-ID: <6ae21650d05e50b1d13d72617d6897c4@kernel.org>
Date: Wed, 07 Jan 2026 12:47:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] drm/debug: don't register files for
 unsupported HDMI InfoFrames
In-Reply-To: <20251224-limit-infoframes-2-v3-10-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-10-7fd3cacfefed@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Chen-Yu
 Tsai" <wens@kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Wed, 24 Dec 2025 03:02:59 +0200, Dmitry Baryshkov wrote:
> Having debugfs files for the InfoFrames that are not supported by the
> driver is confusing, stop registering those in the debugfs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
