Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791029;
	b=yzWnwXhUdVfMvuscVnXsUOfhy9ZZfBknKtRvzrHwrnE32GplHTyan4qspCl7wW0XEVN+
	 0YnKXDOATyEpOtoEwwEdqEtbMDDAQHDrQyBlWblJGu9/R0AeEXCC3t9Zzrix0wEekGc5A
	 DQRhk3aCBoUoqCixUR751FUUA/fDyGshm2Fz79vJH3LfUs8yJY5Q1mVCenCTL00gCscAZ
	 xvFEPP6e7EPGmigNXniY5ng1vLiiA/WPA9rfrJKioEWFjQPRrZRmyGaZ3MvT+e/KZcvfm
	 oG27H6M9o0pDzYMj9hIpzGpTu5ErtlTequQ+M6z/z4UGqaTLV+VX5JsBUuUG14w5Ukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791029;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3jNoWnulbrsDpVqqs904fRidVqIbZWsGQHKPgCx74o0=;
	b=nGAzhuac58gmmKjxKMWF5C4IaHa+QQavbpvTRaAJjoGBpj61jwhmTNoFsYf9bLFb+b1j
	 fcpREttMaU+XIPmcYmkukwZF3zQlv3L/JYgTFj3HF6nozBh0ENMNXybTF1DcCWC7oRJ55
	 N1VN7kdfeG87MhyVab1bHHhFxiu1NnY8VI0eQvTHqFjKtlth7yvHDGjHd2SGThLdwd/MA
	 T6FHx09vybhxYrTHVCnr95n93jOdUMRrjaG+BP/p2MqT/7C0V4RpLX45nuf+sl/vsAaoo
	 oCdp/i9aOPO2ANDW8U+UoeraBv+kfMTTaz+YCHnGN0rdlSTtGsG63Do4uRZ4kalbHPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asvmTp1e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBB606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asvmTp1e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722311F000C1
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791029;
	bh=3jNoWnulbrsDpVqqs904fRidVqIbZWsGQHKPgCx74o0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=asvmTp1eHdvI/IZXhgvTmgWBGVGWINsxFfv71+oro5tsHYG9zv/HhjEIicEE+VfXz
	 wWDsg9tMFeXqveIKChi3wbKSCL9rVkS5a39EVtZBJu9VHHItnWI9nS1Kp/fAIUDRFl
	 sr2H4J+FeZKJNkfqnwwjRzgmyEUkPEFqwkS2AyozNYOD3Bb52EWAxnjQ9mH0q+H1lb
	 5YFqJLdstQJvsMU+PE4CPe+sP/2cqiTGkMSLJjoQqi8788H/LPlMeLXZpJvFd/aRDb
	 AvzT05/HWtdV6qQ6ZN0pvu90wxtShu3uUc0nri5ZkNZ/iRrbwi8w6QjSrWwYMuu+Xp
	 yWndXD6iO/xaw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c31cdbeec9so2967045e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:50:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEC0ISrbGsacjKtJmvZz7k1SU0EvQtjUitRw/KqZ20HNxpGwmJzaApsgoLLFlepC6lKpZ1syqBFBlGiqw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MXsCfJThZ1yi7Ez3DSG+8y4m/UxkDRUsngQNyHSBIfcX5itO7
	ePFOwSWUuugp9HBs+TRKXDcSkSbOpLWs8J4s3FxwaPH+2IYLx+1Egl0lg5tXAS3DxjRVwiyY6MS
	9+0+RHo8nN+36Fmf5KTDhCo/NHLGWOck=
X-Received: by 2002:a05:6512:2353:b0:5bf:c3e2:41c1 with SMTP id
 2adb3069b0e04-5c1bc809895mr7113918e87.44.1795791027796; Fri, 27 Nov 2026
 06:50:27 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261127080649.1982883-1-alastair@d-silva.org>
 <18637573-d20f-4a58-9e63-6bf71b015cef@arm.com> <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
In-Reply-To: <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 27 Nov 2026 22:50:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KRdVqauuJ0F-fb3Fvtx5HJqv-fUTaFJS+xEsQ+Wb78w@mail.gmail.com>
X-Gm-Features: Aa3M54oOaQujivp7_3Q1utEL14RKW5So41dM2VxpASzKJxC7DwsjG9miI_JHOKg
Message-ID: <CAGb2v65KRdVqauuJ0F-fb3Fvtx5HJqv-fUTaFJS+xEsQ+Wb78w@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI support
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Hans de Goede <hansg@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 9:58=E2=80=AFPM Alastair D'Silva <alastair@d-silva.=
org> wrote:
>
>
> On Fri, 2026-11-27 at 10:03 +0000, Andre Przywara wrote:
> > Hi,
> >
> > On 11/27/26 09:06, Alastair D'Silva wrote:
> > > This series adds boot-time simplefb HDMI support for Allwinner A733
> > > (sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
> >
> > Where does it do that and which U-Boot version does?
> > I don't think we really want simplefb in the mainline DTs any more,
> > unless there is a big blocker or delay for proper Linux DE support (lik=
e
> > there was back in the A64 days).
> > In Jernej's HDMI series he hints about A733 support being pretty
> > straight-forward with the reworked H616 DE code, so chances are we see
> > proper DE3.5 support in DRM rather sooner than later.
> >
> > Cheers,
> > Andre
> >
>
> I think the blocker was firmware for DE for this SoC - it can be ripped o=
ut
> of the Orange Pi OS blobs, but that won't be acceptable for linux-firmwar=
e.
>
> I'm currently reverse engineering the GPU firmware blob, it's not very la=
rge,
> and is a well understood instruction set (MIPs) so that may be a path for=
ward
> without the vendor contributing the blob to linux-firmware themselves.

GPU and DE are completely separate blocks. You don't need the GPU to have
display.

And slow down. You sent out dozens of patches at -rc5 (closing in on -rc6).
Realistically none of them will make it.
