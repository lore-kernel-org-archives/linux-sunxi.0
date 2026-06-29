Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415B44508E0
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 16:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752060; cv=none; b=i4O/1KXEaE3kxsZKaFlk1UuJwAfYV4QPzkACzlF6NhsqC+pjQHBu5JB7NQpKS8m844OTdCBcByxH0U+23pCds92y5dgBWwo2zDxd+1HBDb9U3xCS7ZtbXWc3Ynl0g+IpHK+2LmXFlftsC7hx3CEZWzVGQscCAjiILcrYXY+ZPo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752060; c=relaxed/simple;
	bh=eE8NJJlLWJmGLS8Mjp0uHMgdO7h8J7DYtf3wXUf3DU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0s6hLBjX9g4lfjq8jMPSngTqMPQWXpECkPU9SSfFx16OqlkVwaiDXEBOR/n2J7nklAL+yaIGu40G74aV5q5RcoNL8twKXs/NNi+g2dbObxjlTsQuOEjV3IHUtv5qlHsY4rc/WUHpI5y7Eipegv+scCINMV8KwVpV4EUtA9ZJhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU6yw4vi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU6yw4vi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDA61F00ACF
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782752057;
	bh=nrtvzAHL3u6/v5L5E9Co3P0QE5xowtwOQFIomSwMWjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VU6yw4vi/RRqYyWmik+ophl6nA0c8MnAaB4uZgFM8rdu55rY0XTPMwCA3TM7ZXD5R
	 UwZfLfWFeodA0bYOFuYa1wJDVv64WoTbojo5Afg28wzXp2kqwgyIh2Ja8X8cU/2Ew1
	 9HzpWW0Rp9sYeJiAKE0DzkK5sYnhpV+jxfsGH4rJWzSYFSGZS1jh0dXIEwi0tva032
	 ShGhsjNlhGZmAW6P8xTwC1Q6R9dKRgMqpqxRRpcHKjEnIB1Xg2bGgMj9Xpe+KGnYn6
	 xwr5h2s7pxdndsZu5yhoOgfIn0Rd0VhcIvv+tr2GGf22qMReEbdIn5nHN5j/5aau8x
	 bcQ/YTZ9D9GiQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39ad9c80fa8so27092161fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 09:54:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpT9gH/MrqpeVS7XkLrel3jTnT/yQ9ru29641MyJe7aI1Zi1esWRSD8o954N9e7RkjOBeuk099rzgFSqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrJTlOg5TVcADvqQ6PXGTnfgILeHVy8xQP9dKhtoFTUnl4rhca
	f9B6WrPB2QcyhE/od05hMJxdMaNkbAfV9O+qh2qqhw+lcU7JFqpihdtZ222GzwnbuzeA7D2sIxX
	RqZCnv20JNRBiUI7JttvFgl/y+uFSHX3SiDnh+vBuHw==
X-Received: by 2002:a05:6512:3d19:b0:5ae:b97b:f75a with SMTP id
 2adb3069b0e04-5aebdbbc205mr24885e87.55.1782752056582; Mon, 29 Jun 2026
 09:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com> <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 29 Jun 2026 18:54:04 +0200
X-Gmail-Original-Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
X-Gm-Features: AVVi8CdXDDErrbJGCmrBnsO12t_UfV9Z0jI02dBWCQjihPCNNCZY7ROJGiFNTUI
Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 4:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote=
:
> > On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> > <geert@linux-m68k.org> said:
> > > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platfo=
rms.
> > >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> > >> managed by firmware over SCMI.
> > >
> > > So why can't it be reuse the DT bindings, and be compatible with
> > > qcom,sa8775p-dwmac-sgmii-phy?
> > >
> > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
> > >
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii=
-phy.yaml
> > >
> > >> +  power-domains:
> > >> +    maxItems: 1
> > >> +
> > >> +  power-domain-names:
> > >> +    items:
> > >> +      - const: serdes
> > >
> > >> +examples:
> > >> +  - |
> > >> +    phy@8901000 {
> > >> +        compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> > >> +        reg =3D <0x08901000 0xe10>;
> > >> +        #phy-cells =3D <0>;
> > >> +        power-domains =3D <&scmi7_dvfs 0>;
> > >> +        power-domain-names =3D "serdes";
> > >
> > > Ah, this uses power-domains, while the existing bindings for
> > > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > > I guess the clock is the correct hardware description?
> > >
> > > Adding to my list of examples for backing a hardware-to-SCMI remappin=
g
> > > driver...
> > >
> >
> > Russell King asked me to put the PHY logic for SCMI pm domains into the=
 PHY
> > driver instead of the MAC driver where it was previously. Instead of cr=
amming
> > both HLOS and firmware handling into the same driver, I figured it make=
s more
> > sense to have a dedicated, cleaner driver as the two share very little =
code (if
> > any).
>
> I think you are mixing up DT bindings and driver implementation?
>

Ah indeed, but the bindings don't share a lot of content either.

Bartosz
