Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C05F2E0939
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Sep 2025 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758811987; cv=none; b=DX5MihUYdFQ/ecJCV/UWJIui1osNwy4CV7KwGVXX39cc+WLFWkh6sKmcunq0PGbhMRJ3pz/hO15O3s4Eae/IpJZKx8eUMWJaUoXAuOajP5aH2hJOAUOXBA6AYFfwl8Q4N2qfsS8YwdORURhsdL0oUUIexZ7i3IJEoflewKdrjyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758811987; c=relaxed/simple;
	bh=ZXJMMFCZDGimdSoFUJxE3pUZd+JGKjmvs7+jQKpoKQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbvbPGft7IR3lCjC2x+VK0CEVPjsqGSS1v+vevlmHiF62y4j6HNTuhlEYUK+43HlJ1BWr+n0D8INLuTbFPLxMGBVrH6jLy7Wnkw6zHck4UdK3sETfUWT7/qU0SxmPhBkbnQq637z6D7SsVWN4aNXIu7CY8iA3EhbxmHSW1pXYQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso1211691e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Sep 2025 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758811980; x=1759416780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DlO5HN86Kc6YrRTCW9kNidWKyaECOConDbUQtE/vSBs=;
        b=tLMzpz/+GI0RzbX8NjMqzy7V44kNRUMyNfhoF4ZCuEvgDy0vPLIEEpkiDQRAVad6R/
         pMCgjA2kc52kwxhd8gG6Qih5LoW1d1I3YxHsxXaZzGwuLNOORkO1l5qJh+04jVOZ4ZsM
         fEdAK2b+n/LShTCQGZwuKXJXJr+sBYV9wAYnlUMQ0sJHESZfS7kHbpa80X09ml8emrEJ
         RMl2PxrF3RhEtIA2sr302VxONvBeuWVyDQd1LRe/tRMYwJvu6hzpwKDI25dOEvL9Nlcr
         hPUeOyKyJ6UsZw2xp8+amaUmHO3X4dNErCjBu3pjHfpfp6BT+UoXQMrukOYgKwPM8hhv
         ps9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOWYZ8mnG+4IMaaNx3tw8cPfCcOyG1K6YixnZCJiD63QDVT41AWX5Xh1H8SO7j1gxX6lit6+JtZjAp3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT86TKL2XKOfPUh3LUvT9Ah2uhslAgDJy7pfxJl12WMM+Hey5C
	ytFNEa6zsLGEeqarGfz4DfZ2qvUPf9xA5Y7om9f8z4E1ih52R90TVzvPMtJaWH2V
X-Gm-Gg: ASbGnctiXO1/wLwjtF4C7tCddDjWF5zbHx2lhRIievP+keK1rvIAf+b3fP994OJ1dfs
	ltHzKMmS+mlZxJwPAl+3DfwYgyJo9ysHXZFKTE2WbIGwksi387ZY5Hq/x5ZytaOiRgg34z/hUbX
	Pk7DEs1duxSCXtQ4wWb+OjpiLdGt25GP+TTEJ9IOK/SY8pYs88s7Fn7OemqKk4dmyu9MWcdQiq2
	VlBHWtVeFJQg6FxUV4XEs2KSGqPvd+MdRur8pcnrkhV0ZjTabK+07B8CgcuspEmra8qmC/AZmt0
	BkXsabSTjpd/1vCGX0TBArPhghMxqlsBlCnnoKgqN4M5cNQNHdtHyEEbE31jnJuG4GmCuoGpApY
	EhEb8fKOgY6I3zUa2oV0Wt4uBZpXYgzqprWQHNmPkQvcatBOTLk04BCr5UdyEhgn2gA==
X-Google-Smtp-Source: AGHT+IHOHH8bslhC2z6UeAI3YfQ86FvtaR0r84KJPLF7KCjrkuxD4JGJ3WQuPtspYiPlZVeIwpssHQ==
X-Received: by 2002:a05:6512:158c:b0:57b:a723:2b4c with SMTP id 2adb3069b0e04-582d073d183mr1404833e87.12.1758811979485;
        Thu, 25 Sep 2025 07:52:59 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831343051csm851500e87.11.2025.09.25.07.52.57
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 07:52:58 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-361d175c97fso9857131fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Sep 2025 07:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWE1TJC2UlFFLXVWg3yK9AUFn0dVz2iwY+ZTvJ8c31j/dibF6jspEh4NXXl6NPJ0MCmpQpqAUE24InSKA==@lists.linux.dev
X-Received: by 2002:a05:651c:150b:b0:333:b6b1:a151 with SMTP id
 38308e7fff4ca-36f7cecce7emr13436431fa.7.1758811976957; Thu, 25 Sep 2025
 07:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919000020.16969-1-andre.przywara@arm.com>
 <20250919000020.16969-2-andre.przywara@arm.com> <20250922181611.GA567602-robh@kernel.org>
In-Reply-To: <20250922181611.GA567602-robh@kernel.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 25 Sep 2025 22:52:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v64KvnvSy0-MYd7FBLVKeJQk=-=VWxRLsHXMP1+MFOPPfg@mail.gmail.com>
X-Gm-Features: AS18NWC5SLylzS53NFTh78yeOtaf2DKHmvxRwMULDvXeTqI87y6sQlGtbhqXD2w
Message-ID: <CAGb2v64KvnvSy0-MYd7FBLVKeJQk=-=VWxRLsHXMP1+MFOPPfg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] dt-bindings: mfd: x-powers,axp152: Add polyphased property
To: Rob Herring <robh@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 2:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Sep 19, 2025 at 01:00:16AM +0100, Andre Przywara wrote:
> > Some X-Powers AXP PMICs can combine some of their DC/DC buck converter
> > outputs in a multi-phase fashion, to achieve higher currents and
> > decrease the output ripple. The datasheets call this poly-phase. This i=
s
> > programmable in the PMIC, although often set up as the PMIC's reset
> > default.
> >
> > Add the "x-powers,polyphased" property to the binding, to describe thos=
e
> > pairs or tuples of regulators that should work together. In the lead
> > regulator node, the property lists the phandles of the connected
> > regulators. Just an empty property means no poly-phasing.
>
> Don't we have a coupled regulator binding already?

That was my first thought as well.

Though on the driver side, I guess we would need to add a coupler to the
axp regulator driver to handle the polyphase case directly, or somehow
tell the regulator core to ignore this property.

Unlike separate regulators that are ganged together, in the AXP PMICs it
seems that when buck outputs are ganged, only the controls for the first
output have any actual effect. In such cases I don't know if we should
just ignore / leave out the secondary outputs from both the description
and the runtime state.


ChenYu


> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml=
 b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > index 45f015d63df16..260c4c0afc475 100644
> > --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > @@ -304,6 +304,15 @@ properties:
> >                noise. This probably makes sense for HiFi audio related
> >                applications that aren't battery constrained.
> >
> > +          x-powers,polyphased:
> > +            $ref: /schemas/types.yaml#/definitions/phandle-array
> > +            description:
> > +              A list of phandles pointing to other regulators that sho=
uld be
> > +              polyphased with this regulator. The linked regulators wi=
ll be
> > +              synchronised with this regulator, within the PMIC, but o=
nly if
> > +              supported by the PMIC. An empty list means this regulato=
r
> > +              should be configured in a single-phase setup.
>
> phandle-array is poorly named and is really a matrix because you can
> have arg cells. So you need:
>
> items:
>   maxItems: 1
>
> And is there an outer max for linked regulators?
>
> Rob
>
