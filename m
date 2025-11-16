Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C42D2481
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763294874; cv=none; b=CO/jSoKg/Lyds4EfhRBEsqXDw2R+BbI28pxKK1rf4G6anWMVfYrn/GcL+xe6todrei+9ZRG4FYTJWUTLq6KO68r3auXgEQScA+CCLMuyoT/redmMdtRdc1cSIIWL5CmiaF5fuP6hnVVZRh1wJOKpn8mb2RAZj+2IMsFLJ4UpDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763294874; c=relaxed/simple;
	bh=iNn0qP/249kJDQzGSS/F/L8+NQ46eWkZ/7Q+EwQ3/5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw0NNL+o0FOHp2/BaMLrKRQnY/XZtgzjEwWdSF1H72tsvpSSYZ8n8V8fOTYoeNiT2XJenMzyIfHsyna6piI8AMzHO/snowVDCkhpBRDHApVBbB8bMHv4SkbrCuPkDxV1tldmjqCqWeJYVw1VhK+BVNzQglzHV1Rw2pVJOyKf2nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1LZKMYF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1LZKMYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BE5C113D0
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763294874;
	bh=iNn0qP/249kJDQzGSS/F/L8+NQ46eWkZ/7Q+EwQ3/5A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=s1LZKMYFBWgmwDlBidQOMDzou8HKuhiJBwX5bCttfTz+vmA2QLgc2BWFnfY+aIyHR
	 TQy2J3PyV3YBuUtIcRB5HdHB8D7Nn1qqyCtHs71WO4rv23mEoLNbrLHHM4XYgqJciH
	 wXsbPa/jLB5NC5+LqeyTMQLHzE62s7Fpc+XAKdRRvkEZ9ygL2qIYgXl7VUMINOvh86
	 pPHR1HweRSzvpBHW8GD6GnxdTyyENVhJpwiGf0oBs/2ltZr95qnwhKLMqYf/EeY//L
	 E4Z7daJTCKOfTqojdr4VoYMfLl27x4eDGRVv0VqmA8o9UvLF6P4TZUSZ2CpHNLZQ0x
	 vu98s+cCoyt6w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378e8d10494so44259701fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 04:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfjDU1SIEZIG2D5+gX5A0bFjFNZdA34ja/9TSyuEJ8SgX/l3zst4zTIQcTflwKER8BiZTQeCr1yyrsdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtcEcFGGYObMH+nGO4FJsCKGixuSHo4G0r9mBGm5XdJGkvf/ma
	4vhH0TDGo6ZEGfluh2TCrPO8ev7jNGgewws+fWlrg09IkLZXnE3cdKXGDA/dfMvpVnPLxE/H02p
	InjBhK7QHHF0MgXwM6KnTcnRsSBwh9rA=
X-Google-Smtp-Source: AGHT+IEvIN8OBOVj188eKaOm21h0kLrZfEbd8gXOEWO1ViahGfGkiAHVWIOgpRFEEEODq4tccJOhUGpdSt0NBiXPH2A=
X-Received: by 2002:a2e:8a87:0:b0:37b:b00b:7988 with SMTP id
 38308e7fff4ca-37bb00b7bccmr18734591fa.29.1763294871956; Sun, 16 Nov 2025
 04:07:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka> <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
 <10753322.nUPlyArG6x@jernej-laptop>
In-Reply-To: <10753322.nUPlyArG6x@jernej-laptop>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 16 Nov 2025 20:07:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65tBHCE7RYPBKKD2j5=rwoH1+pYasNbF5X1=GMSumcHsg@mail.gmail.com>
X-Gm-Features: AWmQ_bnmhrPCrlQnEh24KiJ1VDf4jAXcqEIaG3lMOfIOQYYG1c8ox1KSD4eS4QE
Message-ID: <CAGb2v65tBHCE7RYPBKKD2j5=rwoH1+pYasNbF5X1=GMSumcHsg@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 8:00=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Hi!
>
> Dne nedelja, 16. november 2025 ob 12:33:55 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> > On 16/11/2025 12:33, Krzysztof Kozlowski wrote:
> > > On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> > >> As it turns out, current H616 DE33 binding was written based on
> > >> incomplete understanding of DE33 design. Namely, planes are shared
> > >> resource and not tied to specific mixer, which was the case for prev=
ious
> > >> generations of Display Engine (DE3 and earlier).
> > >>
> > >> This means that current DE33 binding doesn't properly reflect HW and
> > >> using it would mean that second mixer (used for second display outpu=
t)
> > >> can't be supported.
> > >>
> > >> Update DE33 mixer binding so instead of referencing planes register
> > >> space, it contains phandle to newly introduced DE33 planes node.
> > >>
> > >> There is no user of this binding yet, so changes can be made safely,
> > >> without breaking any backward compatibility.
> > >
> > > And why would you configure statically - per soc - always the same pl=
ane
> > > as per mixer? If you do that, it means it is really fixed and interna=
l
> > > to display engine thus should not be exposed in DT.
>
> Not sure I understand what you mean. H616 SoC has 6 planes which are
> represented with single DE33 planes node (see previous DT binding).
> Driver has to decide initial allocation. For example, 3 planes for each
> mixer. However, nothing prevents to allocate 1 plane to first mixer and
> 5 to other. You can even allocate all 6 planes to one mixer and none to
> the other, if board has only one output enabled.
>
> In any case, plane allocation is runtime decision and has nothing to do
> with DT. Since planes are shared resource, their register space can't be
> assigned to only one mixer.
>
> See [1] for example how this would look like.
>
> > >
> > > Describing each IP block resource in DT is way too granular.
> > >
> >
> > BTW, everything is update, thus subject is really non-informative.
>
> I guess "fix" would be more descriptive.

Or maybe be more specific, like "split out layers register space to
separate binding / node".


ChenYu

> Best regards,
> Jernej
>
> [1] https://github.com/jernejsk/linux-1/blob/d93d56d92db52c7ff228c0532a10=
45de02e0662c/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L181-L235
>
>
>
>
