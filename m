Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093998;
	b=Q5LGqOQbfg0TChSJQdj8vnNeIJ2fXvcp67H0gWtodBUddAeVXdxmF172VFt92D9RYLnD
	 4YUXQAvqlECW0WfZETUniAMKF2m2cNhTQfthCuTKSznaFBW9f8ayijucm8fzJEP405sMl
	 PPgDLLIYVRWZoE4BMcQ4ndovBktUkUxfAdY3+NIKSedK76gYXJpp1lnAiRH/YZy/MIoYl
	 R5sp50yIM5SA5sBdT6ZDBS13oysPmHs79dpCQBEA4OC8m+2OzS+S6Wn8gW+8PYReJin7C
	 /4fwSb6MvB+BrZT4rFQywpvPDxqW303+cPkntnjQvi6JJQUFgCUN36yi1B+dJ7rYmag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
	b=sRA5d9P0ujrnYKKOGUVV/PhkLUsWn1k5f9vE/ESxABJuzOaVaWXUegyUSrqhF/N4ZzOO
	 9mCuI3R4YRbU1CLjuKeKJIW7gf4DNo7wNZ4vNlWby2q2yWZG8e3bZ/vIJwF/kNUd52WMp
	 JANv9ztK/8DHeIx1lzrk3/1lYkmoTSgUTIwsNFVZWiNuVrrRlcqMGPSuS2Ns6XK2v6Vb9
	 20tDkYNz5PFiYWRmS+qnYh8LQwpuLDANy6++1uCTZJ3g3q5OOSIkd0qs591g9YYehRdeF
	 cwrNAMTKm25qtx+B9Lr8OAc0kta6VO5JIfmOzkbBGdJdhgJmr4scyTG184se+8FWtrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SUoFGf7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668B606A32D
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 09:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4668B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SUoFGf7C
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-980c4258105so2134830241.2
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 02:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793093997; cv=none;
        d=google.com; s=arc-20260327;
        b=WbzppcX8PSKZ5H/4aZkzqSVBRg7sDvZEQjMPJh8tjJPIGBG7SQROV8OS4e12S62oPs
         cw5ECp0eYbRpD/z5kAOYUfX0M7ktxQrqLntnBwETBvLhel5ifjtq1+QtYJBqsFsXqW+B
         beVPygAtCeYftCH86vQnNCSVIvBeSnb+YODp+vnJN4rdLUcU4ke+7ddwezP4yKLLVKLp
         r7KBb5wdA3jRMzkN8tFHM8BffOCo/G6A+2l7W5ITwjz47cxniPGSFm6QJ2Zani/VDARJ
         eCLVs3olbtd+D7LP3HEEAlqbBJ6IhxOpeOSP41FgrFIiymSBNAjv+GHvGQmUPL7nSW6G
         VDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        fh=XSY71XegkDD6VvSm/fZ0MHEe4i3WPN1TqQbJ/PM6DSo=;
        b=a8M5MTfgeXW7oMH2ePYhL9cuwF4AHYhKmgIinGn5hOyaCprLX3k/4TOftCF2xWeV3j
         Lmjg9Jw2j7B2SbD8JARyYv+jNUwTheKCWDRCFcGi4+ZYf1gVLOUzRgK6W0V6BDWXIgOf
         oRPnr+zQFqKfcLUvP/pkNh9qLlWzpYteRySZ37WPAjS7JXwwyBUnbQYFhghL5h5k8oFL
         J7Kr3dlZqw1SaFzYXwth++WZDsNVhc/LMD77wwFpGQxTNfnMo4qdb9vjamjJoJDRM8Vt
         kHBwmuZIzDAMsuLTdhBsZXpBxmgUOEY/vbu7dvwQ/agUY62CInBxhpyJousxIj2X/TD7
         EOgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093997; x=1793698797; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        b=SUoFGf7CiLPa40L+ln7pZYq+E7dC/HXZNayMkgxhRat8ONusq8XppnV6kakhjQzAxQ
         09ET1BhoRxFtoIVR3LGRsnXmz0AJr77iaJW94kCko+aNYqhfJOv6Yr5EhN49J/N7aoGR
         8aE7iMP6ajHGfst5cTuZUCvT44a3qPkhVESqbeQ+eU0a/KRfkDGhY+zegSNGndKBZygJ
         IrwjIlkEBV0vXItBb8qe9Ufxoop6AlSSJo/6KHjZPLt8TNGj+q3ZNBVwuDTguHIg7O7H
         69lXmnEOk0497S22Z2oe/Vz9hfLUnefMD+doXO2UJNX0k9UYKl1dhuxufCcePoJXjKFD
         0G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093997; x=1793698797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        b=oySVn1JrE9pRI1UTtWedmYOT/EESCg69R50K3ybZhwSdrQOhQHhL3+MX5tPmVeYy5c
         F1lCxofXKvjpjMTjtKpOik1POJsnfofJkIovmikhFJvq63YtMcUsmso93Upx5cWWjxCR
         FvN1OUDsoG3zQxNGzanY8xmC7kGnLQswnZjjRrHXQ2K4b3TNQZFlxFHl0uz5TiGn4Tpv
         Slz1KVouonwk6nTt706RtYJjOxtQuQrb2ynE5lAYDM62wFVcu8ai5JauJdWFIkMuZiGy
         WyRatiJrkfMwvuKN5B2pCJpP88NxPcYlVrGaFWvK2/TA06Q9JhQ+X9h0Int0ITyt5y0d
         uQhg==
X-Forwarded-Encrypted: i=1; AKwUvByLzIZafagJ93sQg+GWNi7hOMQh/JkuSPgtA7EvF+Ss5huCMwdZVe9LSze7OoY5psN0Itgnf5xnv+zVRQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI4H7c0XMD0LrvOhEXAdPq7sXHPgX6H7RIh1A8yk83wjzdANwxb
	N9TEh/0aJZtfFazxRm+lnou6kWc3e2Zb2KKUKA57VuV81y1BEghxXfZyC5g87EghcsL0fnzdEIA
	Isufz7los70Szhjg1iPw+INEtQfZxbIU=
X-Gm-Gg: AYBFou0kzI6zaPk+dBFJyrdFKs+0sFhyGcs4Q7rNJ0DPL5nrjuNwgS5aNqZwKhUT8iD
	vP1ql2an8efkAPt9WLU1uvq0DoO245rJ7e2VMkJt79NRMkWdUorwADFpO8Abf3c59sSXfesAUlZ
	ZU/vyxOwSaHdDarDSPuxrN9qlKTUDM77cjud/7QxJyBGGcJwshLWEENzJdyooy9Q6SScoIOK3BV
	5SL6cBue2agLz3w0h1EraL31K8gYvi+ZS8FYi6d8+r5GCO3UYZa3EWwNY8huLtOpANIrIctVv+Q
	+5NvxV7AtGLYNxB19mwaUUDdjApKQiGUfZ6+3Kl4xL3zDVHNLQ1LiEoSFar+BBrkqNBNl18aFY3
	e5g/cRi3xgMW9xRyakZOaPI97dJyKIAI69ucwkTk6HGVefHsG8KGLNMR2KB64GHIv6KrpXDNDEC
	hXAQry0odVLJjmDx3QroUFYWXHqBabB1H7t9ptutGqLIg83PRv6uX+LEHxsaovDSqsFqcdibQ8O
	ezhw8sDnaGnQbRbGJJ0KQWWPN3EEg==
X-Received: by 2002:a05:6102:c8f:b0:7c0:4d52:8cc9 with SMTP id
 ada2fe7eead31-7ce5cc8d55dmr2986698137.14.1793093997186; Tue, 27 Oct 2026
 02:39:57 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com> <20261027-nifty-reliable-octopus-6cbac5@quoll>
In-Reply-To: <20261027-nifty-reliable-octopus-6cbac5@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 03:39:45 -0600
X-Gm-Features: AclHuK-P2vZ9SIQ1kD5xtHOmSa1lugBkFh7TQdGZgeHlLBc3Sp6mnxkEd0joV1c
Message-ID: <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Oct 24, 2026 at 02:22:24PM -0600, James Hilliard wrote:
> > The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWa=
re
> > component parameter register does not report the FIFO depth. Its option=
al
> > register layout also differs from the generic DesignWare integration.
> >
> > Add a specific compatible for the integration and allow the standard
> > fifo-size property to describe the capacity. Require the documented
> > 256-byte size for H616, retaining snps,dw-apb-uart as a fallback.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++=
++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index e2ca126d58ba..0f8fd0485879 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -13,6 +13,18 @@ allOf:
> >    - $ref: serial.yaml#
> >    - $ref: rs485.yaml#
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-uart
> > +    then:
> > +      properties:
> > +        fifo-size:
> > +          const: 256
> > +      required:
> > +        - fifo-size
>
> Why do you require fifo-size if is const? It is implied by the
> compatible.

H616 has a fixed depth, but other sunxi integrations have different
depths between UART instances. For example, D1 has 64-byte FIFOs on
UART0 and 256-byte FIFOs on UART1=E2=80=935.

Should I keep this explicit for consistency for all sunxi uarts?

>
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -60,6 +72,7 @@ properties:
> >            - const: renesas,rzn1-uart
> >        - items:
> >            - enum:
> > +              - allwinner,sun50i-h616-uart
> >                - anlogic,dr1v90-uart
> >                - brcm,bcm11351-dw-apb-uart
> >                - brcm,bcm21664-dw-apb-uart
> > @@ -120,6 +133,10 @@ properties:
> >        - const: tx
> >        - const: rx
> >
> > +  fifo-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Transmit and receive FIFO capacity in bytes.
>
> Drop property, not used by any of the devices here.
>
> Best regards,
> Krzysztof
>
