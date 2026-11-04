Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815674;
	b=kwU/gJ+Wq9bSnFZ4krbwuuhIrnhO1yYJMaTVhvLiIj+HHeGnboIcoDGx2FdamDr0H5kx
	 thtcnf0BX0C9InfZ486Awil0ccuRHMyB4aqUKoIBabsVe3ZfBVzbquM4HkBwZ/XOHyxl/
	 swChiU7FY5Y5JsxwscXcITS+Svsat6qBuiF//KbxhNTsGfvVnFltoBavxOKB9blhXiICI
	 1fay/06MuMR4GAqWd14kosbnlJHK3yioxdirSepSajp3o6Xtex9uqIcU7xv9u912Jay6J
	 tqeVcJR1QkM6nOwqs+/kOCAhTaSWYfevVkGgzGUGGvMtoexaNtN2LvpNo/R7LGb8Y3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
	b=akv/nr34z5us3wgdKhJJs8WLltAZsGT/vC4icVg8RDVnnwluBYNpkcQjEHIoz862baQ/
	 93tz9igedSP1hJAifRfL86Dzcw82cOJfj6ioKh11nJN4QsxKCA//ezS3ncYqa1D7S5ePL
	 8kyDNKVJYpbF3b6BBGjxmbtY9LFf24L9P3hzC/s6/N7pOCQGyF3xhU3zcFCuVNnVnq9D7
	 twIKAs3WYXpYHDizYaqCN/+uheYejOU3CejBBrD9WsFvM4DnTCLobAqQ4TkrckIOP1qGP
	 nxVk+4UrFqu7QKbOz82UE+Lk1SQQNp6Xspasctmbo5LoAVaB2/D8QXwCCawwUzKo2XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKfkPvKk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B307607A3CF
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B307607A3CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKfkPvKk
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so440152e0c.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815672; cv=none;
        d=google.com; s=arc-20260327;
        b=XscPb17r6CEp7/NZdAQOljWHuZcyzkGdvtLP9Ak859atoOkhZfpqEuMcrcJtwW8ABG
         t3fHcFBcrvYTWgQwGjseUkn6ZX5xfrKqcSYQ+WNA5IXXr+H2E2tVhq7expvoSAJTPsaL
         pWMJNR0W3qTDeOPKb1mFiFm08OrHb/XeUKP/Y+ydwa4DY1G6suE6VU+XmERd0C9KcCMM
         AweKkVLcy9OM/AObFxB8+OQEL+S+Tee0M+oquI4uw21CW9cFyic2eFIV8aczHkQ3Xkga
         gbuBTOTha1s6Q7AujFd3vPhP2AOjTE1fVGbUIJ6Q+k1KwVin7L/u/Woiid8FsWRlF37O
         5+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        fh=WhNrQAktcjXW0PHJWLa8C5J+/Cl+7/pOOAFZ6s8yqAU=;
        b=hwKCEdtljvTIiKFoNoEdpsvaER3LSmQHBGXhI3+lh94vUa60G2cdTmP8bluZLtQUjP
         dlPRWQGKuOaWx5eyYnxAHjzT1f25Asn07aADFLgyhFh7c1fhniR1tLIt841rrj+B4X3A
         Y/ArUahkUl2JMRd8hOLmKXSMLo+MYJBsBYpEgXPUrNjVJbaEHXXhsFdNaQpkTE6pvFVd
         Ujy2QsfBqHYepF/Mc2CpUDKxcO7gQ/GWHE9xCIacTpdBMIRYc7cduhP9U70QQtB2YvyE
         RO2NJRNKDJzaWHGX71ihY2QXTZJgsN5Xyg/9EUfKnJpD2vt4+QIKYMDBaKdblv+kzBI7
         5KOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815672; x=1794420472; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        b=HKfkPvKkFWfUpU8GydEYMDh/2Oxrwyp3WoYKIdLePJkCzm3MOfV+Tn26FvzzWWbe4Y
         B/GM35WqV/eq8tOAgh85zsMAcqS0MqsU+kj/w5z5VDq2SN6Jrq0fe4Z2DYOmI1KduKF0
         /JKqmLq9mADe/c5Fin5wJ2tetXIKd+a//NZiRBVSL1ZUV0bFrCwgDkMQr+EF4A0q76zq
         p9jR8nWgKQwWFMFA0ZUlLxZzfYB9qe0wg8DsUJlYruDWBt2tJu8UG/rvaAMFSDS2MYkt
         IuRcZipyWtjXaIHHZZO4MvTxdWC5LC8Adu82lN03HPBGNLo8DXAjrAsdSbo1mPOIzeZb
         sFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815672; x=1794420472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        b=1+S+WBXm6+/nJpuOHCWchUdjocNp9u+mDlPgxHUBWEDNGZiDrJ0d+A7tsaqEbECSlK
         8eOnCmj+SPelFo7368EkBn8HB6l3/An51TtcBnjlvsicTY84c0nsltfrDYXMT0bbj/fW
         aOLX+Msm/A46A0gux+P2+DRmRMh/tRWnPU8xb/Ihlc+utc8/K/oB533E018v4HsUa25k
         5arsY360e6iyxvWLqIDwTnUHn3sAxLgYGKfkfVu62zHlF28h52Uwf3hJircZgbpa5cFf
         RZ1c8wA9u0hoD729hKxz4QP94HZ/QS7fwB867YsKUkZpEWjU+Z+xxGXR1isspWfuEjxZ
         kCmw==
X-Forwarded-Encrypted: i=1; AKwUvBxZwcDU3tcyDu+wZ9asQtV/XFF8BzTVTQbJxVi986FaT9NtsZPg93zipjaNPEXHyXmfgtO3n+6W2C6ygQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/g39TuiEMRAEgdJDGiGOLldxDtIWdFt+sqwQ64bnBQcdUYocjV
	RY0L6B4hfJivOoEF7DvUy4co3AkDKtklKUptyNFG79PI91WCoQidrGGGbMyvf+cYoNRbqaFBbab
	MetPDPJqKjEo7f1h+l4k3Iz9kQsu/IUA=
X-Gm-Gg: AYBFou3CXWrDx6TMLPuwEBzvFhpLO//oh+Q5I9LQu15EOM+kmqorVJf2+TWTZ+FNOri
	fT2pIP+LmBLfvBtPclFE2pcawLWyiw5DT/dQicnSFM6425LMNJaITEaE6rUekNAnAUq9Vd3YNuY
	ld7IrHE+uJSZTAhj+8G5Z0LkubClIMCnmOarlvUJFmj8gu5AVknjRGFiUQoF0jSRyMqeMN1BHH5
	UoH1NxMOSlgfitSz+dpw8ENYv6m6ILA8WS4q8WjC3v84x4P5zv+sH/hBytHJuyfCZQkEF46qNVT
	M3cCAW5b/lsy0cJZ+OS3nvrbg6d+1fzduUeObseceLyt029fMF568v4nL9sjX5NxxxckwZ+BaKF
	1PWIgiF+fuOPilpAIZW8kWGypBOlL0WcKarik+H0lHfEXFppyp19khr4P+XBK7YfavVVtWfSX4r
	5o9A8Eg/ikIU9yGQkTpNXuqIQuOaddGf/yTwW5a78I/TH6rv13vvKyU6Yd55VhBVciDJsSH8sK7
	QOWLauMkHwbjpNpS07/tkc4l6s6rpbeRXYFNAgabRHOP8WYZQ4=
X-Received: by 2002:a05:6122:1794:b0:5c9:a60d:3275 with SMTP id
 71dfb90a1353d-5ec6894bafdmr7258349e0c.9.1793815672343; Wed, 04 Nov 2026
 10:07:52 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com> <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
In-Reply-To: <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 4 Nov 2026 11:07:41 -0700
X-Gm-Features: AclHuK8w6f78lagZOCqY3kBXvDEG6Z5rWFvxVoRwnTwu0OTjK9VJe-pup1TnDtw
Message-ID: <CADvTj4qPfWo=w0khBM+vPfT4vxCJVBQsqzAE3C9V+2J7fwq9gQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:59=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Hi,
>
> On 11/3/26 22:39, James Hilliard wrote:
> > The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWa=
re
> > component parameter register does not report the FIFO depth. Its option=
al
> > register layout also differs from the generic DesignWare integration.
> >
> > Add a specific compatible to identify this fixed configuration, retaini=
ng
> > snps,dw-apb-uart as a fallback.
>
> I think we should not focus too much on single SoCs here, all the
> Allwinner UARTs need some care. We should have had SoC specific
> compatible strings (plus the fallback) from the beginning, but we
> didn't, mostly for historic reasons and because it just worked (TM).
>
> So just from looking at the Allwinner A10 (the first one really
> supported mainline, since 2012): the manual reports a FIFO size of 64
> bytes, and it has none of the DW config registers.
>
> So I'd suggest:
> - We add compatible strings for *all* Allwinner SoC's UARTs in here,

The current series covers H616 and A523, but the setup is structured to
extend to other integrations. FIFO-depth discovery is separate from the
shared DesignWare RX-trigger calculation, so adding another compatible
does not require duplicating the threshold handling.

> regardless of whether we currently need a quirk for each of them or not.
> This is now regarded best practise for DT anyway, we just catch up on thi=
s.
>
> - The FIFO depth is all over the place for the various SoCs, and most of
> them do not implement the CPR register to announce the size. So we
> should use the already existing generic DT fifo-size property to

v3 actually used fifo-size for H616. Krzysztof requested removing it
because the fixed 256-byte depth is implied by the compatible [0].
That is why subsequent revisions supply the H616 depth through platform
data instead.

The earlier discussion also covered UART instances with different FIFO
depths. The feedback was to introduce the property when an integration
requiring it was added, rather than require it for H616 in anticipation
of those devices [1].

A523 provides a different way to handle that variation: each UART
reports its depth through FCC. The current series reads that value,
rather than putting either a per-instance size table in the driver or
fifo-size properties in DT. H616 does not rely on FCC and retains its
fixed depth.

Linux already reads fifo-size into uart_port.fifosize, but supplying the
capacity alone does not handle the other integration differences. The
H616/A523 setup also avoids generic optional-register probes at offsets
used for Allwinner registers, and installs the FIFO-relative RX-trigger
table instead of using the static 16550A thresholds.

Older integrations with a fixed depth implied by their compatible fit
the same model as H616; they do not need a discovery register.
Compatible-specific data supplies that fixed depth, while FCC supplies
it on integrations that expose it in hardware. Adding fifo-size in
those cases would duplicate information already determined by the
integration. This is why the current approach uses those two sources
for the FIFO depth and shares the remaining setup between them.

[0] https://lore.kernel.org/r/20261027-nifty-reliable-octopus-6cbac5@quoll/
[1] https://lore.kernel.org/r/18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.o=
rg/


> describe the size. This is the simplest, yet most flexible solution, and
> avoids hardcoding implementation specific values in the driver. And it's
> friendly to other users of the DT nodes, be it U-Boot, the BSDs or
> whatever else is out there. IIUC, that should already work out of the
> box with the current Linux driver?
> Since we need to touch the DTs anyway, I think this is the best way forwa=
rd.
>
> Cheers,
> Andre
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index e2ca126d58ba..fc1289073241 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -60,6 +60,7 @@ properties:
> >             - const: renesas,rzn1-uart
> >         - items:
> >             - enum:
> > +              - allwinner,sun50i-h616-uart
> >                 - anlogic,dr1v90-uart
> >                 - brcm,bcm11351-dw-apb-uart
> >                 - brcm,bcm21664-dw-apb-uart
> >
>
