Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C533366065
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 07:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779608204; cv=none; b=ghrDlMzTpIf7Umg277E4yXEUx8HAEUle42Hq4dISBysGTb4dOrejcYqb0cO93ISW2L9iW84Dd8Whbz853V/msh8b0IWUi9E1SRb6viF+0gD0tipXU7RNPiA9NsyV1dspsQZn/S889Oz7NTlPPrns2SQzmIo+rqB+QvEXC3Zq7+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779608204; c=relaxed/simple;
	bh=twvAWBRVO/ZJDAg0wUTAKAtiP6Qk//RmMjnsT8rN9kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKVuB64TRNjgdcAOpxKyfOnuGpTv0uJSbIxqQt4tN6sFBop5IpkAdHg+xDIt6sxQveTdIiFWFT+rZXMoMcc8u9tLrUxXcK4X9Jo6dER/BKEQ8lm3UrlaSqLrAeiTYhj9wtxgDNsu71R8W+fLZtz9PPIacnaHfaaCkUvMx3hfPYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9gXRvfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9gXRvfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3427E1F000E9
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779608203;
	bh=twvAWBRVO/ZJDAg0wUTAKAtiP6Qk//RmMjnsT8rN9kg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=H9gXRvfF3mxHZdTsJm+unrFd1m69BLLtil4NOpconGGR5ICzieoSxGgTwpLExqHT+
	 pwahR7Col9y1qPdtkZmicrNMg5k6FOkzOTZs8PvWB5W5Nha0mcoIUIsUh99uEQU6Vv
	 gSpzYGXOmLOmhOXA71F6WFxi4Iiqc25wFaJQJwZqjp/WGXcZYhOvhpbZer3R5rVhex
	 2D/pf9cWaV7Dc/qwOTi/Edeab9Cb/Jo8QNxLBFYPJfm9Kk7wMueemQ8pFUd80HlMqi
	 S00cTVJY4HF6+AtsAgn9mfQBVDo1cmc7fsQVw/xviOJldjo3sFSbc4pJ9F+FcNzrQ5
	 KQAjCcCu4x5gw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e7d983f91so79608451fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 00:36:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9WY9cVv7RTYg9eRS455j4zt8d63TVT/MzYnLwK1+wlmoFMe9cnBXCgIii6m5PPNLruvPcuWeilx422yQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVoGmheHVU8ijmc/lCctQMYituAZq2ZoFCAAHDqpLw3u6i5zqD
	iPucLx/D+n+JxuxS2novwvsqwFOHGRwlUmvcocGDzU7y58XmNSFiE++QwWl60mw20Xqr/742m9T
	c/g7oHlWK/jcE9V5A7jYFw5D90KysK0A=
X-Received: by 2002:a05:651c:1601:b0:38e:2fcc:78fe with SMTP id
 38308e7fff4ca-395d8bbc2famr38101571fa.3.1779608201708; Sun, 24 May 2026
 00:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com> <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
In-Reply-To: <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 10:36:29 +0300
X-Gmail-Original-Message-ID: <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
X-Gm-Features: AVHnY4KVGfaT4jHK_tEOETRqcTR3jPqtFPaTGTB9dpESZ_u5nKVSnneDOYxlkpk
Message-ID: <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 4:55=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Hi Chen-Yu,
>
> On Sat, May 23, 2026 at 2:19=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> > And when you do add patches due to Sashiko raising an issue, please
> > do mention it in the commit message.
> >
>
> As mentioned in the v1 discussion , this issue was originally reported
> by Sashiko.
> I'll add the Reported-by tag in the next revision.
> v1 links:
> https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/
>
> > Did you actually reproduce the issue, or did you add the patch simply
> > because Sashiko mentioned it?
> >
> Since I lack Sunxi hardware, I couldn't reproduce it or perform runtime t=
esting.
> But I did compile-test the patch.
> The patch aims to fix unsafe register accesses that occur before ensuring=
 the
> device is runtime-resumed.

When you submit a patch, it is expected that you already tested it.
If you only compile tested it, please remember to say so in the
footer (or mark the patch as RFT) so that others can test for you
and the maintainer knows the status.

And if possible, provide a scheme to test it.

> > On sunxi, either it will hang the system because the bus transaction
> > got ignored, or it won't as something else enabled the clock.
> >
>
> If Sunxi's PM design already guarantees safe access here,
> feel free to reject the patch.

I can't say that it does. But since the only control that SPDIF gives
is the IEC958 status, and that doesn't appear in the standard mixer apps,
it's unlikely that a _user_ will trigger it. Plus the control was added
after the basic structure of the driver was done, so there is definitely
some possibility of a crash.

But what you wrote in the commit message doesn't match the actual hardware
behavior, like I wrote.


ChenYu
