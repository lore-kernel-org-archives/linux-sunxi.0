Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751503;
	b=Em/ZKcplPptSZnvLp5iE5Or2pjzEOmV1EwrgRAP0n2SxGbLMdAoddqvpM5eBTRLwRX31
	 ArvoxCHbdkOZOB3CEo67y6/3QSafKumeQuoI4F7Hoq6+O2FDespBkSToB8JWAWti7mwCJ
	 lIfzvoLFn//RfSVHVFxbbKrtyfO+g9rF1p3x+SCDDzvp1tmGjZ8qo0MmZtf+3wxxWo3+R
	 thgVBT2fKadsgryFpiv6TymQdtt5RX/O+U+M2cJZs62P3qYgDqASiSaF0qDsDWj1Y62zp
	 X992Mx+qiviJ6XrIX4COcWYf8v5b5duWPNmZknONM8GsbETNHNgzNX54iCF4zY1VNkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751503;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	b=P+zYj1+j48759oLcPKN3bnFiESK6m71maquow43EeYiDDIA/nbGQ/7fYGSXHdrh9sV9Q
	 7Ehkxsfd9WTaQyhcRHGluyXckPprgmA75qJEdbe6qJSxl19HmYwPgnLcNl6PUMFBHVLXx
	 uj27NqwOVohaaQ9/UjaiKRvhk+It4zpmVWKTozfE7SVxUuRcpf5b6pfKLBtRG0vUY7Qma
	 Roj+ws1pW+DyWaYoUOK6w+KAzjdw9CpVsR7qDqvzl4/jurK4ks3dbpDbQ1j7sBFhVGQ7X
	 yl4723dmwFCvlQ2nM4vIWyOKObJ7kWtzfD/XRsYeNK6wWSRdV/dVUyF+KP5i2sSb0HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHmikIoq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C45A606A31F
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHmikIoq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DCC1F000C5
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794751503;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DHmikIoqoA22jou79nFPP6iVVKr/WcDGON2aE4C8Axj7L8F3fkMNUoZYTdklMRKXG
	 NK7tyA7Fr3XZD8iHHH08E3nedo/wrttTJTg+tXtgk4OC4oQzo1cS5LJfD8tw8+pxR8
	 Ra7wLraVk3W2vsCxI1CjtIwSptBSqIkSycIMbG3lTTxD9d0ccAovYYlEEqWoGW0h2l
	 p0N6ZDFg2U22SOOx96Gl3h0kWiGDck8cKBw9oriP5k14J5egXlPMnfIgj6pLhk8MuB
	 z3fNnAQZ8ETyO0lwv22D6FIr/ErOsFIpP1NK6ROiHzWWbXelmSxK6A+ucgy/yAH2p/
	 pSX4yQOq885Vg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so2868416e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGy7lvB6dUv2qP7fR3bvdhphIx8q52vBggJjGv7i8uaHgFVYzDHnUh5+AqROdsQWM3UsJczbrmIpnmGXg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8kH8cPSB7IkAZFsX4hRngVp0vRKOgu4s0s416/goVjEgVIsIHj
	1xvNO+7O3JfeLBXDG5Aoyl2eFLwItrHb7m9rrj7oMDC0WZfDeExTVEh+maoA/GI4z6XKYhvczDI
	icMlkQa9JpQJA9ipb3rSFnvhz+5jYwEU=
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr25507651fa.16.1794751501306; Sun, 15 Nov 2026
 06:05:01 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com> <20261115061102.229680-5-jernej.skrabec@gmail.com>
In-Reply-To: <20261115061102.229680-5-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:04:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
X-Gm-Features: AclHuK8_QfEct_D3A6zPG8V_CU046sWNEFKONymgEnMQSD9bb71yZqe8AOLlRsI
Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.

Somewhat related, but I think you also need a patch to block fractional
coordinates? IIRC that also uses the scaler.

This was flagged by my review agent, but I vaguely remember it being the
case from working on the DRM DMA helpers.


ChenYu
