Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095358;
	b=12bKTzL/U+bJqt7N1qWFh97brkI/Lu92TjB15SvOL1SfpVkfR/zC+oRfTviTIQ5CVCez
	 8H26RFUmFxjQ96e80Dn6wF2s70VC0Fl2PiW5VOmcXUNB7QUr3C1W9pxgxpM5zBUCUrIql
	 G38TIkz3w15knCVIOrlwm7qlitO/mE6w7FVnq7DRir8xbthJ7VZvg3Ix3jzwkD/yczQch
	 7I8qQt01QP+Hl5MmLLmQRGJEbdqYn55BTgez7Ls5dlYx0beaqhpOpY8PHTXERbIrDJtZ5
	 OoBn2w8O6/Johy5XGIlUj8l7raah+1xvYGVZmHBJ65je3zvNouvysTHlzU5J5VZIlAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095358;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VbkC5PiXkuQEdYLYK/YUR9pdO4ULkJikWXO9Pu6awtg=;
	b=irUC99zp/DUuID/vpYHavYMJoessCoFuNhblCKxKnPOawqUZ6Zs/f3yc13A/EVnTVXO+
	 civNlNIVt7aJ/WNmwyktqrZtoV0FxJmJI0gblidQYqv5U1Y5vnYZrvj/9Pj3EBjRtSDjF
	 O3NEkpGFhR4rxLIiOwzr35dT65zc9bjPrtpzT53aWdzb0Mtu8eBk1RfCm3MiSKWS868BG
	 beu9XxIf83EQEzhss+fP65ZjuxXXlDmnkogWy18VEeltBmy351I113d+C7S3OVYQJxqH+
	 /POg0QlTWtkgl4Fq37iC7ZywZwY21Og5+A7oDNLIiifGuhUi5JBR5JOb4y06i/icrtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iD962t4O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D1606A31E
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iD962t4O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF841F031E3
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793095358;
	bh=VbkC5PiXkuQEdYLYK/YUR9pdO4ULkJikWXO9Pu6awtg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=iD962t4OeYl8fq9bTKX9Iflx2I8f4Vh717mX7u9d7sgpo3vSQSuZKwQe07yLRktiO
	 gFdNC4bR0scWTeYeG9TlkR7+3xN4DJoKt17dRAPIvmpfuk9X3NLIT+RijO1qwXbOh1
	 mR5OHKL7wb/iz9+5aMbhW+2FAfECvIlTyr5QtUWw5O926DvgT+4ibSkwaFOcbxHQkP
	 W5Io98xLEQYQN5altOp6mwTly7u+9RMwt5X1lVQLP5ehGoFuIWthAYn+3X7P52B4qp
	 /mgz5VjRAGHHSfDNtJam+ZWFb7e1U5bYIQaVa8VphujDC4wpURh4MQSpqcHAzm6Non
	 0VXVfNNsi8ZsQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so27019141fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 03:02:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwHs/MUcl0pdA3maWrle61dwz9M/tswKeOQ6q6Zmc8xvprgwC+S/tk6H0QqQy5NaAc79Bfd0T9IQ3mf1Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKVzefOkv69DfejepRB9XmeaESX2YVMDT+HwLWJqRG4nmViS+Fj
	qyldvh/Q2E4DHLiUDKnih24141nbwKNygfMG7BNv7xQepun2k8+QEwfUqhINxwDiIkzvJr55N8/
	It4/58YatNLrgnDBip9x2sQu2SLHYfFM=
X-Received: by 2002:a2e:a99d:0:b0:3ab:48e6:6785 with SMTP id
 38308e7fff4ca-3ac6fde8009mr25044611fa.27.1793095356530; Tue, 27 Oct 2026
 03:02:36 -0700 (PDT)
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
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
 <20261027-nifty-reliable-octopus-6cbac5@quoll> <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
 <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org>
In-Reply-To: <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 27 Oct 2026 18:02:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
X-Gm-Features: AclHuK-r-0qVcGxijtfK3XLHMgbsvhgpkiCG_8sJWoMVAePUb1PQB2bHv8-O4VU
Message-ID: <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2026 10:39, James Hilliard wrote:
> > On Tue, Oct 27, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sat, Oct 24, 2026 at 02:22:24PM -0600, James Hilliard wrote:
> >>> The H616 UART has 256-byte transmit and receive FIFOs, but its Design=
Ware
> >>> component parameter register does not report the FIFO depth. Its opti=
onal
> >>> register layout also differs from the generic DesignWare integration.
> >>>
> >>> Add a specific compatible for the integration and allow the standard
> >>> fifo-size property to describe the capacity. Require the documented
> >>> 256-byte size for H616, retaining snps,dw-apb-uart as a fallback.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++=
++++++++++
> >>>  1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uar=
t.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> index e2ca126d58ba..0f8fd0485879 100644
> >>> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> @@ -13,6 +13,18 @@ allOf:
> >>>    - $ref: serial.yaml#
> >>>    - $ref: rs485.yaml#
> >>>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: allwinner,sun50i-h616-uart
> >>> +    then:
> >>> +      properties:
> >>> +        fifo-size:
> >>> +          const: 256
> >>> +      required:
> >>> +        - fifo-size
> >>
> >> Why do you require fifo-size if is const? It is implied by the
> >> compatible.
> >
> > H616 has a fixed depth, but other sunxi integrations have different
> > depths between UART instances. For example, D1 has 64-byte FIFOs on
> > UART0 and 256-byte FIFOs on UART1=E2=80=935.
> >
> > Should I keep this explicit for consistency for all sunxi uarts?
>
> I am confused, there are no other instances here.

I think the point is that it is going to be needed in the future when
we add the compatibles for the SoCs that do have UARTs with different
FIFO sizes.
