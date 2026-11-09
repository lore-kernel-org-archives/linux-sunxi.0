Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243250;
	b=0EvNfs4ND91LqzLGOQ+EU7DBCtUbKhdI1hrnMWi1OScVJAQgq6bYmjDHVzrUVwNKGPMs
	 7VnVUn7vemFOvt4vyUoLGNE4g0odJqc0PoKs+qsOOjCjdgm7MEhh2t6MSFRTj5bXZN8m4
	 XkzbaOnJ71ef2ssQZwbj5R/p1Gg2jHSgKrEMZygTpiQHd3UINI8ixb2djBppYRiI2cUlt
	 GlOF/ceCW6Sa4ZP6o8/YjWj+C7I2ti8czwLzaPacY6U9TXVpnCoxEqyhGwxj3qJZmZIB9
	 iRtE4YJAkmI9uwbmgyYYVeo6IGPwVn673BZHwRoso2mRghGDHYHALExlopaKbAT4x3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243250;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1HDtwLDGfSRrUZ/V7Ccnlt8XRob7ixLwnD6AArPjBEg=;
	b=jJ4LjNHn52H92GJCjnfvwtfty5gArgBdRaIisNaVW/w5xBnCq1Aa5OpFM02r9gZWUsmU
	 exIM2iPi+BoKKJs2ytiqWeRxQSi3bhZP48FvdNEEwCqtfhROb0dxyQpw3sHYBKkPJOEG0
	 Qd6PPgwCbwivhbk7lFyCfPvnWNafOWNRUoULXVinSyeqRb9ToUcATnosXjCsFt6iC2haz
	 HRGP+bS5IG9RNEyvQ5GvP3DioKdxn1mN3Plqzx9zznPEEQx3mA04c6DXbiQUAKyP1HJNq
	 2c6S5rQRzRAds32QersJo0WodG5da1hf4nVJHjthaouWsPY2hFyM5t/V4RK+NHVyshA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNTYIhWy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD1606A33D
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNTYIhWy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C0C1F008BD
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243249;
	bh=1HDtwLDGfSRrUZ/V7Ccnlt8XRob7ixLwnD6AArPjBEg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lNTYIhWyh0pZzKnL2tR9hpeq6ddbd8RQRirnojvBgYsvmM1l1rIJVGWiQamXZNFiX
	 2yUV1ul3sJhA0O6Laskk3E2LTKXWvkAPJTRVtRzsBD8WAMOilp2Ocb3C/d6zaof0zw
	 oMrHZndlwXz5TDjJqcIJFjuBPqnaqdevqnbvlXXpIZ8lRe7dmUB8FigPn/B/dwPoeT
	 FA4X9yTQuDUujEt3e/aV4PeYZj99NJ9+tI/RQr1ducpwBYr76Yv106CRVQnA9PVH6h
	 U89Z9FMuU6zAPVmXNCIQ35ki2rCJ/YFR+G5Z5KS3B04GcGfJA7Ir4v6WcqMkCMaIV5
	 PEVC2/O7PoZrQ==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4d198f1a591so560140b6e.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 08:54:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGHmO7AT7ChVbLHkOpzylqDBegcRnGstzBGqspZ0iDL7lNsx6ey362sw8DMn3dlM5zWsDszvEYXm2U64g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9s7Ugt1+7V5R2XEh67U9e6LQTxS3CHYHSYrXo3dhDvFafgJ/Fb
	uVgNg2QkBd77E/LzWMw5TEflHMvFTw9Z+QKsBJl3EtKscRRI8v53VnmqS1Uc0v4BxKcov4B+qil
	iJrRI0C1XDXMYb4Xm9tQ/Ohr+2ydeH+k=
X-Received: by 2002:a05:6808:124d:b0:4cb:f21b:6f8b with SMTP id
 5614622812f47-5683cd808femr133852b6e.30.1794243248824; Mon, 09 Nov 2026
 08:54:08 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104185659.884455-1-jernej.skrabec@gmail.com>
In-Reply-To: <20261104185659.884455-1-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:53:54 +0900
X-Gmail-Original-Message-ID: <CAGb2v64xKf-w_Zuqqpg3Y=p9PZw+hdtW6hCdsXjR4Gxp_=gWpA@mail.gmail.com>
X-Gm-Features: AclHuK_bYfJMnl5Ic49VL29CSJbv2z-P7IUwDE--H7P2QG7_ODWK-Rv_7ZMYaAc
Message-ID: <CAGb2v64xKf-w_Zuqqpg3Y=p9PZw+hdtW6hCdsXjR4Gxp_=gWpA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:57=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> sun8i_hdmi_phy_init() enables the PHY clocks and deasserts the PHY
> reset. When dw_hdmi_bind() fails afterwards, the error path doesn't
> undo that, so the clocks stay enabled and every further bind attempt
> enables them once more.
>
> Call sun8i_hdmi_phy_deinit() in the error path, like unbind does.
>
> Fixes: c64c8e04a12e ("drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
