Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108697;
	b=LlvmI5FQDjRhYbBsQXayRu78j8y7Bn6Of1ih6I15NKpQOR/b/2tArktBRTRnpB4vz8s+
	 gQh7AYMJjRc9Z9CCmiencTw1UqsAgLLGrROQjZAbN5w9v/COzAjhZqjCmygTQVS9REUzo
	 nOYHmgJTXF7TPnPO7dpq+qbVtdIOV5RhOa+da5R3iiqD2qI1KNglwEv7pkj+zTdWFvfY9
	 8uQntsxBiYerTjYIvjugCfx+fIeuBq897kgviQemRetSNcbFcUfXyEw33QEhvdXl8Iqiv
	 IC+XkKgJDmB03JzcrrY8FWUAa/91rPpvhyVxXAH4S+RYZXGTbFpMMP/TA57JkL5PmhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
	b=nV2E2j3y11cD5DYqIOIdIsTpYewAkWSdpeScjQ6VFrJpI82yPby7r5tsekH6SF8fMNGT
	 2HSy+VrVXVO94tDZyhqKvkvRKsbjJMtC+ETTTYxTvnChr/upgt+hITnmR/9eyjo5RhvZr
	 eqYH7OM0gbHRRn527YvEEeOIw8nN2+48RC/SlWMAjOQoyqFdFeV9ZXTLdIqe6hz0J9Mvm
	 YtficmVw5uewNDPB1bjyEGvFafoygv+GfgYGmzt5sldiBFu5VA8lDOASjEBM/OtiYHHZ7
	 ixStlaMbFwyCcOFfTY3hd2ZNMPxq/oitgZvJmDHRHyKURkc2yigNcYkLU0hOjl/vdxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dMRXVohl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC1606A320
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 17:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FC1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dMRXVohl
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-992f6d8cb51so593080241.3
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 09:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108696; cv=none;
        d=google.com; s=arc-20260327;
        b=TxFGMJsLmjanwIrlEqiUhJCwU3jiVDATcVXLaAOcFUFLUu7ddnPXvTkdh1Khf+KLov
         6Rz1RORvDytiAEqrvwkYyLDtKtrv0FWLmWTe4KkDaOGMn2AYTlDLtFHOypZ2yM3wsP+z
         T/kFieQeiSGsF4i9vRehDUV9Cz+z5Tuq/KxOkckHuF4W2jG26hF69BpMs2BRTur7XUDF
         r8LoH8a853dllz3i861HE2OL3nf9YQq2Z6Usp0u7xYXfAvxYS8V4/LKbAcaQQUO5Ltsi
         Fb9Whn3ycNBHLN7ARnyms7JaJM2TJ+unGdMecM1jWhFRR253M9l2eZjTxByyNN048oUG
         LWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        fh=A3waO4M2+sOlmG5bdS4lV/agimUisMIWzwHXu72Iv2w=;
        b=Oo5oFidwbQMrCge1zf6JukburauntpgOg0uD2dVeTGSm/X72Ri64dvnFujplwsdYCw
         bWjqVsPe8tdBnWbbOHoyTECekSjjt1osC9TLRe/4MId6C8X/KGQ9vR8btkhJxiNu7CIf
         AwfTvDJ71kiVN8GoHL19fAGgfIL8iIHzujEBmnzKGTswYIeXngLThITmQIPdt0hyL1g7
         /V0UP6cVKZK/ZPmeBSb4ubhaUJsAmDexMeq6DB97hYBP0qKMiorEUYczMvJ8tYkL9krX
         KVt29IIWiowiZFaueCRCjOIVoAfcQP41LVjeIMpR88Is4uDnHr4loT3HDYnjoK8j4XpY
         MOZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108696; x=1795713496; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        b=dMRXVohltaJMRL8i/Wdk3tipzCe08tHRp/atbj3kwfy+zX/URrgqrTThaSNOQOus0B
         NNXtzrKQgGB+/GPKFEf0D0s6VhZlijyFErmdVwDM9nZqZIIZwZ0UEXS1Svw8XbjadX+0
         vU710DMb6vbCpwVrk109t8zvUDfKzJqHlaTVdLXxOfhjw1xXBuhBZSNZPL6NpTjzS5hM
         8bTJI+P+VkKTvO4jQ7VnWmKa0M1RSEqlO0rfVPskuITgAZb9NCpO8aAxufDcUQEhhUVH
         +KPgb2MBwXEKvDBALaPYJnRPp0fe8FnFJ2nw0dyhfkiLSTudh0HRKVnD1+yZbJHcUTUB
         nftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108696; x=1795713496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        b=P+6sDs5MrXVZKtkzP9aXpr80eXMb91LHe1uGv2QstCjO37NMkVVBah+FJnJF0IjRxB
         oeKAh+AlNhGf24ODxJkGGmDEX9whaoa63l1ew9ab+yzrUvf1v1x7FXgKbjeaUJu9fsru
         eGp6+afu2d1GsUnckABrPiZMbnKp/SHIbNwdhTM3DyG6slMeBSLfwFxWSuueXMAhZbkA
         O5hUh+KJv4Y4Z7Q8Lp4/CP+BIGZjPeVeMmkPMq1dDAP5xGlaHasHE1ekgnWDmaR2vz4o
         UUC+oZivYUPccFfsADxP1PPPcjmrnIlCfuzKbn5FKZTm2s+/1qqZQvNWn0usdHDPIuwH
         u5DQ==
X-Forwarded-Encrypted: i=1; AL+hErFcBT1Ia/Q59KQOG2xrvURQYIO04djnXuhLj3JAAGNzAV39JyxwDaVzWCGra0sFm5cBhSHngCJ2CnIsvg==@lists.linux.dev
X-Gm-Message-State: APuU4Z//Ilfd92tYD92Ee/uK4hZmLiWSQElu6rN7SaJ0UPw61vZEMnLk
	FdFHsWzrUTkCLv9w1zPdwm+ygVPbZPySc3N4CdPJ6oq2KqDcTcIGGO+FkyVQUR3a4MUByzAQly8
	DAv657cS17QsrkCe1ZtvQ1YzCdpaSag4=
X-Gm-Gg: AYBFou2ZA2c23zlG+iiZkF7O3QLKDosgjP5ENv4mx7fT9FTcezveslFmUwNal+qQwir
	e8H+H17xp5jlu6HFHoxo1pXpYb7WHcyN0LRVYbdeGRZ8wxMDSfdhlfhBzLyF8RTkXdQh0kU492W
	2yujRe04X6y/S3tk4hdjVnauM31No3maCncn7PODyzKXIl1Nxj+M5I2z/Lo3elcA5V9drn2KDRx
	8B5JL+IqsHGvERP+Cp4/KRB9FpPZcei8GlVwtyp3Ik7YoHv2OvBVKhIQyXWoj9B/PE/TVRsHKbe
	QGiOaWBSmL96j9Ms4BxL5SSLQBMrf0/otYuEhHk36SHDSTMxYivbVP6XZMEW1IOlr0QqBiiqk1L
	mmrX0foSH7ucutZ2Qpsl9ixriRpgl5SzDL6benzqpRaWPv9eUp+4l6+iGWsMlaAo+ibVi73D14k
	klBJlW2m/vVuZ/7unuqftrtpOWaVarUO+dhVzAPnkH2FD6W75SHjM3wRlRN9U55Zo76Ll2Du/9h
	thXt3v2AfxgEm1MDxlExnveyQVX6w==
X-Received: by 2002:a05:6102:5813:b0:7b2:508e:3d57 with SMTP id
 ada2fe7eead31-7d72b3688c2mr101327137.4.1795108696380; Thu, 19 Nov 2026
 09:18:16 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179497442968.3136.18415990643273213851@kernel.org>
In-Reply-To: <179497442968.3136.18415990643273213851@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:18:05 -0700
X-Gm-Features: Aa3M54poH74flJHm30nVUNh5kQyVyqEvjxxcHU_6uijb8f_Ea6AWdb-4l3_B2EM
Message-ID: <CADvTj4p9bBOTCk5xbiVMRtcv5gL3L8Nn2Umxm4i5VD_6jJBbNg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, clabbe.montjoie@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 9:00=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Clearing EMAC_RX_DO_CRC (EMAC_RX_CTL0 bit 27) whenever
>   NETIF_F_RXCSUM is off may also turn off the MAC's Ethernet FCS=E2=80=A6
> - [Low] When RX checksum offload is turned back on, frames the sun8i MAC
>   received while EMAC_RX_DO_CRC was clear can be marked=E2=80=A6
>
> --
>
> net: stmmac: dwmac-sun8i: Honor the RX checksum offload setting
>
> Before this patch, sun8i_dwmac_rx_ipc_enable() always set
> EMAC_RX_DO_CRC. With the patch, it sets or clears the bit based on
> hw->rx_csum, so that turning off RX checksum offload through ethtool
> also turns off the hardware checksum engine.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > index 2ece7ba9dd73b..98cc7503bddeb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > @@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_de=
vice_info *hw)
> >       u32 v;
> >
> >       v =3D readl(ioaddr + EMAC_RX_CTL0);
> > -     v |=3D EMAC_RX_DO_CRC;
> > +     if (hw->rx_csum)
> > +             v |=3D EMAC_RX_DO_CRC;
> > +     else
> > +             v &=3D ~EMAC_RX_DO_CRC;
>
> [Severity: Medium]
> Does clearing bit 27 of EMAC_RX_CTL0 also turn off the MAC's Ethernet
> FCS check, and not only the IP/L4 checksum engine?

It doesn't on H616. I sent 100 frames with a deliberately incorrect
FCS in each setting and checked that bit 27 changed. With normal
filtering, none produced an RX descriptor. With error forwarding
enabled, all 100 produced descriptors with RDES0_CRC_ERROR set in
both settings, and the driver discarded them. All 100 good-FCS
controls were received in both settings.

>
> The bit is named after the CRC:
>
>     #define EMAC_RX_DO_CRC BIT(27)
>
> The probe code says the hardware features were "copied from Allwinner
> drivers". That code sets this bit with the comment "Enable CRC & IPv4
> Header Checksum". The Allwinner manuals describe CHECK_CRC as "Calculate
> CRC and check the IPv4 Header Checksum".
>
> On this path, sun8i does not have the hardware strip the FCS.
> stmmac_rx() removes it in software without checking it:
>
>     /* ACS is disabled; strip manually. */
>     if (likely(!(status & rx_not_ls)))
>         len -=3D ETH_FCS_LEN;
>
> The only FCS check left is the hardware RDES0_CRC_ERROR bit, which
> ndesc_get_rx_status() turns into discard_frame.
>
> Suppose bit 27 does control CRC calculation. After "ethtool -K ethX rx
> off", the path is stmmac_set_features() -> hw->rx_csum =3D 0 ->
> sun8i_dwmac_rx_ipc_enable(). Frames with a corrupted FCS would then no
> longer set RDES0_CRC_ERROR. They would reach the stack as good frames,
> with the FCS silently stripped. That behaves like NETIF_F_RXALL rather
> than "RX checksum offload off".
>
> Is there a datasheet reference or a bad-FCS test showing that bit 27
> gates only the L3/L4 checksum? If the hardware ties the two checks
> together, a different approach may be needed. For example, keep bit 27
> set and, when rx_csum is 0, stop discarding frames whose only error is
> the IP or payload checksum.
>
> [Severity: Low]
> Can frames that arrive while EMAC_RX_DO_CRC is clear be marked as
> checksum-verified once RX checksum offload is turned back on?

Yes. In a separate test, frames with bad UDP checksums were already
in the RX ring when offload was turned back on. When NAPI processed
them, invalid datagrams reached the UDP socket in both the IPv4 and
IPv6 tests. The driver used the new offload setting for descriptors
filled under the old one. Changing the order of the register and
software flag updates would not fix that case.

>
> When "ethtool -K ethX rx on" runs, stmmac_set_features() publishes the
> software flag before the MMIO write that re-enables the engine:
>
> stmmac_set_features() {
>     ...
>     if (features & NETIF_F_RXCSUM)
>         priv->hw->rx_csum =3D priv->plat->rx_coe;
>     else
>         priv->hw->rx_csum =3D 0;
>     ...
>     stmmac_rx_ipc(priv, priv->hw);
>     ...
> }
>
> NAPI is not disabled, RX DMA is not stopped and the ring is not drained.
> Meanwhile, stmmac_rx() may run on another CPU and read the flag
> directly:
>
>     int coe =3D priv->hw->rx_csum;
>     ...
>     if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
>         (status & csum_none))
>         skb_checksum_none_assert(skb);
>     else
>         skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>
> sun8i uses normal descriptors. ndesc_get_rx_status() never returns
> csum_none, so nothing in the descriptor says whether the hardware
> actually checked a given frame.
>
> Any unchecked frame still in the RX ring would then be passed up as
> CHECKSUM_UNNECESSARY. That covers frames received before the writel()
> in sun8i_dwmac_rx_ipc_enable() and frames received just after it.
> Before this patch, the bit was never cleared, so this state could not
> happen on sun8i.
>
> Swapping the two writes would narrow the window, but it would not cover
> frames already in the ring. Would RX need to be quiesced or drained
> across this transition?
>
> >       writel(v, ioaddr + EMAC_RX_CTL0);
> >
> >       return 1;
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f%40gmail.com
