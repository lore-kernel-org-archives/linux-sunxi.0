Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909E82F0C62;
	Wed, 20 May 2026 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294537; cv=none; b=b6Bz8B7qRRrLjmV6SxWQ7zy1BtA2sSLCsa+FsavAbqCfVc6vO1ItGRUX0d1dOXSb8bGrvJRfysS/TqLf5Iex3n4WAWUrdtGKAiG0k8WcKIDj29LILYBPyoZW2NQ2PkUgqqd+BsevoTLeovM8YXX/fpGjtxy2Tfuhge6ip6C3a8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294537; c=relaxed/simple;
	bh=ZwZzDwBPCLRG9PXoPEmqDXTwIe8HtG/ZkyvqpQ/vJjI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=u3OrRrJ/gGH3TKogDVrNgRjW7/9IYFGD4DKOelVlPhICPkiXOVWk1/IsQo7Jz3D24BKqL2o3qWYU6EWQgqSI9E1EpL3zsd3TlDq/DzZlvsu4IsMOi8lJRV5wgiAna0IBpTLT1XRF9YPtAwC94q3i/R7jj+OAXj/7Q39dBGuYq+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bp5FUk2K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bp5FUk2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CACA1F00893;
	Wed, 20 May 2026 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779294536;
	bh=ZwZzDwBPCLRG9PXoPEmqDXTwIe8HtG/ZkyvqpQ/vJjI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Bp5FUk2KQIbt0M3E/b0CPnjzwUNs8EBJdsRSekRvptNtrj2u2Q6r85nZBPtg7YRn6
	 JA2G47fw1QCrApRZngK4nI7hSlYcb7WJKH5BGk4P879upoScY0lHEpsvl1PAxQZsB2
	 hk3AWu9VmwY6rnKvdiK1GRHfEDwgccv7DyovfW419RUHt4+t00g4M4HXclIrOPSoOW
	 QoyXh9ektqGLBtQJwjOYRI7p5/3qdNyGFFOjy/EZUmEOt1KF9RhhPTAEhJgtQEGerM
	 18IFFGCRrLTktduM0EllzAaMmtb8H/T3fXGgTrESz1TOZ0w3xBHnL834O94HavrBnN
	 KFxMy+Dqta4Eg==
Message-ID: <c78d360919f00e3b6d3fbd56d035488e@kernel.org>
Date: Wed, 20 May 2026 16:28:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Javier Martinez Canillas" <javierm@redhat.com>
Subject: Re: [PATCH v2 0/8] hdmi: Add common TMDS character rate constants
In-Reply-To: <20260520144424.1633354-1-javierm@redhat.com>
References: <20260520144424.1633354-1-javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Alain Volmat" <alain.volmat@foss.st.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Brian
 Masney" <bmasney@redhat.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Chris
 Morgan" <macromorgan@hotmail.com>, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Daniel
 Stone" <daniels@collabora.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Jani Nikula" <jani.nikula@intel.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Sean Paul" <sean@poorly.run>, "Shengjiu
 Wang" <shengjiu.wang@nxp.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Wed, 20 May 2026 16:43:36 +0200, Javier Martinez Canillas wrote:
> Several DRM drivers define their own local macros or use magic numbers for
> the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
> instead these common rate constants could be included to a shared header.
>=20
> This series introduces these constants to the <linux/hdmi.h> header and
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
