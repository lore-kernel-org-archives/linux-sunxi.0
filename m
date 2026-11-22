Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366585;
	b=BcAwb9hKwmN9jhV8xiBzFRoezLOT49tAujxVVxbCBzYH/bqZawsiuAFvKa0qKh1PLOy1
	 dXaPyi2oO5UWRaA+qNaMiz+DtNitYBrlOGma3bsfEsbGgjYjqbxvX4JSHqrT2TOwSDl8G
	 9BIEetpPIbGVAM9fJ2vOu1G1nJrhgMJNZ/MGnnAcZmn16c16+GCTXUaLRwpU6qPdgVWlo
	 5BjodrN0hwZ1D9M+hV3diBQz7to6Egvedw9Gi8eUQ3bmrfsZd740qS3BpaClq5dQioDVM
	 iwdDYwJFB9TM8BhLxD9E1KNA0QJJzrYOwKvAPVNFN0o63xPLc7KZqxMTUe2IZk/EKUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366585;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r0teGaLFiZbnip2X0hbOa3BQ614Td9G1LXhr62qV31A=;
	b=384gFX/RBRDFRW578fLbz6lMOtOeeg0j3gGx5MSMXvCpyyt5twANL75mjSnn6D792tur
	 Z0Wolwyqbztgu7dTLtgJSZdCIIzCRwC/MZAeNI1DNJKi2wsMnZ+amj5O/3MI56kvnh7K7
	 bYDfZxU6Mw6gG/6AS+F7p+/Tnwr9rBz3mkAj4aGJC8ZKvP8NnxI0cKcsP6aZZdRMBux4c
	 6QAg8DpDUryBVB4XNUBcerR1aGRNo5tCAOGrviFc1upCCeGYTGdJY0rinmAFiaFe5fS1M
	 Vh30Hpjhj0UW4aN+ZMZKw7Kd1lL1keG64bOuaGSZS8GbDWpdLA2BZPhymOEEb0YgNwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUohEqQH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98A606A32A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUohEqQH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0371F000CA
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795366584;
	bh=r0teGaLFiZbnip2X0hbOa3BQ614Td9G1LXhr62qV31A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ZUohEqQHZSFC/64bYg2uf7z2xhayzkxTB6MF49gU9OZp9iFnDYg1QyEMGRWipn8S1
	 ILAD+xbGhrU1Z1zu5k0r6tkQ/RRTPnHNM/dwaPDWOmIdFQNiaufWQNilIuWRcckpXD
	 oHSb2N8vDrUfwRoaZ9PsArpHQRz+ikKjZutJuOICcDDZgPaKkDx6B/LXT0T9+DoGy7
	 TsqaGUhwFRZTL/wW/OHFyw161X8LxQND8HTzN/z8fRZsuvsHpLPipywWd6OhLoZyzJ
	 8cLTLfos1iCfsPLTKXnK9nnJTeWy2QGb+mrO5hNOpC8fempSfe+i3i7xc28/TR/ZnE
	 VLBxx+TE4zAtA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab4354db11so24258671fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 08:56:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEqVpZbDc9eHvcOoFfg5qJX7krao47LaeeG5I8lqBdTMfHo6ORS+UbuDpAf7/iYVQiI+FZej4QbMGqZJw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+xiz6qSjs9R7iuBs2Zmf2Fnk1sy9dji1YMe6OhaChHt5ALEStd
	j0uZo15nC3oGF+jwyvcFe0nTcW9VHQxXUZGUqDWikkbRO7ERPWtwCu8JSZdTKt8bjwN3ZKvY26S
	kMWZD2daWwbfajTXLAcNA4tTqA/3rCUY=
X-Received: by 2002:a2e:b8c3:0:b0:3ae:6f2b:6caa with SMTP id
 38308e7fff4ca-3ae7f9f6483mr26598401fa.11.1795366582998; Sun, 22 Nov 2026
 08:56:22 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-1-c4081e5b83cf@gmail.com> <d3af70f9334370a1d32511504aa14725@tipi-net.de>
In-Reply-To: <d3af70f9334370a1d32511504aa14725@tipi-net.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 00:56:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RZAVX6FNV_y+TO+frP9RBCURZbW=B3Ws2_4f8f+1acQ@mail.gmail.com>
X-Gm-Features: Aa3M54oulFi-3Qjl1WQec184X79yaVwtpOneI4puTLfYjiDU5sNNxxTSKipqNJ0
Message-ID: <CAGb2v65RZAVX6FNV_y+TO+frP9RBCURZbW=B3Ws2_4f8f+1acQ@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: stmmac: Limit the MTU of normal
 descriptors to one buffer
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: aiyengar1990@gmail.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 12:27=E2=80=AFAM Nicolai Buchwitz <nb@tipi-net.de> =
wrote:
>
> On 22.11.2026 10:13, Arun Iyengar via B4 Relay wrote:
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > Russell King noted in [1] that max_mtu for normal descriptors,
> > SKB_MAX_HEAD() (3712 on arm64), does not match the hardware. Their
> > buffer sizes are 11 bits, and stmmac neither splits TX frames nor joins
> > RX descriptors for them, so a frame must fit one 2047-byte buffer.
>
> AFAIU TX does split (jumbo_frm() in chain_mode.c).

Yes. But it also assumes each buffer is 2KB or 8KB, which this series
already says is not correct. (I do wonder why the size field is not
size - 1.)

And also, if I'm reading this correctly, the jumbo frame conditional
is only ever true if enhanced descriptors are available:


    /* To program the descriptors according to the size of the frame */
    if (enh_desc)
            is_jumbo =3D stmmac_is_jumbo_frm(priv, skb->len, enh_desc);

    csum_insertion =3D skb->ip_summed =3D=3D CHECKSUM_PARTIAL;

    if (unlikely(is_jumbo)) {
            entry =3D stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
            if (unlikely(entry < 0) && (entry !=3D -EINVAL))


I might have pointed this out in a reply to Arun's other patch, but here
it is again. This seems to have been broke since 2014 by

    29896a674c8e stmmac: fix chained mode

> This makes RX the real limit as ndesc_get_rx_status() drops a frame that
> spans more than one descriptor. Please say that instead, it should also
> answer Chen-Yu's question about hardware vs driver?

It's great that we have interest in getting this working again, and tools
to help us get there.


FWIW the the new "GMAC200" cores in the latest Allwinner SoCs, and the GMAC
in Rockchip SoCs would also benefit. As far as I can tell they don't suppor=
t
enhanced descriptors, based on DMA cap values reported in debugfs.


ChenYu

> >
> > Limit max_mtu so that a frame with two VLAN tags and the FCS fits.
> >
> > Link:
> > https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.org.=
uk
> > [1]
> > Fixes: 48febf7e6476 ("stmmac: allow mtu bigger than 1500 in case of
> > normal desc (V4)")
> > Cc: Russell King <rmk+kernel@armlinux.org.uk>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>
> > [...]
>
> Thanks,
> Nicolai
>
