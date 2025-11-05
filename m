Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B206332D0C8
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Nov 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354301; cv=none; b=OWgNy7b4o+4i7pFlLlztJJE4oMJsbltr003gfQBNZv313Ua9oW/LUfHEUn1fshKOIj0eZwHn+qD2n2zLzj3JdePUEFKh+2JsXUUuGKe+lN8bPxfOvcSN68ZznJBVvrsnL8xJ0GHoVD95s7+ySvP1kwFuPSzmBN42ncUVv0A4Zkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354301; c=relaxed/simple;
	bh=JtKwR334IOcJSfMe+jz0Enq6IP3LE52bXJK9P+kWavM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzyVD3Hp/m65Bm93Ca9QOQwJghc/hMoLvAKum2mAkuzL9IUdcsdJWPyeHPLWrTn1e37IQI0BiNVheOb39xbdnhT6cFc3gNhtBVrTZUB8MZxYceBi7y1kOU4lY2O+r9RAlF5p7wmbxPqtTYKyzagLBm4rBzizoJNVOoF+8+cMqbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+8p8Q8j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+8p8Q8j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DE3C116D0
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Nov 2025 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762354301;
	bh=JtKwR334IOcJSfMe+jz0Enq6IP3LE52bXJK9P+kWavM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=X+8p8Q8jfvgeoUWRhIia0snZRJ+ZKqqo/hRQ0KgiupludUAqi9vdAWPMg+gaEbl5s
	 H5yYahlbc62wjGfemrYJ/Hu6YXxN/OLnggTOwRJLRo9Te/ROWElJTttF8CjHidP12B
	 abgK39PuSyhW1c5oWtAzFxjs9JgACIximtyVRrbnb0jxJunaKlmwnSbhORBC6F4l0x
	 GH/rcMxpmkougg2mrxUBIaF+u1EQTWK3l+buE8ugoSIle7Ji4qlST1C+CyXZRnfPPN
	 S5hpOmbeaT4enhnH7Qb5g+GlJ9wT0YWUS6nLhS+U8v2O36WNdvUduRveR95XAOR9MD
	 LLQsCCo4L9FKw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-362acd22c78so59542441fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Nov 2025 06:51:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVe0eEsw2htYOEPz3HizewKOfJkbSP9b7jMTbxRLkx35fvo8Jsma6EgCkQk0HFtZZz80D8nBWtheCNQAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4NgNu3oO9WPVwu/veBh/3ufl2/gGT7CC4ZSeAYQsHTCxH3qWe
	SbBlqsSe+yr6lUv/DcBDtGvFZmYMx1hM+VKmc7HyT/ZeMiljvUnTVsToH+hwooAnIGiARHSXYzt
	gt7c6kn4WMEX/OpgQkXvePDTs4e8BFFk=
X-Google-Smtp-Source: AGHT+IGIEAVXYAC5/mxxWbiGcaY0AYo/5s9g7cRbmFp73EoeMVAloAa2YGLv9a0XjgeGIWx0S+GlkPfBvf0ZgrTNKUM=
X-Received: by 2002:a2e:be1b:0:b0:378:e437:9085 with SMTP id
 38308e7fff4ca-37a5148889cmr11360031fa.37.1762354299760; Wed, 05 Nov 2025
 06:51:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251104180942.61538-1-jernej.skrabec@gmail.com> <20251104180942.61538-6-jernej.skrabec@gmail.com>
In-Reply-To: <20251104180942.61538-6-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 5 Nov 2025 22:51:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ETD-x=CW+xUCcz9xPv+MC4wYMu+BRXk1znCCp8cmMnA@mail.gmail.com>
X-Gm-Features: AWmQ_bkW3EOy2EHaeuPwKcFuf5kSmMWMiTBiqTH9At9mwTTrXhAJeB0YdOMrK5g
Message-ID: <CAGb2v64ETD-x=CW+xUCcz9xPv+MC4wYMu+BRXk1znCCp8cmMnA@mail.gmail.com>
Subject: Re: [PATCH v2 05/30] drm/sun4i: vi_layer: Move check from update to
 check callback
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ryan Walklin <ryan@testtoast.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 2:10=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> DRM requires that all check are done in atomic_check callback. Move
> one check from atomic_commit to atomic_check callback.
>
> Tested-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Thanks!
