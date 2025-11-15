Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD128AB0B
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763217642; cv=none; b=Po9SyNRHNpXvM6/4nUGPaG2BLLzrSm4mh1+jTdgg94743VUuOstN+6rINXUz7Ixvimhh6H+07MLLN5WhJv1uNitUKo5E9ykfd74KXulUnMViryxD+7LlNsAyHy/iWCjfDMH07vMAa4C5bFuFjwBQ+jsg18Xu+YQzEjsvNxWPJYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763217642; c=relaxed/simple;
	bh=Sue3DiX7aivO+CREJvjgnQK9H3Tgu+sLekJRMaXhs2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjYntRLXQMj9XYtSHxMKBPO0V2szJ9mIhEoNksPxmcuF2uLdfzhMszTD56xUgXJglcRfrsLNUlTDHYp4/sEBF1zDTLt6A+zbI5sLfhsjIBsUviinrD2RA0W3cpqf6PWVQ2+Jw8vQ+XVu8a6apiI3DAIm7/ILEQPzy3pivnSGse4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8/5ngWc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8/5ngWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A16C2BC9E
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763217641;
	bh=Sue3DiX7aivO+CREJvjgnQK9H3Tgu+sLekJRMaXhs2A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=j8/5ngWcMu4uR2+5U32ZtsMBluoXbq4r00xSz5DFwqXGpsDqRehYBPhU4JwhuqdfY
	 rbVIFrFXl0tSiZAoGw3l9jYyYqA6bwRpq1DPDHpzDfun+qQbWSPHJhH5uwWnAjrWsB
	 XsLsCQmT6BCZGBLG3EMH8TeJwriHOIpa+OSTKqdCivadSieOI412P2DW3qbVSSDdhh
	 r1vPdMJnHak4ggiJaMEuXkxhwGd4LayTdLi12cAsnrQUhIXhK+j9ktydZdL80ClfRh
	 Sp3WkhGUiPnVVHT9HaUeGJGEVLZPmIyM6BmSmJTCA0zgUBPBjzCLGdiKGqgagqrKU9
	 PNPs7HXAp1YAg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37b9728a353so28218181fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhVIYEmjk9GI40wx07DnLJviorEmwD5yrUJ566AZMXo9eiFSKeVKwRzXA72EaZXV2UPkxZwV4Kdy8mGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXvS7mYqoH7h9IhAh0yf4VYI/EPNw7seFD7EQmv4prh3qAfNpd
	plIvxcQA7uurjQbf7SGT0wv9w5e2KMrzk5yEB5N8MO3attUGcwWSBVEFc01ip+jgS6+fJao+iKv
	IurDfrY/csAsRhJocOLQTSiLVL+0Akh0=
X-Google-Smtp-Source: AGHT+IESjGE8+0xVTH/QjhjF8+obf5TP9Oc8OEClkcCl8dEd7PpJQsH5CVoNDaeGwAe6R1UChVfXuLbguHAeh3ulKxU=
X-Received: by 2002:a05:651c:41c8:b0:37a:455e:f302 with SMTP id
 38308e7fff4ca-37babd5cb6cmr20120411fa.27.1763217640107; Sat, 15 Nov 2025
 06:40:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-3-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-3-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 15 Nov 2025 22:40:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk6LAUI84UIq1LoT1dh5454sL5SZsNoWjCZBYs2iLefOyWq2c142CwfOnM
Message-ID: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

I assume a fixes tag isn't needed because technically DE33 support isn't
there yet?
