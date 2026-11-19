Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795131192;
	b=2gRg/1N2KrV0HQXBq2ff2juJRLIYH9/sL6mpM/8o73b5fB6GwbYTH9T4pPnZ1Q0+IgEK
	 u//Xn3yXCROayamU0+7vSInRcH698FIr9PIq/BDJTLiOcHZ1hCAXKb1Is4Gw4WkMxVwQ5
	 WBoYIaXnjaLOWYJriNHTF0gWg3yZPF+wJ7sJ8qEmbecuQRFBwt+loUnbL5Sh+YFIHLZKW
	 c8LT9xyyF2dnwgJsHdaCXutMPX7WTXgXxNGzEAs0MXzwvnLUTHSGKizHIWwdZ4Aani7t1
	 dN5JGEHcHYmpit1jJhpBm5IAq+qYghVizve5qPwB+4s8I8c5zlWvkYjxG3Lu2dZxwbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
	b=j1yiAtARnR1zDICUGY7qEIkH4KPprdmtOc0WOgKf6/tGYsDz6Y1/cabP0nE81RWRvIf7
	 9EIkyLkrc2xLx4TtaIiMNyJlDym/atba9EzktEYBE0nP0Zxl+Ql1xDhdyiBviwBRQB5cP
	 EcCMUH9RpOREjiDEar/QFQF2F3PDMDOAZcMDC9O24xbwxF5UBkoCILmaTy0zEUTiLmo0j
	 IzFJRUV8QtPyiLv2W1krpP/doB5ZCoeca0opVHaslavuz4amcmWOJlDWWa+WclUCHBOrS
	 hGbwBIdVSxH22CP3rt/WyoSbFZGUKRoW395V2PGILHc+xq8LKDpOMmoEG9HLcJYIGBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p6Sihay/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B968A606A325
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 23:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B968A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6Sihay/
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2db6408cfso221496137.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 15:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795131191; cv=none;
        d=google.com; s=arc-20260327;
        b=H4ynSBs7HjLXQvJtOftNOgZTtQ1hVOMg+H96c2IgKcw80G2+aN7Th6gjhmmEt/EKgJ
         cj+ZMI9TKnd4Ja7w42XyjUixgtWRT9PmEBknN0dUJ2WhMwjftncoHRQx/+typfB9Gq7T
         fn45JXvaYf1ZLwYA1kTGD+xw0eVd4pSQPdclzJYFg5lNW9IiDKzfINSHsMIDSsWK5f4w
         bjV+JDI3bVK+i5vDGb/zdSLLawC5EMQY8V8EWqlC7B+2nzI/Pjw0CkmfOY95cTpxAVMo
         2m5GhX8/C4+SgwQYGDg306HOgKyM0LHGHzAbLw8yYk3l161onDJZbqptKpfYeFSX7SCo
         qimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        fh=8W88RHgVRLpIESDomJnzmUEe4JYrZlmTBN1BDN3jldE=;
        b=C3NYxs0xeWBzXHw3yn06lVdPG2IZE47pvZxEprAFXi6K1FWnttdZEwZx+CQlZfwy2f
         9XYrzweoXzJCf+oWS7sTg5y9ELk8EpwptAnmw/+EUG6LY5lWgEgDN+eHvFDwH2AXM4+X
         gCiofDZBpM2gnK34oZg5B7Gi126S75OHeKPYzD6A8lgwHHODko4q8v1vt+gyrkGANgMx
         VsdXM8sIjpcC65CJW6jAOIQHIE8UyQbnQ8oJbJ+FAV1CYvMzUzpuEEm7B/IEPPn2XE5a
         YKadXjOtWR8fapT1l9KLyZYz+adWbbePS7fQ5gIX7Mamsu2rJRPwYKIwk4RA3smVJC1W
         jcUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795131191; x=1795735991; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        b=p6Sihay/n9fKKH2DSFGOhF2ZwNgWJ9O7deSEiNs0Tgh0D9o/y419x1LfhSCJGCkXtE
         2vu61AuYE0o8gMEmc8cUNeKjoeMc4ufIUvy8IMen+waLT5EPSOgAEwjh8IrHuccQ5J8E
         uP9kuyDmni6oqMJjW1QznMhbJiucjzpfGaZvIuYSLYILCCrgrvfhcXFoHsydTTfhqRnz
         Xka281IB+Ns3FiWUqli98371A7hP1sht+S+voKYG+/bjpDP5PqQBZLmkpwzktHxVej3a
         XSrc2Gg4SG2EnnYLdJlYfhx8uNSCV+wmuXXd2PvQL0FRPJsmgnZmrhPzl17MAJkhAzMd
         lo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131191; x=1795735991;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        b=hlINNK3A5BR7oGulsmPeKb0CYwRbkwa4AGvPd1wzWZXCnHUzd22OWlHEGeGVdQWQNO
         DMW9yzz/s8gW4PZjGd/Zqh7HVDqBHeVaBrKo6CYkkOdyR+EuR5FAZlsPhs8FmxlTlUwz
         biBD7R3E0JblkHl08qissAVXlg8LgbnA1YX6inXFJtqRZSTJdh/NmjgHgIdnH8UJh+fi
         UnfF4HwE4pdIrpXnlrb291l3zOR3Uobtme2RjBLNeZGXjla0umAG1L5WYf2s0tm8YBnl
         vcGhuTR1sV/Aon0IyZa9xA2dUE0o8UUjy/qQPgQsyWZBJYqwBixyBrhPlI6fYYLopZKs
         i/iQ==
X-Forwarded-Encrypted: i=1; AL+hErGgR7eUukFnXGSBnnP54Mzqiwp2gkeoHbTfIZ6TOWKE+ap7aohwX9Q3wHNB8F2ZooqjMjEBTu3e/nCTew==@lists.linux.dev
X-Gm-Message-State: APuU4Z8FrOkHmrAQKjrB1zL1S4yylfpYVh6+YzlV+OzeoE6/hBiAhZlB
	0NvjokhseW3quNo8wxFqVxgypwHshpGZmg+N+DQUNAuYpAtAvhrDefBrt+PqoZmmr075sqsSZs9
	UuArPGXdD/MlgdPRWTwjxrwNxQWWWI8E=
X-Gm-Gg: AYBFou06Z0BesFxRN6g6/2K1iqwbwnKkG4PY81mS5V4iOt7O40O/juaHzs+ieeRCZCR
	o+i23LQsBB58+HZYpupf+Z59wr1ZEYVd1Qs/fZ+CVIRdBld5WQXYHCMJTJHoaVfVksuC7cQkSfj
	2Xbg+FAfr/hqyyFHXyGLPIe7HO4g/SL5kjYe+1V5rRPIc2o0/CA5R1qZj8Nxf0PAFeNJvHlAkST
	iGBKNM4qcJXf34KvX85nF2F6KSXO0LvweS25iW49ZrUmBcH/HvBvr33hIo+BNtjBcOFutZjiL9K
	E/dZKnzonZmEKM1HxCHFqlqv24I9J5WGetEdtvZToVWN22933+C5ryMlgQVwOIRzu48WwTQeX99
	CxInmUN5A9fVCB9XZi5G1EEmpyI7H3EtvOSEOfqGDNA9RAnUi3l8BQK+Zh5kG8CM2dBqzOLJtCf
	HejKlxqP5p++Pk70lItH5xx9uzvyW19Vi41SLIOGhDIsPYt83ggxXTGA4WXNOjNPBCZh4m+cOaR
	9ws/YUPgA73bbhacD4DWYPqS4RJYA==
X-Received: by 2002:a05:6102:162c:b0:7d2:b199:6710 with SMTP id
 ada2fe7eead31-7d7394619edmr563227137.15.1795131190654; Thu, 19 Nov 2026
 15:33:10 -0800 (PST)
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
 <20261119144848.4ddd88cb@kernel.org>
In-Reply-To: <20261119144848.4ddd88cb@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 16:32:58 -0700
X-Gm-Features: Aa3M54pl4hlXRMcwBzZFHc9YCWzUYN6am3kufSQboJBVsJ7s6nPiZ-HbdhxnAag
Message-ID: <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 3:48=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 15 Nov 2026 17:58:26 -0700 James Hilliard wrote:
> > stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> > disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> > hardware checksum engine. The MAC therefore keeps dropping packets with
> > invalid IP or transport checksums before they reach the host, even afte=
r
> > ethtool reports RX checksumming as disabled.
>
> Rx checksumming only controls whether the _good_ packet indication /
> offload is communicated up the stack. The device should never drop
> packets due to a bad L4 checksum. Checksumming L4 is not much of a DoS
> vector. Oleksij was fixing this in other stmmac variants. I _think_ you
> should always clear this bit if it leads to packet drops.

The case I hit was `rx off`: on H616, ethtool reported RX checksumming
off, but the driver still set EMAC_RX_CTL0 bit 27. Clearing it let
packets with a bad UDP checksum reach the stack, where they failed
software validation. With `rx on`, the driver sets bit 27 both before
and after my patch, so the drops in that mode predate the patch.

H616 also has a separate control for forwarding error frames to DMA:
RX_ERR_FRM (EMAC_RX_CTL1 bit 3). With bit 27 set and normal filtering,
none of 100 packets with a bad UDP checksum reached an RX descriptor.
Setting RX_ERR_FRM let all 100 through to DMA in both the IPv4 and
IPv6 tests. The descriptors had the payload checksum error and error
summary bits set, but not the CRC error bit. The driver discarded
them on the error summary.

> (FCS is fine, bad FCS should only be passed up if RX_ALL is set,
> but sounds like your device has all checksums controlled by one bit?
> in which case we prefer to see all and let driver discard the bad FCS)

Ethernet FCS checking stays active on H616 with bit 27 clear. With
normal filtering, bad-FCS frames produced no RX descriptor in either
setting. With error forwarding enabled, all 100 bad-FCS frames had
RDES0_CRC_ERROR set in each setting, and the driver discarded them.

> If I completely misunderstand things we should at least get a respin
> to update the cover letter. The commit message talks about L4 offload,
> and rx_csum is L4 AFAIU but the bit is called CRC which deserves a
> mention somewhere IMVHO.

The H616 manual calls bit 27 CHECK_CRC and mentions the IPv4 header
checksum. What I should have made clearer is that the bit also affects
transport checksum checking, but clearing it doesn't disable Ethernet
FCS detection.

Would it make sense to address the `rx on` drops in a separate
follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
would mean enabling error forwarding to DMA and passing packets whose
only error is an IP or transport checksum up as CHECKSUM_NONE, while
still discarding frames with a bad FCS or other fatal RX errors.

If we leave the checker enabled in both modes, `rx off` would only
control whether the driver reports a checksum as verified. In that
form the follow-up would replace the conditional bit-27 write rather
than depend on this patch.

[0] https://lore.kernel.org/r/20250818090217.2789521-4-o.rempel@pengutronix=
.de/

> --
> pw-bot: cr
